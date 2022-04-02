Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C2C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUf0mL29TyOIqJSv8vRHJlNJhiOYJqOF1MR/1HDbIm8=; b=i3MCj2M52wX8Pv
	EYypALNGiFXauaNGwuTDlY7ssQnzo4zDlB76F1CjqMaIxEt78XsFEO//4QHhf/LMzG+LTtpZ8xgRk
	SVN5pS3PnJ7H0sLL/n9qRr2kqHXDRyjJR/J8W4srL6oA38ZfMJp9t4tylhWDpTjSXjq+wWup3bH1h
	hTBxrZBoB12THL/ySdTwb6K/BdEjAY2TmRwtGjPunEyZKNqFGFYYEJY2o3XEuktRj4Rg+LzzxaXom
	1GDexYbDiaqtIaEylykH77wB31iVd6Q6qalSoBma4ZxjuwR4WrhY4unYLnTDi8zuzFk/3IfF/68UT
	d+2LQNsiQEsok6PzS2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naeaf-009E79-HK; Sat, 02 Apr 2022 14:18:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naeDS-00930Z-PD; Sat, 02 Apr 2022 13:55:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19F07614D0;
 Sat,  2 Apr 2022 13:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B648FC340EE;
 Sat,  2 Apr 2022 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648907697;
 bh=qyoPYJlSA6NEig6jnwlt/QYfSWiYQ9maXb6WEkmPDVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pe4pC/yKY++LpOsMbzFLmblnxqvaef97rOg7pqmYFTa0TzQ2wUk0tobdlEnXhYYP6
 OapS9D9YcqeZd8WESzRc8gabevqmAXQ0okpm4/wy487vIgU1tD2F91LDqSFIGhIPNX
 VrsseNh9Z2loSnoELgUELneEoe7WyDaFd7RrFiJwNznp+cT9LzFfNwoyD2G10g+GRJ
 ls87Q64Ux7e3wb6u4MiJlgOFSLroyzHBdkdqASfY2cjoLIJnyZfIR4/GKZtaGeud4r
 /ZiybISscUriO1FUrAwDhK7WvrKN9NSertkPK3IxL3+sbutxO3fOOmd3guUmHCrQE1
 5gJtBXRs58Rfg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V11 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Sat,  2 Apr 2022 21:52:56 +0800
Message-Id: <20220402135256.2691868-21-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402135256.2691868-1-guoren@kernel.org>
References: <20220402135256.2691868-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_065458_980367_E608C0A7 
X-CRM114-Status: GOOD (  10.74  )
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
index 5adcbd9b5e88..6f11df8c189f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -73,6 +73,7 @@ config RISCV
 	select HAVE_ARCH_KGDB if !XIP_KERNEL
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
@@ -123,12 +124,18 @@ config ARCH_MMAP_RND_BITS_MIN
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
@@ -406,6 +413,18 @@ config CRASH_DUMP
 
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
