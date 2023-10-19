Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF16CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drBv1uo5dgFE3SQvEjn2bxV22o2qqvGjB4b0VN2Cc9A=; b=QU99cBZ+2shqoO
	8MJCjIwCk3JDygJTq7ijoqyLIiKx2UhlbPsgT0jW16WMaQ3OX8/lXqHE1cWgttUG3WAVrsOvAazKM
	Uz3Jp/XEx62koaGH+Mo2KznFbskhCVR1IDclezTccMb0f462agb0VA+eOf/sc6/0M7IERNk6qHmK3
	lImH6SDv8T/p+0l1jNc1J0xo3PhhgOC9NLPz0Nhm9d3A+QmW1Lk1VSBFHmkVSFXzRcdVCcxNTzFT0
	YJDfzcXb0smlZ+6zkKy5i5BsknnXDJx3GhLNtwFa+44Lo/eoWMNjQow6gQ2Jls9M8nAU2SstUoHzt
	7VNmaMsKAEO+FLcfHoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNut-00GeeD-1K;
	Thu, 19 Oct 2023 07:58:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNup-00GedJ-2N
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:58:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32d9cb5e0fcso5150418f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 00:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697702277; x=1698307077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BaT0UAyyKtssFxQND155cWxNkiluUWACURFJFcXVWDk=;
        b=OH+dxqY3zuv0nV6mBa9TSXoaay5vSkbHb2iG92APhNBOtaIvjyn2K+96GMaiRfzZyx
         9btT+mfKuJiia8QOvwp0ocPaUK9JwgjZNvm1WpsnI0mY+FRu187wz3shlAHljkVpC/ai
         0lt0gLKVq4sqJBwIi/EY9WweS6Ndz4TVUVf6Ge41SpZVQp0BOWd9VZZHMuuHC0v3DIa7
         2Vd2wEM20Ncm4nIst66PW5dy635Rj4tfB78TFqkYf4cUViY44vXvU7EhXkYGn1hHXNbt
         clWAQ7eAvKZXVo5W1c68tL1ACw3mmtQCGBHHkbSY9WoQWo5D+VyV2JYq5veXFPZYKmdU
         j14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702277; x=1698307077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaT0UAyyKtssFxQND155cWxNkiluUWACURFJFcXVWDk=;
        b=Z4tIibVdvFdAga5bvdgzy7zLI+8lNYhEagw8pQpo9PjjUBetifVgP8Ou/guSssR4uC
         b4Tx+ZEvbyDjl3ZwXqDr3qxSxpUscj/k02FrQDkpiAONPFgi7/VQDkS/kR2iQYGUfCLH
         CFvJrtBJZnD6o73bCH5gyLkInUgxFt9R4cEeG2iUZ4PqfoSOhNhjNXLphYVPbh+D60CF
         wNyZ4EnDoUR09esOoRndBggvAZQ+flyYZTmzNvTi6ZvxNEmNqAbBviD+fIiqHfGAgein
         2adn1cebpQu0eshBpS4SHE6J36V6SHS9R9dXarc6DJ5ClAa2bds+MhYql1VzXKDCSh2L
         0GGg==
X-Gm-Message-State: AOJu0YzRiHDGQszSjvfn2mUTsL93/ZwbX4Xh3LK0at5boNpuTStkMj9X
	s+7iUe1rDVJNbaUWqJMvHB64/w==
X-Google-Smtp-Source: AGHT+IEK/SMb4NUNaf8d2WXTwiv7iPTtR4vQFuKO9GOmaPzBWNUEn6ZcPIJGemg9D6f0QM31YvDQsw==
X-Received: by 2002:adf:f9cd:0:b0:32d:a335:e33d with SMTP id w13-20020adff9cd000000b0032da335e33dmr887824wrr.58.1697702277126;
        Thu, 19 Oct 2023 00:57:57 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i3-20020a5d6303000000b0032db4e660d9sm3831000wru.56.2023.10.19.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:57:56 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:57:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] RISC-V: KVM: Allow some SBI extensions to be
 disabled by default
Message-ID: <20231019-1e6f411e1cbc4a3b0fbff3f5@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_005759_780641_A0AC696A 
X-CRM114-Status: GOOD (  37.64  )
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

On Thu, Oct 12, 2023 at 10:45:04AM +0530, Anup Patel wrote:
> Currently, all SBI extensions are enabled by default which is
> problematic for SBI extensions (such as DBCN) which are forwarded
> to the KVM user-space because we might have an older KVM user-space
> which is not aware/ready to handle newer SBI extensions. Ideally,
> the SBI extensions forwarded to the KVM user-space must be
> disabled by default.
> 
> To address above, we allow certain SBI extensions to be disabled
> by default so that KVM user-space must explicitly enable such
> SBI extensions to receive forwarded calls from Guest VCPU.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 +++
>  arch/riscv/kvm/vcpu.c                 |  6 ++++
>  arch/riscv/kvm/vcpu_sbi.c             | 45 ++++++++++++++++-----------
>  3 files changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 8d6d4dce8a5e..c02bda5559d7 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -35,6 +35,9 @@ struct kvm_vcpu_sbi_return {
>  struct kvm_vcpu_sbi_extension {
>  	unsigned long extid_start;
>  	unsigned long extid_end;
> +
> +	bool default_unavail;
> +
>  	/**
>  	 * SBI extension handler. It can be defined for a given extension or group of
>  	 * extension. But it should always return linux error codes rather than SBI
> @@ -59,6 +62,7 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  				struct kvm_vcpu *vcpu, unsigned long extid);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>  
>  #ifdef CONFIG_RISCV_SBI_V01
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c061a1c5fe98..e087c809073c 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -141,6 +141,12 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  	if (rc)
>  		return rc;
>  
> +	/*
> +	 * Setup SBI extensions
> +	 * NOTE: This must be the last thing to be initialized.
> +	 */
> +	kvm_riscv_vcpu_sbi_init(vcpu);

With this, we no longer defer probing to the first access (whether that's
by the guest or KVM userspace). With our current small set of SBI
extensions where only a single one has a probe function, then this
simpler approach is good enough. We can always go back to the lazy
approach later if needed.

> +
>  	/* Reset VCPU */
>  	kvm_riscv_reset_vcpu(vcpu);
>  
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 9cd97091c723..1b1cee86efda 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -155,14 +155,8 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
>  	if (!sext)
>  		return -ENOENT;
>  
> -	/*
> -	 * We can't set the extension status to available here, since it may
> -	 * have a probe() function which needs to confirm availability first,
> -	 * but it may be too early to call that here. We can set the status to
> -	 * unavailable, though.
> -	 */
> -	if (!reg_val)
> -		scontext->ext_status[sext->ext_idx] =
> +	scontext->ext_status[sext->ext_idx] = (reg_val) ?
> +			KVM_RISCV_SBI_EXT_AVAILABLE :
>  			KVM_RISCV_SBI_EXT_UNAVAILABLE;

We're missing the change to riscv_vcpu_get_sbi_ext_single() which should
also drop the comment block explaining the limits to status knowledge
without initial probing (which we now do) and then just check for
available, i.e.

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index bb76c3cf633f..92c42d9aba1c 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -186,15 +186,8 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	/*
-	 * If the extension status is still uninitialized, then we should probe
-	 * to determine if it's available, but it may be too early to do that
-	 * here. The best we can do is report that the extension has not been
-	 * disabled, i.e. we return 1 when the extension is available and also
-	 * when it only may be available.
-	 */
-	*reg_val = scontext->ext_status[sext->ext_idx] !=
-				KVM_RISCV_SBI_EXT_UNAVAILABLE;
+	*reg_val = scontext->ext_status[sext->ext_idx] ==
+				KVM_RISCV_SBI_EXT_AVAILABLE;
 
 	return 0;
 }

>  
>  	return 0;
> @@ -337,18 +331,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  			    scontext->ext_status[entry->ext_idx] ==
>  						KVM_RISCV_SBI_EXT_AVAILABLE)
>  				return ext;
> -			if (scontext->ext_status[entry->ext_idx] ==
> -						KVM_RISCV_SBI_EXT_UNAVAILABLE)
> -				return NULL;
> -			if (ext->probe && !ext->probe(vcpu)) {
> -				scontext->ext_status[entry->ext_idx] =
> -					KVM_RISCV_SBI_EXT_UNAVAILABLE;
> -				return NULL;
> -			}
>  
> -			scontext->ext_status[entry->ext_idx] =
> -				KVM_RISCV_SBI_EXT_AVAILABLE;
> -			return ext;
> +			return NULL;
>  		}
>  	}
>  
> @@ -419,3 +403,26 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  
>  	return ret;
>  }
> +
> +void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry = &sbi_ext[i];
> +		ext = entry->ext_ptr;
> +
> +		if (ext->probe && !ext->probe(vcpu)) {
> +			scontext->ext_status[entry->ext_idx] =
> +				KVM_RISCV_SBI_EXT_UNAVAILABLE;
> +			continue;
> +		}
> +
> +		scontext->ext_status[entry->ext_idx] = ext->default_unavail ?
> +					KVM_RISCV_SBI_EXT_UNAVAILABLE :
> +					KVM_RISCV_SBI_EXT_AVAILABLE;
> +	}
> +}
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
