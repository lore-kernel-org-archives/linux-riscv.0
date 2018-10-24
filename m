From: mick@ics.forth.gr (Nick Kossifidis)
Date: Wed, 24 Oct 2018 16:32:40 +0300
Subject: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
In-Reply-To: <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
References: <20181022224213.GA25145@bogus>
 <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
 <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
Message-ID: <8e420b9dee0f246fda8e018532737b1a@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-10-23 17:30, Rob Herring ??????:
> On Mon, Oct 22, 2018 at 5:55 PM Palmer Dabbelt <palmer@sifive.com> 
> wrote:
>> 
>> On Mon, 22 Oct 2018 15:42:13 PDT (-0700), robh at kernel.org wrote:
>> > On Mon, Oct 15, 2018 at 05:20:10PM +0300, Nick Kossifidis wrote:
>> >> The /chosen node is optional so we should handle CMDLINE regardless
>> >> the presence of /chosen/bootargs. Move handling of CMDLINE in
>> >> early_init_dt_scan() instead.
>> >
>> > I looked at this a while back. I'm not sure this behavior can be changed
>> > without breaking some MIPS platforms that could be relying on the
>> > current behavior. But trying to make sense of the MIPS code is a
>> > challenge and they have some other issues in this area.
>> >
>> > Can't this be fixed by making /chosen manditory? I'd expect ultimately
>> > you are always going to need it.
>> >
>> > I'd rather not resort to making this per arch. There's also some effort
>> > to consolidate cmd line handling[1].
>> 
>> I'd rather make /chosen mandatory on RISC-V than to have per-arch 
>> handling, as
>> like you've said there's already too much duplication.  That said, it 
>> does seem
>> like a bug to me because the behavior seems somewhat arbitrary -- an 
>> empty
>> /chosen node causing the built-in command-line argument handling to go 
>> off the
>> rails just smells so buggy.
> 
> Yes. Probably need to do some archaeology on this code to figure out
> some of the expectations.
> 
>> If that's the case, could we at least have something like
>> "CONFIG_OF_CHOSEN_IS_MANDATORY" that provides a warning when there is 
>> no
>> /chosen node and is set on architecture where the spec mandates 
>> /chosen?
> 
> I'd be okay to make it a warning unconditionally. At least then we can
> find the cases that deviate and either fix them or understand their
> expectations.
> 
> Rob

I don't think we can make /chosen node mandatory since it's not 
specified as such
by the spec 
(https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.2).
No matter what we say from the kernel side, the device tree provider is 
not expected
to always provide the /chosen mode. Also device tree is not the only 
provider of
a command line, we might get a command line from different places 
per-arch (e.g. atags
on arm) or through EFI/ACPI/kexec as well. That's why my initial 
approach for RISC-V
was on the arch-specific code.

We shouldn't try to handle the built-in CMDLINE on each of the possible 
command line
providers and if we do we should at least make sure we don't depend on 
the presence
of a provided command line (which is the issue in this case).

I believe the best approach is to consolidate all the different CMDLINE 
approaches
for the various archs / providers and clean up the mess instead of 
re-implementing
the same thing again and again. I saw the patch you mentioned and it's a 
start.
I'll look more into it and try to come up with a similar one.

Nick
