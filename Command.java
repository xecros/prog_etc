import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

class Command{
	public static void main(String args[])throws IOException{
		String str = "command";

		while(str != "exit"){
			System.out.println(">>Please enter the command  #CommandList -> help");
			str = ask();
			System.out.println();
			
				switch(str){
					case "help":
					help();
					break;

					case "ls":
					ls();
					break;

					case "pwd":
					pwd();
					break;

					case "mkdir":
					mkdir();
					break;

					case "mv":
					mv();
					break;

					case "cp":
					cp();
					break;

					case "rm":
					rm();
					break;

					case "exit":
					str = "exit";
					break;
		
					default:
					System.out.println("Enter the configured command");
				}
		}
	}

	private static String ask() throws IOException{
		BufferedReader br =
		new BufferedReader(new InputStreamReader(System.in));
		return br.readLine();
	}

	private static Boolean alert(File p1, File p2){
		if(p1.exists() == false) {
			System.out.println("!!!Cannot find the specified file!!!");
			return false;
		}else if(p2.exists() == true){
			System.out.println("!!!The data with that name already exists!!!");
			return false;
		}
		return true;
	}

	private static void help(){
		String[] commands = {"ls","pwd","mkdir","rm","exit"};
		for(int i = 0; i < commands.length; i++){
			System.out.println(commands[i]);
		}
	}

	private static void ls() {
		File cdir = new File(".");
		File[] files = cdir.listFiles();
		
		for (int i = 0; i < files.length; i++) {
			if(files[i].isFile()){
				System.out.println("f  " + files[i].getName());
			}else if(files[i].isDirectory()){
				System.out.println("d  " + files[i].getName());
			}
		}
	}

	private static String pwd(){
		String pwd = new File(".").getAbsoluteFile().getParent();
		System.out.println(pwd);
		return pwd;
	}

	private static void mkdir()throws IOException{
		System.out.println(">>>Please enter the DirectoryName");
		File data = new File(ask());

		if(data.exists() == true) {
			System.out.println(">>>Same name exists");
			return;
		}
		data.mkdir();
	}

	private static void mv() throws IOException{
		System.out.println(">>>What name of data do you want to send?");
		String path1 = ask();
		
		System.out.println(">>>What name do you want to send the data to?");
		String path2 = ask();

		Path p1 = Paths.get(path1);
		Path p2 = Paths.get(path2);

		File ep1 = new File(path1);
		File ep2 = new File(path2);

		if(alert(ep1, ep2) == true){
			Files.move(p1, p2);
		}
	}

	private static void cp() throws IOException{
		System.out.println(">>>What name of data do you want to copy?");
		String path1 = ask();
		
		System.out.println(">>>What name do you want to copy the data to?");
		String path2 = ask();

		Path p1 = Paths.get(path1);
		Path p2 = Paths.get(path2);

		File ep1 = new File(path1);
		File ep2 = new File(path2);

		if(alert(ep1, ep2) == true){
			Files.copy(p1, p2);
		}
	}

	private static void rm() throws IOException{
		System.out.println(">>>Please enter the DirectoryName or FileName");
		File rmdata = new File(ask());

		if(rmdata.exists() == false) {
			System.out.println("!!!Not Found!!!");
			return;
		}
		if(rmdata.isFile()) {
			rmdata.delete();
		} else if(rmdata.isDirectory()){
			File[] files = rmdata.listFiles();
			for(int i=0; i<files.length; i++) {
				files[i].delete();
			}
			rmdata.delete();
		}
	}

}