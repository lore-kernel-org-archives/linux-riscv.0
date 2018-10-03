From: zongbox@gmail.com (Zong Li)
Date: Wed, 3 Oct 2018 11:26:43 +0800
Subject: [PATCH v3 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
In-Reply-To: <20181002145116.GE3889@infradead.org>
References: <cover.1538470103.git.zongbox@gmail.com>
 <54849b9d9a709525640011814872155eafa7a9d7.1538470103.git.zongbox@gmail.com>
 <20181002145116.GE3889@infradead.org>
Message-ID: <CA+ZOyahwAA3v+9XeJ4eLkhiNgDacHtLHfrqG3ifhdV-shwnAaA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Christoph Hellwig <hch@infradead.org> ? 2018?10?2? ?? ??10:51???
>
> On Tue, Oct 02, 2018 at 04:52:31PM +0800, Zong Li wrote:
> > From: Vincent Chen <vincentc@andestech.com>
> >
> > For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
> > after AND with PAGE_MASK because the data type of PAGE_MASK is
> > unsigned long. To fix this problem, the page alignment is done by
> > subtracting the page offset instead of AND with PAGE_MASK.
> >
> > Signed-off-by: Vincent Chen <vincentc@andestech.com>
>
> Looks good,
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> (and I'm pretty sure I reviewed this before..)

Hi Christoph,

Very sorry about that. I didn't notice I lose these review tags. Could
you please help to review again in version 4 patches? Thank you.

Regards,
Zong
