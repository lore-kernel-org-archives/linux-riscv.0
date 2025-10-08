Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E783BCAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 18:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGxT3Nm3axIY2Bgz38Jf1uZQjeW0luKcPAQ/Bo3L2gY=; b=AqCF7bQ9n6MZ1c
	CSMkh1kpJZJfPaXfR45FRgNF1TJ7/Yi1dPS/7k5WhseFCvdUbWGl+4KXc5t0RwvLEm6BsbphXs8UA
	431ZMA+InCEMxH2qPsxkg8S2KvZbPQUrXltOd3sv2l1DYd/LVReW8LuaSvhnUwIa5Ey8b/2aW9YnT
	5Iyrl2X0YhSE13ZzbRg3qL4ifVb0zHrg8MZe7zP2/HDsufeKMJjoiFtnTBWwXMh0xQu0P6PVzwe7b
	AXwYqjAFh3eJVaoLMzyMFWVmfYbqnbgh2f2wddM4IOVLkOp800gwOYygenrqBHtIlwxvJwu45sMMP
	OB1kbfMSsGSjz/B05LlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Yio-00000004T08-0oLb;
	Wed, 08 Oct 2025 18:17:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Yim-00000004Szv-30vC
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 18:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3FB5601B5;
	Wed,  8 Oct 2025 18:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE40C4CEE7;
	Wed,  8 Oct 2025 18:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759947423;
	bh=AW5yOKh/sNWuA+cO9tnwU0Y7SfMqI6HWFAIrzVfvpWA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nMC12xqTdQMqGo2v9vucB804d1ePNckLejoZFWE/uyOgNIpiE/aYOYA3u/Rw3/3KY
	 vCe3tiBg6McHbdBhQTK9stk+G9Wbyg+aeOywRDO0FGkwl0/D1irx9tlOzyZaL3rvXb
	 y1KIoDfETH6sM/po9rZ/27ahrpraL2L1n0P2ZsMeP0+kNYdYIBUYRyUTfZ04fndpgV
	 Wgdb6/+YQUWx1b0a5nm/yyH8EiWqaBQCOP1ULPSf7EnOPlR29aG6ApDC4Nc4cUkyD9
	 XJkBlyG6YXliibOUAs8t/J6tnrR2TrrmaZ1ktg350mAFY1Y6FjMu1CIveAg8QxW1Ji
	 Eox0IsWF12J8w==
Date: Wed, 8 Oct 2025 12:17:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: BillXiang <xiangwencheng@lanxincomputing.com>
cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
In-Reply-To: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com>
Message-ID: <3bd01b1c-07e1-c545-8256-f83e3343247e@kernel.org>
References: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com>
MIME-Version: 1.0
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

Hi,

a few comments:

On Wed, 17 Sep 2025, BillXiang wrote:

> Move those sbi ext ids to uapi because they will be forwarded
> to user space by kvm.
> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>

checkpatch.pl reports several issues with this patch.  Please follow these 
steps before sending patches to the public lists:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst

> ---
>  arch/riscv/include/asm/sbi.h      | 16 +-----------
>  arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 15 deletions(-)
>  create mode 100644 arch/riscv/include/uapi/asm/sbi.h
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 341e74238aa0..e196feaabb2e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -10,13 +10,12 @@
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
>  #include <linux/jump_label.h>
> +#include <uapi/asm/sbi.h>
>  
>  #ifdef CONFIG_RISCV_SBI
>  enum sbi_ext_id {
>  #ifdef CONFIG_RISCV_SBI_V01
>  	SBI_EXT_0_1_SET_TIMER = 0x0,
> -	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> -	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
>  	SBI_EXT_0_1_CLEAR_IPI = 0x3,
>  	SBI_EXT_0_1_SEND_IPI = 0x4,
>  	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> @@ -37,13 +36,6 @@ enum sbi_ext_id {
>  	SBI_EXT_NACL = 0x4E41434C,
>  	SBI_EXT_FWFT = 0x46574654,
>  
> -	/* Experimentals extensions must lie within this range */
> -	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> -	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> -
> -	/* Vendor extensions must lie within this range */
> -	SBI_EXT_VENDOR_START = 0x09000000,
> -	SBI_EXT_VENDOR_END = 0x09FFFFFF,
>  };
>  
>  enum sbi_ext_base_fid {
> @@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
>  #define SBI_PMU_STOP_FLAG_RESET BIT(0)
>  #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>  
> -enum sbi_ext_dbcn_fid {
> -	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> -	SBI_EXT_DBCN_CONSOLE_READ = 1,
> -	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> -};
> -
>  /* SBI STA (steal-time accounting) extension */
>  enum sbi_ext_sta_fid {
>  	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
> diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
> new file mode 100644
> index 000000000000..d29ac0abeefe
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/sbi.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.

Most of this file is cut-and-pasted from another kernel file, with 
different copyrights.  When that happens, it's best to add the copyright 
notices from the original file, as the new file appears to be a derivative 
of the initial work.

> + *
> + * Authors:
> + *     BillXiang <xiangwencheng@lanxincomputing.com>

Same for authorship information.

> + */
> +
> +#ifndef _UAPI_ASM_RISCV_SBI_H
> +#define _UAPI_ASM_RISCV_SBI_H
> +
> +
> +enum SBI_EXT_ID {
> +	/*
> +	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
> +	* handled in kernel so they will be forwarded to userspace by kvm.
> +	*/
> +	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> +	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> +	/*
> +	* Both SBI experimental and vendor extensions are
> +	* unconditionally forwarded to userspace by kvm.
> +	*/
> +	/* Experimentals extensions must lie within this range */
> +	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> +	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> +
> +	/* Vendor extensions must lie within this range */
> +	SBI_EXT_VENDOR_START = 0x09000000,
> +	SBI_EXT_VENDOR_END = 0x09FFFFFF,
> +};
> +
> +/*
> +* The SBI debug console functions are unconditionally
> +* forwarded to the userspace by kvm.
> +*/
> +enum sbi_ext_dbcn_fid {
> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> +};
> +
> +#endif /* _UAPI_ASM_RISCV_SBI_H */
> \ No newline at end of file

I do have some broader questions: is this patch really needed?  Is it 
fixing anything that's broken?  These SBI constants aren't defined by the 
kernel; they come from RISC-V standards.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
