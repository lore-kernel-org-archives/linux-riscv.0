Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C91C25B78
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0UI75LIPrdtC0UuBlF84J3NSeNgjptS6Y4DxE7x4OQ=; b=XUZfoWksmkZoQj
	y8gbO/59TAaoxlwPY1g1f5Lmq8V8hXfocoFfHA0d4o9jM9fplkww7VzJTiI0NdtCnKElFxiyfLrEd
	Kopq2LZ/BpUALFQoBNMR2FhgSMrsutQGERWAdmdPDZwCDY0VSAdpQX94wAqlAamv00QoqsLbnlkn8
	FFSZxE2lShSFcJXViytL1K0A5mxYSp2I+n3rLs6fuBrgKDTOj2KJUOBn6ew/+xxCH/9/2F8dOTDVy
	RLT5U88KM4f0RH+7Ek8l7aaf7y7+nra4aNr4l5OO505kwuRY0Itej0EP0WU10VLVCmNAvKJey5gtl
	+aFxClEXhXs1bdLgHYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdED-0000000FrNR-0uIA;
	Mon, 27 May 2024 16:29:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdEB-0000000FrLF-0RE3
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:29:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-421140314d5so9000085e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716827376; x=1717432176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUR9tjUj2iCuKOML1r+nyycL1s+FksIs6kJ9krg7rYI=;
        b=fuLpBMfeABfJ/4l68oT+pR2M2eU1GYHyh5MDAoL7OGnxhCvKe6+StXCzvFxfaypVFX
         TPL/Hogr53j7NrRJBtrNYGwUxie3Gy5JzaJLIIKNVs5/GbL4PpoF93LN1lOg5syBq6fV
         MH94iU5BRVrjgKDogqF79WbTpmrk8j1C4RxkikNu0sukSO6WNUde9LZLxIPKLO+p6Nx2
         dzYOEQ4vEIW69+hGfZ8hlyvhhi22jxPbgPGP/bvjt6zUxQOJP/NUhPOaCAkD8wClE7k/
         y8iBOdm8yQ7UipBaCq/GbJEWFu6BjgnUEE2xqS34UQ3YSnVggnZi1OAQq7rxjm4k5a7J
         uTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827376; x=1717432176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUR9tjUj2iCuKOML1r+nyycL1s+FksIs6kJ9krg7rYI=;
        b=lSWXk73KuPpd2TyjkguByBfGd3hvJKea2aoWTd4TlSoydKJiEQIl49XV6Jzy2U4l6o
         30xN2SlHwIE1HLXKWuhs9rmXZmsllqmthy26HdHBWAvlcxx87GXBOPLhiBjD8lrCMZUc
         6SSYCqLH8GmOreQvst6RTNYL5rwtEpmQ9OzE43XGc/U+Uvrf51LSOm0GnXYw/3fGVCtf
         WAtQBRM/pm6Jt7V/6ZU/TJ1h4htEqCRd9dUdkzT9Mf3BSxsPHAmqQVYeyPfrt+UeOIku
         OJV1ozy/SupHCAYzbzI2OuXysUZDFaVhhyKnuGcuZsIVJEMmYmC2RVKAbaurxZ1bJjao
         z8wA==
X-Gm-Message-State: AOJu0YwNfyTKtO5zYdDa86lRMArFpcvjQfA8JOCAuO692Gt1EcW2Exfe
	sfvyk0dl5sdYhhOX4jKTjys5LEh/4IkPoqjj5eWEipTb5grhs5zMI2atEuozRfKR5IS00Ww55hS
	GgqQ=
X-Google-Smtp-Source: AGHT+IGfCJZo4LZWWLpRRKTEPYlRJOgjNRulCbrg6HUczWdUKveycFMLbxR2PpHYqvUCkagZop+Nww==
X-Received: by 2002:a05:600c:1d22:b0:418:2b26:47a3 with SMTP id 5b1f17b1804b1-421089ffc9emr76330215e9.32.1716827376450;
        Mon, 27 May 2024 09:29:36 -0700 (PDT)
Received: from localhost ([176.74.158.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089b0410sm113439735e9.29.2024.05.27.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:29:36 -0700 (PDT)
Date: Mon, 27 May 2024 18:29:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 4/5] RISC-V: KVM: add support for
 SBI_FWFT_PTE_AD_HW_UPDATING
Message-ID: <20240527-cd06bb4215d05129f4793dd6@orel>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-5-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524103307.2684-5-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_092939_177297_F8383A1E 
X-CRM114-Status: GOOD (  20.48  )
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

On Fri, May 24, 2024 at 06:33:04PM GMT, Yong-Xuan Wang wrote:
> Add support for SBI_FWFT_PTE_AD_HW_UPDATING to set the PTE A/D bits
> updating behavior for Guest/VM.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  2 +-
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 38 +++++++++++++++++++++-
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> index 7b7bcc5c8fee..3614a44e0a4a 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> @@ -11,7 +11,7 @@
>  
>  #include <asm/sbi.h>
>  
> -#define KVM_SBI_FWFT_FEATURE_COUNT	1
> +#define KVM_SBI_FWFT_FEATURE_COUNT	2
>  
>  struct kvm_sbi_fwft_config;
>  struct kvm_vcpu;
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index 89ec263c250d..14ef74023340 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -71,6 +71,36 @@ static int kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
>  	return SBI_SUCCESS;
>  }
>  
> +static int kvm_sbi_fwft_adue_supported(struct kvm_vcpu *vcpu)
> +{
> +	if (!riscv_isa_extension_available(vcpu->arch.isa, SVADU))
> +		return SBI_ERR_NOT_SUPPORTED;
> +
> +	return 0;
> +}
> +
> +static int kvm_sbi_fwft_set_adue(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
> +				 unsigned long value)
> +{
> +	if (value)
> +		vcpu->arch.cfg.henvcfg |= ENVCFG_ADUE;
> +	else
> +		vcpu->arch.cfg.henvcfg &= ~ENVCFG_ADUE;
> +
> +	return SBI_SUCCESS;
> +}
> +
> +static int kvm_sbi_fwft_get_adue(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
> +				 unsigned long *value)
> +{
> +	if (!riscv_isa_extension_available(vcpu->arch.isa, SVADU))
> +		return SBI_ERR_NOT_SUPPORTED;
> +
> +	*value = !!(vcpu->arch.cfg.henvcfg & ENVCFG_ADUE);
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static struct kvm_sbi_fwft_config *
>  kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
>  {
> @@ -177,7 +207,13 @@ static const struct kvm_sbi_fwft_feature features[] = {
>  		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
>  		.set = kvm_sbi_fwft_set_misaligned_delegation,
>  		.get = kvm_sbi_fwft_get_misaligned_delegation,
> -	}
> +	},
> +	{
> +		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
> +		.supported = kvm_sbi_fwft_adue_supported,
> +		.set = kvm_sbi_fwft_set_adue,
> +		.get = kvm_sbi_fwft_get_adue,
> +	},
>  };
>  
>  static_assert(ARRAY_SIZE(features) == KVM_SBI_FWFT_FEATURE_COUNT);
> -- 
> 2.17.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
