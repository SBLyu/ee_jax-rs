package mad.nthu;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/ask")
public class FirstJersey {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public String askResponse() {
		
		return "<html>"+"<title> Jersey in WeiTu </title>"
				+"<body> <h1 style='color:red'> No Cross, no Crown. </h1> </body>"
				+"</html>";
	}
	
	@GET
	@Path("/{name}")
	@Produces(MediaType.TEXT_HTML)
	public String askResponseName(@PathParam("name")String name) {
		
		return "<html>"+"<title> Hello..."+name+" </title>"
				+"<body> <h1 style='color:blue'> No Cross, no Crown.<br>Nice to Meet You..."+name+" </h1> </body>"
				+"</html>";
	}
	
	@GET
	@Path("/images/{pic}")
	@Produces({"image/jpeg, image/png"})
	public Response askResponsePic(@PathParam("pic") String pic) {
		
		String filename=null;
		switch(pic) {
		case "Annie":
			filename=pic+".jpg";
			break;
		case "Bob":
			filename=pic+".jpg";
			break;
		case "Cindy":
			filename=pic+".jpg";
			break;
		case "WeiTu":
			filename=pic+".jpg";
			break;
		default:
			filename="nofiles.jpg";
			break;
		}
		BufferedImage bi=null;
		try {
			bi=ImageIO.read(getClass().getResource("/images/"+filename));
			
			//照片上寫字
			Graphics2D g=bi.createGraphics();
			g.setColor(Color.BLUE);
			g.setFont(new Font("Arial",Font.BOLD,38));
			g.drawString("12345",10, 250);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		ByteArrayOutputStream baos=new ByteArrayOutputStream();
		try {
			ImageIO.write(bi, "jpg", baos);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		byte imageData[]=baos.toByteArray();
		return Response.ok(new ByteArrayInputStream(imageData)).build();
	}
}
