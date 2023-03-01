Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF05EC7EE2D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WE1Vtxg3yUx+02hC2Atw2I3HLjTghF1dx4cRsR8lHZA=; b=Auu9iQCMBtUkHh
	Chpp7NhdMJSSxv4gfvD/plbRZ2gWexrmfwjkhoqFjkIMAfXWozQE2fiIIvIAbWvLzGKzt8kfnpzul
	uJYwfN2pKdkQqxR4qbWT1UTlDcnBqw/YqH67w7Jc+jLmlX18CcS2XC5rU6LGCnEVCcLSjVd9rWHcC
	Jx9vEvweRGfqXeTY0bkyGb9/1aI4Q2IunAxfasP5JaI83FSdbuna9qBiGMPnzFRn9AxUWuQOlY1+T
	PwriQ1avgtyBWYpAgveakBCPwEiX9i0lrfTdp0ZnKJg56JE6WXH0Gp1UVMKzfj2ivXvLdSEzFEZIa
	UbvzwLGNiipvnhx17/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKU0-00FuKh-Bg; Wed, 01 Mar 2023 11:18:52 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKTv-00FuIb-WE
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 11:18:50 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 321BHUJK055101;
	Wed, 1 Mar 2023 19:17:30 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from APC323 (10.0.12.101) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Wed, 1 Mar 2023 19:17:28 +0800
Date: Wed, 1 Mar 2023 19:17:53 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liushixin2@huawei.com>, <x5710999x@gmail.com>, <bjorn@rivosinc.com>,
        <abrestic@rivosinc.com>, <peterx@redhat.com>, <hanchuanhua@oppo.com>,
        <apopple@nvidia.com>, <hca@linux.ibm.com>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <tim609@andestech.com>, <peterlin@andestech.com>,
        <ycliang@andestech.com>
Subject: Re: [PATCH] RISC-V: mm: Support huge page in vmalloc_fault()
Message-ID: <Y/80YZOMce2cgITi@APC323>
References: <20230224104001.2743135-1-dylan@andestech.com>
 <8adb9dcb-621a-0392-9ccd-0117345636ec@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8adb9dcb-621a-0392-9ccd-0117345636ec@ghiti.fr>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Originating-IP: [10.0.12.101]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 321BHUJK055101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_031848_566785_7EF19A2C 
X-CRM114-Status: GOOD (  22.48  )
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

On Fri, Feb 24, 2023 at 01:47:20PM +0100, Alexandre Ghiti wrote:
> Hi Dylan,
> 
> On 2/24/23 11:40, Dylan Jhong wrote:
> > RISC-V supports ioremap() with huge page (pud/pmd) mapping, but
> > vmalloc_fault() assumes that the vmalloc range is limited to pte
> > mappings. Add huge page support to complete the vmalloc_fault()
> > function.
> > 
> > Fixes: 310f541a027b ("riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT")
> > 
> > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > ---
> >   arch/riscv/mm/fault.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index eb0774d9c03b..4b9953b47d81 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -143,6 +143,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
> >   		no_context(regs, addr);
> >   		return;
> >   	}
> > +	if (pud_leaf(*pud_k))
> > +		goto flush_tlb;
> >   	/*
> >   	 * Since the vmalloc area is global, it is unnecessary
> > @@ -153,6 +155,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
> >   		no_context(regs, addr);
> >   		return;
> >   	}
> > +	if (pmd_leaf(*pmd_k))
> > +		goto flush_tlb;
> >   	/*
> >   	 * Make sure the actual PTE exists as well to
> > @@ -172,6 +176,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
> >   	 * ordering constraint, not a cache flush; it is
> >   	 * necessary even after writing invalid entries.
> >   	 */
> > +flush_tlb:
> >   	local_flush_tlb_page(addr);
> >   }
> 
> 
> This looks good to me, you can add:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> One question: how did you encounter this bug?
> 
> Thanks,
> 
> Alex
>
Hi Alex,

>>> One question: how did you encounter this bug?
This bug is caused by the combination of out-of-order excutiuon and ioremap().
The OoO excution will try to access the VA that is given by ioremap() and record
a page fault in TLB before the mapping is created in ioremap(). When the CPU
really accesses the VA after ioremap(), the CPU will trigger page fault because
of the TLB already has the VA mapping.

We hope that the vmalloc_fault() in page fault handler will trigger sfence.vma
to invalidate the TLB[1]. But since we do not support the huge page in vmalloc_fault(),
we encountered the nested page faults in vmalloc_fault() while forcing the pmd/pud
huge pages to resolve pte entry. This is the reason I send this patch.

ref:
    [1]: https://patchwork.kernel.org/project/linux-riscv/patch/20210412000531.12249-1-liu@jiuyang.me/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
