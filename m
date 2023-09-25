Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD81CE7AB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05e0sF9ztm1pj9DHnTpOwLfuvOWvn0OlLBleMYhE0Vo=; b=ZsFaTzkZOiOP8P
	JWDhz1/wD/s52YLK6AALHbO7g6A/KqMwWi/raBIE24wrEXgnnAdha2l0XsA4ONSE/bipOi1QuZyzL
	JUc1ZcdIlB3lGsXN+rueH9GvsRJnFrtG9/xnuj2JKIiDMQ/LbTdxylE9nkUOs3cTRwhmG8bCe7P2e
	MmkT0HQbBVC94gv34oIJbjd8L0bXBUDNZkBefV2bkriOs+qoRMw+rwMfpbafStzI9YjggM+XpnbvO
	TqKULvj5DeGRNWZsK/mn3uaRbApxuzYP9r7x2DWAbfPDFdqGWs9QKc2L7ZxEEIcs+JAaOtasMeVaz
	EiwRx9L7SjW3e3nJI4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkpgy-00EmHK-09;
	Mon, 25 Sep 2023 17:48:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkpgu-00EmGM-1r
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 17:48:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so61473265ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695664095; x=1696268895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3tuJIIS1l1SOVzZtlVmqa55J+BZPRUyU2VUwqVvswg=;
        b=rMAspUmBuSdmfCqPgx1F7TbmH8WWIQzBPwbCOtKjtctbnN5alIOEaPso/b3axn9Zwt
         Wi2zxtFhLwv62VqaEUmLUbbz+bYfnpgOxrz7Rl7bffhQi45WMvUM49zDvhH2ABoRsrtG
         XFqgm0STdsp4MrXhmLqBVTSYUyzraj/DcCrKiKXn378KHEdSj1q/TatHKcI8+03RHLmP
         U8j/sOCDuaV8TdulnO4OkVDa0gTWKg61t3M31dzo68gW/juiSo5E1wqnx2E5O2XB5H7X
         PNptGVPe1PammbILYYJlzW5AUVKvx5Y9sYgidl5pWAJJZzcJd1LEl4Gfg9wNmjDDZ85h
         /A4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664095; x=1696268895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3tuJIIS1l1SOVzZtlVmqa55J+BZPRUyU2VUwqVvswg=;
        b=Yl1fFQxJXcsN0nYYjDzRQh/S9OZFuf4/9LPg7w7amGnWvOh9cyibBnDg7QVHSakaQN
         zcyCyAaVmAcbm3QL78gFK3+RVeL2Tw8fg1TP23pMZNes85qU/6ZmLpFC6yAkwuc/agEg
         7YyZ38DhEiGzariOw8b62sGnOLXDayHB2ffxQg68FlG0MCEym3aLBnUCHgKPJtJ1EB9D
         6i0QJQbRZjplOMAGt9CpuH33knpaAcL9iJxkAyCocSPcB4AvJExKv7uc0w2LMF9bbj/o
         pEFCJcIBaVuqWr7VLaqWwraRv/9o8T6aIFST2aDSgd71Q/NDVMRkrbdF/fBWbUe8EA3M
         wtHg==
X-Gm-Message-State: AOJu0YxougOidhIpen6KJe5hcqNlMbTDFUyOZ9O9RcKf9OLDOGSt5l7C
	2elcKxioaniMDsTzZ9a++i/lAQ==
X-Google-Smtp-Source: AGHT+IGvqV00K1g0/ZodkrKU5PL2uuUghZiRtw/5AJYE/blsphF6S3mDHOM5cs0FDHZM3+gOY2KwWg==
X-Received: by 2002:a17:902:f548:b0:1c5:d354:93b6 with SMTP id h8-20020a170902f54800b001c5d35493b6mr8832777plf.67.1695664094936;
        Mon, 25 Sep 2023 10:48:14 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s23-20020a170902989700b001c5de2f1686sm8260228plp.99.2023.09.25.10.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 10:48:14 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:48:11 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/9] RISC-V: Detect XVentanaCondOps from ISA string
Message-ID: <ZRHH25IyJJLWSolC@ghost>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925133859.1735879-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230925133859.1735879-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_104816_847156_6D1C4B4C 
X-CRM114-Status: GOOD (  22.46  )
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

On Mon, Sep 25, 2023 at 07:08:52PM +0530, Anup Patel wrote:
> The Veyron-V1 CPU supports custom conditional arithmetic and
> conditional-select/move operations referred to as XVentanaCondOps
> extension. In fact, QEMU RISC-V also has support for emulating
> XVentanaCondOps extension.
> 
> Let us detect XVentanaCondOps extension from ISA string available
> through DT or ACPI.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 0f520f7d058a..b7efe9e2fa89 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
> +#define RISCV_ISA_EXT_XVENTANACONDOPS	44
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3755a8c2a9de..3a31d34fe709 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(xventanacondops, RISCV_ISA_EXT_XVENTANACONDOPS),
>  };
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I worry about storing vendor extensions in this file. Because vendor
extensions are not standardized, they can only be expected to have the
desired behavior on hardware with the appropriate vendor id. A couple
months ago I sent a patch to address this by handling vector extensions
independently for each vendor [1]. I dropped the patch because it
relied upon Heiko's T-Head vector extension support that he stopped
working on. However, I can revive this patch so you can build off of it.

This scheme has the added benefit that vendors do not have to worry
about conficting extensions, and the kernel does not have to act as a
key registry for vendors.

What are your thoughts?

- Charlie

[1] https://lore.kernel.org/lkml/20230705-thead_vendor_extensions-v1-2-ad6915349c4d@rivosinc.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
