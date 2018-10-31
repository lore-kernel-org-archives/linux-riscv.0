From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 31 Oct 2018 07:17:45 -0700
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
References: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
 <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
Message-ID: <20181031141745.GA5183@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 31, 2018 at 04:46:10PM +0530, Anup Patel wrote:
> I agree that we need a place for vendor-specific ISA extensions and
> having vendor-specific directories is also good.

The only sensible answer is that we should not allow vendor specific
extensions in the kernel at all.  We need to standardize cache flushing
and we need to do it soon and not introduce horrible bandaids because
the foundation did not do its work.
