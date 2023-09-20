Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF42CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NDePkdiSwLTpi3nvPFsIBS27nakOenyDM9V5i1tdaE=; b=JDm00OT0ho40/U
	ar96HuMFkjzwfTSxYt1QUM0NG929ygdZ7N3lC+H396SpgCw1gDvPmE048CrBIS2EHe04BPLGEbz0N
	0d98mMPCdp8T4hzmDOT9xotm5HnRjsaw5hIONN42kkhseOGZNaqewXA4wNMU4748R43WrGzAHz1VZ
	pLu6BqWurl7CmlPH1OgvuDBdP+KkS5KSmBMdnceFr6OSfiv2/T4198q+y5jUfrsXTjbtvAVRtZarG
	ndsaI9gF3j7fKHyF8S1J95ntNhD1qj6dOYcGd6QaOOqe7XDpP3BG5WVJa/wQYNKDkrRlrVvu0YPKE
	nnxW2qU1EzRIpufbyAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirvH-002B6n-1U;
	Wed, 20 Sep 2023 07:46:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirvF-002B5b-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:46:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4051fea48a8so6288005e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695196015; x=1695800815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVunG7o3B5X9vaQEWyirI9ryk0oP6Di9CEjbsBLCF3g=;
        b=MfqPNiIugkmQqVW/aS+5MVrTEy1vE+zl3gff8PxM1BE+u6n2IcTlnTLj+FTaZO5NYm
         AxuICuXUJfDk5tt81yWYBlfsjBwqWxx6PqL3GdljVcDdTm19rcxfkVr5I3phdp8A+vBo
         MhvVg5X4Ep5og/qKkAmmWBoPHX4BLBfYxx8Pk1HlW/96ZOgPXOtBA7vz/yskwhizsumw
         pwQbkk5SaIWFigFQ/q3i1DEKt0pEgJLk97XEYFSQJSApxK8gNnPczsSWf8j4lKhXSeze
         7Ed/z40u8dD5RTmPgt8MKMTtG9/JMYHHJsRH8lvLu4gLH1e+4bJi1ttaYd8OJ7bAmuBH
         toUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196015; x=1695800815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVunG7o3B5X9vaQEWyirI9ryk0oP6Di9CEjbsBLCF3g=;
        b=bhnLMY6U3GtbWOxnKCWUaQ8s5Xi8MnnC/HufLB7oqKco/5dL+4rYdDZXMEtmFlfzZf
         8FKSbB2E++JMIBmCsHiQFXvtqUJ4JhghsmfC38778/MWuG3vS3DGI1sDFGKez1Owr7ml
         W0nrEgVfBJzsYezceleHnohwY0KQugk02iqIm9nQd4KLEcScHbwkqkUA9bA2hEpygGTb
         /0fnnkdVFOebD7zDpryqB303pK9ojfD8BrHij4F5MSFUMy0uK/5TDoTXrSYByRvFse+3
         OGbT4qDqMgoKwZxd052Jyadtq7D47eFOrD5cSdhpR/E3jNeADWOt2r+ldghcJlUvmsUl
         tIwg==
X-Gm-Message-State: AOJu0Yy0S3K83vU33eDFGz03XkWhVeDZ7NgLhXmSR0BJ7CwXaY+1q/qL
	ZioplGNbyqQDYjilUMRaFNPoLA==
X-Google-Smtp-Source: AGHT+IGG/3UyVqZOOAbC3tloQ80fV1Kl6R8qcuyc4Oxl1dNBdENA4jwJSlr1R6ygp4yAftiTc+gUZw==
X-Received: by 2002:a05:600c:280b:b0:401:38dc:8916 with SMTP id m11-20020a05600c280b00b0040138dc8916mr1690704wmb.10.1695196014842;
        Wed, 20 Sep 2023 00:46:54 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a24-20020a05600c225800b00402d7105035sm1167853wmm.26.2023.09.20.00.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:46:54 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:46:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/7] RISC-V: KVM: Allow Zicond extension for Guest/VM
Message-ID: <20230920-be44cc5bd0f749a1137d103c@orel>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919035343.1399389-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004657_519129_A9D6A47D 
X-CRM114-Status: GOOD (  15.32  )
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

On Tue, Sep 19, 2023 at 09:23:40AM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zicond extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index e030c12c7dfc..35ceb38a4eff 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZIHPM,
>  	KVM_RISCV_ISA_EXT_SMSTATEEN,
>  	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
> +	KVM_RISCV_ISA_EXT_ZICOND,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 17a847a1114b..d3ca4969c985 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -47,6 +47,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZICBOM),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICNTR),
> +	KVM_ISA_EXT_ARR(ZICOND),
>  	KVM_ISA_EXT_ARR(ZICSR),
>  	KVM_ISA_EXT_ARR(ZIFENCEI),
>  	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
> @@ -95,6 +96,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
> +	case KVM_RISCV_ISA_EXT_ZICOND:
>  	case KVM_RISCV_ISA_EXT_ZICSR:
>  	case KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
