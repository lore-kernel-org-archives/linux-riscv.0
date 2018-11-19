From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 19 Nov 2018 16:10:57 +0100
Subject: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
In-Reply-To: <mvm8t1pazea.fsf@suse.de>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de>
Message-ID: <20181119151057.GC26852@lunn.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 19, 2018 at 03:57:17PM +0100, Andreas Schwab wrote:
> On Okt 08 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:
> 
> > The Microsemi PHYs have multiple banks of registers (called pages).
> > Registers can only be accessed from one page, if we need a register from
> > another page, we need to switch the page and the registers of all other
> > pages are not accessible anymore.
> >
> > Basically, to read register 5 from page 0, 1, 2, etc., you do the same
> > phy_read(phydev, 5); but you need to set the desired page beforehand.
> >
> > In order to guarantee that two concurrent functions do not change the
> > page, we need to do some locking per page. This can be achieved with the
> > use of phy_select_page and phy_restore_page functions but phy_write/read
> > calls in-between those two functions shall be replaced by their
> > lock-free alternative __phy_write/read.
> >
> > Let's migrate this driver to those functions.
> 
> This has some serious locking problem.

Hi Andreas

Could you be more specific. Are you getting a deadlock? A WARN_ON?

Thanks,
	Andrew
