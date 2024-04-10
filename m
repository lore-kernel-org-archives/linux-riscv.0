Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D3CD1284
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y4dzZHDBUodUaBybNmj3j9dB8JQqEXLVUGe5duIPec=; b=g5+L5wfL1KWtjWGlUB58PA+r7C
	zxN2YsXIkNT4MZBbB31CwGMsqzJITfJJTtqfmH5reoC+kIwrZObQqZmZdPVQN9CwUeUgG/nqh86tI
	S0TRRbRLcnScsY0vkJUmAGF/OZh4ZgJR5+KqgVCV+mffAvIfh8Yc3Frd/Yrb+wfmaygfR7NzRi0i7
	uq4nkERT0iwdLpWlCY1gamkRMpSS2Sy1xCeQuSWBNawO5eCKsqkxKDZbEQRSBIQjiVSrGAcGNz0Iq
	k8N/EFA7x+QeZz7VphrxQ1DLuGrtl+GCrRt6RPy+W4MICdLMzVwVooLMDajLKEFLVpm9NlFgtfccl
	Wc8Xh2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufYn-000000091y1-1RDY;
	Wed, 10 Apr 2024 21:32:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufYj-000000091xC-3HXV
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 21:32:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so5224284b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 14:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712784763; x=1713389563; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/gmMU/A0Yd0PYrsEGoyRAws1U1MCAqzm8TivoV2wjk=;
        b=dRkdtMjmU5rWmgRdcRh4XwuU9UvgSAYOOqQEtpNV/TAQflsUnMCphYOw3IAZg82r/Q
         sjPb5kJEQnU+UmVxXuS+KmZmT/zgO7z/4m3BP7nnehbgsJKb+PtXIcSJyCOHYSXtlUAy
         l8znyue8UCN9Ce0PDwS1pULjIfBTAodTO3p5B911lsHPeg0DQ/wd0v60VUcz2weqa/1W
         xSlnr2ARRoyJ+Ze/9IrjLz/BrBkfH+TdobWS6PBHaccVcQ5C3HCu2g9jUTrcxFe6IOjn
         ttKbS5Wu3NrDrfmhWaPSEHFCKSDx2BENXQ1xA6hBmKB1BRniZUujEQxRxfYycWjomutU
         90lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712784763; x=1713389563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/gmMU/A0Yd0PYrsEGoyRAws1U1MCAqzm8TivoV2wjk=;
        b=ouUxFV98a5Pjs6Z92azZGy18ql5KSIZwf4ixLPu+Vv5kYD3Y72z1R4A95991DWza1w
         jrv9HhGI3vGXkwaofTbKuwd55FBv7MyaKiw7gyzF3Gvo9Jyvz0FlgPuvK1g373Bz/bcO
         eyA81jzRDD17aDDTVXT2stq/VHatfqSEY+oXGeuH+ZT7uOsU3Kz3p06OtmeFHEI5fFDd
         EwlHlAkduwUfmVZxTEQlWl1yhaVRHlKSRgJXP7qwRSYBtJoawget1XeDYR7d9NcUofvu
         vQ7+D9v2mcNnX6XGLJJwFn+g0T7pMPPJ+/ANuke2+8APMPnw3U6/hJ0L8ZSfpiX/toBo
         nNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJIDFalFVXrEaGwb2I+zovsjyyvBEv4iYG73ELqX5LjIE+1GeNyp+8EXONhzhxtoSECCtGLARTG/3IIXMtf/B2y0gAgpEhr77wBZyzZOpB
X-Gm-Message-State: AOJu0YzVyL1k4kgSc5Ly0YZe0fD03Ky7P2nKx0qLkaCTV65sJQKSmgEb
	Bo1fMu14YSPgxlIN5ffUt5KbfZ3uGHZKpRHe5WB3tpQc9Nil0H1/8NdOhdaM8iU=
X-Google-Smtp-Source: AGHT+IFZBbWkrMsFlNLP4i0ZlHtJh5hiqPGMGHChZ4tL7JbCR2OzFzA8h4o1YnA4MyIHgbnWJTDA5A==
X-Received: by 2002:a05:6a00:2355:b0:6e7:8322:ff8e with SMTP id j21-20020a056a00235500b006e78322ff8emr4200583pfj.30.1712784763268;
        Wed, 10 Apr 2024 14:32:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id gx21-20020a056a001e1500b006e72c8ece23sm99920pfb.191.2024.04.10.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:32:42 -0700 (PDT)
Date: Wed, 10 Apr 2024 14:32:41 -0700
From: Deepak Gupta <debug@rivosinc.com>
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
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410091106.749233-8-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_143245_830908_9039CB4D 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2024 at 11:11:00AM +0200, Cl=E9ment L=E9ger wrote:
>Add parsing for Zcmop ISA extension which was ratified in commit
>b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>---
> arch/riscv/include/asm/hwcap.h | 1 +
> arch/riscv/kernel/cpufeature.c | 1 +
> 2 files changed, 2 insertions(+)
>
>diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap=
.h
>index b7551bad341b..cff7660de268 100644
>--- a/arch/riscv/include/asm/hwcap.h
>+++ b/arch/riscv/include/asm/hwcap.h
>@@ -86,6 +86,7 @@
> #define RISCV_ISA_EXT_ZCB		77
> #define RISCV_ISA_EXT_ZCD		78
> #define RISCV_ISA_EXT_ZCF		79
>+#define RISCV_ISA_EXT_ZCMOP		80
>
> #define RISCV_ISA_EXT_XLINUXENVCFG	127
>
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature=
.c
>index 09dee071274d..f1450cd7231e 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -265,6 +265,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
> 	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> 	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> 	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>+	__RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),

As per spec zcmop is dependent on zca. So perhaps below ?

__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP, RISCV_ISA_EXT_ZCA)


> 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
>-- =

>2.43.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
