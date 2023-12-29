Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99FBC46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zUKUnWoUyEHAMl/ur44nl0Wxb5hWY7urkQWBDcJv8z8=; b=CRLzNFzLQchnWOyRz4iqoQGZso
	P+JS7hO5KOUOLSmBNYhyQ1ngLVY0rCp52ILfGeZ6BSkWv/pIltI60MNXAhT2vHvILAq6paIUX3I1w
	kIP4SMy/WewusCHcvZDQR6+hL0WIocnRY6j8K1jp/81vjacfkY8cSb3C1W6sRkCg6pbvjPqQC8DMY
	GYkSCNP8qi1MC5JnDXqMzdOZm9DBEOTzoQHJ3GbRNmczs2zWgdRUBYu8YjdXRQA38SQzv84mhIwnx
	XhXTtDU1MrH29vlzdKra3fJz1L06zqtRCu0O511JKRSyxNyDuTFR0hsFzmXXNfvJy3gwxjM7guo3l
	I+qWzCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ1vq-0003Me-0D;
	Fri, 29 Dec 2023 01:45:02 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ1vj-0003IU-1t
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 01:44:58 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbd1f9e0b8so782725b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 17:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703814291; x=1704419091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4V1BHEupFQbqBJMrfQMAXq3kLkeflc54O4MuJlc11M=;
        b=vUX26Z77y+J+4fgR6sQGna3WK5+x2oWzD2ehccTuJMLs3AKA/DEIykeMoQqYPF6kFn
         Eb2GVDbrbfKbJaj9hTnGgjw+584hbvzvyEr9kCALefcuqchzD04ylwuIHCo2cckOKOJh
         s7RcjNySnVczVLHs5R5H6FsCybGT3WPN5D6YXWm7f5HkRM1H3gNVW+yT4aMAf9qLKDMs
         dVue2dtxUNMpv4pCnGHOs+sLIBezEL7KjKE1aNPotVKOBkIqZ8233gIGk3TxXphGuBeO
         +B+s/e7CQBVx7Sax3rmouESqxpWpHShMfNOe7QNJTxPT0m2bDP5jbEKLYWQOSpzsGzGo
         5mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703814291; x=1704419091;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4V1BHEupFQbqBJMrfQMAXq3kLkeflc54O4MuJlc11M=;
        b=IUrDV+IgH940Qz91zPcMYFZZypgDzR6Jr66gAC0z87ctbKR7XNvXdj6giaVpceFPuR
         rI6E2EyTcd8mr90flCTdw0er6Juzx8gCAeQjqKFl/xjOCj1wmG4jCJaOz2S9ray/z6XG
         xPA68dGkWUswo3G0nfl1zPn/sL367sGnyrN1MActUcBFvuchfizdPBLYuDJ091EXz767
         ex607zjhzBvE+LHQgC+b59PRjua/VbdgERqIC3bihxo6ZgdE0q/lgo/KILgXNBgNbBSM
         c9tcsW2iNm94QNbR1H4LnTikgRLQMdzcNXm5fA9OLRNoTqgaltMtUV2M1fhypbY6tSkE
         hF0Q==
X-Gm-Message-State: AOJu0Yy8ElbCLOKhSS2vFh9O/pg7pju5k1CzoWGjr9aI/Setmfh/lkaF
	4KCb+eZIrGmcQFWL9Rf0kbUIFCsxXgMTaA==
X-Google-Smtp-Source: AGHT+IEJDPm2HxcdY+IacGVsA8lBK6Lf18NKOW8Wt/2LU5dUqXP+w/AMvLeHFRRdjdIVbKE+YBkJyw==
X-Received: by 2002:a05:6808:3c4a:b0:3bb:ce8b:94b9 with SMTP id gl10-20020a0568083c4a00b003bbce8b94b9mr3240341oib.111.1703814290662;
        Thu, 28 Dec 2023 17:44:50 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id a25-20020aa78659000000b006d9c216a9e6sm7077180pfo.56.2023.12.28.17.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 17:44:50 -0800 (PST)
Date: Thu, 28 Dec 2023 17:44:50 -0800 (PST)
X-Google-Original-Date: Thu, 28 Dec 2023 17:44:33 PST (-0800)
Subject: Re: [v1 04/10] RISC-V: Add SBI PMU snapshot definitions
In-Reply-To: <20231218104107.2976925-5-atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-bc357c81-f43a-40e2-b4ac-f9c462e4c006@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_174455_673690_B5DE3EE2 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, kvm@vger.kernel.org, anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, kvm-riscv@lists.infradead.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Dec 2023 02:41:01 PST (-0800), Atish Patra wrote:
> SBI PMU Snapshot function optimizes the number of traps to
> higher privilege mode by leveraging a shared memory between the S/VS-mode
> and the M/HS mode. Add the definitions for that extension and new error
> codes.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index f3eeca79a02d..a24bc4fa34ff 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -122,6 +122,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_STOP,
>  	SBI_EXT_PMU_COUNTER_FW_READ,
>  	SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
>  };
>
>  union sbi_pmu_ctr_info {
> @@ -138,6 +139,13 @@ union sbi_pmu_ctr_info {
>  	};
>  };
>
> +/* Data structure to contain the pmu snapshot data */
> +struct riscv_pmu_snapshot_data {
> +	uint64_t ctr_overflow_mask;
> +	uint64_t ctr_values[64];
> +	uint64_t reserved[447];
> +};
> +
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
>
> @@ -234,9 +242,11 @@ enum sbi_pmu_ctr_type {
>
>  /* Flags defined for counter start function */
>  #define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
>
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>
>  enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> @@ -259,6 +269,7 @@ enum sbi_ext_dbcn_fid {
>  #define SBI_ERR_ALREADY_AVAILABLE -6
>  #define SBI_ERR_ALREADY_STARTED -7
>  #define SBI_ERR_ALREADY_STOPPED -8
> +#define SBI_ERR_NO_SHMEM	-9
>
>  extern unsigned long sbi_spec_version;
>  struct sbiret {

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
