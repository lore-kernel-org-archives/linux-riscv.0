Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8AEC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4fri35LYiCDSyADPdRL3T+EmWEjEcw6Uc9Id3X5hD8=; b=hXx0ju8bmt2qhC
	2WyXrVgWcC6SC2TtObY7nCBueJm1nslfS5UwbUwJkyI7mm2x7VC2K5T+GlI0EqQ8z6plNcCMqmwpS
	/26EcrQaAdv9LZTi50vjTSsmf+WPrQWfPd2FXTrR/YkPbO/pww8nIyTn+QPHIRWR2jJvbVDroBZpY
	XEqzx0UFZ7ZUZEWcKGnQHJ2u1qWwFpKeGr+7Qpaho3JFOO5VYBzeF9M0xOFxIebkyFN+fx3rWj+K4
	RmEui0yFFG4gOA5m/Mm2o8G5tzDRS0g4phLp6zsyV4NG3La+6iznadUnekS4WU854V8O5N/BJ3gBq
	lx1MZwl7sYMbRHkdCFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskbG-0000000Bfoz-3ZV8;
	Thu, 13 Mar 2025 15:35:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjYa-0000000BXCI-4B9P
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Mar 2025 14:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2dChJFwxiHoEAavEY7H+gGYQh3r5PftDd7S++Ebsfx4=; b=dWFO0iCWaV9m1uxZzXVgKQl0i9
	5DLjrK7G+L9xpdnWQOniWGOGd00wl0HwyYqJYcc3wglgZG0c3GubPaYQkgiYiHkGYkchrB+Qwx57u
	WdBNaGarBdP2LqiFjSRCBC+iJnkxxcPkyRV+JegLtyV5c4BSwCM94q+ccMOySqiQo5VTtVDscRmGw
	q6r+/ZiQNj2eIK4XYLnQEID9kof06umfumYEOD0Z6gxxZAN68cfBDo75B9mguHX2znvqZgrTzpTWC
	DFNCvV0Mv7EIxTH0Ulg8gFXx5qCQrh4uqYOR7bNkuzZJnKonAMk78uSJm6+ljl+wRv3fJKFZHQz6e
	Jpnu2/+A==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjYY-00000002gWb-0P18
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 14:29:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-390effd3e85so899293f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 07:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741876143; x=1742480943; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2dChJFwxiHoEAavEY7H+gGYQh3r5PftDd7S++Ebsfx4=;
        b=gCosiazxJmKsbDxJI9q6Y7Ctn6c+ZYZ4mjrxH5Noj2wOoNLkZaKl1O9gylQ75BzjsY
         /9+YTzWGf2I4TyoA3UE3v8HiW2tQSn1Qgu1WnW2C0gU9OqGFy+NIWPJmpC6LXqhohwVA
         td4WoRFG8VEvbrYuhLtjc8S0w1Ht2Dn+onIu1SlSTmsujcJ2aQOjA6Pzg/jHQzB2e3b5
         sXUfdArBjwBTvA5YI7udnjRkcBnQNG9Ywr/kVI37pfBLLUGZl9XAeL4EZIopB2IEPJHq
         a/7xHRGyd9HD6PGlu95C9P+/mEf2H82vRwq5EfoNcsdduTjIJv3/PKkfl5VQ7CM1o2wu
         ppZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876143; x=1742480943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dChJFwxiHoEAavEY7H+gGYQh3r5PftDd7S++Ebsfx4=;
        b=tBg0Zmf3ibcYwhMoW+Wal1qSWfYQobdoLLz3J8/oKdFVzvjxvXp5vJf78u888WaDal
         XB2Gmpo2hvk7sZ7+84aqydzl6Y7hl+ZP8eF1hBNVopElkosuVGb3BsPHjAGe8lmnQx3E
         wK6dEmddg4X/KZKMo9GY3z7xhbtuzm+9SY+eDu4mq7kSzLpOrpxdhAlLKZ9zRnD/OIX1
         N2SWdKGDhbQpbmqVZdMdFd2FqLELvVfMovVo6pp8afeMrFF8tqhGAxDBPv7ApTDPc7Yp
         lyQaf1TY89fm1VuD+CXYc16e6g12TY++qM9q0S73n6YkMdodVJnWT4xII934JkeB4Lr3
         I0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ahcwLQk3bPntHsRVcWm6K1d2iH6ZvX8+eKdW8D75sJvLVDdKCdcYHQv37XfRSWASkoPc4+FFM76o/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9tmdXCqiAdQPC9KpQTNz/ZVoUFidCZfAOM6Ux6f3IQkv5uHL4
	Fb/bFMEwF4zdH30HGqWRNCHW105PMI+F+xTZvQ9HfZ1ym8Ao43nsQqv3RLYGooY=
X-Gm-Gg: ASbGnctuCSR5C0azk0rF8ZuAk+q805CfRv65Ryq0MfX6MViSyH0Ov5PoyzAdQbeosUV
	Tzd4giuf1XwYwpJwJuIUtg9AQx/RSdEtI7AW892eI4ynsp9XOnfmB5u9k2PiJRj91av8b2SECfZ
	ZSMC+HubSeJQ6m1NFFkrgvuyW6kQuiL6B/LfD3pgT9sxg5/bFi/2FPmtujoyIc7QXJRXgxnJOpI
	I+Y8SBGWdKtAn/k0W2g+bUnKs9upWpxxF7IQzC9EQurX9msQQ/3FzX/LlaZs91xGI3x7MXcctr9
	TN9cXM/1cYOOZ2ppJBxaSQbrpT/sl9qo
X-Google-Smtp-Source: AGHT+IFGRk0+85vMf2nznPTCngJQKmrnEFB+xnqtB5azAsXm2lVcoxNZzqC/c+NjJqT/RrDSQQ2lQA==
X-Received: by 2002:a5d:5f4e:0:b0:391:fcc:9ee8 with SMTP id ffacd0b85a97d-39132d6bc06mr19775572f8f.23.1741876143518;
        Thu, 13 Mar 2025 07:29:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74d339sm54808835e9.14.2025.03.13.07.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:29:03 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:29:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 15/17] RISC-V: KVM: add SBI extension reset callback
Message-ID: <20250313-d269cf1812f8d080947fd64d@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-16-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-16-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_142906_236247_EA49B576 
X-CRM114-Status: GOOD (  22.25  )
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

On Mon, Mar 10, 2025 at 04:12:22PM +0100, Cl=E9ment L=E9ger wrote:
> Currently, oonly the STA extension needed a reset function but that's

only

> going to be the case for FWFT as well. Add a reset callback that can be
> implemented by SBI extensions.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     |  1 -
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 ++
>  arch/riscv/kvm/vcpu.c                 |  2 +-
>  arch/riscv/kvm/vcpu_sbi.c             | 24 ++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_sta.c         |  3 ++-
>  5 files changed, 29 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> index cc33e35cd628..bb93d2995ea2 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -409,7 +409,6 @@ void __kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
>  bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
>  =

> -void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
>  =

>  #endif /* __RISCV_KVM_HOST_H__ */
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index bcb90757b149..cb68b3a57c8f 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -57,6 +57,7 @@ struct kvm_vcpu_sbi_extension {
>  	 */
>  	int (*init)(struct kvm_vcpu *vcpu);
>  	void (*deinit)(struct kvm_vcpu *vcpu);
> +	void (*reset)(struct kvm_vcpu *vcpu);
>  };
>  =

>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *r=
un);
> @@ -78,6 +79,7 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu,=
 int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
>  =

>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long =
reg_num,
>  				   unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 877bcc85c067..542747e2c7f5 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -94,7 +94,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  	vcpu->arch.hfence_tail =3D 0;
>  	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
>  =

> -	kvm_riscv_vcpu_sbi_sta_reset(vcpu);
> +	kvm_riscv_vcpu_sbi_reset(vcpu);
>  =

>  	/* Reset the guest CSRs for hotplug usecase */
>  	if (loaded)
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 858ddefd7e7f..18726096ef44 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -539,3 +539,27 @@ void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
>  		ext->deinit(vcpu);
>  	}
>  }
> +
> +void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
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
> +		if (scontext->ext_status[idx] !=3D KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
> +		    !ext->reset)
> +			continue;
> +
> +		ext->reset(vcpu);
> +	}
> +}
> +
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index 5f35427114c1..cc6cb7c8f0e4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -16,7 +16,7 @@
>  #include <asm/sbi.h>
>  #include <asm/uaccess.h>
>  =

> -void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
> +static void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.sta.shmem =3D INVALID_GPA;
>  	vcpu->arch.sta.last_steal =3D 0;
> @@ -156,6 +156,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta =
=3D {
>  	.extid_end =3D SBI_EXT_STA,
>  	.handler =3D kvm_sbi_ext_sta_handler,
>  	.probe =3D kvm_sbi_ext_sta_probe,
> +	.reset =3D kvm_riscv_vcpu_sbi_sta_reset,
>  };
>  =

>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
> -- =

> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
