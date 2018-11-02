From: alankao@andestech.com (Alan Kao)
Date: Fri, 2 Nov 2018 08:41:22 +0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <mhng-22ded2c8-7f87-4acc-b017-627e369cf874@palmer-si-x1c4>
References: <20181101005541.GA25604@andestech.com>
 <mhng-22ded2c8-7f87-4acc-b017-627e369cf874@palmer-si-x1c4>
Message-ID: <20181102004122.GA22741@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Nov 01, 2018 at 10:50:04AM -0700, Palmer Dabbelt wrote:
> On Wed, 31 Oct 2018 17:55:42 PDT (-0700), alankao at andestech.com wrote:
> >On Wed, Oct 31, 2018 at 07:17:45AM -0700, Christoph Hellwig wrote:
> >>On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
> >>> I agree that we need a place for vendor-specific ISA extensions and
> >>> having vendor-specific directories is also good.
> >>
> >>The only sensible answer is that we should not allow vendor specific
> >>extensions in the kernel at all.  ...
> >
> >How can this even be possible if a extension includes an extra register
> >set as some domain-specific context?  In such a case, kernel should
> >at least process the context during any context switch, just like how it
> >deals with the FP context.
> 
> Ya, I think there are cases where vendor-specific extensions are going to be
> necessary to handle within the kernel.  Right now the only one I can think
> of is the performance counter stuff, where we explicitly allow
> vendor-specific counters as part of the ISA spec.
> 
> For stateful extensions, we currently have a standard mechanism where the XS
> bits get set in sstatus and the actual save/restore code is hidden behind an
> SBI call.  That call doesn't currently exist, but if we just go ahead and
> add one it should be easy to support this from within Linux.  We'll need to
> figure out how to enable these custom extensions from userspace, but that
> seems tractable as well.  We'll probably also want some fast-path for the V
> extension (and any other stateful standard extensions), but I think as long
> as the V extension adds a quick check for dirtiness then it's not a big
> deal.
> 
> Do you guys have stateful extensions?  We're trying really hard to avoid
> them at SiFive because they're a huge headache, so unless there's a
> compelling base of software using one I don't want to go add support if we
> can avoid it.

Currently no, but the future is hard to see.  As long as the extensible freedom
claimed by the RISC-V foundation remains true, such extensions may have their
role to play.  Don't worry now, I was just to give a example that in some 
possible vendor-specific cases the kernel cannot keep itself from involving.
