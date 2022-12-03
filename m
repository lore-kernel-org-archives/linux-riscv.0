Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63F2C4321E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ml19FfBPDfZms6hUnCJ0FGGB8RosoDNSrpE9BqOrG14=; b=iEhsbVbclp3zGfoGCYftnidIcM
	s1Ztm78cVl8o4WrfOX6wHRIvHeYUkcHiqJrhnb5ecaMerA6TlmIU2J+3K61F60gdWS+7gaPF9KkKx
	JIMlmRwBsrPDLTNJuiCTIO9WwzRhiYf51VSF2Lx0VJxwYsnjig8SHQoYEnEnHK2KRJC2gIwl6rdmY
	Y0nfs4qh0HOj/tjpcxLq1iQHXcsSMdMZA7kTXlbUWTQWpI8D/Pl0YC3Q72ZD69758iXdP84tEjak+
	aSDtOeRFWqvuWGKY/ihmJ7jiKQNbzUxP1ehoaTfpe87O2bfmUrXCtoNwujAmEdv0zuJZq4XtUbkVA
	DF/75DXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ItF-002C4J-67; Sat, 03 Dec 2022 03:08:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ItA-002C1R-1H
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:08:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id jl24so6279537plb.8
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9Qp9+HUESamZgztegXLRYtfdkMT+u4+Qv2NAYZnOI=;
        b=1TnXWNaLs9L2SGmKWGvwVuLiAMISwdppdRsaXmjW8/Ifgbh65V+sFHT6jSK3efeV+H
         eAkycYUrU0kme/RNCuau7q9Ci5Us7JJ1AWI8s8MVztjY2o/tJeajIwTdSet+jtZwY9Vm
         27qH7wVQvSKSulitlpL2H/fsQXmsjro1Dgzgu06ngaBBTqQG+JfQGaOFooXmfEWvVB2z
         TTRrvCa//1z3sGNzyaJ/r9Q4bRbRawCaWaSOz1Fq7Z1VfTkNkHxoS4txIrJt78PG96Ja
         2UdKSMERnAzJPJzZrzUj1bN55ajKwGMRpb3VgoNu0+TLweom0fpPR7OY3HyrVzmjaTnH
         Y+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ9Qp9+HUESamZgztegXLRYtfdkMT+u4+Qv2NAYZnOI=;
        b=xJqg6AOwy2EtQybv6hiljBymv2OiTGsYNqjM7zxFWPC6AntdTkbWI1aYtbb+90R5d1
         GDSrQlAyNIr8+3MOWhC3GoChQEFLwk5jWXpdMM50wbOYd+rGzcpyz7htKP2OiucF2YMn
         AavLd0EN3X/239WtnKD+c838VD6pQVhjTEbFAOov60tVD8LKLUntyIfOfg4c0zbV8p80
         zHJxPc1+c19TqFzRw21isFYUhpFC6IoOiB+ZfyeOMSXeTylticSAU3xcnf6xM60OnkK/
         0g7DFzYBD8o+bU6K++8RH0OM5vhVn2Tch6AlZeGk7qom1IfTMv0IiZmArjCeUBnHVjCn
         Czlw==
X-Gm-Message-State: ANoB5pnVxtdvavFm3tvEGnO+b7qjEsvqzQadhGJhfbANQwNq2MFpCNsV
	YvdglEJFqnx7guFXtNENkL5DpuioR4ya5k6CfGY=
X-Google-Smtp-Source: AA0mqf7hfOIxl4dhjVVh92XpSOTYxffO3W5Xrb5h+3teV6aZE157757zhWFRQm/ssukejgOBV+eQhA==
X-Received: by 2002:a17:902:e949:b0:189:7a15:1336 with SMTP id b9-20020a170902e94900b001897a151336mr33837903pll.122.1670036906752;
        Fri, 02 Dec 2022 19:08:26 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c194-20020a621ccb000000b0056d3b8f530csm5773033pfc.34.2022.12.02.19.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:08:26 -0800 (PST)
Date: Fri, 02 Dec 2022 19:08:26 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 19:08:14 PST (-0800)
Subject: Re: [PATCH -next v2] riscv/mm/fault: simplify code for do_page_fault()
In-Reply-To: <20221029084715.3669204-1-tongtiangen@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, tongtiangen@huawei.com,
  wangkefeng.wang@huawei.com, guohanjun@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tongtiangen@huawei.com
Message-ID: <mhng-8618b532-dfe2-48bf-a5ab-4247cf36d07e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190828_318114_EBAD4B2D 
X-CRM114-Status: GOOD (  31.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 29 Oct 2022 01:47:15 PDT (-0700), tongtiangen@huawei.com wrote:
> To make the code more hierarchical and readable, we fold vma related
> judgments into __do_page_fault(). And to simplify the code, move the
> tsk->thread.bad_cause's setting into bad_area(). No functional change
> intended.
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
> v1 -> v2:
>   Fixed incorrect use of macro VM_FAULT_BADMAP.
>
>  arch/riscv/mm/fault.c | 77 +++++++++++++++++++++++--------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index d86f7cebd4a7..3fdc2eebdd36 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -85,6 +85,8 @@ static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_f
>
>  static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code, unsigned long addr)
>  {
> +	current->thread.bad_cause = regs->cause;
> +
>  	/*
>  	 * Something tried to access memory that isn't in our memory map.
>  	 * Fix it, but check if it's kernel or user first.
> @@ -200,6 +202,38 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
>  	return false;
>  }
>
> +#define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
> +#define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)

These alias with VM_FAULT_HINDEX_MASK.  I just sent along 
<https://lore.kernel.org/all/20221203030356.3917-1-palmer@rivosinc.com/T/#t> 
to clean that up for the other ports that also do so, I'm going to hold 
off on this patch until I see what the comments on that one look like.

Otherwise this looks fine, it might not make 6.2 pending the discussion 
over there.

Thanks!

> +
> +static vm_fault_t __do_page_fault(struct mm_struct *mm, unsigned long addr,
> +				unsigned int mm_flags, struct pt_regs *regs)
> +{
> +	struct vm_area_struct *vma = find_vma(mm, addr);
> +
> +	if (unlikely(!vma))
> +		return VM_FAULT_BADMAP;
> +
> +	if (unlikely(vma->vm_start > addr)) {
> +		if (unlikely(!(vma->vm_flags & VM_GROWSDOWN) ||
> +				expand_stack(vma, addr)))
> +			return VM_FAULT_BADMAP;
> +	}
> +
> +	/*
> +	 * Ok, we have a good vm_area for this memory access, so
> +	 * we can handle it.
> +	 */
> +	if (unlikely(access_error(regs->cause, vma)))
> +		return VM_FAULT_BADACCESS;
> +
> +	/*
> +	 * If for any reason at all we could not handle the fault,
> +	 * make sure we exit gracefully rather than endlessly redo
> +	 * the fault.
> +	 */
> +	return handle_mm_fault(vma, addr, mm_flags, regs);
> +}
> +
>  /*
>   * This routine handles page faults.  It determines the address and the
>   * problem, and then passes it off to one of the appropriate routines.
> @@ -207,7 +241,6 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
>  asmlinkage void do_page_fault(struct pt_regs *regs)
>  {
>  	struct task_struct *tsk;
> -	struct vm_area_struct *vma;
>  	struct mm_struct *mm;
>  	unsigned long addr, cause;
>  	unsigned int flags = FAULT_FLAG_DEFAULT;
> @@ -280,44 +313,16 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		flags |= FAULT_FLAG_INSTRUCTION;
>  retry:
>  	mmap_read_lock(mm);
> -	vma = find_vma(mm, addr);
> -	if (unlikely(!vma)) {
> -		tsk->thread.bad_cause = cause;
> -		bad_area(regs, mm, code, addr);
> -		return;
> -	}
> -	if (likely(vma->vm_start <= addr))
> -		goto good_area;
> -	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN))) {
> -		tsk->thread.bad_cause = cause;
> -		bad_area(regs, mm, code, addr);
> -		return;
> -	}
> -	if (unlikely(expand_stack(vma, addr))) {
> -		tsk->thread.bad_cause = cause;
> -		bad_area(regs, mm, code, addr);
> -		return;
> -	}
>
> -	/*
> -	 * Ok, we have a good vm_area for this memory access, so
> -	 * we can handle it.
> -	 */
> -good_area:
> -	code = SEGV_ACCERR;
> +	fault = __do_page_fault(mm, addr, flags, regs);
>
> -	if (unlikely(access_error(cause, vma))) {
> -		tsk->thread.bad_cause = cause;
> -		bad_area(regs, mm, code, addr);
> -		return;
> -	}
> +	if (unlikely(fault & VM_FAULT_BADMAP))
> +		return bad_area(regs, mm, code, addr);
>
> -	/*
> -	 * If for any reason at all we could not handle the fault,
> -	 * make sure we exit gracefully rather than endlessly redo
> -	 * the fault.
> -	 */
> -	fault = handle_mm_fault(vma, addr, flags, regs);
> +	if (unlikely(fault & VM_FAULT_BADACCESS)) {
> +		code = SEGV_ACCERR;
> +		return bad_area(regs, mm, code, addr);
> +	}
>
>  	/*
>  	 * If we need to retry but a fatal signal is pending, handle the

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
