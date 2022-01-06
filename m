Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 04:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=owEQwxA5vDoxYNdAw8mGZpybxxXY3QUVU0Tc++DCXuM=; b=vwsbr2O9ZWw6tgipabdpCHq8FT
	13pzPPq1dtN6doD3A8WkWglldPrsKa7u8qRZ+55AW5BNPeHL3GDYsW3v7dQqB3ha1+qo1X2XKnJSP
	NhpzJmpd2JgVPtekFUEfNV+2N3dZYlGmDHFgzfZVFRMj0kg12z9hDxpqQHfSUU5TXeK8I2w0G58gY
	wl2NdejDOoU847Qc2bD6++W+c3WM+8op69bZNy4Ro2o3OTmv+sRuuXVTPV1xlHasNEWcXxI/bqt1Q
	v1YFsUofNnkffaY22J6/nP72pAPK42Sp6k6y54u1DIWi3g70g+XSCG9ptSqc2qWOePc387HdCUoyb
	gnK5E0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Jx3-00GOg2-Qy; Thu, 06 Jan 2022 04:00:33 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Jx0-00GOeE-J9
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 04:00:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id m13so1379020pji.3
 for <linux-riscv@lists.infradead.org>; Wed, 05 Jan 2022 20:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0WJAe8vxjl7vSZNcsIANJLCfbMukeeVxdbXpzSS2gAY=;
 b=ytgcbQT85rdiawNwIyNcmPAuOq1gXc082nJNwsH/uch+gt+c/Q6UZ07G5jrsOgOop1
 bO7jsFge3z23IBfV0H/87EJWQNukgjXSxVLoZsyWjBnVMUETB175M2Nr9E631UjjBmSa
 dsRZehQs/7k3uyGOUkuwZk2fdhnqSkNATY5oVO1rEcDxaJ9AS94RrYWGMvAfTiStc7FA
 rhVGcKTMoYcqxDaC7Hb1rbQW3bkyPu/KY5iCIUjKoRnq0OoQwm9WzN402ZwYapdc5EPt
 Yvq0aHZnueTzCBh64xNI+SvxqAVt6biXZ0odcK0/bepo47S3XUxZKCU+ExWWnLsMhqT4
 HLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0WJAe8vxjl7vSZNcsIANJLCfbMukeeVxdbXpzSS2gAY=;
 b=F/x4bqC3fB1Q2NQ778TrlZ6xRkNYbhGAvBNLMTckFE4PIx/qXzCiDpWI2feyqkczq9
 vVXAawluRDccw1rng9z14NIGG586w81OfVjua+XgOkeLbQWpbwcw05vWlszYLIoMgLSL
 GeVQEoXXVPXZjDnKTtQC/OH7UKE8D9Wr41rOFS0oRbFvJ72L7W+u9Bgj1BcauvccFsZs
 7GFLo6UF7gfDxj5ue0cPQ1B61wjTzLpA/fiNv8UWLOeY2wcm5u4oHeQGJd7zBxMWyuHv
 zrYqY0ibcBoOAkXbaxRmeZGGRzSjfNRY02qhHt+7r7Om0VjnyfRCwkPxXJVTEyu8YX11
 ZorA==
X-Gm-Message-State: AOAM530Sx8syeqfWXDALv1DLWzfYrRZxhH7agKP6B3615RPufhY6Lakv
 s5Krbuoj+lKuK4atVyLz2P3Eeg==
X-Google-Smtp-Source: ABdhPJwt+sA0b9fOzrA68i35DqvHURvTEr2bonu6wgYtO3so+VTX2HerFCO2ByZL3HWYpBfKyW5mSw==
X-Received: by 2002:a17:902:8ec7:b0:149:8d21:3e49 with SMTP id
 x7-20020a1709028ec700b001498d213e49mr39833770plo.111.1641441629379; 
 Wed, 05 Jan 2022 20:00:29 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l191sm441909pgd.8.2022.01.05.20.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 20:00:28 -0800 (PST)
Date: Wed, 05 Jan 2022 20:00:28 -0800 (PST)
X-Google-Original-Date: Wed, 05 Jan 2022 19:32:22 PST (-0800)
Subject: Re: [PATCH] riscv: Make vmalloc/vmemmap end equal to the start of the
 next region
In-Reply-To: <20211118134539.137212-1-alexandre.ghiti@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.ghiti@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-2006bfc7-264b-4d1b-96a3-6b4a012f8be9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_200030_658212_9FB43363 
X-CRM114-Status: GOOD (  21.56  )
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

On Thu, 18 Nov 2021 05:45:39 PST (-0800), alexandre.ghiti@canonical.com wrote:
> We used to define VMALLOC_END equal to the start of the next region
> *minus one* which is inconsistent with the use of this define in the
> core code (for example, see the definitions of VMALLOC_TOTAL and
> is_vmalloc_addr).
>
> And then make the definition of VMEMMAP_END consistent with VMALLOC_END
> and all other regions actually.
>
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 4 ++--
>  arch/riscv/mm/fault.c            | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d34f3a7a9701..5155048274c2 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -25,7 +25,7 @@
>  #endif
>
>  #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> -#define VMALLOC_END      (PAGE_OFFSET - 1)
> +#define VMALLOC_END      PAGE_OFFSET
>  #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>
>  #define BPF_JIT_REGION_SIZE	(SZ_128M)
> @@ -53,7 +53,7 @@
>  #define VMEMMAP_SHIFT \
>  	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
>  #define VMEMMAP_SIZE	BIT(VMEMMAP_SHIFT)
> -#define VMEMMAP_END	(VMALLOC_START - 1)
> +#define VMEMMAP_END	VMALLOC_START
>  #define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
>
>  /*
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index aa08dd2f8fae..41ae0aa8f2b8 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -235,7 +235,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	 * only copy the information from the master page table,
>  	 * nothing more.
>  	 */
> -	if (unlikely((addr >= VMALLOC_START) && (addr <= VMALLOC_END))) {
> +	if (unlikely((addr >= VMALLOC_START) && (addr < VMALLOC_END))) {
>  		vmalloc_fault(regs, code, addr);
>  		return;
>  	}

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
