Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBE5C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RSfWmvexDMlvAzwxi4btfcIRWp3m2TCVO2RmUwPnleE=; b=STnjjfZShZp+XlfBoRu0IVkYCA
	T2NFcnxTDpikKW088mt0RWsfn2n+wyYqdsrp9H8mh1xLNMk/6KD7cX/KSuipdzsOflEZOXMkrw2QK
	BFhuHKQ09qIgYoXLtT1tjmlw0wsMBXI0LJ2OA4n9PewgEJfPGSXipDDljtCYcqblyCKJEblGogabl
	U9c/F/NN0NThxUwcziMRc8dS2Iq/zvLx6igs66KCXTaj34UGfTxB8uGgz4E1cCDNXlWE0cO7ehwO6
	tVsf3gYwGxz4UU/bockc+j2xHXfrO9hQCtKO+iSBsBTHOh8gJpR7vnsrQAve1rl9DGxRG4CZ4tCdL
	6QYNqMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFao-00000006TGy-1Rvg;
	Thu, 22 Feb 2024 20:22:54 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFal-00000006TGB-3kfb
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 20:22:53 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5dc20645871so132664a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708633370; x=1709238170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpShOmtkkj9GEApYdcwx7cn/mMGxpGuhSoDbV1XUNXc=;
        b=21pey5i2FWHfPxgkVaDsfjVD46qmR5fqEqQxizUGsfbCeX1pAUWeuFmWhPRoIBs116
         5YlEFlZ8xKPK8fUvcP95djncc7EClk7haCKcVzD1BLd53gSEANIy3j7txSTlOqRyaIu/
         2eRsVEilTfDLdtcneU+UTUF1KrQeed9piedlvH66utTg2lKT2cOlaJIQLkB1H7vySvIU
         HCqkRXs0cj6/K0qo9Qm/TV4mu1z6bn4TqZlfYVhMqUz+miniwzOPTPtJLwuY+nhqR1A4
         bvJQephXmVVRHBnynqgBETaYNCQI1GcoaGa0cndboBruEICuNPubfW72F+K4iuRgckrm
         RpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708633370; x=1709238170;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpShOmtkkj9GEApYdcwx7cn/mMGxpGuhSoDbV1XUNXc=;
        b=Zr0i2CTmrWn+yanRIBc9TN+6iO/aR4ZlheUbDy5G32H5Lh1xkQ2xIW6aTgMJSiFfUC
         oANPYxh5PA53GQiUBFhcVin3YG9oVM87H43hL8HkBhX+L0JHJtHL0dLl0aAHWQC7HbqD
         tCEBXdv6X67opJjAIR1tCsYx9rftPiRk3QrPIgiZ2JqNdSKkFvKcrzaErCUioS33jk/K
         r4Q6BH2hH1jF6m0w8VyFA20G+PB54KSKoBM80rTm1cSfk0/k+3vDCQCWb5R4rAHZpCWN
         9BtHLUXzefbMBp+bK7w76722QhKyzMI8tXu1lCoFtHPgDSahzw4GEsvHSAh74IhuNy/2
         63mg==
X-Forwarded-Encrypted: i=1; AJvYcCWXidsoRKCYG6hIoqKkLJD4DMBamDVpSLF4W+/BrsfuibVYFDijPbTpK/uSxtOHeRao5PX1rpQRerrDofhtzOi50T0a32i69MWQ6Pqghsx1
X-Gm-Message-State: AOJu0Yxn8swW+1LkEppLp2lhmpqufIZdyddpPRLDBOAaxYsf5w3uL6Hu
	dvqKezm5VJYD8Gg9McCEPG7v7S1uvizv9a6W9FUK3wddD9sis18yFsTJBNoPEEMTHvgJeUI+yUl
	O4tk=
X-Google-Smtp-Source: AGHT+IHqzp5vBlh891WfzJCO4hseA3vx6/FnlCk5TJbweZ6XQhH5Ogc5C8SekyxUIOEcqD7DZP99Dg==
X-Received: by 2002:a17:90a:d3d0:b0:298:b25d:127c with SMTP id d16-20020a17090ad3d000b00298b25d127cmr5033001pjw.23.1708633370408;
        Thu, 22 Feb 2024 12:22:50 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id ta4-20020a17090b4ec400b00298b3e058fcsm4424899pjb.57.2024.02.22.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:22:49 -0800 (PST)
Date: Thu, 22 Feb 2024 12:22:49 -0800 (PST)
X-Google-Original-Date: Thu, 22 Feb 2024 12:21:05 PST (-0800)
Subject: Re: [PATCH v2] riscv: add CALLER_ADDRx support
In-Reply-To: <20240202015102.26251-1-zong.li@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr,
  Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-ce04b525-e138-44ba-874f-97b0f6d5e2e7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_122251_962193_8738388D 
X-CRM114-Status: GOOD (  29.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 01 Feb 2024 17:51:02 PST (-0800), zong.li@sifive.com wrote:
> CALLER_ADDRx returns caller's address at specified level, they are used
> for several tracers. These macros eventually use
> __builtin_return_address(n) to get the caller's address if arch doesn't
> define their own implementation.
>
> In RISC-V, __builtin_return_address(n) only works when n == 0, we need
> to walk the stack frame to get the caller's address at specified level.
>
> data.level started from 'level + 3' due to the call flow of getting
> caller's address in RISC-V implementation. If we don't have additional
> three iteration, the level is corresponding to follows:
>
> callsite -> return_address -> arch_stack_walk -> walk_stackframe
> |           |                 |                  |
> level 3     level 2           level 1            level 0
>
> Fixes: 10626c32e382 ("riscv/ftrace: Add basic support")

You've got a spurious newline here.  I've got this queued up for 
testing with that cleaned up, it should show up on fixes soon (assuming 
it passes the tests and such).

>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>
> Changed in v2:
> - Rebase to v6.8-rc2
> - Add noinline attribute for return_address()
> - Add a fixes tag
>
>  arch/riscv/include/asm/ftrace.h    |  5 ++++
>  arch/riscv/kernel/Makefile         |  2 ++
>  arch/riscv/kernel/return_address.c | 48 ++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 arch/riscv/kernel/return_address.c
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 329172122952..15055f9df4da 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -25,6 +25,11 @@
>
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #ifndef __ASSEMBLY__
> +
> +extern void *return_address(unsigned int level);
> +
> +#define ftrace_return_address(n) return_address(n)
> +
>  void MCOUNT_NAME(void);
>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  {
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f71910718053..604d6bf7e476 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -7,6 +7,7 @@ ifdef CONFIG_FTRACE
>  CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
>  endif
>  CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
>  CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
> @@ -46,6 +47,7 @@ obj-y	+= irq.o
>  obj-y	+= process.o
>  obj-y	+= ptrace.o
>  obj-y	+= reset.o
> +obj-y	+= return_address.o
>  obj-y	+= setup.o
>  obj-y	+= signal.o
>  obj-y	+= syscall_table.o
> diff --git a/arch/riscv/kernel/return_address.c b/arch/riscv/kernel/return_address.c
> new file mode 100644
> index 000000000000..c8115ec8fb30
> --- /dev/null
> +++ b/arch/riscv/kernel/return_address.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * This code come from arch/arm64/kernel/return_address.c
> + *
> + * Copyright (C) 2023 SiFive.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/kprobes.h>
> +#include <linux/stacktrace.h>
> +
> +struct return_address_data {
> +	unsigned int level;
> +	void *addr;
> +};
> +
> +static bool save_return_addr(void *d, unsigned long pc)
> +{
> +	struct return_address_data *data = d;
> +
> +	if (!data->level) {
> +		data->addr = (void *)pc;
> +		return false;
> +	}
> +
> +	--data->level;
> +
> +	return true;
> +}
> +NOKPROBE_SYMBOL(save_return_addr);
> +
> +noinline void *return_address(unsigned int level)
> +{
> +	struct return_address_data data;
> +
> +	data.level = level + 3;
> +	data.addr = NULL;
> +
> +	arch_stack_walk(save_return_addr, &data, current, NULL);
> +
> +	if (!data.level)
> +		return data.addr;
> +	else
> +		return NULL;
> +
> +}
> +EXPORT_SYMBOL_GPL(return_address);
> +NOKPROBE_SYMBOL(return_address);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
