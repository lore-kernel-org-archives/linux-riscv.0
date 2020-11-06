Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ACDC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 05:15:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32EED20756
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 05:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CkCIoG2z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="sxzKNtT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32EED20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QxI8vAFocbV1rGcNscS20pIrhYGgeRqdnfVFQB5QToM=; b=CkCIoG2zGUTq/OvWKmXvu5rR8
	mqaXLPGpHWoZq7KQ4WAzCZvlZNvg/YXfSglhbMM7uKT8JkrpUZSP7evwAAi8EJl3eg7ygGC7+aAZ1
	rTOOvgCAoA98uOPxReeLYWEVtXTlGqOEr5MokvrlKbW+wjjAqvj1HSWgebsp+Ku/C8O3Nkz/wIIF+
	+3YhiF8Vb0zDhgdDVzU+KbMTEboTtu//tcljZUCzQQtv4KTUttAI/KurWTeJE0lYuKyHaYI15PYkL
	iE0cAGBNcplXk2tdhDLFjbcU2fh8OAlhlW6nIv6WPfsRc3iLWfkPc1jRnNWV+tEvLLnBLNVHbTPRY
	IX77VcuAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kau5x-0006T7-Rm; Fri, 06 Nov 2020 05:15:29 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kau5u-0006RK-Bf
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 05:15:27 +0000
Received: by mail-pg1-x544.google.com with SMTP id i7so30527pgh.6
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 21:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bOyMY+kSzPHfwt/YncbXWhyMG339YQ0Eyf//8x4re5M=;
 b=sxzKNtT3Kl3Pq5Hy6+8t255HdE0ljEqClI1T55mSDPoCbBsKt74RNGf5oBWIzC0GPd
 hpi4pU2ufKZQJqRb84TjQaB4cTCCSRVg17X98+Ptpg0ieIQjkUvuhTdMGE+50UtgHiXK
 sCJsyjb5khhk39QbRNw0qGChaD8o4vWr/PRdlPWK+Ha/ozovwEqvde8HCYLr0Gft7Szj
 8c791wMbmFDcTvJRmIKp79/YrGCSUgpy9Xq13o6J1+lmUH6c24ItQ4pxaCYyL+QWE2DL
 aufscq+4M3Oh4O8FeB7yMqMYT4YWGGHR+FxfunvHJhNYisQXQRBgmuvPOV4y1P2z3cnE
 JCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bOyMY+kSzPHfwt/YncbXWhyMG339YQ0Eyf//8x4re5M=;
 b=XLpny/4Y2E70iRtqraYfEx1aptsjzLaxFFZEkBkyNyJZtkQ4lkSLVzlWSA9/oWqZ/n
 9cX1CyfMi3m3wCs52j8cUz/G3C6CkV/DtaTBAq708nXRdmCC1piiF+4e10+3jje6BJo7
 yn2CHoCjp/PLplSeHWzjkKzXqMYFflLODiUi1Zwl2xGQi/0PzuT2gdoneXzMOOqRI5WJ
 iynLOAMT9uZI92L11VB91uygyXkc4KbZN1WlTGXQRKSg3LBzva6VeWTjhxYklhdtKImg
 Rup9pcise8bknbHqn2QsGXnby2tPB4zFEmKIMN5KQcOsH+723xR9z0E1ciEd1BNdqDAc
 O0og==
X-Gm-Message-State: AOAM530Sdfk3Hi3t3zYLvrrs2WIfXyKf5YuvzrJAd80Evm01Z1EDrMCI
 6ncZ655hXnGQkNzVhU56z7Zqbw==
X-Google-Smtp-Source: ABdhPJy03qWK3hg/CNy1wVGvdT9LABzVtA/BxBq+lNzIlCFWd3Z1xTdXuDWwracFQ7Cunk4gx7mSaQ==
X-Received: by 2002:a63:180f:: with SMTP id y15mr294401pgl.324.1604639724127; 
 Thu, 05 Nov 2020 21:15:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g7sm371018pfi.16.2020.11.05.21.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 21:15:23 -0800 (PST)
Date: Thu, 05 Nov 2020 21:15:23 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 21:14:46 PST (-0800)
Subject: Re: [PATCH v3] riscv: fix pfn_to_virt err in do_page_fault().
In-Reply-To: <1603715214-29082-1-git-send-email-liush@allwinnertech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liush@allwinnertech.com
Message-ID: <mhng-eb94691e-6afe-4802-bf03-949f0a22b467@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_001526_425262_5E80F2C7 
X-CRM114-Status: GOOD (  21.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, liush@allwinnertech.com,
 linux-kernel@vger.kernel.org, peterx@redhat.com, penberg@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, akpm@linux-foundation.org,
 walken@google.com, linux-riscv@lists.infradead.org, vbabka@suse.cz
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 26 Oct 2020 05:26:54 PDT (-0700), liush@allwinnertech.com wrote:
> From: Liu Shaohua <liush@allwinnertech.com>
>
> The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: liush <liush@allwinnertech.com>
> ---
>  arch/riscv/mm/fault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 1359e21..3c8b9e4 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -86,6 +86,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>  	pmd_t *pmd, *pmd_k;
>  	pte_t *pte_k;
>  	int index;
> +	unsigned long pfn;
>
>  	/* User mode accesses just cause a SIGSEGV */
>  	if (user_mode(regs))
> @@ -100,7 +101,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>  	 * of a task switch.
>  	 */
>  	index = pgd_index(addr);
> -	pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> +	pfn = csr_read(CSR_SATP) & SATP_PPN;
> +	pgd = (pgd_t *)pfn_to_virt(pfn) + index;
>  	pgd_k = init_mm.pgd + index;
>
>  	if (!pgd_present(*pgd_k)) {

This is on fixes, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
