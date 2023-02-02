Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C148CC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WF5BL+5JMKsgxDGN/RN8ncL5dDA70yZcNqyTe80ftcI=; b=LjZJcnG6PsHw26
	Z4UTjkTgVuZgu3bv6PRJOIZEQz50Fzpa+6tN2OPJFw3R/9wO7OrGqMzFHWZHb3UomfEMw6+CskwUx
	131ufuQxAKtA29QVD9he2GJMietIxNXTpMyUFymTTge7gaayBg1J0R/GF+DgavczGBjALbfaxWAoG
	zBodV5iaHBKWieNT9Kk6qU/N7ZyqMXPRxy2DHJ1XXBCVyx0j76VGXFn62U4OACwDCGXt7lEp2iSZP
	c4qMimuHphjvD3hFsfd/Y9wgnstqCHqHOVUq/SoM5zTMrPu59FfHg/zux3rPaRIHBxgqwDP01JQen
	9p6uU6dU75Mac917id8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbIM-00GICg-Kh; Thu, 02 Feb 2023 15:14:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbIK-00GIBz-Kz
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 15:14:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o36so1668676wms.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I16Z1KgxRWP5MyHAvbuxURW5bLdfVdGat8LdiyVkZ7U=;
        b=VEUHLfU3cpYCINOO9LcLpYGlADqSXC15ZfI53t8aLaFHNN3NMUbf2x8wxcnck6Iuay
         j4FQ6kiNcj+ysWf+meWmecn3IPVa1cG7jGRlpE9Vby85Ge8Qyok3xNr/j9si3PVy3/lp
         KlQSpT7gjOYy/VljXUgCjlmBGpFhDpZsXdWFJm3g6pUmvI5/GC09tjIYY5u1wSBFMmZB
         pjtHzE9+/7DnM4BxwYnA7OjYwA0srrOZFWLrp7V9RJ/5KzDCbftjsJOJqO1/RdvvxNRg
         7OdrIg5Fc8L/je0Ym0Or4m0AecDgQe+b90Zx6nPHzmGf3T9LZcrIVrvKkaOw6EvUFH9f
         Rtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I16Z1KgxRWP5MyHAvbuxURW5bLdfVdGat8LdiyVkZ7U=;
        b=raSqTXOuYmF46O3xhCkvcmDmRhFTsP6X0gGM01gXm8nSS/3bAAwTOS7x/SidDIN/Om
         0eGJ6wUqgMmTseNnnw0gnEgeSrVI1oLtSimTTaZ+ql5cvge0f7n6aDujvcRtV2fG2gWA
         gh0iDPF7U0MumHYratNyY97YetcfX3NQs3ELv9YfHKZaSp3S8oD4huAY+duJrXXZqa7f
         FP8vQOYcCq6zD5cu4JKxo+5y+l5mLmrmsAphITyJyEySH9LtacPI27PFRFKmoydiE9CE
         kIZc2voSM6pqRAz4HfEB79PhBLD+3XEyT8NwltZryOdQwOnAZXzHG7F/mVsa1HF1iBs6
         D8BA==
X-Gm-Message-State: AO0yUKW+Dpv9XsQhS4PRXn4F/SiXgXkURHhLmJLqR/aTyxQUgbpHVGvL
	aFXKSjyUuskCB1Ln2HXiwkwZcA==
X-Google-Smtp-Source: AK7set++OTtPGCP2P3+NgUI2qvWC34mJ3Zb5+a0gIgWMcAnUGLvAA2gRKgUzvEYkmiOl+mgEgbT78g==
X-Received: by 2002:a05:600c:35d3:b0:3de:e8c5:d82c with SMTP id r19-20020a05600c35d300b003dee8c5d82cmr5645595wmq.29.1675350875212;
        Thu, 02 Feb 2023 07:14:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0ac700b003d1d5a83b2esm4924261wmr.35.2023.02.02.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:14:34 -0800 (PST)
Date: Thu, 2 Feb 2023 16:14:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 04/14] RISC-V: KVM: Define a probe function for SBI
 extension data structures
Message-ID: <20230202151433.kspo2g7cqsccoqsq@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_071436_708200_85AA5155 
X-CRM114-Status: GOOD (  23.81  )
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

On Wed, Feb 01, 2023 at 03:12:40PM -0800, Atish Patra wrote:
> Currently the probe function just checks if an SBI extension is
> registered or not. However, the extension may not want to advertise
> itself depending on some other condition.
> An additional extension specific probe function will allow
> extensions to decide if they want to be advertised to the caller or
> not. Any extension that does not require additional dependency checks
> can avoid implementing this function.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
>  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index f79478a..45ba341 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
>  	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
>  		       bool *exit);
> +
> +	/* Extension specific probe function */
> +	unsigned long (*probe)(struct kvm_vcpu *vcpu);
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 5d65c63..846d518 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  {
>  	int ret = 0;
>  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	const struct kvm_vcpu_sbi_extension *sbi_ext;
>  
>  	switch (cp->a6) {
>  	case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			 */
>  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
>  			*exit = true;
> -		} else
> -			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> +		} else {
> +			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> +			if (sbi_ext) {
> +				if (sbi_ext->probe)
> +					*out_val = sbi_ext->probe(vcpu);
> +				else
> +					*out_val = 1;
> +			} else
> +				*out_val = 0;

Conor points out elsewhere that we need {} on both arms if one arm needs
it. We actually don't need {} on either arm, though, or even the if, if
we rewrite as

 *out_val = sbi_ext && sbi_ext->probe ? sbi_ext->probe(vcpu) : !!sbi_ext;

Thanks,
drew

> +		}
>  		break;
>  	case SBI_EXT_BASE_GET_MVENDORID:
>  		*out_val = vcpu->arch.mvendorid;
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
