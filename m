Return-Path: <SRS0=HYxj=TH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F691C004C9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 May 2019 23:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019F3205ED
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 May 2019 23:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p07LzzYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019F3205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QUXM6ISvZLOgJRZ4c0r+N9QZbAGUyBI/uD7ws4XUhHg=; b=p07LzzYR//QgjnM2mdfisDBeg
	mB3/NxGEf6AIaOV214rIgGLZrnQl9fC/FCHPCdRD6qZMZ/s4fY4pR/FYmuCC2zQjuS7y25t3aH94N
	Ps7hrhBIywTnnBfdg1SOoHejp/m9aMI9/S/97Bkhchi4SwakqOzRZRq8ZBwwxgrp/dCxeSXTjobNV
	2gDufrqeYCYZMW2qKMTqAVLeDH3Ai2qZiWcZQdO8/hAO2VOGlL48bbCh+asK5cF9N2lUTbjBHD6DN
	hiE09QY/jwR1e8iS46Eh32NYBBcH29xJ2maRfj5Arn3LhxLVAW5bS/Ui2uVFANXkTlPayP1Ge4nvX
	qoZkAXKSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO9oh-0001VA-8z; Tue, 07 May 2019 23:48:11 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO9od-0001UR-Et
 for linux-riscv@lists.infradead.org; Tue, 07 May 2019 23:48:09 +0000
Received: by mail-pf1-f196.google.com with SMTP id u17so9468259pfn.7
 for <linux-riscv@lists.infradead.org>; Tue, 07 May 2019 16:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Xc5yB1zQ65A+bT/TEX7kwPlOeoH820lrDziLp7lmLpk=;
 b=sjEtIrFSpa9RJytZoG35u5aGLZEx/nblegktkPmtT3/nC2uaRzo5tRYTK3vsZ7m2Ya
 mHZArjyVwr3uu4sz2c123/zjWL1Ri2xX15eJNxPhVAA/uHUxfi9AG/cyK5dcUQVUTDaT
 eLUBT0HmJwPbyhzfemp8alwyzpfU5vcB2ZjEuO+YOFspRXZN9z5+kQD5/jYfcHW/tUSK
 Qz1+IJj+o7fiY6ojzj2YyBytBTSV26nATi6OBIeB1/U+sP99LoqlPYfP+hNkbrhGX6W4
 7r81FqM0YNgbhDM1WjfvxoXrjYXsFvCJPSIpReLaLdoLho/zj2VfC50PHsyZSVbbvkRu
 tq5w==
X-Gm-Message-State: APjAAAUHf3Bs+mh2l1M1NCCR8uoRl/Opl7GTOpVD60DZv4xD0huHvmRb
 tUHv59uj+bEpq9KBH4zxCcKJn1wUfXg=
X-Google-Smtp-Source: APXvYqzxi+8s0kTgdE3wx6h+YyLz1JxmMhnAT4Dvn0eloXEXtiTyplpknHAhK/JvQQI++cJkR2huwA==
X-Received: by 2002:aa7:8186:: with SMTP id g6mr45461551pfi.126.1557272884660; 
 Tue, 07 May 2019 16:48:04 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q17sm35869266pfi.185.2019.05.07.16.48.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 16:48:03 -0700 (PDT)
Date: Tue, 07 May 2019 16:48:03 -0700 (PDT)
X-Google-Original-Date: Tue, 07 May 2019 16:27:44 PDT (-0700)
Subject: Re: [PATCH] riscv: fix locking violation in page fault handler
In-Reply-To: <mvm5zqmu35d.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-56794b7f-6cd4-4eb9-a962-83ad256ed3cd@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_164807_505736_8A67967E 
X-CRM114-Status: GOOD (  18.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 May 2019 00:36:46 PDT (-0700), schwab@suse.de wrote:
> When a user mode process accesses an address in the vmalloc area
> do_page_fault tries to unlock the mmap semaphore when it isn't locked.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/mm/fault.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 88401d5125bc..c51878e5a66a 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -181,6 +181,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	up_read(&mm->mmap_sem);
>  	/* User mode accesses just cause a SIGSEGV */
>  	if (user_mode(regs)) {
> +bad_area_do_trap:
>  		do_trap(regs, SIGSEGV, code, addr, tsk);
>  		return;
>  	}
> @@ -230,7 +231,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		int index;
>
>  		if (user_mode(regs))
> -			goto bad_area;
> +			goto bad_area_do_trap;
>
>  		/*
>  		 * Synchronize this task's top level page-table

I got lost with all the gotos, I think something like this is cleaner

    diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
    index 26293bc053a8..cec8be9e2d6a 100644
    --- a/arch/riscv/mm/fault.c
    +++ b/arch/riscv/mm/fault.c
    @@ -229,8 +229,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
                    pte_t *pte_k;
                    int index;
    
    +               /* User mode accesses just cause a SIGSEGV */
                    if (user_mode(regs))
    -                       goto bad_area;
    +                       return do_trap(regs, SIGSEGV, code, addr, tsk);
    
                    /*
                     * Synchronize this task's top level page-table

Unless anyone has a better idea?

Either way:

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

LMK if you, or anyone else, has a preference.  I'm assuming this will go in
through my tree, so I've picked up my version for now :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
