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

class Card
{
  // ---------------- Fields ----------------
  
  private static final int cardWidth = 110;
  private static final int cardHeight = 110;
  
  private final String cardName;
  private final int cardId;
  
  private final int leftCornerX;
  private final int leftCornerY;
  private final int rightCornerX;
  private final int rightCornerY;
  
  private boolean isFlipped;
  
  // ---------------- Constructor ----------------
  
  public Card( String cardName, int cardId, int rowIndex, int colIndex )
  {
    this.cardName = cardName;
    
    this.cardId = cardId;
    
    this.leftCornerX = ( rowIndex * cardWidth ) + 10;
    this.leftCornerY = ( colIndex * cardHeight ) + 10;
    this.rightCornerX = ( ( rowIndex + 1 ) * cardWidth );
    this.rightCornerY = ( ( colIndex + 1 ) * cardHeight );
    
    this.isFlipped = false;
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
    
    String str;
    if( this.isFlipped )
    {
      textSize( 14 );
      str = this.cardName;
    }
    else
    {
      textSize( 40 );
      str = "" + this.cardId;
    }
    
    textAlign( CENTER ,CENTER );
    text(
        str,
        this.leftCornerX,
        this.leftCornerY,
        this.rightCornerX,
        this.rightCornerY
    );
  }

  public void OnMouseClick()
  {
      if(
        ( mouseX > this.leftCornerX ) &&
        ( mouseX < this.rightCornerX ) &&
        ( mouseY > this.leftCornerY ) &&
        ( mouseY < this.rightCornerY )
      )
    {
      this.isFlipped = true;
    }
  }
}
