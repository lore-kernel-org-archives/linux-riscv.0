Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEA5C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 12:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9CAA613B1
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 12:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9CAA613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saHP1ksYC9p8ISQwTodne4qCIPsHmisNzG/evIDfavo=; b=xXKEox5+Mbr2kg
	NSOaGCDTE8hwlpXQecMyuGiXqfgV6j/La2PzzOX1KxibwrdiKedlLoPUZIdiwNNdENLw8GdEd4cwm
	IM2YHfonXgKDdvQmFokzS+tAA0VMxKUVWtTqvBW+xsrown/qYh8PIp8p24LX4omkIqMKu8ZS4pCL9
	6d3/5WYQcdOd2tQULqlo4dqALDcGebmQvOVMUVtGfhKQwN5mBEPBoc9Jwf/5YyTBKfP4bAoaCRX6E
	4iNgV4B43qllJLtYVWf4lxJqiip6c0BmylSFZ5Cp5Tf/Ly3cns6SHuNwFywrqXGFB9ubQ/9l1ayy1
	Ydcwaj6YlVuvdFqwD6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomsz-008mja-ES; Thu, 03 Jun 2021 12:55:45 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomsd-008mY7-DC
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 12:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=7UdYMQLbOKNEyWdQdHae4yIpHvTN3Pwjb5
 rxl1JhgOQ=; b=soHW2K4jKkidf2E8QwG4NHFhLLMff4etygn1VJ0+Ll0/9Iphny
 5rqM4tNnY8S3enlcbI7p9PJpjvfNA2gjlZJR5UhmU+8O+5h3B5UVNSXcTp8pZkAY
 mpVFNE5403IQDveE+Ye/ZL7fJ3MBK6PKUJvlpieJnMi/cUxvRbLUETf1k=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3gqAs0bhgtwmJAA--.45431S2; 
 Thu, 03 Jun 2021 20:55:08 +0800 (CST)
Date: Thu, 3 Jun 2021 20:49:42 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
 <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>, Zong Li
 <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] riscv: Factorize xip and !xip kernel address
 conversion macros
Message-ID: <20210603204942.703c9cb4@xhacker>
In-Reply-To: <20210603202748.2775f739@xhacker>
References: <20210603082749.1256129-1-alex@ghiti.fr>
 <20210603082749.1256129-2-alex@ghiti.fr>
 <20210603202748.2775f739@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3gqAs0bhgtwmJAA--.45431S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr43WFyrXw1xuw4xKr13CFg_yoWrXF47pr
 1kKrnrGFWSqrWY93yjv3Z09as8JwnxW343KrsrK3s5A3Z0yF4xWFyv9wnxuryjqFWjvFsa
 vryfJr1a9w1jqwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2rcTDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_055524_293718_5992DE0E 
X-CRM114-Status: GOOD (  19.13  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 3 Jun 2021 20:27:48 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> On Thu,  3 Jun 2021 10:27:47 +0200
> Alexandre Ghiti <alex@ghiti.fr> wrote:
> 
> > To simplify the kernel address conversion code, make the same definition of
> > kernel_mapping_pa_to_va and kernel_mapping_va_to_pa compatible for both xip
> > and !xip kernel by defining XIP_OFFSET to 0 in !xip kernel.
> > 
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> >  arch/riscv/include/asm/page.h    | 14 +++-----------
> >  arch/riscv/include/asm/pgtable.h |  2 ++
> >  2 files changed, 5 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 6a7761c86ec2..6e004d8fda4d 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -93,9 +93,7 @@ extern unsigned long va_pa_offset;
> >  #ifdef CONFIG_64BIT
> >  extern unsigned long va_kernel_pa_offset;
> >  #endif
> > -#ifdef CONFIG_XIP_KERNEL
> >  extern unsigned long va_kernel_xip_pa_offset;
> > -#endif
> >  extern unsigned long pfn_base;
> >  #define ARCH_PFN_OFFSET		(pfn_base)
> >  #else
> > @@ -103,6 +101,7 @@ extern unsigned long pfn_base;
> >  #ifdef CONFIG_64BIT
> >  #define va_kernel_pa_offset	0
> >  #endif
> > +#define va_kernel_xip_pa_offset 0
> >  #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
> >  #endif /* CONFIG_MMU */
> >  
> > @@ -110,29 +109,22 @@ extern unsigned long kernel_virt_addr;
> >  
> >  #ifdef CONFIG_64BIT
> >  #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
> > -#ifdef CONFIG_XIP_KERNEL
> >  #define kernel_mapping_pa_to_va(y)	({						\
> >  	unsigned long _y = y;								\
> >  	(_y >= CONFIG_PHYS_RAM_BASE) ?	  
> 
> This CONFIG_PHYS_RAM_BASE is only available for XIP, could result in a
> compiler error for !XIP?
> 
> I'm also concerned with the unecessary overhead of kernel_mapping_pa_to_va()
> for !XIP case, there's a "if" condition branch, and extra symbol: va_kernel_xip_pa_offset

Err, I just found this symobl always exists no matter XIP is enabled or not.
I will send out a patch for this clean up

> 
> >  		(void *)((unsigned long)(_y) + va_kernel_pa_offset + XIP_OFFSET) :	\
> >  		(void *)((unsigned long)(_y) + va_kernel_xip_pa_offset);		\
> >  	})
> > -#else
> > -#define kernel_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_kernel_pa_offset))
> > -#endif
> >  #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
> >  
> >  #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - va_pa_offset)
> > -#ifdef CONFIG_XIP_KERNEL
> >  #define kernel_mapping_va_to_pa(y) ({						\
> >  	unsigned long _y = y;							\
> >  	(_y < kernel_virt_addr + XIP_OFFSET) ?					\
> >  		((unsigned long)(_y) - va_kernel_xip_pa_offset) :		\
> >  		((unsigned long)(_y) - va_kernel_pa_offset - XIP_OFFSET);	\
> >  	})  
> 
> Similar as kernel_mapping_pa_to_va(), an overhead of "if" condition branch
> for !XIP and extra va_kernel_xip_pa_offset symbol.
> 
> > -#else
> > -#define kernel_mapping_va_to_pa(x)	((unsigned long)(x) - va_kernel_pa_offset)
> > -#endif
> > +
> >  #define __va_to_pa_nodebug(x)	({						\
> >  	unsigned long _x = x;							\
> >  	(_x < kernel_virt_addr) ?						\
> > @@ -141,7 +133,7 @@ extern unsigned long kernel_virt_addr;
> >  #else
> >  #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
> >  #define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
> > -#endif
> > +#endif /* CONFIG_64BIT */
> >  
> >  #ifdef CONFIG_DEBUG_VIRTUAL
> >  extern phys_addr_t __virt_to_phys(unsigned long x);
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index bde8ce3bfe7c..d98e931a31e5 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -77,6 +77,8 @@
> >  
> >  #ifdef CONFIG_XIP_KERNEL
> >  #define XIP_OFFSET		SZ_8M
> > +#else
> > +#define XIP_OFFSET		0
> >  #endif
> >  
> >  #ifndef __ASSEMBLY__  
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
