Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1231C369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMxzztIYNvwQdbxp88XZvlR2kgc6zo4XMiukNqXA57U=; b=fs1guyrV1FrFRE
	/o7aXMxhoTusSBrtAJ0K5aegewhgOlD9HC30T35fahv6tIewnKXo5DYxo+dIwYORD5mbSZoHq8lte
	yyyiUvllcpnoNS9XF5A7ZtMUOMOOqisEAFmPG9dRQWTmbdpKFYF5PlmMzyhKfD4uT7r8gib9ck1cu
	rBPrzV8MuGy/k3/iuXwWkL0tPvhQwlcoN/QUlAXrpOdPyno9o4gijtxYkQ1VxV5JHURMr7Bn/l7ca
	N0dL7mXEmdeHrowdKaFf5rcK9XS3ZLZOBoB7wwVPRTslnt9ImWe35eZUT1/o1a1hIqultOfsHoVsN
	tQjmCQNMc7/rJEwZzEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z35-0000000EZlo-2FzA;
	Thu, 24 Apr 2025 16:03:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uqa-0000000DsFB-0NK8
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 11:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8kNEaxbnoW9g1fYmJXQwSNKTdFbvmREbcFtvdLnT5Xc=; b=LDP9akddg8JGgKvSuhzIqRA8KA
	IaKv4gVixeBYdFFQXJzgMR1HUUf2Fa8Px0ztdd/Z0x1yldeKdKjFU+8w6H5fpf4Xkz9JkoW9pDE8w
	bCT3NgNz5fGAhPMhXxrvzP6FPwph2/hQYi+sgWTusys/lsw6NH15SC+lNLvEm9NM+6blbK6FQxKBQ
	bfgROmJVuhW/+1awYiv/bfyRKYTB9OEK9TWtHaiXhKuGwiU8O5qKaKGy17DresVgwKJOkupbxdZ9p
	I3iO/AM6qeJtmapUaL7e4E9QKZME05pJCPbF/RG2598Cx8RxSJYiJQcxVVvXh8xImmOHd4MJTi+aV
	cKOfosvQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7uqW-0000000Bm2E-3s71
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:34:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1efc457bso602212f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745494462; x=1746099262; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kNEaxbnoW9g1fYmJXQwSNKTdFbvmREbcFtvdLnT5Xc=;
        b=kGhMW8bMceVwn9qNFIHJx+ZF/haiNVUFMArZSaUms1tlosRW85PPePQ6nADZzAUaet
         +GNbmB7JQicrGnNd1TxdHQn7yk/XVr4Lu6lhNq/XxA0GCZXS4JbmOBYLAxHQSk+H/x7y
         R095JJJvs1N4m/f9C7ECEcxFRO1D1D+/fy7WgmnNlSlgDxAZnHvi+21cYeOjS3GTEIG/
         qfgWhfiQrDjAyxw2Lfff8uzgUqQ+SLQo9CzVuS4TGHMsZDNLVY0RqFAkfri2GCf7guEZ
         rWBNqbctqSB/Wrh3HAksDrqE5UwJ6Emj+8QtnsTMhD+R1zk7HRFHq00jKY3R3n3w0ge1
         xrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494462; x=1746099262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kNEaxbnoW9g1fYmJXQwSNKTdFbvmREbcFtvdLnT5Xc=;
        b=m5fKb0wmPDWjhR2rghFB3+231OYEaZjfw2BholyqSHVDP7SI98M8hbUfszb9/BzX7k
         ME+o5ZZfcz92422udsQR0FuueD1XEccclkPcFEsmzuj35spVoUnZobxlDMf0gfKYfUDA
         P2iGZAUByGMWyB0jCuKQzh2O/b6A9bK4xKSTS7NxWzyMVVoUFhhCTAJTIREfY54wXPc4
         LeQV6+xWIlquuONz6hrnlNrMO9aZfCaIWVqbfNko7n9PiVSq7K4Vc+296Rwqg5Nl4K3i
         idJ9sMpTaVs30Y+2JP1fvr0bN+e98/aAtSyIzcb3sZyWttNbBeLXwiERtCYBPlL9T8Ed
         iy8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUINvR07EYpzcMcCzGdHfQ1Nk+lo2zfL/H4K58+oqK8n/SsxS4dt/LC3lNj60l8/YmeRJahekseN0HvPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpHd3WyTl46RkpmlhVHENyqvB1coo57io2N90Cj8brdCV6fkF
	n8bDX9brxAKY850tai+zaBDs4NvUkc2wjlWZbh8KWXKRLXhe9Ze/KRYw/pbb7Kk=
X-Gm-Gg: ASbGnctfLbX6TaTNmlk+bHh2fAsORV2ASkq7N77OABYQ5JLv++gTQ9wDFBjA/Q0cJCE
	RJBYzta1bfo6S4sbUMkXkBUpIEPG3VbwBsRzD6KEzKcdEpEpHXLfCr/mPQAOjo7YMBA6ouauM3X
	HSnu1GEbR8So3NrBT3wijaUOSbGWGRvZhBAWKSC+7KKAOLIrPf4CVyNVM6hwwbXBoa2j+N0kRT/
	GCj+xhaz1njM+3BAceF+a0nkzDJtsZhozacp5hMmwnB6+3JvdE8vZXCFs9xTTXOgp9o8vKB1CUI
	idg5irHY1USUbpiLWe3qVAKTMTR0
X-Google-Smtp-Source: AGHT+IH+Hg3/PqfVx4rNvlrTeNa+fBCY/aumfjJWzS9tER7WilSZAHlxfjRytvmLaoteiiEk+m6uJg==
X-Received: by 2002:a5d:4a8e:0:b0:39a:c9d9:877b with SMTP id ffacd0b85a97d-3a06cf5f4fcmr1401332f8f.27.1745494461931;
        Thu, 24 Apr 2025 04:34:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4bf781sm1830579f8f.37.2025.04.24.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:34:21 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:34:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v5 13/13] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <20250424-ae24464169f7143c509cbab5@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-14-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417122337.547969-14-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_123425_108177_D4049F24 
X-CRM114-Status: GOOD (  19.52  )
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

On Thu, Apr 17, 2025 at 02:20:00PM +0200, Cl=E9ment L=E9ger wrote:
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c          |  3 +++
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
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
> index b0f66c7bf010..237edaefa267 100644
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
> @@ -68,7 +70,41 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_=
feature_t feature)
>  	return false;
>  }
>  =

> +static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu=
 *vcpu)
> +{
> +	return misaligned_traps_can_delegate();
> +}
> +
> +static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
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
> +static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
> +					struct kvm_sbi_fwft_config *conf,
> +					unsigned long *value)
> +{
> +	*value =3D (csr_read(CSR_HEDELEG) & MIS_DELEG) !=3D 0;

This should be

  (csr_read(CSR_HEDELEG) & MIS_DELEG) =3D=3D MIS_DELEG;

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

> 2.49.0
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
