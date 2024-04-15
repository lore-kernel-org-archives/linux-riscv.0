Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A19C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WcEWRzSOcfsRsoxBkBBNtpAGn4wvbQt6m9uBey7J6g=; b=EzmjlUbVJlNmYO
	vJliNjoTOn1x3651p0SysET6cWhKMStdhaaN/BRgtIRFWF8z1IDwfUU+oRb4oP44R4+7lL1Pmg4uP
	pWVVbPWLE1ARW8VFcK0jy+amnKhCohdxDPZJEv0SaoshfWOAxV58dgiIJFjHR9I1M2Swxu1fze0Uh
	z2AHWmGVi5P23Qi8F6Sse8TFx37dlcFOI7o0n2bdLKD5Kby1hD1nIYMNly8a9BcemfFTW2/c4iQYW
	mpJHJrX6rN6l5aAHBM6pKznup64W6W52+/vuLHiG9rWJycBKsTSZcGVczUiEwl1dbcE3JXdbR76/w
	H3uTxAHakp5WRQgOfAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLy7-00000008Lpm-1CnO;
	Mon, 15 Apr 2024 13:01:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLxy-00000008Lko-18p0
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:01:53 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-516f2e0edb7so3790677e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713186103; x=1713790903; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAzNe/Dr2zrsI9zQzFBtyYItApxCRsnWpljg+FQj6uo=;
        b=pnUdqvCICf2eAE0Eo1yH3LEos1O//nlo2y2xXhiSvdpjAWBuyk2Edkeq1X1q5WRJrG
         cNnXzBJocb75xx4m7pG00+QvZMLj3vfMszAaWCjLarmKLy/K/rZIlO2thvD1veWheD8y
         rKXnmw4oPuW3x+PeswrOcxLiWlcepnxtFKFXQkWxtRiuNfHp9lMc81TTy1bCmdj/d8dd
         hHqCUb7jWeYnKN/hl85LQlMtpfiPzv0sUSgGBrCctoKHAalJ0cFOdmR4tXISiBoABt7H
         XBvztmZYgUCNEuBnHDI+NqT+2wmulMN1df4Pdew51enh7GEV7hgXOub1kbBg85U56G0V
         YGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713186103; x=1713790903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAzNe/Dr2zrsI9zQzFBtyYItApxCRsnWpljg+FQj6uo=;
        b=hhMIYmTEXMEN2PFETXkWxAbfdleD48rl4ZsFGbpuDUEUbWHcntp1XGNYWw/AKmeqUo
         zkU5UoGQJrFtN5/JNNDzz8sMEIMyEztiCRQvo2x7a1Fy/wZ0N0XlOjcgM4U34iBTYTgm
         /Wr4WpxILV4rz4N3Qen7XYD0RLynv6HXU1yQzEYlv4bDnzgESxiORh5f5NC19FthfT2M
         8iIo6bmvTSSNvwyfmWXfxv8ytvFrsJa81KFuXb1yJse0xaLo73tfmEj02auAWQzXi2Lf
         YtdwL16NEE14T4O1KaIJtXAsaf3Z4eVl5IxIdd7Zw0uOsove7Z3XIXzOVOWF1yackuQ5
         7QFA==
X-Forwarded-Encrypted: i=1; AJvYcCUTAhiRby7hiqNBKWE/kx5JNCmXcVhxtbU9Ia0S3h4PSX300wBX0MzgH3XrjnZdf+FoeyLgcKntheJkEFRa/HlkWpQbirpKIDS9tf4A7reu
X-Gm-Message-State: AOJu0Ywu39h2mkpYPKW3lwYwPGNJSNXXqYV3yqaiQ7d9rIO9ETfQfWAC
	DuSJcCyEcbuxIsw+J2btRbhFNPVExMD2dixB9Vfgu04R7Hk+M2g7lKExyKR2v/g=
X-Google-Smtp-Source: AGHT+IF1FG1SINFeCjGlp0eZOZIZwVeoNZP8XYe8YPY4t8v9NbI69LFZuWlNvlzfivwxMIckGeJs1Q==
X-Received: by 2002:a2e:b4a8:0:b0:2d8:6b0c:d91c with SMTP id q8-20020a2eb4a8000000b002d86b0cd91cmr5501216ljm.47.1713186103351;
        Mon, 15 Apr 2024 06:01:43 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r9-20020adff109000000b00341de3abb0esm11994830wro.20.2024.04.15.06.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:01:42 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:01:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 01/24] RISC-V: Fix the typo in Scountovf CSR name
Message-ID: <20240415-b899e62329c901f59db9f146@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_060146_376654_52357739 
X-CRM114-Status: GOOD (  15.08  )
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

On Wed, Apr 10, 2024 at 05:07:29PM -0700, Atish Patra wrote:
> The counter overflow CSR name is "scountovf" not "sscountovf".
> =

> Fix the csr name.
> =

> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 2 +-
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 2468c55933cd..9d1b07932794 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -281,7 +281,7 @@
>  #define CSR_HPMCOUNTER30H	0xc9e
>  #define CSR_HPMCOUNTER31H	0xc9f
>  =

> -#define CSR_SSCOUNTOVF		0xda0
> +#define CSR_SCOUNTOVF		0xda0
>  =

>  #define CSR_SSTATUS		0x100
>  #define CSR_SIE			0x104
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 8cbe6e5f9c39..3e44d2fb8bf8 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -27,7 +27,7 @@
>  =

>  #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
>  asm volatile(ALTERNATIVE_2(						\
> -	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
> +	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
>  	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
>  		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
>  		CONFIG_ERRATA_THEAD_PMU,				\
> -- =

> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
