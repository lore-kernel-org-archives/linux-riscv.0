From: thierry.reding@gmail.com (Thierry Reding)
Date: Tue, 16 Oct 2018 13:01:42 +0200
Subject: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
In-Reply-To: <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
Message-ID: <20181016110142.GC8852@ulmo>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 15, 2018 at 03:57:35PM -0700, Atish Patra wrote:
> On 10/10/18 6:49 AM, Thierry Reding wrote:
> > On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> > > From: "Wesley W. Terpstra" <wesley@sifive.com>
> > > 
> > > DT documentation for PWM controller added with updated compatible
> > > string.
> > > 
> > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > [Atish: Compatible string update]
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >   .../devicetree/bindings/pwm/pwm-sifive.txt         | 32 ++++++++++++++++++++++
> > >   1 file changed, 32 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > new file mode 100644
> > > index 00000000..532b10fc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > @@ -0,0 +1,32 @@
> > > +SiFive PWM controller
> > > +
> > > +Unlike most other PWM controllers, the SiFive PWM controller currently only
> > > +supports one period for all channels in the PWM. This is set globally in DTS.
> > > +The period also has significant restrictions on the values it can achieve,
> > > +which the driver rounds to the nearest achievable frequency.
> > 
> > What restrictions are these? If "nearest achievable" is too far off the
> > target period it might be preferable to error out.
> > 
> 
> @Wes: Any comments?
> 
> > > +Required properties:
> > > +- compatible: should be one of
> > > +	"sifive,fu540-c000-pwm0","sifive,pwm0".
> > 
> > What's the '0' in here? A version number?
> > 
> 
> I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive Guys
> decided mark it as version 0.
> 
> @Wesly: Please correct me if I am wrong.

It seems fairly superfluous to me to have a version number in additon to
the fu540-c000, which already seems to be the core plus some sort of
part number. Do you really expect there to be any changes in the SoC
that would require a different compatible string at this point? If the
SoC has taped out, how will you ever get a different version of the PWM
IP in it?

I would expect any improvements or changes to the PWM IP to show up in a
different SoC generation, at which point it would be something like
"sifive,fu640-c000" maybe, or perhaps "sifive,fu540-d000", or whatever
the numbering is.

> > > +	PWM controller is HiFive Unleashed specific chip which warrants a
> > > +	specific compatible string. The second string is kept for backward
> > > +	compatibility until a firmware update with latest compatible string.
> > > +- reg: physical base address and length of the controller's registers
> > > +- clocks: The frequency the controller runs at
> > > +- #pwm-cells: Should be 2.
> > > +  The first cell is the PWM channel number
> > > +  The second cell is the PWM polarity
> > > +- sifive,approx-period: the driver will get as close to this period as it can
> > 
> > Given the above comment, maybe "sifive,period"?
> > 
> 
> ok.
> In Unleashed board, the DT is loaded by FSBL (first stage boot loader).
> Thus, changing device tree entries requires a FSBL update. If we update this
> string, we need to update the driver to parse both properties so that
> existing devices with older firmware continue to work.
> 
> This is probably ok as we anyways do that for compatible strings. Just
> wanted to update that here for the record.

I'm going to defer to Rob on this. He's said in the past that he doesn't
care about existing bindings that haven't been vetted through upstream,
even if that means that bootloaders may have to be updated. I know he's
been fairly strict on this in the past, but let's see if there is room
for exceptions.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181016/cf2d9b9f/attachment.sig>
