Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3514CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysNUDW6JTzuDfxTarJYHZOzD/RG/AddbP8qrNE3fYTs=; b=vGx28ifuPVePlb
	X1u7queYlHadaZT0YbmTS0fKLU/F8+4oCRYNGoksxI/iQFJOwni5oAb+71T/kxgHCGvdzCQdtxvis
	j4wpKtS5S2ITeodXMX2FpeGeg3mkTVCaHlE1Crj3BO1kdSPsAoQWCIx7o/y+40BiFUYdxZseKHeL9
	sF0WB6MfcvyjcsuwGHBH9OndbSbfMy9tRcXsQEVk64+y3m9pgsnCeDWNoz2nNSRrNc2Ndo4hG0ZGJ
	2Ad6gKV9JiJxstSGXBeRGiBgb0bkU9lDw6PR2Zn4fqh2/6dRGHx3RfJsZuv00p+PtrwvLWhJ/EFcN
	LFbMk3+AvD7+3KcD6Hkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0us-00000003Rwt-3FKi;
	Fri, 15 Aug 2025 20:20:46 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0ow-00000003Pa3-1ZMF
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 20:14:40 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e56fffda94so11527905ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755288877; x=1755893677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiZcsRXblDK+QsurtCHU3wPd/EqkMipNd3cgRBpokNI=;
        b=crnsbVAtDikKyPqUl1cY+Dg095u4wuQVB2SnzMYnSqMnLatDEINsHHCpfltSRAOlSk
         JJ3d0nqAxbxOxfvMpyrhBWdXZOOO+WvzCcbPHKuPi4/QmMFwauOGy2yndPysveG81Rpd
         U7iQw6/1AV77tFWVl+lBIjGnWmjcYmvcITbVLQDNcNfkHSQ5X9/lAvgOfx8HzBxpjpLJ
         u9wMzpfeG/RZaY1UTeVpFK+bK81lEJ4YYKaTDT1uHsDD+WajwnBpagX3cbIiEqFT9GPi
         fdMBIkBIdzvSYNji2m92gJqkMCV2nslgQUdt0titBCdt5M9ucpo78/cp0tCmlHa2but8
         Ks2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288877; x=1755893677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiZcsRXblDK+QsurtCHU3wPd/EqkMipNd3cgRBpokNI=;
        b=gRGUxgvI4zftOYov8J7SWQejUfuEWVDkSH7NnZXw6adnu3BRB5u7RMEx9GnupWmN32
         O1qE5ZGgq6HJ0Y0yuUaLToTQ/fQEEoQ/i3nqYgzFrVa72XDUMMKlrBQCyZ7rrhPpxKC1
         btCR+CHr6R9HScCqGF815k5h4tAIfRHyI+ydSdB6iNFc+hNpW81l0CNMr8cX0A+CqsvA
         LMnn6YN/OV2CF4evKwtxAAQ1rbXhQQ272xRS0y+KxvZZonKEfYbRCl3K2HlVieAdhv5E
         yBH0GHT5x0DfNDdeY6tTirBeemCgJPLNezIHWF9rquJWJ39MHngp8WI1U5ZQWuTcVWHJ
         vPyw==
X-Forwarded-Encrypted: i=1; AJvYcCWKt88ZQacsQVt3KegtKHfrOsvkmIEe4+9lZ+GC3rSgRFYjYAblFn77r57wBW2S+W0gZ1NswyMTzCBJAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhpABMc63lPiXrH6/KE7Ta3SrixOnMBoqIHlKbDEGSeS/6Jdqn
	mJvdCCz1QPndxTIXkk05joquTsiPny0hwBvnmEGSMxsJ9Fh6Y7JhgQOFsGbQKXmO854=
X-Gm-Gg: ASbGncuGqWIFTDZHeNx4L2q6y11AGj7gnnFHw6jPGWdp9YYT/fQwxCwfNKzRatcDrSY
	7rYyGqyReJiBmwHCc7f0vNJIXFPRX6QrJI6yi0U6u7X6Pr81IEuR30GyGi7Tlckhv6PA31sZ8oa
	TCpALJ4ej3eidODFYqTuBn08TprDzCgoorqXe62g5F6bY3EeCVeze66nA5kDUVw5aYBgygWP6Ny
	ZJaYyHXW+eMVCmOup9ot1sIPY0K6rTFZ4fA9yI6eK9DCnYu3O8puBeyy4w1sIqNE/FKoXfVkrrC
	ky+YQPBerNBVX2qNKGnZh159unTNGNrr3JmlLk4cFWGboDrZ1G5/a0H61cLhAIS9bhJnHtlPnRe
	7RHD+EjaJ/jGi6iHkkgVSCb40
X-Google-Smtp-Source: AGHT+IExUiAjUdPYMjUNNYaE14vRBPYsuuXTciG9RIicgQedUovVnhzk5z3ol3/Zbxwlnlhc2kiZ3w==
X-Received: by 2002:a05:6e02:1a4f:b0:3e5:469e:b105 with SMTP id e9e14a558f8ab-3e57e9d1a1fmr71697515ab.18.1755288877401;
        Fri, 15 Aug 2025 13:14:37 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c947f547bsm634066173.43.2025.08.15.13.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:14:36 -0700 (PDT)
Date: Fri, 15 Aug 2025 15:14:36 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/6] RISC-V: KVM: Introduce feature specific reset for
 SBI FWFT
Message-ID: <20250815-30ccdcf30a9746a3b2443b4b@orel>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <20250814155548.457172-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814155548.457172-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_131438_414714_7E05939E 
X-CRM114-Status: GOOD (  22.27  )
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

On Thu, Aug 14, 2025 at 09:25:44PM +0530, Anup Patel wrote:
> The SBI FWFT feature values must be reset upon VCPU reset so
> introduce feature specific reset callback for this purpose.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index 164a01288b0a..5a3bad0f9330 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -30,6 +30,13 @@ struct kvm_sbi_fwft_feature {
>  	 */
>  	bool (*supported)(struct kvm_vcpu *vcpu);
>  
> +	/**
> +	 * @reset: Reset the feature value irrespective whether feature is supported or not
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	void (*reset)(struct kvm_vcpu *vcpu);
> +
>  	/**
>  	 * @set: Set the feature value
>  	 *
> @@ -75,6 +82,13 @@ static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
>  	return misaligned_traps_can_delegate();
>  }
>  
> +static void kvm_sbi_fwft_reset_misaligned_delegation(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
> +
> +	cfg->hedeleg &= ~MIS_DELEG;
> +}
> +
>  static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
>  					struct kvm_sbi_fwft_config *conf,
>  					unsigned long value)
> @@ -124,6 +138,11 @@ static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
>  	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
>  }
>  
> +static void kvm_sbi_fwft_reset_pointer_masking_pmlen(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
> +}
> +
>  static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
>  						   struct kvm_sbi_fwft_config *conf,
>  						   unsigned long value)
> @@ -180,6 +199,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
>  	{
>  		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
>  		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
> +		.reset = kvm_sbi_fwft_reset_misaligned_delegation,
>  		.set = kvm_sbi_fwft_set_misaligned_delegation,
>  		.get = kvm_sbi_fwft_get_misaligned_delegation,
>  	},
> @@ -187,6 +207,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
>  	{
>  		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
>  		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
> +		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
>  		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
>  		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
>  	},
> @@ -321,11 +342,16 @@ static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
>  
>  static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
>  {
> -	int i;
>  	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
> +	const struct kvm_sbi_fwft_feature *feature;
> +	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(features); i++)
> +	for (i = 0; i < ARRAY_SIZE(features); i++) {
>  		fwft->configs[i].flags = 0;
> +		feature = &features[i];
> +		if (feature->reset)
> +			feature->reset(vcpu);
> +	}
>  }
>  
>  const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
