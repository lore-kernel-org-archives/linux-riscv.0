Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B068C44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZswOsElzMR0yJ78vNea4CQnwWWtCQbKp3Pr8cMlILU=; b=t8jVs8yPqJE0AS
	eJRgXqxZC+xoMTiNvTMyDHLiQSH63JCFnmp0P4My7WL/j4uVEPl2rhKd2wmaUW+iB1QsGyGBi4P0T
	GtNUs590NtWcpmSHnW2UNSDYB1Dks3UDwPfmbNYyPE4ZhulS/yh65TK6TKgTWbB0iFJalCqgCNZ/G
	2EGFfwDhPvs2B44gt53ilNXnjINVOmjncF5fVU1fFbK3dJR5vsL1cuMMZzV3cHhABd7YDzl3EU3tt
	TGWlbi7CldgLy6rUFxXE66LwwrQUmWJ34OPq1zacf3POQHVxmy+9kGa+qsrp1cquvKlRxgv6gWeWB
	1SCz9NpmcmQmk22uTcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklL1-00000002jT3-37CJ;
	Fri, 17 Jul 2026 16:22:59 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklKy-00000002jSS-439a
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 16:22:59 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6675db463b9so3890106d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784305375; x=1784910175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Atpe8oiFuJo0ZpVqSFjP8RyKcje4LD3ZY7D56RIa880=;
        b=CBgpub3WmPXBg0BvYIKLYfk4sMoqs5yye6+KzCeinIcpCXE4paeyeBISMBiAcW/3SN
         q5WZYyJQJFtDI2mvWs87T4saKMdThFFZ84iEnF0KYQoE+CicUioGkdt50tnA7253IPsj
         wzTyGMiMANwWoSLauQgy2pxeb3qvmrgscrQWTA/Ng4375MEz6vxc2L8LDFHprMlMFFxB
         Dl4DcElthoZseUyHvYYF3XF+d7/ALFwm70WGKkCkdoe7rPQs3DTd2DxJkW3Owglkn5tj
         x1MmNMlDA/+3zYpwscv3IJZ6ACJ+1nJeWS9u71vexTl07rMVshpkQJxdjM/oYhhyPXxo
         +PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305375; x=1784910175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atpe8oiFuJo0ZpVqSFjP8RyKcje4LD3ZY7D56RIa880=;
        b=fFA+nbd0u4XAeOpbwrhkNPp/RMjJq6x2Z+RYkRLjZBy4kDHrMfH0rya8tDChxNSLJv
         KdETpIko8tLXeDmOkCBfmTDp8ulDmoUQKkTclMuLmnQwr2PFOYgUZysYRWVte04kmExX
         ukLEVhqqKM3NAJ66abODK06+yqB4jAeYa6Y0es/3+t2DqVBdXcMkXgrn3hk/hxP4Mw9e
         d924PAEwlM+Sk8fPe+44gAGpEBjI+VBaBYHUPA8nBRJZ3PR0cvsiqkYi2TqLR8sQ8rtI
         UhS3G0iyMv/NjILtXiNOkEI7M0a5qxPeKXpNHepbzkEz6AyikgRwLGJHelQfrIry8sUY
         1A/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr62Zybvxv+IqijRX+Pj2ITiCUexcLCknEme/XrwKkg8YhiUaqWTnpdyTxlcxgXxkqAGwczOfX82XWPbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyynVGr1Mzn86pdIZQB+87KfH6TETC+ozRwr9ZusAGuvL4TDllI
	CDxUEcaABjSlc3gzvXh/rA2QWayZx5MVa0AoIeq71oMSg/2eGeeQGOajS0Nm/bXcnXE=
X-Gm-Gg: AfdE7cnwhFJbREOEAJjxnPWBGQzVyqDb6vGggYRyjWX9rSmZhyt0iI/da+I9GTrEan+
	O+0Y2UznyHG3FcRU/yIPGbkMqMTaQ2Af6TZ7HsRCHzOMO/bqeH6QGcFddMw1z8DGmnk4NWIO6yL
	7JUhG6oK6qM7xNwhXwOb8vQ4axHdRRuBsxEXblSbjYjsr6HCJjwEqsS+YfKpAA0YoFEfB+hQHgc
	SqlqBSbcS4pcWvRQQh1rfbY9KrbmVZz5R/XevMKTfXzB0hCzX9QivD1Ekw5rWmgacwuMPQ2kyqF
	g3GY248Sz92fypAw3nsRkoUL4uf2knrQifo0A4HZ7JEh0t4zLJ7RdXjrFsTRYL4N9/et/pj7kSl
	Z3vrLMQELMDQMAwdssLjj3J6/x2TYdDqoPss/s2+bNzRWLBRJyYtUWly5/gLi4aE0bAjRUbTKBY
	A058v9rIjVq+pqcq0tOVRqvQg+KAu4AI/iNqQGPOmCgXopd3E=
X-Received: by 2002:a05:690e:138f:b0:667:8b91:2429 with SMTP id 956f58d0204a3-6683be34e8amr896532d50.88.1784305375240;
        Fri, 17 Jul 2026 09:22:55 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:a95b:4a36:131e:330b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6683b56fbf3sm1812291d50.8.2026.07.17.09.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:22:54 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:22:40 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Klara Modin <klarasmodin@gmail.com>, Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in update_mmu_cache()
Message-ID: <yztlgx3bzablvmipbppedmemyihhvv6esg6qmu2ldwmjg53lp7@z6odepyf4hyp>
References: <20250901114141.5438-1-luxu.kernel@bytedance.com>
 <20250901114141.5438-2-luxu.kernel@bytedance.com>
 <albbQtulrnpOmmBp@soda.int.kasm.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <albbQtulrnpOmmBp@soda.int.kasm.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_092257_200828_D1C918E4 
X-CRM114-Status: GOOD (  19.23  )
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

On Wed, Jul 15, 2026 at 03:14:25AM +0200, Klara Modin wrote:
> Hi,
> 
> On 2025-09-01 19:41:40 +0800, Xu Lu wrote:
> > Only flush tlb of the specified mm, and apply svinval if available.
> > 
> > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h  | 16 +++++++++++++++-
> >  arch/riscv/include/asm/tlbflush.h | 23 +++++++++++++++++++++++
> >  arch/riscv/mm/tlbflush.c          | 23 -----------------------
> >  3 files changed, 38 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 91697fbf1f901..165cd02d51629 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -495,9 +495,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
> >  		struct vm_area_struct *vma, unsigned long address,
> >  		pte_t *ptep, unsigned int nr)
> >  {
> > +	int i;
> > +	unsigned long asid = get_mm_asid(vma->vm_mm);
> > +
> >  	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
> >  		 : : : : svvptc);
> >  
> > +	asm goto(ALTERNATIVE("nop", "j %l[svinval]", 0, RISCV_ISA_EXT_SVINVAL, 1)
> > +		 : : : : svinval);
> > +
> >  	/*
> >  	 * The kernel assumes that TLBs don't cache invalid entries, but
> >  	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
> > @@ -506,7 +512,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
> >  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
> >  	 */
> >  	while (nr--)
> > -		local_flush_tlb_page(address + nr * PAGE_SIZE);
> > +		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
> > +	return;
> > +
> > +svinval:
> > +	local_sfence_w_inval();
> 
> > +	for (i = 0; i < nr; i++)
> > +		local_sinval_vma(address + nr * PAGE_SIZE, asid);
> 
> Probably should be
> 
>  +	for (i = 0; i < nr; i++)
>  +		local_sinval_vma(address + i * PAGE_SIZE, asid);
> 
> instead. My BPI-f3 hangs when entering the initramfs with the original
> patch. Reverting also fixes it.

I'm also noticing this. linux-next is unable to enter userspace due to
this on Spacemit K1. Hopefully we can get a fix merged in soon.

Regards
Anirudh Srinivasan

> 
> > +	local_sfence_inval_ir();
> > +	return;
> >  
> >  svvptc:;
> >  	/*
> 
> Regards,
> Klara Modin
> 
> ...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
