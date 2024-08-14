Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8D4C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 01:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gh3qZJOIeHMUv61ZBje/T5i5LW4h7X4cmQkCcWv7foo=; b=JuN7yE33CkeIWv
	rwIHafmQBG/J4QThlrJMcbdlZN1k3q9aHrpnJOja4fcZtUK2KknEho72fance8QKGr/ovGzLWhU0u
	CQ151BS+NYv1yzwmcu+XrcuCKaBHAqxpQlx6u1Lzo0GijVuuNCDrZw4d0dYG4TMktfihAoB2UfqpF
	a2iStAzAR1z2qscJfQtTXHTBBzzJrJNl9v/VRfSslAJhNsgGGlhbz8cwoEg/m55bYiomM90FEAb1A
	Cmo1IoPomoMtzq2hCcepFjUisKJvULkdz5/Iq4SD3FiXSQ/L2+4EWiIVfX8FV8dby7h0pzhD7Cr3E
	G2pxAyWcf74C/zh/zuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se2pf-00000005NLm-0Vvi;
	Wed, 14 Aug 2024 01:29:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se2pZ-00000005NKT-3rLo
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 01:29:44 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-710ffaf921fso290498b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 18:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723598979; x=1724203779; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hODmjSl6QW+3X/s9NClws+oOQIw7sZ/BkvPvK41RAqM=;
        b=EPBADmmukceATCQXSRApiBif4eI2Miieb4wENM1mq7B7ZhITp5bkhUtNtkPf3bjcKy
         iiNcY5BV3DwjLzWANAARDCQQ57mQ3V+gdKCzz9m3iIQch5vraua+ViXDXjdoHfbHkKgV
         V5tx1gTnY0FwTIkq4YtvGcuBVeWVcvUh0P7BV/GlmJD31Vp56/31JW2VemFIwVY2muiK
         zOuucpsvD/+XH+ae1fnBq4JucTuZ05TjmtgUPbggAE/HQn4Iul8CKKzNAt1RFWluntgs
         9JRUnFioYJaHUKEXN2MhE+aEu5hsiCIcfIczBdqpu5MNtQnHiMsUqEEf1Kkx0qLvEAt1
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723598979; x=1724203779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hODmjSl6QW+3X/s9NClws+oOQIw7sZ/BkvPvK41RAqM=;
        b=bppp5KPe4GSEBSYugHxboHecjqa3l8SbDcX56ukmfSbKCI899PrRC3zo6DDsemFJzc
         xsQKv0PKbebTNDRF6KrE/P8HvC35mDxXJHkAI3+tedN1rzRzCxUCjJuOS0Or62AHKUAU
         9OQIgNJMMBkGkZEEmB1CU4iwaDJ7oLeVGrU4Iid+D4rHYTr7Fh5SrEWPaAOXGeXMvGhb
         vrKsNnQ8/MpydkfnBFna4wgdCE0UOvXInRY0Lem29Orce7Tk4wIIyxsLknzynAzXyQTS
         IKgvBfYmMcFmmn4HN/2hcP3wLI+/cNlKccG0AGBq5eSqzq7U5pWmvfqmxZx6fRiRt19V
         ta3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5NeFhj4zqFgbkBxR96xk4RnOEvdDz5E2Lyj4ymo0iSZ/yrJvnPOO1qpbPObmL9IFNPrYz3+S5eeKCW8Ahs6FgIMwAWmcKc/ZL3SgOrLcp
X-Gm-Message-State: AOJu0Yyy3vyWWTSLQpiBsndpR+yfaXGIlav8pt46RQ3L28cOT55s1RWf
	uGewqatAlhAi9+BB+T5XJLVT+TCfhXqUZM5gSOhLp0/a0Hc7QuQRgX78ilnDeP0=
X-Google-Smtp-Source: AGHT+IEPcSEP7pmct3KvaMtw086pxINGCJd4rsCyrnC2QnEPyOF6Zdez6aYPylv/RSBLuTSk7D2X1Q==
X-Received: by 2002:a05:6a00:2d18:b0:70b:5368:a212 with SMTP id d2e1a72fcca58-7126a528997mr642990b3a.15.1723598978864;
        Tue, 13 Aug 2024 18:29:38 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7126c274c69sm83502b3a.42.2024.08.13.18.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 18:29:38 -0700 (PDT)
Date: Tue, 13 Aug 2024 18:29:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix out-of-bounds when accessing Andes per
 hart vendor extension array
Message-ID: <ZrwIf8nwte43+274@ghost>
References: <20240811150229.82321-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240811150229.82321-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_182942_606616_9CB175FA 
X-CRM114-Status: GOOD (  25.70  )
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

On Sun, Aug 11, 2024 at 05:02:29PM +0200, Alexandre Ghiti wrote:
> The out-of-bounds access is reported by UBSAN:
> 
> [    0.000000] UBSAN: array-index-out-of-bounds in ../arch/riscv/kernel/vendor_extensions.c:41:66
> [    0.000000] index -1 is out of range for type 'riscv_isavendorinfo [32]'
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc2ubuntu-defconfig #2
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] Call Trace:
> [    0.000000] [<ffffffff94e078ba>] dump_backtrace+0x32/0x40
> [    0.000000] [<ffffffff95c83c1a>] show_stack+0x38/0x44
> [    0.000000] [<ffffffff95c94614>] dump_stack_lvl+0x70/0x9c
> [    0.000000] [<ffffffff95c94658>] dump_stack+0x18/0x20
> [    0.000000] [<ffffffff95c8bbb2>] ubsan_epilogue+0x10/0x46
> [    0.000000] [<ffffffff95485a82>] __ubsan_handle_out_of_bounds+0x94/0x9c
> [    0.000000] [<ffffffff94e09442>] __riscv_isa_vendor_extension_available+0x90/0x92
> [    0.000000] [<ffffffff94e043b6>] riscv_cpufeature_patch_func+0xc4/0x148
> [    0.000000] [<ffffffff94e035f8>] _apply_alternatives+0x42/0x50
> [    0.000000] [<ffffffff95e04196>] apply_boot_alternatives+0x3c/0x100
> [    0.000000] [<ffffffff95e05b52>] setup_arch+0x85a/0x8bc
> [    0.000000] [<ffffffff95e00ca0>] start_kernel+0xa4/0xfb6
> 
> This happens because we unconditionally use the cpu parameter to access
> this array. But if -1 is passed, that means we should not and we don't
> need to access this array, so simply prevent accessing the array in that case.
> 
> Fixes: 23c996fc2bc1 ("riscv: Extend cpufeature.c to detect vendor extensions")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/vendor_extensions.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
> index b6c1e7b5d34b..01dc79b1d17b 100644
> --- a/arch/riscv/kernel/vendor_extensions.c
> +++ b/arch/riscv/kernel/vendor_extensions.c
> @@ -27,7 +27,7 @@ const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_li
>   * @bit: bit position of the desired extension
>   * Return: true or false
>   *
> - * NOTE: When cpu is -1, will check if extension is available on all cpus
> + * NOTE: When cpu is VENDOR_EXT_ALL_CPUS, will check if extension is available on all cpus
>   */
>  bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
>  {
> @@ -38,14 +38,15 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
>  	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
>  	case ANDES_VENDOR_ID:
>  		bmap = &riscv_isa_vendor_ext_list_andes.all_harts_isa_bitmap;
> -		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
> +		if (cpu != VENDOR_EXT_ALL_CPUS)
> +			cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
>  		break;
>  	#endif
>  	default:
>  		return false;
>  	}
>  
> -	if (cpu != -1)
> +	if (cpu != VENDOR_EXT_ALL_CPUS)
>  		bmap = &cpu_bmap[cpu];
>  
>  	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

The line that is setting the cpu_bmap shouldn't be indexing into it at
all. It is supposed to be:

cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;

The indexing is handled later on by the if-statement.

Thank you for looking into this.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
