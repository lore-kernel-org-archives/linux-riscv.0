Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE9C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISHOQe5ckFOPtIXNKDAd3vGqTcPDwxtQzbmXqzoFnOY=; b=gMIw+zsd3airGw
	bumwASVLNqQrs4H4PHFjOZ46dGs7H7kEj8B7LFy4loSQy8uhNVvW2/xvejjCjli2cRdw9A3zHHez8
	51GC/QXmvPb0o2Ml8qbV4aAdzPcPiqWIo/5kVu8F6H92Ae7FKIIQXkhxZylDG0ItSVT2rKx3GlklO
	o5sxk128n4sGjortgbaGOaF2b+oCqwe32qmhjnds7f6kh5IwQhLRj2foTmKVHl34PKwgbvDwCzXup
	K8yZWTUuHdvr9AVWHt9P+iri34/dSnCFOaeQIl235J9J0W8GfCR/nib5b5EBgfcT5TlrvYWMF5XNX
	4uUUCtHL//IPLFpSuYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJb7-00000009NPH-2mOQ;
	Wed, 28 Feb 2024 13:03:45 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJb5-00000009NOG-0uv0
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:03:44 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so7441993a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709125421; x=1709730221; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yFXQvGUsk1gt0qCtFqOPcrEsIWVhxYHprqeQMVcPhiQ=;
        b=OrbtJWDZdiMGA6LFej0AN9/Ral4AQqMAEDuYeBcCGNcUXF3c98OY7z2PPHYgOyw7jr
         ql0AtW/hkPlt8ra+qKA2951vovTBjzo/Y+1y6Nn6b1p+yqfZ+hvwOaSxm2Hfjl5cPRf7
         8Qx+NXgQj8sLtYD3Jzs4iRmvu4svMm27ylyH4FSAse7BYm2T9WzpIUmQGqNv5xbP6SCg
         VD/jqYnznRKd6tk+kCeajfJjRBejPmYpkqRB/JMl1ZyerTHqnzhg5jWjU0mFULhvdx49
         pU5G6y7ucq4Y81+49Kj0PNin5ztQ6B+j9K9W76A0bctFX9Bu65YMvmsJynIBHJnp52D0
         c/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125421; x=1709730221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFXQvGUsk1gt0qCtFqOPcrEsIWVhxYHprqeQMVcPhiQ=;
        b=YtUEs/txjAInaJ9uKcvNVtx8Onfx2VlZrq6kl81rGkE3ujMPlkm3Tirwa5B5oRf89S
         al+lv4aPhhXLSZoXa6wzF6EYbRmhHUgxBt73GRjG+6Gp4xYYdXD0wx7KZcUpwemz+TgP
         7WS8SWhtyPh+Ginu1MvKIZf5r6CcZMK0ynnN3Z869bcU3UCBFNkdVD9Ovi0eppph121f
         Nxlgz4UHwR4QZm1oIgiBc9n9X3MCCCjkYQUUhGB1RNhy822WZyiPaURhR/YzxxQS0K4S
         Drmsy/VY8mnqRrWD+7i1yw4p+gvztAbaIjNc/zt0KRsP2a/XnaSIXQPuFh2tght/aj7Z
         n1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoOyfLBEySGpuZM4B4SNP7OUXGT0NX+qkwstwm3IZQJc7EfUJ+KVFu4tcLUzzWU8/KxIX8cFOSQ3UrAgVSTpHbgxM59zPwTGqEaCRG49kq
X-Gm-Message-State: AOJu0YxrDk//obMgQjEcGVzwT7hct9eZYLCIsMDLzimz3gcvm8wCLKfi
	+xmi2rnZ+DPFPk1R0vIGlQ6vlqQjhQEI286abHzAZ9FVRUDqnvM45f5mO6DNzfU=
X-Google-Smtp-Source: AGHT+IGvHaZpaUKN38zrJM3JDTNxolRHG6m9JTolps7oKVeZD8z9mLSzqZ67XkfY3F7ks+tZteHSgA==
X-Received: by 2002:aa7:d80e:0:b0:566:d15:1458 with SMTP id v14-20020aa7d80e000000b005660d151458mr4961658edq.21.1709125421040;
        Wed, 28 Feb 2024 05:03:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fe9-20020a056402390900b0056470bf320asm500629edb.43.2024.02.28.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:03:40 -0800 (PST)
Date: Wed, 28 Feb 2024 14:03:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/5] RISC-V: KVM: Forward SEED CSR access to user space
Message-ID: <20240228-e87f7a9a9cf6fa701e621f41@orel>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214123757.305347-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_050343_323046_664EBF9E 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, Feb 14, 2024 at 06:07:53PM +0530, Anup Patel wrote:
> The SEED CSR access from VS/VU mode (guest) will always trap to
> HS-mode (KVM) when Zkr extension is available to the Guest/VM.
> 
> We must forward this CSR access to KVM user space so that it
> can be emulated based on the method chosen by VMM.
> 
> Fixes: f370b4e668f0 ("RISC-V: KVM: Allow scalar crypto extensions for Guest/VM")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_insn.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index 7a6abed41bc1..ee7215f4071f 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -7,6 +7,8 @@
>  #include <linux/bitops.h>
>  #include <linux/kvm_host.h>
>  
> +#include <asm/cpufeature.h>
> +
>  #define INSN_OPCODE_MASK	0x007c
>  #define INSN_OPCODE_SHIFT	2
>  #define INSN_OPCODE_SYSTEM	28
> @@ -213,9 +215,20 @@ struct csr_func {
>  		    unsigned long wr_mask);
>  };
>  
> +static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +			unsigned long *val, unsigned long new_val,
> +			unsigned long wr_mask)
> +{
> +	if (!riscv_isa_extension_available(vcpu->arch.isa, ZKR))
> +		return KVM_INSN_ILLEGAL_TRAP;
> +
> +	return KVM_INSN_EXIT_TO_USER_SPACE;
> +}
> +
>  static const struct csr_func csr_funcs[] = {
>  	KVM_RISCV_VCPU_AIA_CSR_FUNCS
>  	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
> +	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
>  };
>  
>  /**
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
