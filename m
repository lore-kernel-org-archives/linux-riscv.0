Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0817CEEE278
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 01:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7WG9wLZ0KwipfsrC4MyT6wJXKk1xK8JEGmgKI90FzM=; b=qPGOG7BVQp3BR7
	TY0bjynza0DhPlyMzeE7UJUFjgYqtIMhYdpiFqrlNtWtvwgYZRayDdAEniSDt/xMLScw6lVkIZIdI
	UiIDxEl28WJCBpnbKrekk3lddvDsvLJUTusDkepWlfw1qA8uzTiw7hFDq94+f0rdZ+oYDKryoD6FL
	gbdW5NTNamr6C2yuf5ccqkUzNP43x2FOtvO9DvyPvtgW2snuygD/254b7IBnsTWr+l6RL1kSY05wm
	4urinbqFCayYZO/+8aThyewJh76hoeh/biM94F66fKWr2shjgkYYzNU5TUYgJu10kTpiv3Nhhbscp
	VWSW2T9uUzrGVO54SGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souvG-0000000Edgb-1Qen;
	Fri, 13 Sep 2024 01:16:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souvD-0000000EdgB-1GrH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 01:16:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fc47abc040so14722055ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 18:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726190186; x=1726794986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CGdN0gxzpmFovSXXc4PPR7wb1goaAH/sxNtRx0azomw=;
        b=RbnLo4Hft1mpAEz+n/zQjqgl/7YQK4SjuUgXpC/xU8fEnPBPggZiSAKw31QcS4NeDe
         eggIEX8AOO3KmCUc/lCIW8A8/d/E9XLixcTyI3rlGjtfTUhIfMdqTtYp60FGEqTqB+pr
         0LuYhZfk8vDmTp0TGqqAYWltOdML5e/78/ivlIO+uyaKAoSI3MTJPwGfTbRASDE21Pzb
         V/mXqQZOsaHv/Xh3eN7hpO7J1fkmUCHNdHn5VAYaeKBjUJrkpQ7NMI+hsioR5z2dC9lm
         ZjJvozXKLmmcIRXMmqNLK9Ed8AZOOFd8XPbT7lReRexurPXacdwuLRegvxJwE1mOz3m2
         COqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726190186; x=1726794986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGdN0gxzpmFovSXXc4PPR7wb1goaAH/sxNtRx0azomw=;
        b=HSxpAAl7Vp83tRqHrPby3PM/BOARRMB44sLYf698gXnL+33IrwOEd67aQCd5ZgCdwC
         ZdKe1gMYEnUErM2Knmdu3TqwDagk1s+edRFQIB9EG2olkA3T0tHgII83BF7Om/JMYfxT
         m3eLiCyCappHWHWtgc/PEwzHg15iWCHZpQMxIVwR11X9h5jpXjZlRpAL1zLWxAp/3DGD
         mRxdKz7i54IXMpOeNjLybFAlXTmOzKMAgjJy4BnDuVGaxfFTBkamzpX22YafvcGzQUkZ
         HxOVN9sz32ZAlW6lRCQLa0euGtXHmKNi4AXup7jU/0AsmGJN1nsdG943WuqGzY4BZTjG
         Ak0A==
X-Forwarded-Encrypted: i=1; AJvYcCWkDo3cwAVdPO/BMKpT2We2XaJkgA5FcsP2tNI0FrwW/vYi+py1CYdQLNybHuFrTLcJ98OUdKufgjdyuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQDC5rky/EwikZAoAiKMW67QE9Q2MSprct+yjmyjj6PkmveNhX
	lOMhYupxV6bTEJEjvL1YOFvZwLpQombRyZFLdIzwLPiZP6h2GD5RBThfxPvhwVs=
X-Google-Smtp-Source: AGHT+IEHKm3UNTMeYi9FcEOsLtiVsBpfeVoViEjIu4klChUXmqp/JF2zUsw5pdnzmHwyVdvF9TzQWQ==
X-Received: by 2002:a17:903:249:b0:206:8eec:c087 with SMTP id d9443c01a7336-2076e354d05mr65687755ad.16.1726190185980;
        Thu, 12 Sep 2024 18:16:25 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c98f1fsm382550a91.20.2024.09.12.18.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 18:16:24 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:16:20 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v4 03/10] riscv: Add CSR definitions for pointer masking
Message-ID: <ZuOSZPJLBUeoTMA9@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829010151.2813377-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_181627_365308_F01720D8 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, Aug 28, 2024 at 06:01:25PM -0700, Samuel Holland wrote:
> Pointer masking is controlled via a two-bit PMM field, which appears in
> various CSRs depending on which extensions are implemented. Smmpm adds
> the field to mseccfg; Smnpm adds the field to menvcfg; Ssnpm adds the
> field to senvcfg. If the H extension is implemented, Ssnpm also defines
> henvcfg.PMM and hstatus.HUPMM.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> 
> (no changes since v3)
> 
> Changes in v3:
>  - Use shifts instead of large numbers in ENVCFG_PMM* macro definitions
> 
> Changes in v2:
>  - Use the correct name for the hstatus.HUPMM field
> 
>  arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 25966995da04..fe5d4eb9adea 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -119,6 +119,10 @@
>  
>  /* HSTATUS flags */
>  #ifdef CONFIG_64BIT
> +#define HSTATUS_HUPMM		_AC(0x3000000000000, UL)
> +#define HSTATUS_HUPMM_PMLEN_0	_AC(0x0000000000000, UL)
> +#define HSTATUS_HUPMM_PMLEN_7	_AC(0x2000000000000, UL)
> +#define HSTATUS_HUPMM_PMLEN_16	_AC(0x3000000000000, UL)
>  #define HSTATUS_VSXL		_AC(0x300000000, UL)
>  #define HSTATUS_VSXL_SHIFT	32
>  #endif
> @@ -195,6 +199,10 @@
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_PMM			(_AC(0x3, ULL) << 32)
> +#define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
> +#define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
> +#define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
>  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> @@ -216,6 +224,12 @@
>  #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>  #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
>  
> +/* mseccfg bits */
> +#define MSECCFG_PMM			ENVCFG_PMM
> +#define MSECCFG_PMM_PMLEN_0		ENVCFG_PMM_PMLEN_0
> +#define MSECCFG_PMM_PMLEN_7		ENVCFG_PMM_PMLEN_7
> +#define MSECCFG_PMM_PMLEN_16		ENVCFG_PMM_PMLEN_16
> +
>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
>  #define CSR_TIME		0xc01
> @@ -382,6 +396,8 @@
>  #define CSR_MIP			0x344
>  #define CSR_PMPCFG0		0x3a0
>  #define CSR_PMPADDR0		0x3b0
> +#define CSR_MSECCFG		0x747
> +#define CSR_MSECCFGH		0x757
>  #define CSR_MVENDORID		0xf11
>  #define CSR_MARCHID		0xf12
>  #define CSR_MIMPID		0xf13
> -- 
> 2.45.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
