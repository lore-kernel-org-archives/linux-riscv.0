From: alankao@andestech.com (Alan Kao)
Date: Thu, 1 Nov 2018 08:55:42 +0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <20181031141745.GA5183@infradead.org>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <20181031141745.GA5183@infradead.org>
Message-ID: <20181101005541.GA25604@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 31, 2018 at 07:17:45AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
> > I agree that we need a place for vendor-specific ISA extensions and
> > having vendor-specific directories is also good.
> 
> The only sensible answer is that we should not allow vendor specific
> extensions in the kernel at all.  ...

How can this even be possible if a extension includes an extra register
set as some domain-specific context?  In such a case, kernel should
at least process the context during any context switch, just like how it
deals with the FP context.

> ... We need to standardize cache flushing 
> and we need to do it soon and not introduce horrible bandaids because
> the foundation did not do its work.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
