Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C091C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 04:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii27u8s6TxEC9JcHd02sD5fYsknUBOo9xCwgfqwc/9k=; b=mN0lD0BbFe/aDOX6BKStpbhZUl
	hoElMpZvs4zTfNBMQAEA2leoJsA+6ZpI4J+6GQo8ndBA6ut+swO0vA8XEMxlxJIWeJCf9CtR0Pmpo
	DLw6PHGWZLpFHSGzq5zqIlNsQoJK2wB+976C6MF0PgO0PtclLsZlaVtd00ZyGHVq9SeoLjkCrJ87o
	Jczu6Z7akDIZamMs41EJlSCOgdAmLs76CDOiCd0OOxSvlxe8LI0DaTgcPp5Lu2PIKMdaKysZFywxY
	fk2f6q0MUxrVeOKjJQ+fPZ4t+jn8gmnlvEYGZZehDGxFz54TxELws/DDkwj+j4bD9b+Lz7WwY5OC6
	MDmkfBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovWJk-00A8px-75; Thu, 17 Nov 2022 04:16:00 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovWJg-00A8nc-SS
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 04:15:58 +0000
Received: by mail-pg1-x536.google.com with SMTP id f3so922527pgc.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 20:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDD27eRVr6Jpi3mv3EpbjZBfO7XDNZID1/HCkNCN7Lc=;
        b=gq4qQ68HZFLk59q+PiEYGf4KzSPXoaHUCGwkgytoBfV4K3UXyLtQ2hMzRC5aOA5dXl
         eaXR7lnrkMQ5OB82HlcrD6e4+rvYsdmKyUGqDxa5dzldStKrUaPEeB+uUO1cNDjU7sFO
         2J5JcdaRhESAPx6/3TBJ+botN3IwFQ8UWQOBPtpqgMKy1AnYeOkWMKa6+1Eig6DYMkYN
         larq/bjcceNN8CMNhOVRKuk2svcVPlK3XafSQL2ljGXKVqEsha6lkNZveRSYragc3+CC
         61+10oaKb+iDkIrMZ3OuvCyQRiXmanL+ElMojCyZc3coiJMeGoDVZzsPVV2FwOPMlM0v
         33tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDD27eRVr6Jpi3mv3EpbjZBfO7XDNZID1/HCkNCN7Lc=;
        b=LqYYIj4t965fXtMeZ9x8gibYawQJ3828tQCL6bcwsh+As3g8EalMBk7wWd3N0MtKoI
         xP6Xz0uKRVOVn6xovNaCYaeVcJ/wtDfJogCmD+zzOuPy7W5FYW2KInIqAkVJf9ZmAl92
         hsuiqZlS0Npl7jOq4s5GkZtLjQCGD4UEavLf3I7wPkVKpQDqPUzJaeThnoNvPwXHHAOJ
         bNj4jAuEbb5Dm6LdrIOKDQFnFOJi6T72WVk8azVk04GjHLJKdR5Rc2Lzdi04DHJBSgt2
         ohr/i4xrXQZLsspwZJdv1wtjeQo/cIyWWRU8/bQT8uN2ODf6e7BxC7kbrNFwVK/zP7Tf
         a9ig==
X-Gm-Message-State: ANoB5pkC1jk3mQgYSdeJ7iTHWZCMC7gDQ2rt1AVQoXqIge08HxHp2EDr
	v/2JwDynv1CmATPTF8iTBXfeOw==
X-Google-Smtp-Source: AA0mqf5V6OHqKAmUjJGcpIKqwpZ/GjFFX4NKQgV3lxyTXpAi69qVN9PHK/mDtD9wPzRAO4Z61xHymQ==
X-Received: by 2002:a63:712:0:b0:438:e0dc:9c53 with SMTP id 18-20020a630712000000b00438e0dc9c53mr478580pgh.322.1668658555199;
        Wed, 16 Nov 2022 20:15:55 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fu15-20020a17090ad18f00b0020d51aefb82sm431788pjb.19.2022.11.16.20.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 20:15:54 -0800 (PST)
Date: Wed, 16 Nov 2022 20:15:51 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	anup@brainfault.org, heiko@sntech.de, guoren@kernel.org,
	mick@ics.forth.gr, alexandre.ghiti@canonical.com, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, corbet@lwn.net,
	Conor.Dooley@microchip.com, bagasdotme@gmail.com,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
	k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com
Subject: Re: [PATCH V5 1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
Message-ID: <20221117041551.GA2197698@debug.ba.rivosinc.com>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
 <20221026144208.373504-2-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026144208.373504-2-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_201557_132349_BD8E40EF 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Oct 26, 2022 at 10:42:07PM +0800, Xianting Tian wrote:
>Add arch_crash_save_vmcoreinfo(), which exports VM layout(MODULES, VMALLOC,
>VMEMMAP ranges and KERNEL_LINK_ADDR), va bits and ram base for vmcore.
>
>Default pagetable levels and PAGE_OFFSET aren't same for different kernel
>version as below. For pagetable levels, it sets sv57 by default and falls
>back to setting sv48 at boot time if sv57 is not supported by the hardware.
>
>For ram base, the default value is 0x80200000 for qemu riscv64 env and,
>for example, is 0x200000 on the XuanTie 910 CPU.
>
> * Linux Kernel 5.18 ~
> *      PGTABLE_LEVELS = 5
> *      PAGE_OFFSET = 0xff60000000000000
> * Linux Kernel 5.17 ~
> *      PGTABLE_LEVELS = 4
> *      PAGE_OFFSET = 0xffffaf8000000000
> * Linux Kernel 4.19 ~
> *      PGTABLE_LEVELS = 3
> *      PAGE_OFFSET = 0xffffffe000000000
>
>Since these configurations change from time to time and version to version,
>it is preferable to export them via vmcoreinfo than to change the crash's
>code frequently, it can simplify the development of crash tool.
>
>Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>---
> arch/riscv/kernel/Makefile     |  1 +
> arch/riscv/kernel/crash_core.c | 21 +++++++++++++++++++++
> 2 files changed, 22 insertions(+)
> create mode 100644 arch/riscv/kernel/crash_core.c
>
>diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>index db6e4b1294ba..4cf303a779ab 100644
>--- a/arch/riscv/kernel/Makefile
>+++ b/arch/riscv/kernel/Makefile
>@@ -81,6 +81,7 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
> obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
> obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>+obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
>
> obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
>diff --git a/arch/riscv/kernel/crash_core.c b/arch/riscv/kernel/crash_core.c
>new file mode 100644
>index 000000000000..b351a3c01355
>--- /dev/null
>+++ b/arch/riscv/kernel/crash_core.c
>@@ -0,0 +1,21 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+
>+#include <linux/crash_core.h>
>+#include <linux/pagemap.h>
>+
>+void arch_crash_save_vmcoreinfo(void)
>+{
>+	VMCOREINFO_NUMBER(VA_BITS);
>+	VMCOREINFO_NUMBER(phys_ram_base);
>+
>+	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
>+	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>+	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
>+	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
>+	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
>+#ifdef CONFIG_64BIT
>+	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
>+	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
>+#endif
>+	vmcoreinfo_append_str("NUMBER(KERNEL_LINK_ADDR)=0x%lx\n", KERNEL_LINK_ADDR);
>+}
>-- 
>2.17.1
>

I had been looking around to play around with crash-utility.
Applied v5 patches, triggered a crash and have been able to use crash tool with commands 
like vtop/bt.

Tested-by: Deepak Gupta <debug@rivosinc.com>

Thanks
debug


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
