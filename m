Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596A0CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9r3WW0xohxqYPaxkA/7PXu3lD4O0a+sKLPGJik/fu8=; b=hypOXgTkRQ+XqD
	+XiE4hee0R20Bmlx2081z1XYhADaotwDJmP17eKEGe6a+3hr/tajQ3ptW1fiVOZw2w2Q6FNcXtXlU
	zK0EXNiku41O3tUQQWNvr1suPxA1enMBBM/v8aXoLvzqThe5/2UNV6iRbyB9wbXV1asyNLLaMgww9
	1SDSTHtlTnmG326OfxlhU9ZrGJKl1JbedJEsibl1l7n7ev11Z8oVW+6trS9xEitsXqJA3NiBVbPVy
	RlyYexd4dJYq6UJVsUcqBBgmRzPOF4fbIzeE22cVB5ZsQsqgIJS9Cx8Rw8ZnFNc1FFCoY8MUX2utk
	GJOTN6lr1z4XNgdIFKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsL3j-00000002LA6-12eN;
	Thu, 04 Apr 2024 11:15:07 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsL3g-00000002L8h-063K
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:15:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so852438a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712229301; x=1712834101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25ODCdRY+Jn4wzM+mEjHDke5+vqaysXX4gL6DfhOAvg=;
        b=KBCZ6abBjUgrOq+98lBcw7lQ2wrFqZ78cThJSQc7Wsh6Nl0inPAVqbk0BYp+mejZVn
         9UWQByvOWOQXC5u/3xFeVTgiTOws1bm8/Be9XOsbWiyfiS9x20h9ON+GsfySjAxoNniT
         bi68zbgtDnVk28l7qTQUYUaXEgw89uSGvjK8lHU9ArGjwZKrpRx8/T0H3vZntQ364XB8
         MxEM7lQE1ebFL2PzEbWtQOwpBhZo9ZAXxD0SoxaWMj/HXoNrvrAe/EI2gJGJl1IAPPUk
         MjjXVuNLku2jyCVqS9wb4L+RZ83HgKG/qAdWtnsd7tCqhGdNpqL7MrsiHhiSkJovfMb/
         djPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712229301; x=1712834101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25ODCdRY+Jn4wzM+mEjHDke5+vqaysXX4gL6DfhOAvg=;
        b=JWUaNM5s7RN8iHdtOAblFJsp8rYR7q/qJx2rnt5VeO76CkMqgYqiHxO3TjTy0vCn/I
         t3m5/qNjimTMoKTufBgdggGCLz1rWdW7NrWmy7xOCUcP65+j99xy473s4xMOyr908lOA
         OY3HvVe3/6Pqi60xtWcFnm64Pko4DPGc71KBwPmRrXfV75SLHBliXVvtmPqKFShQPIKh
         IsTgEQf9HGUqVLQvQi3Do9P2WTJeQOcxZ87meZDf1Fx0pRuPEtvu1KW7SHv4rmJdO/RJ
         gas+nUHj59zdk20auqmMP28HFazz71p4VkL/Gm/RT+XfNlqjgeYXIdwbBsmPT2OlZLO8
         hl/A==
X-Forwarded-Encrypted: i=1; AJvYcCWX24LwB2zxSTqX7gwqG2dVuAWkGM26bps1lp6AjcYvm3Qwlzt2i+WIwfZX9wtXLfCQp+v98lPX97pZF+aEbeBsmjG/AK5SDmUPtRzAmd9F
X-Gm-Message-State: AOJu0YxfEsbsg1u7GUGD3H4XdMsVrSab4kKgmC213qsrZDzl30WY0gPJ
	1stmfUVSyq9rjWLANgvLg0IgwqURCAcPKgrv4ywoOGlWGowTUz8tt+LeS99wTqM=
X-Google-Smtp-Source: AGHT+IHVQCEpGYXXQyLBKL2NnoOYXTEECAPh40NJ3Rd5iw4YTlh7y+zWHd66X26Mz6VjXnim0PWvpg==
X-Received: by 2002:a50:8e4f:0:b0:567:824:e36c with SMTP id 15-20020a508e4f000000b005670824e36cmr1856431edx.14.1712229301530;
        Thu, 04 Apr 2024 04:15:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id fj22-20020a0564022b9600b0056a2cc5c868sm9061098edb.72.2024.04.04.04.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:14:59 -0700 (PDT)
Date: Thu, 4 Apr 2024 13:14:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 05/22] RISC-V: Add SBI PMU snapshot definitions
Message-ID: <20240404-ecddd056e774ccec7cea3be8@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-6-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-6-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_041504_096631_9A984394 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, Apr 03, 2024 at 01:04:34AM -0700, Atish Patra wrote:
> SBI PMU Snapshot function optimizes the number of traps to
> higher privilege mode by leveraging a shared memory between the S/VS-mode
> and the M/HS mode. Add the definitions for that extension and new error
> codes.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4afa2cd01bae..9aada4b9f7b5 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -132,6 +132,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_STOP,
>  	SBI_EXT_PMU_COUNTER_FW_READ,
>  	SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
>  };
>  
>  union sbi_pmu_ctr_info {
> @@ -148,6 +149,13 @@ union sbi_pmu_ctr_info {
>  	};
>  };
>  
> +/* Data structure to contain the pmu snapshot data */
> +struct riscv_pmu_snapshot_data {
> +	u64 ctr_overflow_mask;
> +	u64 ctr_values[64];
> +	u64 reserved[447];
> +};
> +
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
>  
> @@ -244,9 +252,11 @@ enum sbi_pmu_ctr_type {
>  
>  /* Flags defined for counter start function */
>  #define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
> +#define SBI_PMU_START_FLAG_INIT_SNAPSHOT BIT(1)
>  
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET BIT(0)
> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>  
>  enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> @@ -285,6 +295,7 @@ struct sbi_sta_struct {
>  #define SBI_ERR_ALREADY_AVAILABLE -6
>  #define SBI_ERR_ALREADY_STARTED -7
>  #define SBI_ERR_ALREADY_STOPPED -8
> +#define SBI_ERR_NO_SHMEM	-9
>  
>  extern unsigned long sbi_spec_version;
>  struct sbiret {
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
