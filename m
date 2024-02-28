Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8125C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czTaJvUWlQyvP6Gko9NhHBAxO+xdhTNjBAMWUlIc5Hw=; b=L4UcZteHHDmLme
	hPK0AYuO0qnBsnIlIyd97U9eBggUHJYpGo58pucQBib3N40uaD+HWNDYxvbidb66wO6xlBYOGudpu
	Og6XhKB+pqYtO+msA3yjWKTU8dzipVU9+u8SU0ST1BB0gL+yWFlGkU5nJKmAzsXAQ+0I5kwqcMdet
	3WQ/FHMgOWMXoBj3t/LcbAss/62r8ep9kQygQER7oKhbW3+j0ZD+PtliPzJL+izyc/Kzy7zaSXQnD
	izkS6YaaL4uXoH1toowG2saWZxsV4k18sUWCSC4xk0DE+8lZSntu/4yXd5cwLa/EG3JQqfOvljWUp
	CguA2iu5K2QBiPeZjiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJcu-00000009OBk-0w0D;
	Wed, 28 Feb 2024 13:05:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJcr-00000009OAA-3KL5
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:05:34 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a28a6cef709so818299566b.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709125532; x=1709730332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3WgTNeeGr6uKUuJvcES9LZuUweLm/sbBaRIaDoEjes=;
        b=MgZYlmLmX8gszWt4X3qOz6y7MH81U7dM4JswcgV9hw+bCfVOxtdXSgAiBHee4vejd3
         idnJhjnDUqccl+OhNWzoGZB+1+3KE6bZycsA8qKLvvNbLRSNzmR5x6HsL9nEbzoGNANG
         5/s1dVexa5QKyrvel89tgXeCoLTr1AnTtIY4jc0Mvo4HFWAaqfyujGmgdfOMIY1zG06b
         cmxGQ2AQOnGyMs1HykLBdtlyvJ+0l1Z/5Z94ZGrk8fxxfYuWi9NNs/XWZT8GhAnGD45Y
         YZzf/hQq7g9DSoWvmej9FhkboYfCrNnuik+LzEtp1MC+UeQOqzkbRBjhBHcU4OKiQXNK
         BGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125532; x=1709730332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3WgTNeeGr6uKUuJvcES9LZuUweLm/sbBaRIaDoEjes=;
        b=XZhzvzkPFFX4Z4Tic7miUyMeyf00zcT0mxN1SJUDK+Zf6B5dioN+Ng04ViXzdYJMO3
         +4U0rC2q6b1/bXxoCuPJa4kLWiRFgiR/v1rPhLHdUNtvitMRFV9iOzIjAxAaYawoQGy+
         UT5BwJSF9RHTpv2UqPOtZifwlLfY8LehTv2tA6X/LwjGCa5NPgTY4Qi19/wOAs8cjscJ
         ExgbDtByimBYSz+nvgsCkJHDO4o2kggfVSJvcb6rnvNzEE/5oy6VvAJsuaRkHpMooHHB
         oqDf9X7axMjqyFu6RSfEvNnxm90ZGUFKGrKAEfv9ZSb3Dfsg7e7d8fStNZzdqh9EIsqa
         19Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUE8mizYz4VSTJhqu7ZlMRm1ajsGDKRttAILbledX+gAXDwztPL81L8Hee+fiR2CPymBsc3NWkBw5nnybA3DM6JLgcGWJBueB/GYZ2edr/+
X-Gm-Message-State: AOJu0YwGKK+i1fxW9j/E4YEEnEmGCOzD456M9ufF5GhbEyXKRp/ekf20
	+fc1MTezbly9E2D9JLByPHbHWVIpSHUUSkYWv5jGxAjLsL4Rets6gasUBv/9Xso=
X-Google-Smtp-Source: AGHT+IH+C1UK8TXkfq2HYZwku9tG0/J9fW8seqeejTe1fbola7gcXOqlPx5qIbzYgVlGAurTsc1Dmw==
X-Received: by 2002:a17:906:371a:b0:a3e:9ad2:b555 with SMTP id d26-20020a170906371a00b00a3e9ad2b555mr9508772ejc.24.1709125532375;
        Wed, 28 Feb 2024 05:05:32 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ti6-20020a170907c20600b00a43c3e5e008sm1386581ejc.205.2024.02.28.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:05:31 -0800 (PST)
Date: Wed, 28 Feb 2024 14:05:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/5] RISC-V: KVM: Allow Ztso extension for Guest/VM
Message-ID: <20240228-4b0546ecd98e675844aab46f@orel>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
 <20240214123757.305347-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214123757.305347-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_050533_857159_F9551A76 
X-CRM114-Status: GOOD (  14.48  )
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

On Wed, Feb 14, 2024 at 06:07:54PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Ztso extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 7499e88a947c..f8aa9f2ace95 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -166,6 +166,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZVFH,
>  	KVM_RISCV_ISA_EXT_ZVFHMIN,
>  	KVM_RISCV_ISA_EXT_ZFA,
> +	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 5f7355e96008..38f5cf286087 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -66,6 +66,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZKSED),
>  	KVM_ISA_EXT_ARR(ZKSH),
>  	KVM_ISA_EXT_ARR(ZKT),
> +	KVM_ISA_EXT_ARR(ZTSO),
>  	KVM_ISA_EXT_ARR(ZVBB),
>  	KVM_ISA_EXT_ARR(ZVBC),
>  	KVM_ISA_EXT_ARR(ZVFH),
> @@ -141,6 +142,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZKSED:
>  	case KVM_RISCV_ISA_EXT_ZKSH:
>  	case KVM_RISCV_ISA_EXT_ZKT:
> +	case KVM_RISCV_ISA_EXT_ZTSO:
>  	case KVM_RISCV_ISA_EXT_ZVBB:
>  	case KVM_RISCV_ISA_EXT_ZVBC:
>  	case KVM_RISCV_ISA_EXT_ZVFH:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
