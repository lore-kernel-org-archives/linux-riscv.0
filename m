From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:34:18 -0700
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <CAAhSdy3mOdxR9JpZyC9fCx5rphUBDxn2kbRpgtZp4h0_jYCxMA@mail.gmail.com>
References: <20180904185001.GA25119@infradead.org>
 <mhng-ba039ed5-dcff-41d3-b237-0708b5e117b2@palmer-si-x1c4>
 <CAAhSdy3mOdxR9JpZyC9fCx5rphUBDxn2kbRpgtZp4h0_jYCxMA@mail.gmail.com>
Message-ID: <20180910133418.GA12330@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 04:15:14PM +0530, Anup Patel wrote:
> This patch is doing two things:
> 1. Allow IRQCHIP driver to provide IPI trigger mechanism

And the big questions is why do we want that?  The last thing we
want is for people to "innovate" on how they deliver IPIs.  RISC-V
has defined an SBI interface for it to hide all the details, and
we should not try to handle systems that are not SBI compliant.

Eventuall we might want to revisit the SBI to improve on shortcomings
if there are any, but we should not allow random irqchip drivers to
override this.

> 2. Have more generic IPI handler in arch/riscv so that IRQCHIP driver
> can call it

And that is rather irrelevant without 1) above.
