From: anup@brainfault.org (Anup Patel)
Date: Sat, 29 Sep 2018 12:36:03 +0530
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <mhng-0f237369-b7fb-47cd-a610-be4c577c3c4f@palmer-si-x1c4>
References: <20180910133418.GA12330@infradead.org>
 <mhng-0f237369-b7fb-47cd-a610-be4c577c3c4f@palmer-si-x1c4>
Message-ID: <CAAhSdy0nmy=vX74e08BOPqC_pyEnRrPz06gTWz8LivOkQscYuw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Sep 29, 2018 at 7:15 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 10 Sep 2018 06:34:18 PDT (-0700), Christoph Hellwig wrote:
> > On Thu, Sep 06, 2018 at 04:15:14PM +0530, Anup Patel wrote:
> >> This patch is doing two things:
> >> 1. Allow IRQCHIP driver to provide IPI trigger mechanism
> >
> > And the big questions is why do we want that?  The last thing we
> > want is for people to "innovate" on how they deliver IPIs.  RISC-V
> > has defined an SBI interface for it to hide all the details, and
> > we should not try to handle systems that are not SBI compliant.
> >
> > Eventuall we might want to revisit the SBI to improve on shortcomings
> > if there are any, but we should not allow random irqchip drivers to
> > override this.
>
> I agree.  The whole point of the SBI is to provide an interface that everyone
> uses so we can the go figure out how to make this fast later.  If each platform
> has their own magic IPI hooks then this will end up being a mess.
>
> We've got some schemes floating around to make the SBI fast (essentially an SBI
> VDSO), I'd prefer to push on that rather than adding a bunch of complexity
> here.

Yes, I have already removed the IPI triggering part from this patchset.

Regards,
Anup
