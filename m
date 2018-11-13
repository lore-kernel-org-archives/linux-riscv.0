From: broonie@kernel.org (Mark Brown)
Date: Tue, 13 Nov 2018 14:38:22 -0800
Subject: [RFC PATCH] spi: add driver for the SiFive SPI controller
In-Reply-To: <CANBLGcxF-WgsBVFHf4jGRR+Ox2vz=ewzhwGP1CZX-R5HpDAVBg@mail.gmail.com>
References: <20181112142736.15009-1-kernel@esmil.dk>
 <20181113183527.GG2089@sirena.org.uk>
 <CANBLGcxF-WgsBVFHf4jGRR+Ox2vz=ewzhwGP1CZX-R5HpDAVBg@mail.gmail.com>
Message-ID: <20181113223822.GN2089@sirena.org.uk>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Nov 13, 2018 at 08:48:43PM +0100, Emil Renner Berthing wrote:
> On Tue, 13 Nov 2018 at 19:35, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Nov 12, 2018 at 03:27:36PM +0100, Emil Renner Berthing wrote:

> > > I know the discussions about the sifive devicetree compatible
> > > strings haven't come to a conclusion, so I'm sending this as
> > > an RFC to get some feedback on the rest of the code.

> > I've not seen any of these discussions or earlier versions of this
> > driver so I've no idea what's going on here :(

> No, sorry. This has been discussed on linux-riscv for other drivers
> like the uart. See my last answer.

> > > +Optional properties:
> > > +- sifive,fifo-depth          : Depth of hardware queues; defaults to 8
> > > +- sifive,max-bits-per-word   : Maximum bits per word; defaults to 8

> > If the hardware isn't fixed yet making these enumerable from the
> > hardware would be good...

> Agreed, but unfortunately this is already in the FU540-C000 chip on
> the HiFive Unleashed board sold by SiFive.

Pick an unused register you can read safely and define that value to the
default :)

> > > +/* for consistency we need this symbol */
> > > +#ifdef REG_FMT
> > > +#undef REG_FMT
> > > +#endif

> > We do?  For consistency with what?

> Below all the register offsets are defined as
> REG_<register name>. This is is a pattern I
> copied from other drivers, but here we have a
> register called "fmt" - hence REG_FMT.
> If you have a better pattern that doesn't clash
> with REG_FMT please let me know.

You shouldn't be using such generic names for your internal identifiers,
add a prefix to everything.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181113/0987ee5a/attachment.sig>
