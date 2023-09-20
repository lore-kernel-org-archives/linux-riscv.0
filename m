Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8ECE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrpmoRMqOr3dYaH0TyuctgthWLy/CrwVou5g8YqhXDI=; b=TyI/5n4BJIjrjH
	LN9z6M9Su7xmMSFYR8oaRFmG1+yxQ0M98lYYeTEA7HXNE7n9AwjxRf1PviK22y/4qHHrOv655txHD
	MMuUf4gtA1xqGJ0e4KIDLkO59Y3tbWuIG6Kf/eX8Vz8bbci7ageE7/jYVKNIBJTfJ3V7Dkj3Ccmm8
	BQ5CpO32XlSq4OfVIkbPopDEl2n3ElIeeTSHrd81/ersDvnQZskSzLjruHl4yvo7T5STUfsi0f/t9
	CHYir6B91eYvPS6EcS1u9MkuRbiNBYGC6aSsVODPgrvP3mD6Hqzw6N9Tq/NAWuHz2rz4CMmtWKzID
	+hPEggjdYLHHEU0+XB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiruR-002AtL-1W;
	Wed, 20 Sep 2023 07:46:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiruP-002As3-1C
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:46:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4051fea48a8so6279915e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695195964; x=1695800764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCQ64axOzYWQoVJr89JJGEJBkzqcHIgukSDri2Lu2nY=;
        b=Gq/HiO5dipxvDlGF1mJscnGDZ3G4pS0gGeisOmH5cwbfXW2smjuWqzolxiyFphGjOI
         rWfMMFkY0A5PkupTXEDQkCEEQwqMS8EI91bFQFWT0aWeV3fi2D31CW8C+2Up52jPNFcY
         aPybOExxL+mqVNhU9snXvruq+sX5TMSs4uX7Dj1e3U0CphQGGb4CeLteiaswlUnNysrD
         GowKNT2wVKIh0E3xBvmh1/j/Wh2W7aaXowcs2uGsCG1WwJziBr5NvpCYWtwJUijqHGqF
         TAIDBzXquZ2y6WcscDj92UbDzqR0uvnVpnkqWSOtIKESaSYp+Y6dj61wfYAK58fwF+dj
         GCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695195964; x=1695800764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCQ64axOzYWQoVJr89JJGEJBkzqcHIgukSDri2Lu2nY=;
        b=k00zWkt1cDe1B5xXyuPc4P3w6hDr5Ih5jANT60TRffVFrJ6Q1rXCmuquf+oNknVjXz
         fD+m4dXIdDTDpf71VXAtLmPk+y22rkcU0Ga3gaSnkWRqCM3u7g59lIXvBM4ZEd6v+dew
         NaxDCWWdkSFYsHTTsgQVOn3nWLM1LSXQx4ewSMk6e7p3zIUvSefkVRXHWey/b/y5gbLT
         S9T5yvCU7KgcHPjago2mDRXrtU9OK5K9qQOpc/ZDVW567IfHj87k1dF8U9FQDFiESBj5
         sBbCA/mmm7wFEBrrPmQSpF2J6I7ZBZjzBQbYjH/bQkXq83O4p458Bg8UgeDYzQkoGFt9
         Lvjw==
X-Gm-Message-State: AOJu0YzD6Wf3whNuaJAjevKMsx2xpWuWQkQqlyxvLwLgoXPC9sYLSNPk
	pTcrdNa/X6lx2C7xxH837+iNnA==
X-Google-Smtp-Source: AGHT+IGLhZyo0JLpS7qrAayTtRpx8WJ35UC8iBDR4G+V5sBDzN/EMK5surVVEn79abyRomu1HrsACQ==
X-Received: by 2002:a7b:cd94:0:b0:401:b204:3b85 with SMTP id y20-20020a7bcd94000000b00401b2043b85mr1635240wmj.36.1695195963742;
        Wed, 20 Sep 2023 00:46:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d6045000000b0032008f99216sm10914828wrt.96.2023.09.20.00.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:46:03 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:46:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/7] RISC-V: KVM: Allow XVentanaCondOps extension for
 Guest/VM
Message-ID: <20230920-64bd7206b92e056d76cd9715@orel>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919035343.1399389-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004605_411864_6E1F18BF 
X-CRM114-Status: GOOD (  15.56  )
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

On Tue, Sep 19, 2023 at 09:23:39AM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable XVentanaCondOps extension for
> Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b1baf6f096a3..e030c12c7dfc 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -138,6 +138,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZIFENCEI,
>  	KVM_RISCV_ISA_EXT_ZIHPM,
>  	KVM_RISCV_ISA_EXT_SMSTATEEN,
> +	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 388599fcf684..17a847a1114b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -40,6 +40,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> +	KVM_ISA_EXT_ARR(XVENTANACONDOPS),
>  	KVM_ISA_EXT_ARR(ZBA),
>  	KVM_ISA_EXT_ARR(ZBB),
>  	KVM_ISA_EXT_ARR(ZBS),
> @@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_RISCV_ISA_EXT_SVNAPOT:
> +	case KVM_RISCV_ISA_EXT_XVENTANACONDOPS:
>  	case KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_RISCV_ISA_EXT_ZBS:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
