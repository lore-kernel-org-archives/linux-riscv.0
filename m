Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A72C36005
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PX8VmjjiMtEIs3tKUSzyZGpaO7OLoQQpJIOCusqQ9Y=; b=sxdpI7yYViuxjD
	cQSJ/vArhrA1z3TPZ8HpeUT/jMNE0eZFvOZ3Ag3b5AnUEJapQ9LKrmxD4SP40cU9M3MZSC/jsSChI
	cwwmzV4/Sp42ZMqTxl2H0ADExRzv4Yyoc91TEIcrf121RdqnrC2kNsUa2Fo9QepZUQQRID2hj4XpR
	DMbO8K7o0BF6xQMbb6w8RztP1A98DZwLTHkJ2IwcLW0cWihL0dlLJK/1Qjqk8MOvSi/qna5E9O++p
	TxIphnjRusdf6phnIIacZtVj7ZxNPPwsBN3CYiu4QdRL93ZedJ2STT21pLeHQFUh6Dw76WahwCs1b
	VyfXNWq5MbOANg6WqV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxzS-0000000HOlF-48PN;
	Sat, 22 Mar 2025 12:30:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxzR-0000000HOkX-1H0U
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 12:30:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso20173615e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Mar 2025 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742646612; x=1743251412; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XK2TAqZG341EzHEinXnSfJT8xoYCNibzBDqkY726Y1s=;
        b=HD/ba6OrPn9s8G1xTMZJOcl3CKHVjZExJipmBNIfPgFDE3Dlv10MLRQkTN11fX2um+
         HL5JE9VZcdBRYLypmC2xIa24hW2CV93zjdxmPKI6Z6U3owQnItYSn8rwU5BgLU50U1Fc
         dxyywRCuV8W09YFYDGXZgvPgBVbbq0/WK2DYfyaIgEY+3/okmA7ETQtaoLFsFrvNeN2J
         uvufnT4QQ5v6tObTnyUSHFdVefNb/R8p4mztkt+XVlTuNyacyiLjsKBwZC/+QEYlVPf3
         wEeB9LkqyWUjr07tQcgHmekgv7Qjkp8yKwA+i0A0FsaHqj+//I5NskdXNuURoaTN9TsE
         LnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742646612; x=1743251412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XK2TAqZG341EzHEinXnSfJT8xoYCNibzBDqkY726Y1s=;
        b=lQW+L11eUilI8YTeJRS5WY6K8oi1IBoZ0vlIcrRyR3F5p7IOUzSpROpWpKdBQmY212
         /cLa0JA0o8pRDNxUxFtyqZLRT3jNbZCQp49vgRXgSgZbTmdtzqw6+Al6CZkfhidZO08L
         UHIKJqZgDGj2eHRkQbF92A+0ayvDhF0ZVABarJJb3CsPaUazxZTVtR4INhC+0bB1Yo3x
         6lN7aLmXl3j+R0JVFUfLuxQbLBTYjSWb/m0YlTDeoak0SA2dWgq8072lCehALwXyI5Rh
         jGPTxeY9ajeNI4q4hanDw3JZ49tuUrSvXXdbb1GE9HYB//wzja0Qysz5CjxbmZwNUeu/
         AenQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZEtbfF3eAyTuApoNJhlyD3qL2OVEIMOD7ak/fXRBvBnan5UxjDr0YPgF/IBuAlDGrSFb5YV3vMYtC2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb9ts5Wx5dou0htsyt/KwpzgxcpGgGpj9Ch87wSx1dWxFVqwmO
	epAmvMfeDFD43shBIctYjHI8psyDC6cikIJield5bqE4VSJJw1kQxpE7Umy2OCA=
X-Gm-Gg: ASbGnctOANnDzylYm6HiAUFbV1nHntpnjK7T/uQb+cqFEZ58RwJAs9TBdaSBuE5gN/p
	nB+XVt/4hkUj20VJncS+okZCSbe2rnR2v6mhYlcg6skckdzzfBg8lYTgaZzrktfodJQ9PGan0ec
	zQHvy6isaFqzKsbEqMxqU8/AOHJaYW/1PkPyGfkeK7C0LbxijbD1+GYHMTTw2Vz1TBUmJrP7zUK
	cSUV/ePyWzqZ65rIAKCcLiBREs+FX2QV6Ft77814WMI5tpwvOqcLzxJ9sRh4V2bPdj6k0WiDiQ5
	IRJ5mIdxrrBXh6BYkgQfTGZ8K0Y5wMUzteRtV+4eLYNQbXXyjSj/kkGjvZnM4pE+gkybp0jqNw=
	=
X-Google-Smtp-Source: AGHT+IG8oeOIoiATGf2n/eErF/v1UJz5jBt3u89DGuQOGIaGoIkUZOrdT8f7P/SGIIjTK+RAQA8QjA==
X-Received: by 2002:a05:600c:83c4:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43d509ec52fmr59753085e9.8.1742646611632;
        Sat, 22 Mar 2025 05:30:11 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440eda26sm106789645e9.36.2025.03.22.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:30:11 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:30:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 17/18] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <20250322-c4eaee71aa9c1f0b13ca8fef@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-18-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317170625.1142870-18-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_053013_346022_CFEA85EC 
X-CRM114-Status: GOOD (  22.71  )
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

On Mon, Mar 17, 2025 at 06:06:23PM +0100, Cl=E9ment L=E9ger wrote:
> Add basic infrastructure to support the FWFT extension in KVM.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h          |   4 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  29 +++
>  arch/riscv/include/uapi/asm/kvm.h          |   1 +
>  arch/riscv/kvm/Makefile                    |   1 +
>  arch/riscv/kvm/vcpu_sbi.c                  |   4 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 216 +++++++++++++++++++++
>  7 files changed, 256 insertions(+)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
> =

> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> index bb93d2995ea2..c0db61ba691a 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -19,6 +19,7 @@
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
>  #include <asm/kvm_vcpu_sbi.h>
> +#include <asm/kvm_vcpu_sbi_fwft.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_pmu.h>
>  =

> @@ -281,6 +282,9 @@ struct kvm_vcpu_arch {
>  	/* Performance monitoring context */
>  	struct kvm_pmu pmu_context;
>  =

> +	/* Firmware feature SBI extension context */
> +	struct kvm_sbi_fwft fwft_context;
> +
>  	/* 'static' configurations which are set only once */
>  	struct kvm_vcpu_config cfg;
>  =

> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index cb68b3a57c8f..ffd03fed0c06 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -98,6 +98,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext=
_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>  =

> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/incl=
ude/asm/kvm_vcpu_sbi_fwft.h
> new file mode 100644
> index 000000000000..9ba841355758
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *     Cl=E9ment L=E9ger <cleger@rivosinc.com>
> + */
> +
> +#ifndef __KVM_VCPU_RISCV_FWFT_H
> +#define __KVM_VCPU_RISCV_FWFT_H
> +
> +#include <asm/sbi.h>
> +
> +struct kvm_sbi_fwft_feature;
> +
> +struct kvm_sbi_fwft_config {
> +	const struct kvm_sbi_fwft_feature *feature;
> +	bool supported;
> +	unsigned long flags;
> +};
> +
> +/* FWFT data structure per vcpu */
> +struct kvm_sbi_fwft {
> +	struct kvm_sbi_fwft_config *configs;
> +};
> +
> +#define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
> +
> +#endif /* !__KVM_VCPU_RISCV_FWFT_H */
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index f06bc5efcd79..fa6eee1caf41 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -202,6 +202,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>  	KVM_RISCV_SBI_EXT_DBCN,
>  	KVM_RISCV_SBI_EXT_STA,
>  	KVM_RISCV_SBI_EXT_SUSP,
> +	KVM_RISCV_SBI_EXT_FWFT,
>  	KVM_RISCV_SBI_EXT_MAX,
>  };
>  =

> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 4e0bba91d284..06e2d52a9b88 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -26,6 +26,7 @@ kvm-y +=3D vcpu_onereg.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_pmu.o
>  kvm-y +=3D vcpu_sbi.o
>  kvm-y +=3D vcpu_sbi_base.o
> +kvm-y +=3D vcpu_sbi_fwft.o
>  kvm-y +=3D vcpu_sbi_hsm.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_sbi_pmu.o
>  kvm-y +=3D vcpu_sbi_replace.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 50be079b5528..0748810c0252 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -78,6 +78,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_=
ext[] =3D {
>  		.ext_idx =3D KVM_RISCV_SBI_EXT_STA,
>  		.ext_ptr =3D &vcpu_sbi_ext_sta,
>  	},
> +	{
> +		.ext_idx =3D KVM_RISCV_SBI_EXT_FWFT,
> +		.ext_ptr =3D &vcpu_sbi_ext_fwft,
> +	},
>  	{
>  		.ext_idx =3D KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  		.ext_ptr =3D &vcpu_sbi_ext_experimental,
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> new file mode 100644
> index 000000000000..8a7cfe1fe7a7
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *     Cl=E9ment L=E9ger <cleger@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/cpufeature.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +#include <asm/kvm_vcpu_sbi_fwft.h>
> +
> +struct kvm_sbi_fwft_feature {
> +	/**
> +	 * @id: Feature ID
> +	 */
> +	enum sbi_fwft_feature_t id;
> +
> +	/**
> +	 * @supported: Check if the feature is supported on the vcpu
> +	 *
> +	 * This callback is optional, if not provided the feature is assumed to
> +	 * be supported
> +	 */
> +	bool (*supported)(struct kvm_vcpu *vcpu);
> +
> +	/**
> +	 * @set: Set the feature value
> +	 *
> +	 * Return SBI_SUCCESS on success or an SBI error (SBI_ERR_*)
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	long (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, un=
signed long value);
> +
> +	/**
> +	 * @get: Get the feature current value
> +	 *
> +	 * Return SBI_SUCCESS on success or an SBI error (SBI_ERR_*)
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	 long (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, u=
nsigned long *value);
        ^ =

	extra space here


Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
