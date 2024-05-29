Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB36AC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzuOrXBqr7qYMuYrb7Cwxl5MzL+C79e5nA42WqDuoDg=; b=Hu8YatbZrxbIVQ
	fjJOWOY7fZBRn2w7rvPxceYMFMxeLHwIeYS9MRuCKdVtm2PQkvabSfed6cSexOmOVbTyYIJULoQcy
	NvSScVhAPOg5vNTnd8xoOfJcRG1EBAN5dDTAjqDSiG5KJKtxQjmi9OTxK3Jx3MtlVHJvcu7CNjPiQ
	RW9G7yUb9PL99lE5MLO51965FbyX3X0vFsrPr0hfEercXq+JaTWJrUagmJfxAED6BQ/iqVILgywnW
	vzSq94+ariUvnbDxV+wnvn/3QJlDYTsZc9USpM8bPHikr84Xgj2o153IFiPlixth9fxl0OeE1g+kN
	vSZyZ1LcXC7xoFCt6i2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRbT-00000005haU-0gN5;
	Wed, 29 May 2024 22:17:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRbP-00000005hYZ-0iKC
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:17:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70109d34a16so246382b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717021017; x=1717625817; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80ksSo6mSUkyM2Bp/41caPk6UaONL0Ucenm+2d45iFE=;
        b=UgG2TFGfNPJOMv27ao6dsriskdXvG0ATspKZjmpdjqlvCVPzsqH9R6pNNRxQgcBorf
         uwz5QV33OyfPEQbEVnTnVyflSx3hTJnHYIzHjpZB+pOzIPEwVTJJx8h1dvw25leKLdUM
         C+GbPO5vFZOyepgQJdPWEfFo2Mpb4zfYedKHqoch7Zj+luyo71/PteSbC6mmcqLuCHcD
         xYPSGJVuDST1dTTAQxnMPQI1Tdr6gWPjxpY11epGyggh/OZhsFA/cJ8QMzHOvL1jHr/3
         vqkMtFOnfkPcW/UvPewaiWGBXM1L6eNNVyjyCM7X+/EQrdrLizEpAIKluVzzhD/8qmea
         Sc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021017; x=1717625817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=80ksSo6mSUkyM2Bp/41caPk6UaONL0Ucenm+2d45iFE=;
        b=FEue08bIN6hv6gtzBbhSOuch3a1JmYkowFBO9WXH/5pxe8YvQj3T0+peTbO8Wlztmi
         U5AD8MvTWXJwnejkqtziam8PSvWO/eNjhrl9ybj0JeINGA6r8dddVQiwqw39OiZgALnr
         3F3ixk3RfVO/PgbNz++Os/n9QzLbhxdqGy070o1sJz7iBGS//ekycUlZ4ry1RnFKGiKQ
         HhOlmUxwkDGt3p4ztTPsyDGwpLS+xKhnKyauqwdRde3s3NTPGDWWXTBXWUX49sgH8eFX
         i1n/KQZvq7dXAjyT25Pt9WlybRsbbqOXyFG0qxd4iB9lYcQr2WtSoWcOwwHpOArH3UTo
         chlw==
X-Forwarded-Encrypted: i=1; AJvYcCVVU9VLms+7aBvzGzXouPV1xitrnxt0BrKcQ19fGYuqoLlmIHI/C9OfDDZPOJLaSinA5TW91tj3Ed+bDtIlCDde1ZTAPX1J1P52yleTGOkr
X-Gm-Message-State: AOJu0YzlvfYerWs8lYzzFHLwAZZ2OhaT5hJqhFTWnvxW8l62bsUJgy8o
	+YqrwlScqLj0POUHvRDOzWCXPrj45TjQZ9uuSAYjskZ0uXK9BojPFon4jR885b4=
X-Google-Smtp-Source: AGHT+IE5XuXetrfb8TvXQ2JVC0+20NvyBoxanxPvqd5tz8uV2AkKu0FS4Ru4PJq/9qbYZb1FKJwuSg==
X-Received: by 2002:a05:6a00:410f:b0:6ea:d114:5ea1 with SMTP id d2e1a72fcca58-7023113ef39mr464430b3a.17.1717021016699;
        Wed, 29 May 2024 15:16:56 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4d4ebcsm8503826b3a.187.2024.05.29.15.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:16:56 -0700 (PDT)
Date: Wed, 29 May 2024 15:16:53 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
Message-ID: <ZlepVSNhhLzpM32y@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_151659_456731_5372D0F4 
X-CRM114-Status: GOOD (  16.45  )
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

On Fri, May 17, 2024 at 04:52:44PM +0200, Cl=E9ment L=E9ger wrote:
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zimop extension for Guest/VM.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> =

> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index b1c503c2959c..35a12aa1953e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZFA,
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,

KVM_RISCV_ISA_EXT_SSCOFPMF got added here in 6.10-rc1 so there is a
conflict now unfortunately. Easy to fix at least!

- Charlie

> +	KVM_RISCV_ISA_EXT_ZIMOP,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  =

> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f4a6124d25c9..c6ee763422f2 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -60,6 +60,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>  	KVM_ISA_EXT_ARR(ZIHINTNTL),
>  	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>  	KVM_ISA_EXT_ARR(ZIHPM),
> +	KVM_ISA_EXT_ARR(ZIMOP),
>  	KVM_ISA_EXT_ARR(ZKND),
>  	KVM_ISA_EXT_ARR(ZKNE),
>  	KVM_ISA_EXT_ARR(ZKNH),
> @@ -137,6 +138,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsign=
ed long ext)
>  	case KVM_RISCV_ISA_EXT_ZIHINTNTL:
>  	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>  	case KVM_RISCV_ISA_EXT_ZIHPM:
> +	case KVM_RISCV_ISA_EXT_ZIMOP:
>  	case KVM_RISCV_ISA_EXT_ZKND:
>  	case KVM_RISCV_ISA_EXT_ZKNE:
>  	case KVM_RISCV_ISA_EXT_ZKNH:
> -- =

> 2.43.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
