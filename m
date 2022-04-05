Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38574C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gB08rOxEIzbJn1Evyn0AxtxMdfE7VNJYHOHvxkPGI30=; b=Th2E8ZUgs880PG
	Ddda0GwdEUkJeuIoKdtrkZaNHrDx2649m4TUy/ETeprbQTUXAPbPcvrtXAcD8S3u9UQtuLv7B1gQg
	Vl4DAMUfNSU9AuWmUGr9UELCHGg9W1UyODCFRILvYiOYnsnezwIfqgkgoPz4dWdaOnfK5gXj+Clc1
	UzT+3h7s2VXxGk5hFGEQrAnj//yN3FUmm9MkKWVav3Lmc3cGzXXwMsxxVT2HnXEAAvKj53HvjPF5e
	itvSOvWyAV3KQWLFmMmL2ATJDT45dxzULTq6Q7wZypCYs0doCAZqBYe9CJ0ObYQhhAFOv02oYVHra
	nTfZAITGFu2k+UZXSY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbddr-00HXej-W4; Tue, 05 Apr 2022 07:30:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdPS-00HQ1x-1b; Tue, 05 Apr 2022 07:15:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7301F615FA;
 Tue,  5 Apr 2022 07:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E12C340EE;
 Tue,  5 Apr 2022 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649142924;
 bh=qts+XhXf9HFBnxM/+mMxHMF9ldoQz8C/1qg2SBDs/7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RywdVYOy18ZaA/hNwFHqKY/LT0HvTTalDyj0/M7FY0/SrlX5lfa5/bqbVtagr5bDJ
 mIFlzNjxh+uEHqvAozQepWLb+IpWEH7OfZyH6rSej/BxR/eFnT2ZX+lm4AGIYV6jL1
 LK8zYzKSAJwrxRBOD6hem/JwSER6AasuiLvN07j96ZPYqm/bZavqWXsLKkPpU/q8CL
 vHhGRUVP5/A3uKHepxn2CdZdekrRdEwma2j0xxQrMJ693LTtpJ8H/1URKbHTq1U9Eh
 kULJ1WOfyfcc9zK2xzxgYvbGreJIGoPrqZ5ATk+zFNsFCpzuQmVdsNdQq+ntAlZ6Bp
 YguqIvGpghiWg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
 naresh.kamboju@linaro.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, heiko@sntech.de,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V12 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Tue,  5 Apr 2022 15:13:14 +0800
Message-Id: <20220405071314.3225832-21-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405071314.3225832-1-guoren@kernel.org>
References: <20220405071314.3225832-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_001526_208117_CAA8DE12 
X-CRM114-Status: GOOD (  11.00  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Adds initial skeletal COMPAT Kbuild (Running 32bit U-mode on
64bit S-mode) support.
 - Setup kconfig & dummy functions for compiling.
 - Implement compat_start_thread by the way.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..def9798e9675 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -76,6 +76,7 @@ config RISCV
 	select HAVE_ARCH_KGDB if !XIP_KERNEL
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
@@ -127,12 +128,18 @@ config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
 
+config ARCH_MMAP_RND_COMPAT_BITS_MIN
+	default 8
+
 # max bits determined by the following formula:
 #  VA_BITS - PAGE_SHIFT - 3
 config ARCH_MMAP_RND_BITS_MAX
 	default 24 if 64BIT # SV39 based
 	default 17
 
+config ARCH_MMAP_RND_COMPAT_BITS_MAX
+	default 17
+
 # set if we run in machine mode, cleared if we run in supervisor mode
 config RISCV_M_MODE
 	bool
@@ -394,6 +401,18 @@ config CRASH_DUMP
 
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
+config COMPAT
+	bool "Kernel support for 32-bit U-mode"
+	default 64BIT
+	depends on 64BIT && MMU
+	help
+	  This option enables support for a 32-bit U-mode running under a 64-bit
+	  kernel at S-mode. riscv32-specific components such as system calls,
+	  the user helper functions (vdso), signal rt_frame functions and the
+	  ptrace interface are handled appropriately by the kernel.
+
+	  If you want to execute 32-bit userspace applications, say Y.
+
 endmenu
 
 menu "Boot options"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
