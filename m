Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BF9CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOQi+CqaX/GZMFMfC1tS6fi30kgBhD5509IsgGGKTQM=; b=iBcseTwT7liGmK
	KgIHCKHp8gQjO3Ectx8iBxdBzpuAASslO8h9SJtd2hx6GEWUQ+M+XuOmAeaSxU0BYKh3EjtUBRHGV
	kCJ++SuQ+G1p6OZac7Rs7oZgANocRfCaSXhKY30/etTQLIRCzUKJIqjA319ov1EYU3u4p1ygwbcLu
	+MBA2DKyJgWU2CPRxCVsQC1WNeTGDOr/R6wcRUDP9FV4E+sFSyYwm4Is4c+JUlP9l4Ibw+60ht/8r
	T4OmQyc+Eg3VkPk8PUNMxDFxvQftmjS5DolYHzQozgYyKzzpmvre+is4xu5+EtC3lDZ8Il4usEsyx
	t6g4b4GU3Bj1IXcuTnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKlx-00000002H0P-1fFi;
	Thu, 04 Apr 2024 10:56:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKlt-00000002Gxj-2BfQ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:56:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3416df43cabso560468f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712228198; x=1712832998; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EFHFiM3SNW59iwbZR58YbB15YVKnaSxrhFOdislttik=;
        b=PrwJQDJreOYHwpzISS9w3/+NRTAml1DJuW8xLDoizLj00dxAYFdOKHPFxKwVMJFsSK
         Jsh8N+5BznlCNzfTpc9Qd7UQiAVDi7A8s80NwIxgCT3UCh/+qo48JmaLMK3D2AlUt22S
         UKgdAMNt3pKqe/tyVcQWqCUMHGCVRArPyVTDa0ykJgT50k6V0NRoyRbmxyxQeMTIHmWt
         Phm/fSBJXcwu622C1FNLf9A+GiKY/1J3JEfEx8Yjf96RUilQW/nOmOniQb7Q+Y+RqUuw
         qWA9reGOax+sPMEtgztqiGPDwCYYo9tHxsfc5cE3LVgFtCzf4z3bm3WotweQ+MgggO1U
         3Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712228198; x=1712832998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFHFiM3SNW59iwbZR58YbB15YVKnaSxrhFOdislttik=;
        b=Nv3kyQWx5EKIjfCLmLCJJM4Nch0Jb5bUXDcg64n6ADKRqLs7aqxibYVcYHE5iSKCLt
         RX541BCkTzDQpCVsLAIutMdN56NEvSBR+UGS9iyYz7WYTwBI3k7KnEB6V7vnezn3FV3g
         EIH22RZy7zAF45PZYoo5MoYFUsNNY4CyHRbF/XugyZrNbHeu42SkJSa+MuWOpxnTjwMp
         zI9qFsy7JE+qASw5Thyo5JnZGTdAut+EM9gexmGs0sI20cL/ZPuC0EEGhqZdwi7DnewC
         tsyjXVliEJYAsobE5mSPfagdduB7BpeAfJkst90mLk/09mt6az76mjT89cIC93UAOcf7
         PaBA==
X-Forwarded-Encrypted: i=1; AJvYcCV518BFh7nmofpOjijQpAQcvxNZVfKhjGfNjr3jCpEw9WMYzbpo37TWHnZ2J2tkwMRVGTa9ihLmgkhUA/n0ai8rCKyRpA5N7atUpV5kC6Er
X-Gm-Message-State: AOJu0YwEyAc9kdyHQrFrNvWUDZE11ucWJSFymwhPkFnGE/oxXnfLwfFW
	0ITFZ7ogt5OiqRxLzjuPbEmR70+xHq4p2p7xi1NU5iKcnzbBtUKHKUdX6Bs08S0=
X-Google-Smtp-Source: AGHT+IENSyz17ALt9X+5ZUYzaEpWJFzo0+v4zqkPSZygVwnsdSsHijcp2D+46t60iJ6/39PaQMtB1w==
X-Received: by 2002:a05:6000:1805:b0:343:7158:aace with SMTP id m5-20020a056000180500b003437158aacemr1379890wrh.17.1712228198219;
        Thu, 04 Apr 2024 03:56:38 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f10-20020a0560001b0a00b00341dbb4a3a7sm19705617wrz.86.2024.04.04.03.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:56:37 -0700 (PDT)
Date: Thu, 4 Apr 2024 12:56:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 01/22] RISC-V: Fix the typo in Scountovf CSR name
Message-ID: <20240404-9c750d13d89168feb5ff34de@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_035641_589660_04A2F792 
X-CRM114-Status: GOOD (  14.61  )
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

On Wed, Apr 03, 2024 at 01:04:30AM -0700, Atish Patra wrote:
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
