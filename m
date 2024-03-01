Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066A7C5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rCEOHLdKBiB2iMoNoAMUQlV8XMYzy+rUkboVEl4TzI=; b=kDFQEeaRl7gTZ+
	mEbDxjt7IMq+felNgOjTQCSV58KVAfukO865n6r4mCsE6ZLshKuiRibN04gDa/l6jx9wNSyVR6bg8
	/OsUe5SU7q4WxLMU0iGaLMnUfwuGd3Yx858wIlSmyJ7hzpcapwvt8bwLBWB9B7/aIPmFLKj9l4LlE
	RaZsYu3b/3guLKRIRQDC/TOMV4GaETQCB0FAFryanv9I4GHU3mwvF17JoiAXnGwDpljuP9tyhDdU+
	QC56xq5sh67ZnuACKQr7b9p/rI1uCvd8i+nI8vG9x3YaKPOH71WtK98v8lasTaKIXStTlM7QmyJWZ
	wW0zrBAx/PGc7cMdOzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0qH-0000000HWCl-2wSy;
	Fri, 01 Mar 2024 11:14:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg0qE-0000000HWAT-1YGe
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 11:14:15 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-512b3b04995so1686941e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 03:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709291651; x=1709896451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXt56DDN1trQQI8RIOoz0OKV0RNEBNHuWLr8xaraJVQ=;
        b=dZjyw9c1HdE2YBPJNeUNuasrJAZmYtmi5mHwRQHlVUdjDpIYH0mqupYDYxqRV2CUz1
         X4h3UFR7AXI78KCUJqNALdu1xtIS4YQqNphfsRz6mwRKrfkt2lk4I/SWTBsKSxzeznwd
         6AIgZnJSDqf9lh0FQJpQVpL8fKTBCNvZo3LF42SjHLWBvKX8EqK576moBEby8jqyJ9ed
         z5I6Z7IQ4HPrG/Yo34jEnrix31lIFQnK5UIQN0jz2aFxkXEL59q41vkD5EK/fHrvC0jq
         WYqFd866brxAnACte9EdxfG6DmHV07JtbXzBJTlcclSCP3CSus9/RD0yE7O+ple9wkFC
         fi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709291651; x=1709896451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXt56DDN1trQQI8RIOoz0OKV0RNEBNHuWLr8xaraJVQ=;
        b=qO0Xxana/TRH7WjkbEqG1BEzLNdgiFS6Dq2EEKVAJU4QeKgGW13PsSJI8sMu5e/sjA
         guxxI366HJyFjsOwPGEKQQEqVWEx6oEuRAYok6mTB6lmbeHZ+Y3CsuWqIbOxFEPjKrAE
         HZWbLFygFSj3nP4NZpe0vQOOViw1CBkI7kZOWW+fumZHI+k7nnJwaRRqQjVoUQqkjWUq
         mMZ2ZTGACkcgL+1SZRUK7AaKkxCLcMqZTBSo5duCnpNT4ilR8SIFPAYcLI2C3x+oaSKa
         uGX3gA0LwaAoKOa8u5K0hJs1kj5FWkoB68LF6XRhlO72R0aPbzRyTo++d+sx7sxhXx+E
         JO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlCubBvfGzV+LNDM7Tr+ieBtz3tVnxfaEUfCAaBaDb+knuf4jVS2fSCxd1q3YRI8wNGyNLmpuCPkHKIONab3cc4GmRhYq8FPFVsZRdWDCA
X-Gm-Message-State: AOJu0YxjSwWsbewdyRm2TqxHZVpaBPZB347poe1Ps3ZnJCbGt+G/VCtA
	LrF775V5L6hTq5UQmIyuCFjKBsQgNMAuxE+Fk3KBHbtIWbJUYX/jf8aaSLqjX9o=
X-Google-Smtp-Source: AGHT+IEMU3X0u8IVUbmn5Hd0kEbruFTDCYQR+XS7mqKnTdFj2a5iVEk93dn2ijW3fSXhfMFxgwHqFQ==
X-Received: by 2002:a05:6512:2388:b0:512:be8e:79da with SMTP id c8-20020a056512238800b00512be8e79damr1364981lfv.8.1709291650643;
        Fri, 01 Mar 2024 03:14:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q16-20020a5d6590000000b0033d56aa4f45sm4292371wru.112.2024.03.01.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 03:14:10 -0800 (PST)
Date: Fri, 1 Mar 2024 12:14:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 04/15] RISC-V: Add SBI PMU snapshot definitions
Message-ID: <20240301-1a1aa2a2c04640c34749cb5f@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_031414_436662_B2F95393 
X-CRM114-Status: GOOD (  20.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:19PM -0800, Atish Patra wrote:
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
> index ef8311dafb91..dfa830f7d54b 100644
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
>  #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)

A patch before this which changes all flags to use BIT() instead of shifts
would be good, since otherwise the new flags are inconsistent.

> +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)

This is named SBI_PMU_START_FLAG_INIT_SNAPSHOT in the spec.

>  
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
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

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
