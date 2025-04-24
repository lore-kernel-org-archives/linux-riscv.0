Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EBFC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgx0X/gT1VUcHVlHNbLeQ8TmYHMWS9j4A4bzLqB84og=; b=DHLeQYSVozHlgq
	2n8baU/0XqRIzPEz3Y2sVKejuRNfcqcstgAR7DEmnItQXgrW2nFVHvvHom7pHeA8QKGsVgRouq5yj
	hMngWfEk9XCnnva06+uaih88w1G8Y5bSlQ3MSpqAa4CdRttnDNA/x3Ph4pazb6SOo1LGK/7+kx9i7
	uJ61QGi8j7kaYvrQV3me16PIwsTuBp4w9L6sQEKkWaAF0XOV/dfm4Rqf42aBODbv/UCGM0P0dCrtC
	dj4b4xqd1UEc5P8kLR36rK0GMXZc2pPC3smJLcmFuzhOW0bU/re+x+KRJDxMEubL3/Oxd1qYkXAMY
	1zXFSPKhkM0po2U3GH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w2S-0000000E5Wb-2nMS;
	Thu, 24 Apr 2025 12:50:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uK5-0000000DmU2-0NYS
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 11:00:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso7715165e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745492451; x=1746097251; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHHJnHHyOrnNtHHA6vr6DrZ0IO7tPD+NYSLx8YKZu70=;
        b=fL6XL0vAGf5X4OFVkduIAB9KWpRWYY66ViMO2tPjnghZH/bPGcJH/QDaGeoFV6dinz
         /HnOVxBUGmneao9oKNd+dmS0houYFX7mPGK1cb7VPNbDcxoM3ahpZspeBwrTyLX2qOa/
         050xAizPOl9I4o+KG+YsNEnOLxjxN1OuNdT/KzDpD8FIHPpXaOcE1lWZNxOwki8e+oQd
         Lw2gOtIKIwBd53T17tIvUF3/AVhHrs0tuXPIAwzoBVzHDgqb5suOKmpn9KfhWQxoU0iu
         7HKaGLQauiYlCaPWtM+NmnA1cthrmcrvpf8cVuf4qAfs+y0uJ3qVtTzqc9Lk1w0F+AsW
         kqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492451; x=1746097251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHHJnHHyOrnNtHHA6vr6DrZ0IO7tPD+NYSLx8YKZu70=;
        b=bDZK0KJNbBEC1CH5u7PbvoLs8HpbyLiub2kRyqpfGUhKzZrSNE6ViBSerqfpb0j9lb
         AEsLXB665a0xeAHUUmZUhyBpgv6tm27K7igKh4Z0y1SO+UDgBETDidWtjypsWKeX/TSj
         a5O93QBLf3kiH+VR+I32OF7nY7XfAcWGOQApsG8cx2RvxEHPvpaYPFvRrCCo3Tj2/Djn
         QKZwgv7zDtoCKc4RcJwVPnENfQZCTKDvmtY/k2mI5o6Qj//lx53cE8Qx2BDuM+p7mqO6
         t1QyJpSTMHVjuUok2L0NDXbCnIRZsdPqCk96ar3JJYxKAxPCkFp4z5yxvLx9PAX9P55A
         M8ow==
X-Forwarded-Encrypted: i=1; AJvYcCXUxo29gjX9Im2z2kFVsd57YB6muXqggQBihn2vQOmTatTPYDR9wXFDq0dPjfMhL4NWVVR5wJeReotwBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX6R6QYvMGMEA/K4X8AfsmsjJWXBAJHSLDPkkRn7dGxTHkoxhX
	Z+oZMwIAl6/1m/cWKjGVoomOc1SAC+ccCVjkheJMaf5n+bTtoATDGzjg+E6tzz4=
X-Gm-Gg: ASbGnctyZ2NmiaOq74IK5+UxZQB+pTzzIn5MGjyieTzmjTjlSUSVwYQv4VRyoyorjtv
	HzuUSnVCqLiZxYPVe5GL/khRisLkvzGNkbsBrEzef79AteyswNY9L2Ro+1X67j0KqWaOUgmwsmi
	DPC9XagEMHsLAtc7O80zRcDccvjHFmriKTWO+0Xegbaz569N1QEfD+96BzItJ1EzgIXjdIPDK2O
	mkO61B8uT0BS7o1SGdd6XB5oRFeVv8EW4jjZUJBu9aJnEnOrDIHnYwq1Dw17wcjtqKZhbo0G+nk
	R/dj383ETY64Lk+lKQ9dN0GLjtlXUK1C6J7oZuU=
X-Google-Smtp-Source: AGHT+IGP6Ut82q/OqGuYzCaYu8ri2NvYSY5EYxmJ9hg0Kbk3eysivoE/mXbwZrGhC5aaW7QaraDYhg==
X-Received: by 2002:a05:600c:3b9a:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-4409bd8a761mr17964535e9.30.1745492451468;
        Thu, 24 Apr 2025 04:00:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8479sm16884645e9.29.2025.04.24.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:00:51 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:00:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Message-ID: <20250424-c85c9d2f189fe4470038b519@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417122337.547969-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_040053_129596_F563EDE4 
X-CRM114-Status: GOOD (  15.52  )
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

On Thu, Apr 17, 2025 at 02:19:50PM +0200, Cl=E9ment L=E9ger wrote:
> This SBI extensions enables supervisor mode to control feature that are
> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> DTE, etc). Add an interface to set local features for a specific cpu
> mask as well as for the online cpu mask.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 7ec249fea880..c8eab315c80e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask=
 *cpu_mask,
>  				unsigned long asid);
>  long sbi_probe_extension(int ext);
>  =

> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> +			       unsigned long value, unsigned long flags);

I'm confused by the naming that includes 'local' and 'cpumask' together
and...

> +/**
> + * sbi_fwft_local_set() - Set a feature on all online cpus
> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> +				     unsigned long flags)
> +{
> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flag=
s);

...that something named with just 'local' is applied to all online cpus.
I've always considered 'local' functions to only affect the calling cpu.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
