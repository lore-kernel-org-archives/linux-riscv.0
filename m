Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12DCC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndZRuzVwPX6BXpmgANbvNJwao1oaRZFuWjpv/AWIVHU=; b=K23ozAVcImux9W
	7PPE+9A9sNs1FGR2oE2IZ+EToP+u4qFf09Pvg+2o/Z8izaJRH3DhB2ExhSArStRwFzJwj0dzhvLtA
	DILEb0Wyf0fgRz+0l6BDxcaHlNS6sj+ngrWekbhHLo6UHMcVfKBk5jF3xD4/4W4nx/6c5wY3M9Xeo
	QRfbsJeZsyvB73F6TYe4bywYJ2GrK/0c69nA12qPM+WR5UzTmDd9FgykjjfXRUAMNAI/hWcJswLJZ
	MBYDcNzxTFP7zgvOz2TUEqzYxv8gbLHWlLZWQkATXphBuuFGmEnkL/HWXCLlZBbzBELxMjLW9PPsm
	f4dhOWAqSiYq4ybehAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskP1-0000000Be2Y-2aD7;
	Thu, 13 Mar 2025 15:23:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskOy-0000000Be1o-3Kvd
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 15:23:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-394780e98easo748829f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741879395; x=1742484195; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BA/nhAf9Hl5zVgG+VDKOPaGIaEJNci5XuuYhsGZzn08=;
        b=EwHMDBkMsScaC4kfJZUxH9WTggYUTLGtr+hAQE9JoGvijZJdxg0zR5qiLf0KGlssM3
         46jkfSFNvo2k/xmcL5a7+bnUhwrAuKZexUDKVMvL3IM/LqBjzCoP2+s4xBbSmMC9+LWL
         hl3Vz8iP/86BwiQk+q/hjcyhErzfyKxDF/5Y/q3Be8jSpOYm/mpm4p5R+Mv9NRiG0FTj
         wX8vQbWu3WyKTG5GQ7dPsX8tSmPNcCbSAGaR7jk5w5w4da/Ow31SZEeGLh8l35FVZ54d
         2SDaE2S2ihHAQMDlkf2z2lYayGDlsaG0McEGjESw9moTHuMb/m0Dubn3YbefQt7x2O0q
         lL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879395; x=1742484195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BA/nhAf9Hl5zVgG+VDKOPaGIaEJNci5XuuYhsGZzn08=;
        b=HreYY3+lWbC/SYTWW0MYnwtQI59VOo9cpHtbWLPdErI/Z5vuFSh2jgLQb7iAGJAHm2
         e/EOZQna4qqg+noZRkf06sjCBpWz1KJ9loklHMmEHpAjJLAqMQSIMpdypLNjQs9Bgg6o
         KGHVe2aoA+1YuCryOt0bvGaJ61SlVwjeJctgYA6NkQaWLf93PG6eANVYYjgILnYAXiOJ
         K3pWr8fgaZlc3yVl7R/DLUvgBJ9xqKTdIBfeq5biqU2fBK1EY7bdVb7OBVkHkXIyS7qm
         dzTs7CyMBSwqRM6usqeu3qlJIPHrp6rY1PMfAkUrBc4Zk1IhbLPym6dQLLVXRO2QPjhQ
         5Tfg==
X-Forwarded-Encrypted: i=1; AJvYcCVxBXx0HobO4P9eltKPLTWryjyL72EemFPG8vkPESrvdqf44P0tMs8BJJ7mKr5fIe4Fh6UgMUi5l6oaCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFnBs5Y1oJ0rXYeC8cjgXAYLBq/3VJXLN0FzrV0xsAwbETXLRH
	rpQ0DrfH68tfOQqBOhNFA/9Va1FRnue2mNBbGyxqwqD1sgbNPNnUhdYNaOpESra9YR1DvGw31OW
	Ke04=
X-Gm-Gg: ASbGncsUEzh84SxRDyF1SZKyQIFR0NglLlooUHbqex2vwMTrTJ0Wne3LoeP35BrPnif
	5hAyWaURB3bu2oCP7VuRSidGFScTAPJJdAEisEIaju9YUmPsA6oCW/boez6kCPYub2O4maUcw0i
	VhTr+62dcSk3Ua7jivcMn4bFZxSqCWHPB0JgF1yoaVoy23UY3v8pzJ2bTG1vF3QmLmO2Vv0K72a
	24kKWBibZJVBWfUru/238yVtwAd0JhdIGoyDV32KpTrOGXS+XCl9gWEpCoxiCcjl1Eyv0Jf6rBd
	YldK+gBr5kmwMcYGYndZ8cW83vC3dDXa
X-Google-Smtp-Source: AGHT+IH2gsIp2nMPCf9r+kFvk4CDxhChk32XJPj/AyskRIl0tzwGRJ83t63ObvUY/PTXrp9i0eaadQ==
X-Received: by 2002:a05:6000:1f82:b0:391:3fde:1da with SMTP id ffacd0b85a97d-3913fde033cmr20335888f8f.16.1741879395185;
        Thu, 13 Mar 2025 08:23:15 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b34sm2457776f8f.55.2025.03.13.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:23:14 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:23:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v3 17/17] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <20250313-16176e19c15b63a156cb534c@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-18-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-18-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_082316_835706_46016389 
X-CRM114-Status: GOOD (  19.44  )
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

On Mon, Mar 10, 2025 at 04:12:24PM +0100, Cl=E9ment L=E9ger wrote:
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu.c          |  3 +++
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 39 ++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> =

> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 542747e2c7f5..d98e379945c3 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -646,6 +646,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  {
>  	void *nsh;
>  	struct kvm_vcpu_csr *csr =3D &vcpu->arch.guest_csr;
> +	struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
>  =

>  	vcpu->cpu =3D -1;
>  =

> @@ -671,6 +672,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		csr->vstval =3D nacl_csr_read(nsh, CSR_VSTVAL);
>  		csr->hvip =3D nacl_csr_read(nsh, CSR_HVIP);
>  		csr->vsatp =3D nacl_csr_read(nsh, CSR_VSATP);
> +		cfg->hedeleg =3D nacl_csr_read(nsh, CSR_HEDELEG);
>  	} else {
>  		csr->vsstatus =3D csr_read(CSR_VSSTATUS);
>  		csr->vsie =3D csr_read(CSR_VSIE);
> @@ -681,6 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		csr->vstval =3D csr_read(CSR_VSTVAL);
>  		csr->hvip =3D csr_read(CSR_HVIP);
>  		csr->vsatp =3D csr_read(CSR_VSATP);
> +		cfg->hedeleg =3D csr_read(CSR_HEDELEG);
>  	}
>  }
>  =

> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index cce1e41d5490..756fda1cf2e7 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -14,6 +14,8 @@
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>  =

> +#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISA=
LIGNED))
> +
>  struct kvm_sbi_fwft_feature {
>  	/**
>  	 * @id: Feature ID
> @@ -64,7 +66,44 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_=
feature_t feature)
>  	return false;
>  }
>  =

> +static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu=
 *vcpu)
> +{
> +	if (!misaligned_traps_can_delegate())
> +		return false;
> +
> +	return true;

Just

  return misaligned_traps_can_delegate();

> +}
> +
> +static int kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long value)
> +{
> +	if (value =3D=3D 1)
> +		csr_set(CSR_HEDELEG, MIS_DELEG);
> +	else if (value =3D=3D 0)
> +		csr_clear(CSR_HEDELEG, MIS_DELEG);
> +	else
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	return SBI_SUCCESS;
> +}
> +
> +static int kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long *value)
> +{
> +	*value =3D (csr_read(CSR_HEDELEG) & MIS_DELEG) !=3D 0;
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static const struct kvm_sbi_fwft_feature features[] =3D {
> +	{
> +		.id =3D SBI_FWFT_MISALIGNED_EXC_DELEG,
> +		.supported =3D kvm_sbi_fwft_misaligned_delegation_supported,
> +		.set =3D kvm_sbi_fwft_set_misaligned_delegation,
> +		.get =3D kvm_sbi_fwft_get_misaligned_delegation,
> +	},
>  };
>  =

>  static struct kvm_sbi_fwft_config *
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
