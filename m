Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B573DCE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 05:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gScP8yOVAw5icuu28HhgcMRIp1v3HlvMaXNSVklPLto=; b=XuwLfc7AnMJ9ro
	tZBbZ9DfBSFiHDigwBeajISEvHOQGVpMattBPtE/DTLYX2b8qtXHhaAKncJD/gPlVHEfH9Pt3TGxZ
	GrxuUObbeusIyWgmz6+IW6rNgwxJIpTOGvrTXlntalS4i//VlnmVUctKByKQCRA+LeqhMZ1oyf3k4
	HCYXZX01TduXCMx6YNUXrLPFIWskhJ2zzRx9OfBBoWa4aAaeBYW8gdS3SXoetzvQWYZtuST3wVjvF
	YPWY14/MxzYlTYYFXlT+SQnukly7rXpMg8khkGoVdU57HI9Khv8+m/5x/wXGoe7D1q7tYO2nn36m1
	E8R0ibS/F5ssd0o1d6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiphF-001uIL-1I;
	Wed, 20 Sep 2023 05:24:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiphC-001uHV-30
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 05:24:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-404314388ceso68540005e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 22:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695187457; x=1695792257; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdkiLvHF9gidro/3KgiAkGZtbptKxwZzl5vmZkiG0XI=;
        b=dtCtUKtW+EZJChIilpP99Z5yIUrbcX2+ZYADbSC1Rir1qlchGN2ND9fuju6tVYJhwC
         PpE+A2ETrQ2GBrXSnZugofAr1MN4pEgyawvwCgV6SoB2n9B442OUNqYewRY84se3k9EG
         O+8YX7QtvuvDli6SRNGKRywqAMWhnInR4Kmc/HZevDo71XTcsy6JFXRHojhDCMWIjDLO
         ir2KcNPF6GWWrTAHoPVs4bHLF/oKXnj+REuISUL34Vq/953/d4VlE4b6+vRN/nfB9czC
         nFjEYSwlBM9FeEqB8scexj73N3YlmOol+/8UeAOirWeiscxf0+eWLyGdqVM6rhN7AIoU
         eadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695187457; x=1695792257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdkiLvHF9gidro/3KgiAkGZtbptKxwZzl5vmZkiG0XI=;
        b=C8jlReOsPgFMQiieLgq8+Dfh5Ho6rGCEbla3wEeZODYqPzZdOeBayxFdPzGAxNqrqk
         YkNP2yTRNklBxgrXcDAnfRgpcLBXEo3evwosor4+Zi4hjwfliUJqFj2+Nh7JuSTvpsmG
         n1R4bnyPzNrHpRcXDHvFBL5WfwF2RE1rAppBHiqbj/F6ZZPcH6hdGBi/vQOEa31Ar2DN
         eGP319Z5k6D+kqD8fxepvs3spqkxCdXlJybdltc6f9AyVWPe5aprI2C7+awmvVsLLiAR
         ZtO9Jc8BIMU1/aCttsKmMJlYDuHlzlGJee1+vLJpDN7DsNsZ32f8ji8oEa/hcXIREgF/
         WU5w==
X-Gm-Message-State: AOJu0YxWl30+6SSWifzmzZZI79KbeuejR3p3WGltuc0z6MAKqe4wXax6
	9dQsNlM1TlBPrV75ZU7KJ98oGA==
X-Google-Smtp-Source: AGHT+IHQdxfJ+WR4PPpqSYssTciQLBDW93+4eJ8/sDeDDHyZEJdTgHQCz4eKTxKGB5HuEUnCpOx01Q==
X-Received: by 2002:a1c:f702:0:b0:402:f5c4:2e5a with SMTP id v2-20020a1cf702000000b00402f5c42e5amr1429426wmh.37.1695187457228;
        Tue, 19 Sep 2023 22:24:17 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p5-20020a7bcc85000000b003fe407ca05bsm874397wma.37.2023.09.19.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:24:16 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:24:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
Message-ID: <20230920-d524c40b616536d0ad8213c3@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918180646.1398384-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_222418_971739_92CC2BFA 
X-CRM114-Status: GOOD (  25.68  )
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

On Mon, Sep 18, 2023 at 11:36:46PM +0530, Anup Patel wrote:
> Currently the AIA ONE_REG registers are reported by get-reg-list
> as new registers for various vcpu_reg_list configs whenever Ssaia
> is available on the host because Ssaia extension can only be
> disabled by Smstateen extension which is not always available.
> 
> To tackle this, we should filter-out AIA ONE_REG registers only
> when Ssaia can't be disabled for a VCPU.
> 
> Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 76c0ad11e423..85907c86b835 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -12,6 +12,8 @@
>  
>  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
>  
> +static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
> +
>  bool filter_reg(__u64 reg)
>  {
>  	switch (reg & ~REG_MASK) {
> @@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
>  		return true;
> +	/* AIA registers are always available when Ssaia can't be disabled */
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
> +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
> +		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA] ? true : false;

No need for the '? true : false'

>  	default:
>  		break;
>  	}
> @@ -71,14 +82,22 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
>  
>  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  {
> +	int rc;
>  	struct vcpu_reg_sublist *s;
> +	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };

nit: I think we prefer reverse xmas tree in kselftests, but whatever.

> +
> +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> +		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
>  
>  	/*
>  	 * Disable all extensions which were enabled by default
>  	 * if they were available in the risc-v host.
>  	 */
> -	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> -		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
> +		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> +		if (rc && isa_ext_state[i])

How helpful is it to check that isa_ext_state[i] isn't zero? The value of
the register could be zero, right? Shouldn't we instead capture the return
values from __vcpu_get_reg and if the return value is zero for a get,
but nonzero for a set, then we know we have it, but can't disable it.

> +			isa_ext_cant_disable[i] = true;
> +	}
>  
>  	for_each_sublist(c, s) {
>  		if (!s->feature)
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
