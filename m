Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5EE606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AFalvvfP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=IYsXm2P5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Date:To:Mime-Version:
	Message-Id:From:References:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DTbQHL0lX3GRKhhEN8Hzgjw17Xa9Q9ce8lPWkuGuOu4=; b=AFalvvfP4cgyV+1I9kSmiuuD6v
	wkB9QPf0ALlFIhw9YETilOPnkqPOql7H3Xcw8KhQ34wj3FwbeULyM1R5mLMh7eHo8DPbNVfj1CKoz
	Sa4ePB8LbV0J+LXWoiu01Ue1ti+53JUTPyGF8zvvNPpXvJVI8+v/ERJN8z908DUJRb6xLj9X4x2Hm
	3EdLt0/JxWO4Z+feRj/1yDXCquLNbqXaNZh8K3cVkC9Ve9Kaf+pzwREQDNv8u+xeHQ2jLvmc/jP3h
	9BKWH3ShwV4cA8MR+0TvNxvrvDC7HOlY3gAHw3gAKAb9wuPzlM/B4+vakZ3LXITKFgYWAgEZnhSME
	zS01PUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwxZ-0000000919u-3Zr5;
	Thu, 05 Nov 2026 12:52:53 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwxV-0000000918o-1Nn9
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 12:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793883161; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Fz6oVrX7/NbNBKe7D52bmdwjWluMA6P4LkwzqUDU7u8=;
 b=IYsXm2P5Q3lFFL99BDPxLFTKSU2lnKSXO+VMiLPDpBq+fqhCbAjtoXAgTc2yIBvoNaMnqS
 khonTVnSlJuGD1+Xuw2AInBhyo7l5xmHV+gF7Ju2V9yfvbkwkwld0lupL7c14Srq0kXnLc
 MliKsyaA2scfEz+bqmpc15GNvcpwYFBE24690vZN/ur0kTaytRpbk0qMRW2FrPw3kEp2BR
 a7oYIXMNqsM9U/wWrSOsyKz7AXD/fe39THCkzaBjIWmpuLU1LALaGC/zQHJlLstWg0pVFY
 8woCdnb2uAJBkasp7frTFhbCxn9mJqkfyun17YoeG0sGSp0CGEQoKoGbr6H2qg==
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and csr_write_num() functions
X-Lms-Return-Path: <lba+26aec7c17+d3f46a+lists.infradead.org+yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
Received: from [100.86.223.207] ([58.250.106.114]) by smtp.feishu.cn with ESMTPS; Thu, 05 Nov 2026 20:52:38 +0800
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
Content-Language: en-US
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <51cb0e88-356e-4980-95a2-e4a46695ee9d@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
To: "Anup Patel" <anup.patel@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 20:52:36 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
In-Reply-To: <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_045249_567211_9E9970C2 
X-CRM114-Status: GOOD (  16.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, yang.yicong@picoheart.com, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Sunil V L <sunilvl@oss.qualcomm.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 12:15 AM, Anup Patel wrote:
> From: Anup Patel <apatel@ventanamicro.com>
> 
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
> 
> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> as CPPC register and the RISC-V SBI specification allows arbitrary
> CSR number as PMU hardware counter. This means ACPI CPPC driver and
> RISC-V PMU driver no longer need to do sanity checks on CSR number
> which are now done by the common csr_read_num() and csr_write_num()
> functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>  arch/riscv/include/asm/csr.h |   3 +
>  arch/riscv/kernel/Makefile   |   1 +
>  arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>  drivers/acpi/riscv/cppc.c    |  17 ++--
>  drivers/perf/riscv_pmu.c     |  54 ++----------
>  5 files changed, 184 insertions(+), 56 deletions(-)
>  create mode 100644 arch/riscv/kernel/csr.c
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 621f84d1898f..ebd82043430b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -672,6 +672,9 @@
>  			      : "memory");			\
>  })
>  
> +unsigned long csr_read_num(unsigned long csr_num, int *out_err);
> +void csr_write_num(unsigned long csr_num, unsigned long val, int *out_err);
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif /* _ASM_RISCV_CSR_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f54c336bf547..7f52ae724225 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -51,6 +51,7 @@ obj-y	+= soc.o
>  obj-y	+= alternative.o
>  obj-y	+= cpu.o
>  obj-y	+= cpufeature.o
> +obj-y	+= csr.o
>  obj-y	+= entry.o
>  obj-y	+= irq.o
>  obj-y	+= process.o
> diff --git a/arch/riscv/kernel/csr.c b/arch/riscv/kernel/csr.c
> new file mode 100644
> index 000000000000..e96b129c1a99
> --- /dev/null
> +++ b/arch/riscv/kernel/csr.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
should update to 2026?

Now read of CPPC FFH counter succeed on my platform.

Tested-by: Yicong Yang <yang.yicong@picoheart.com>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
