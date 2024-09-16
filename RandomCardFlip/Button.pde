//
// Processing Examples
// Copyright (C) 2024 Seth Hendrick
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
// 
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

class Button
{
  // ---------------- Fields ----------------

  private final String buttonText;
  
  private final int leftCornerX;
  private final int leftCornerY;
  private final int rightCornerX;
  private final int rightCornerY;
   
  // ---------------- Constructor ----------------
  
  public Button(
    String buttonText,
    int leftCornerX,
    int leftCornerY,
    int rightCornerX,
    int rightCornerY 
  )
  {
    this.buttonText = buttonText;
        
    this.leftCornerX = leftCornerX;
    this.leftCornerY = leftCornerY;
    this.rightCornerX = rightCornerX;
    this.rightCornerY = rightCornerY;
  }
  
  // ---------------- Methods ----------------
  
  public void Update()
  {
    // Nothing to do.
  }
  
  public void Draw()
  {
    rectMode( CORNERS );
    stroke( 0 );
    fill( 255 );
    rect(
        this.leftCornerX,
        this.leftCornerY,
        this.rightCornerX,
        this.rightCornerY
    );
    
    fill( 0 );
    
    textSize( 40 );
    textAlign( CENTER ,CENTER );
    text(
        this.buttonText,
        this.leftCornerX,
        this.leftCornerY,
        this.rightCornerX,
        this.rightCornerY
    );
  }
  
  public boolean OnMouseClick()
  {
      if(
        ( mouseX > this.leftCornerX ) &&
        ( mouseX < this.rightCornerX ) &&
        ( mouseY > this.leftCornerY ) &&
        ( mouseY < this.rightCornerY )
      )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
