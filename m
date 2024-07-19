Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B7C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 00:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQCViRMA43sMkzIeEBCtyOthz5S1Lbpj4mZYvgJiB7I=; b=Z4ccP8Eik9acqv
	Isnj3J11cXPrak0ncyxt+Jqqhx+DkRrhh4NLB8Ofhrr/tgYUaVtv5JHo9+mj2HcLurY/cEjiMm2cH
	Z3LhtrtWa1f+VEUJZgivohlxcHfjzT0Tghk70YNB2q+6G1aRbV+lMoRA+dbVmXeyvV9aznB5zhG4l
	5bdWPAA8nufNuosg/38kfJiQb/3vUg3tgm4OaOIArMAKva7urn2cFe9K9hZ218v0Xj8+VinWrzWoA
	MXKdebtPF60zECjoEg21OiH4wZZKtSIFD8mS00Wt96U0Fz9X4D+E+Mv49V4KSS+5ADx6+3LcmFgID
	jN/G8jlqxQF1a4Qpd33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUbNx-000000015Af-3t6V;
	Fri, 19 Jul 2024 00:22:09 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUbNt-0000000159i-2jhO
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 00:22:07 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7fe8d029fbeso49835539f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 17:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721348524; x=1721953324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uKIGXWYWIXloeHuuBuqBxGxPLL0P2YhrQYu7M9WpbQ=;
        b=JNPfxpz3HEqzuCOhMzDyuZGYz3IqCxna86yeKd/ZzsIc5EcRU5zrOy9Fxfk7/b7ZPu
         gYyzCX0avKqyxl1lRAUNBy2908YfvzhbwzeKK+n7WK1mRYBulSCe9b2AYVi/EljghYeU
         JnxbDYO2w2WAlpxooqtsQ23m5241spUpuWuoAfVDagC4Y957yHN1vJCb7FsAs5jp7VKG
         V641/4WSqzjEIsZQCNHcd+M1p+231FOT66mcW3wgXe2iQqBxFakvpx5+AmKEGTbbbG1S
         tnG/YUOB20QA6X7fHRHm6j1A522KDgFXZzpoVWd1EW6VNKKQjjH7faD7vte0nsKrwdoN
         +yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721348524; x=1721953324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+uKIGXWYWIXloeHuuBuqBxGxPLL0P2YhrQYu7M9WpbQ=;
        b=UGtYvk+SqtzXx+sA64Ag4J3FDMonq3C0bJGgWrL5yn00JSCjKs99Y893YmWTpCfRmY
         AruZqB86eDB0SRw7J/C5yGVzSB1PpVcZSrj7t11m4Yw3IS+IARxzOiHjCEMKFfv+k/Rq
         uz6dUTEbPh6GMRcxZ0rKUDqki4hmXgWGvhGXYwyOIqULOup9tSPk4CO2C25zdAluBW0t
         +4oppSB+Bln7pSmMZ9Hhuw+mlXb14ZS1bF9tad6RwjKFXFqj8wDkzEu1p6nfS7524s55
         ojpGfDD94hNCObSwO3r8uWFxY3+xVzYh51FEZh1+WGmF1v2+fdYRkIbibXegJI5RVqdr
         ecNA==
X-Forwarded-Encrypted: i=1; AJvYcCUA9qI8B7nh/MvSGSvA59xDHTYNkZcr7SkUwAo4O9KHlEG/8xBOz+SkrAQEputWV2zajrnpxwMbomuW9jovELGDrvne6U2l74pdIuABwtS5
X-Gm-Message-State: AOJu0Yyee27785xGXwv+KXWVe9/D1t+94Gaf9uTGyz/o3G7mEA1DH6qz
	CCtOIbsggiQj4sNPwhU+kq+JtwPkc0gqg2XkO7ygVZc69H518ZQgpC0Ce+6FJno=
X-Google-Smtp-Source: AGHT+IGZOYKaYajrW+wJeRqu8lvZxt7wFW370je39V0cIuR/Fg8Tkc/xud3IhBJspqPatG5aLX9hUg==
X-Received: by 2002:a05:6602:3fd2:b0:806:31ee:132 with SMTP id ca18e2360f4ac-81710137c5emr919977239f.4.1721348524401;
        Thu, 18 Jul 2024 17:22:04 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2343d2e8esm92265173.129.2024.07.18.17.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 17:22:03 -0700 (PDT)
Message-ID: <60555952-7307-41ed-bd6f-17a179089596@sifive.com>
Date: Thu, 18 Jul 2024 19:22:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Add Svade and Svadu Extensions
 Support for Guest/VM
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-4-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240712083850.4242-4-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_172205_916908_3661B946 
X-CRM114-Status: GOOD (  20.94  )
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

Hi Yong-Xuan,

On 2024-07-12 3:38 AM, Yong-Xuan Wang wrote:
> We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
> detect and enable Svade and Svadu extensions for Guest/VM. Since the
> henvcfg.ADUE is read-only zero if the menvcfg.ADUE is zero, the Svadu
> extension is available for Guest/VM and the Svade extension is allowed
> to disabledonly when arch_has_hw_pte_young() is true.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  2 ++
>  arch/riscv/kvm/vcpu.c             |  3 +++
>  arch/riscv/kvm/vcpu_onereg.c      | 15 +++++++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index e878e7cc3978..a5e0c35d7e9a 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -168,6 +168,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,
>  	KVM_RISCV_ISA_EXT_SSCOFPMF,
> +	KVM_RISCV_ISA_EXT_SVADE,
> +	KVM_RISCV_ISA_EXT_SVADU,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 17e21df36cc1..64a15af459e0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -540,6 +540,9 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
>  	if (riscv_isa_extension_available(isa, ZICBOZ))
>  		cfg->henvcfg |= ENVCFG_CBZE;
>  
> +	if (riscv_isa_extension_available(isa, SVADU))
> +		cfg->henvcfg |= ENVCFG_ADUE;

This is correct for now because patch 1 ensures the host (and therefore also the
guest) never has both Svade and Svadu available. When that changes, this check
will need to add an "&& !riscv_isa_extension_available(isa, SVADE)" condition so
it matches the behavior described in the DT binding. There's no need to resend
to make this addition, but if you do, it wouldn't hurt to include it so it's not
forgotten later. (It looks maybe like v6 only partially implemented Andrew's
suggestion?)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
>  		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
>  		if (riscv_isa_extension_available(isa, SSAIA))
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 62874fbca29f..474fdeafe9fe 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -15,6 +15,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/kvm_vcpu_vector.h>
> +#include <asm/pgtable.h>
>  #include <asm/vector.h>
>  
>  #define KVM_RISCV_BASE_ISA_MASK		GENMASK(25, 0)
> @@ -38,6 +39,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SSAIA),
>  	KVM_ISA_EXT_ARR(SSCOFPMF),
>  	KVM_ISA_EXT_ARR(SSTC),
> +	KVM_ISA_EXT_ARR(SVADE),
> +	KVM_ISA_EXT_ARR(SVADU),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> @@ -105,6 +108,12 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
>  		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
>  	case KVM_RISCV_ISA_EXT_V:
>  		return riscv_v_vstate_ctrl_user_allowed();
> +	case KVM_RISCV_ISA_EXT_SVADU:
> +		/*
> +		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> +		 * Guest OS can use Svadu only when host os enable Svadu.
> +		 */
> +		return arch_has_hw_pte_young();
>  	default:
>  		break;
>  	}
> @@ -167,6 +176,12 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	/* Extensions which can be disabled using Smstateen */
>  	case KVM_RISCV_ISA_EXT_SSAIA:
>  		return riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN);
> +	case KVM_RISCV_ISA_EXT_SVADE:
> +		/*
> +		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> +		 * Svade is not allowed to disable when the platform use Svade.
> +		 */
> +		return arch_has_hw_pte_young();
>  	default:
>  		break;
>  	}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
