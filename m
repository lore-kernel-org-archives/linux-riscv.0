Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0C3C36005
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTF2ZBwE42L8+vsBfDpNHT9cwCu0fs5z9hmhHAHj1PU=; b=PQOVxDsXgtWd7G
	PZHtFy+JDTIZO0RRZpzrgG4ZBjEsv75+EexuRBulM+M36w72oAS2Zxoaydj6X+LN3REGS+oyycdPX
	kSkYMo6b5kWTiCH4yCE9faNR1J/qBlm0qyPu8LNO+J9lG1EpHIkmwynRXoHyH+iotOjmyy2nKHWgF
	1zyHiVfKnsSKx0agmIVDw8WchDLVNzS8xN9VQSW583ePlOI9G7VPAFtius1UxBEtsskdSW9TRw3pg
	8aKXJAy47FN4EQcdCKlsA3/Qq38ym/kMe1TIVgK49tYRLQqwFwXVb9nCRUgA6F/XiQhjOO6SB9DTl
	p+WFf/TwPIaCD3z44dQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxt7-0000000HOPH-3fwt;
	Sat, 22 Mar 2025 12:23:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxt4-0000000HOOL-2t8j
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 12:23:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39133f709f5so1486922f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Mar 2025 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742646217; x=1743251017; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTzyaulL1cxveyrERlwqgSXFqrJfmGbcSuyVzNJ2WH4=;
        b=iTxIz4BwfPnlPHjd4dndR2WyrHf/zZDo+VoLo83mjPMWDB7Wx/tpeRNCOJqZkEoxoW
         TEHtMAkcGQMOh4CP5RMhzmcesjFMP91QftLEUtXa3lH+9IMiPUVgbrViovikHxwVmO2q
         eZBbc0rxK4RpC5Da+loHADNVAS0fmD6wZNio9RFtjFbVY78wKHtyjavRMOjsQmtos5pw
         gFr7IN6ZbgtIL1U8U+0gXJFjca1/6a9SMz06mah+fiTnDcalxDdbZCrLUVLYvzffuOuV
         qpkCWbUzEXGb+LWSUWp0l5cBlnJdYkuBb3b0VhwzN8s51a4Ew41tXBed8blOSge2ghyR
         Ut9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742646217; x=1743251017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTzyaulL1cxveyrERlwqgSXFqrJfmGbcSuyVzNJ2WH4=;
        b=HND5MWHSyphhs8qLvwdz2Uq3PNP2WDX6S3S9LnB8LOcsVl2CKHSigUVO2HeoeQcLuO
         acg2uLLO7v3l2EibkI2vlg1U52breMzJDvgQUgbUnItsAoahVxqf961dAtyaRxPVoswC
         AzxfHwVx32/F0TEeUaoBpkw6xW0T/QwSqBpJ0FSFxMOk2IaQb7xm57HggZI42+4aY1d4
         LEw54lVb8UVKyUBEQVNAEtwGIPPF4oaLC9g35FSP7nYZ3nRkeQnMYgmfe0TA/4v0mqXf
         NrqDUblG0Devv8VWo+hMqN7MQduyPSmhy5P6zN//BFoHZqiUiZ/s8ryI7GSI/w11OKGg
         AIKw==
X-Forwarded-Encrypted: i=1; AJvYcCXn/Ulslz0yvBnE68knoPmu59E2XuGQqHS3pmo0ELRpE8qEXyzjga5qXR8h4ow+slkj3DaLp0QnGf4D0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwISl6PBQ6vlXprT3eYbq+a6o0RjS9GF7+/WuS50aZsycutrIWL
	L/oFK1qVujFq6biWYapCAhIN7ET83TY3DKc7VkanKYigxpSHftqwh+zDXCaSUoo=
X-Gm-Gg: ASbGncs/JXGKMAw2B7uCa5gjzHsBiJcXGNfxD4ze6MbqJH25MVh2vqDJTbv62wXU4Jg
	n8lxfz6h+Co8JCYSeEoiibmdcXIy1ySkIW7oC1duB4ksaR4jGWk4hlxZoxtt8Ipdz7YDX9LU8qL
	9DF7XzVDAMHYMDCL+mLXsG7mPtbmQhw11g1qVgUDpmTq4Lwudht4TmsGHwnincKOEVQnmehctCT
	3ewCwiEB0kG++pr9Uc+VCXllFDChz1xGheBEHOn9IJAejxqBZcZnbkFdPUXuKKCJMbAkAJ60oY9
	cKfxehleCzmpugovj8DthySuoMDKdJSeW26Zu5tB3ZnrJ3AbeBqGDaiS/FC2+heL2CjNuw5dOKF
	DIzSpJax6
X-Google-Smtp-Source: AGHT+IE52/go+hfWqaafAsUjbEtclhpDIHNnMSaVERxClIrOt/FGAA02DZDghiLFtwTeL9nKBPSrqg==
X-Received: by 2002:a5d:6da1:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-3997f8ef06dmr5373282f8f.4.1742646216874;
        Sat, 22 Mar 2025 05:23:36 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e66a7sm5001809f8f.76.2025.03.22.05.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:23:36 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:23:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 15/18] RISC-V: KVM: add SBI extension init()/deinit()
 functions
Message-ID: <20250322-79de477d27a2a75eb89616d1@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-16-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317170625.1142870-16-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_052338_725254_7B6A4912 
X-CRM114-Status: GOOD (  21.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 17, 2025 at 06:06:21PM +0100, Cl=E9ment L=E9ger wrote:
> The FWFT SBI extension will need to dynamically allocate memory and do
> init time specific initialization. Add an init/deinit callbacks that
> allows to do so.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
>  arch/riscv/kvm/vcpu.c                 |  2 ++
>  arch/riscv/kvm/vcpu_sbi.c             | 26 ++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index 4ed6203cdd30..bcb90757b149 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
>  =

>  	/* Extension specific probe function */
>  	unsigned long (*probe)(struct kvm_vcpu *vcpu);
> +
> +	/*
> +	 * Init/deinit function called once during VCPU init/destroy. These
> +	 * might be use if the SBI extensions need to allocate or do specific
> +	 * init time only configuration.
> +	 */
> +	int (*init)(struct kvm_vcpu *vcpu);
> +	void (*deinit)(struct kvm_vcpu *vcpu);
>  };
>  =

>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *r=
un);
> @@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_=
ext(
>  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
>  =

>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long =
reg_num,
>  				   unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..877bcc85c067 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  =

>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>  {
> +	kvm_riscv_vcpu_sbi_deinit(vcpu);
> +
>  	/* Cleanup VCPU AIA context */
>  	kvm_riscv_vcpu_aia_deinit(vcpu);
>  =

> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d1c83a77735e..3139f171c20f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -508,5 +508,31 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>  		scontext->ext_status[idx] =3D ext->default_disabled ?
>  					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
>  					KVM_RISCV_SBI_EXT_STATUS_ENABLED;
> +
> +		if (ext->init && ext->init(vcpu) !=3D 0)
> +			scontext->ext_status[idx] =3D KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
> +	}
> +}
> +
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_sbi_context *scontext =3D &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	int idx, i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry =3D &sbi_ext[i];
> +		ext =3D entry->ext_ptr;
> +		idx =3D entry->ext_idx;
> +
> +		if (idx < 0 || idx >=3D ARRAY_SIZE(scontext->ext_status))
> +			continue;
> +
> +		if (scontext->ext_status[idx] =3D=3D KVM_RISCV_SBI_EXT_STATUS_UNAVAILA=
BLE ||
> +		    !ext->deinit)
> +			continue;
> +
> +		ext->deinit(vcpu);
>  	}
>  }
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
