From: robh@kernel.org (Rob Herring)
Date: Tue, 23 Oct 2018 09:30:35 -0500
Subject: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
In-Reply-To: <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
References: <20181022224213.GA25145@bogus>
 <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
Message-ID: <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 22, 2018 at 5:55 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 22 Oct 2018 15:42:13 PDT (-0700), robh at kernel.org wrote:
> > On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
> >> The /chosen node is optional so we should handle CMDLINE regardless
> >> the presence of /chosen/bootargs. Move handling of CMDLINE in
> >> early_init_dt_scan() instead.
> >
> > I looked at this a while back. I'm not sure this behavior can be changed
> > without breaking some MIPS platforms that could be relying on the
> > current behavior. But trying to make sense of the MIPS code is a
> > challenge and they have some other issues in this area.
> >
> > Can't this be fixed by making /chosen manditory? I'd expect ultimately
> > you are always going to need it.
> >
> > I'd rather not resort to making this per arch. There's also some effort
> > to consolidate cmd line handling[1].
>
> I'd rather make /chosen mandatory on RISC-V than to have per-arch handling, as
> like you've said there's already too much duplication.  That said, it does seem
> like a bug to me because the behavior seems somewhat arbitrary -- an empty
> /chosen node causing the built-in command-line argument handling to go off the
> rails just smells so buggy.

Yes. Probably need to do some archaeology on this code to figure out
some of the expectations.

> If that's the case, could we at least have something like
> "CONFIG_OF_CHOSEN_IS_MANDATORY" that provides a warning when there is no
> /chosen node and is set on architecture where the spec mandates /chosen?

I'd be okay to make it a warning unconditionally. At least then we can
find the cases that deviate and either fix them or understand their
expectations.

Rob
