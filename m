Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1D2E80AA0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tch3P2E+zUODRZr/hq1UycDQjw3pUZBcFAEIEN8ioyY=; b=qRwxKvhWBg4/Lp
	bk53i8D/O/pUX7R+f12yaro7yeVL9/JV0pXiJqFklzS5i1RyNAzq7kr+Sc89Ogl5YUFY4sbnnquX/
	9tgfm9GwuKorl7rvkLB0XzeahM1JKaA4bTPY6uqNgkgBcVYiY3LZPQ9wn38CAf8EkMWYZYSgzm0tR
	+aJJecLIseLQ1bHivMmyk3UXlzU8ykHtvBdIxXkxdkhnE6l1CgC1TuXzsDQvfi95SabR0ghhG6pia
	dZFUOq9l1e//qTKGgFntP3IiT0BMOn7UvhoaNqfsDt+azsCE8tTpQdwHpmuyaEXftD/UsZMNabaDC
	aXKA6xVrkGExGAxDu6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOx3-000BgD-32;
	Wed, 27 Sep 2023 07:27:17 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOx0-000Beq-1I
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 07:27:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdcade7fbso1278149566b.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695799631; x=1696404431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jicr0C9o+OP8Bl8W0wwK/zVRRNXHvssftPu6icJ2MsI=;
        b=WvUqSnqw/QYsjhV65FOEqZMu1sCL+LKg/FkTYCem9j6LHFM42hPqwwS9Alx46QXvJJ
         FyDQU1qcVkGNIqbVeXecaHuYxy2QYXsBL0OO0m6ahjpLFLoZEJ9ptiq8dzturN1h1KTn
         XsMoPVLJBwFnbcgc3AQjbCS5DZ1NUNHIGTPHckQSn08+Bs99islEs9dZgmCLlXUzWDIr
         LzFl5RbuBB4auGV8rAr/JSXiwPzRR/ibXJxcxpP20VjKZ8FaWgc8elff7ttocwqljn9b
         Jj4N1lk85mDSrxSBo6LTSSLUDuSlsnlP5oPvuL2WZvKDuD6A6r4b4rEUgSwF7CvUTLhO
         1UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695799631; x=1696404431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jicr0C9o+OP8Bl8W0wwK/zVRRNXHvssftPu6icJ2MsI=;
        b=lCHD9YrjTPBwRxkffok9d9x+i7rg/Z9LMIuGSGjp4VJkYNCbIpf/QaKf7DU3f1ifMN
         LNnNnTsy8TkSFWSK2QTylpBrYm0vyLt6M8CA5KHB0mccJFo+7HEPKuC23S342Xb5GRfJ
         Pc5BODpKxmY5IsQm+w4PXI/aYuKH2RqkaHgN0wyYvL5fbmysI071GtYs58wD/HBU0eoq
         3cBwoI8u/7EzszPkeppC1oLG4843uFoSlvzS3kXy7+XRyIvraV2vz3jM/IpLg2q2LgXP
         yre+s2py4+BXafLS/CFM5CRRE5TIe03ZivtEYhV1dDNH+qOW3Tgaj+TdI3+8FlRpNa0L
         etrw==
X-Gm-Message-State: AOJu0Yz6MN8abclzBuoKsk1XOFjx/Sup2hafOWgxfQI37FkhXcfLAjBd
	pZpjy5uyxanALkYYhFzNgY5sDw==
X-Google-Smtp-Source: AGHT+IGVch1VtqFhycPP9kneRFs/qrXR1z3hJ3lQWj3uG9ohGT7avGn+bJyDfZdr17bZiiLnFRcXdw==
X-Received: by 2002:a17:906:1dd:b0:9ae:42da:803c with SMTP id 29-20020a17090601dd00b009ae42da803cmr1014846ejj.48.1695799631122;
        Wed, 27 Sep 2023 00:27:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lf11-20020a170907174b00b009ad81554c1bsm8776380ejc.55.2023.09.27.00.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 00:27:10 -0700 (PDT)
Date: Wed, 27 Sep 2023 09:27:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com, alex@ghiti.fr, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: Add Svadu Extension Support for
 Guest/VM
Message-ID: <20230927-408c4f85a0ee1d2caa1779f3@orel>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922085701.3164-4-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_002714_442128_4787C26A 
X-CRM114-Status: GOOD (  19.39  )
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

On Fri, Sep 22, 2023 at 08:56:49AM +0000, Yong-Xuan Wang wrote:
> We extend the KVM ISA extension ONE_REG interface to allow VMM
> tools  to detect and enable Svadu extension for Guest/VM.
> 
> Also set the HADE bit in henvcfg CSR if Svadu extension is
> available for Guest/VM.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 3 +++
>  arch/riscv/kvm/vcpu_onereg.c      | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 992c5e407104..3c7a6c762d0f 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -131,6 +131,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZICSR,
>  	KVM_RISCV_ISA_EXT_ZIFENCEI,
>  	KVM_RISCV_ISA_EXT_ZIHPM,
> +	KVM_RISCV_ISA_EXT_SVADU,

This register will show up as "new" in kselftests test[1]. We should add
another patch to this series to update the test to handle/test it.

[1] tools/testing/selftests/kvm/riscv/get-reg-list.c

>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 82229db1ce73..91b92a1f4e33 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -487,6 +487,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>  	if (riscv_isa_extension_available(isa, ZICBOZ))
>  		henvcfg |= ENVCFG_CBZE;
>  
> +	if (riscv_isa_extension_available(isa, SVADU))
> +		henvcfg |= ENVCFG_HADE;
> +
>  	csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>  	csr_write(CSR_HENVCFGH, henvcfg >> 32);
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 1b7e9fa265cb..211915dad677 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -36,6 +36,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	/* Multi letter extensions (alphabetically sorted) */
>  	KVM_ISA_EXT_ARR(SSAIA),
>  	KVM_ISA_EXT_ARR(SSTC),
> +	KVM_ISA_EXT_ARR(SVADU),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
