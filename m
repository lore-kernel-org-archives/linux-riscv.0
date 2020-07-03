Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C10BC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 13:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4086720826
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 13:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kapv9qNF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4086720826
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tgTNgMQrsZSwqiG4TxEg7fyXwGwZWeH8UJA7k8KmKag=; b=kapv9qNFs6cnOHmP0BZSu5Hbmh
	OBWukVjiwfHjkR/7yhP/DrpRwJEfVo/pp4jHSoXiSps3Jmf2hyVzqFd9LgNVMFwgJHha9lgAIo8Zp
	USanSjS9SEjTKW/aUHRhc2DtPMQKsc18NSLvDtNvQ3HpFshkvZ/cgu2MBR8PTHulaCQCDkZo8zZbh
	5ljEwZ46gqjmcCLCKJGjCGhYjp/T4czhWy12uuH/I1dbonGFYlYNlx5yCfetJuTgmavGOQ6oh+CsH
	tkJAfnq5sJ+L98i7756+bksNFhkt9GTYP5+NivfYUHwi/ABnkBUqcHO2i1Zx3m/F2NM7BaOchPAXf
	HnUaYaQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrM2M-00053r-PQ; Fri, 03 Jul 2020 13:47:30 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrM2J-000531-21
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 13:47:28 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49yx971s6pzvjc1; Fri,  3 Jul 2020 15:47:22 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RESEND] riscv: Add kcov support
Date: Fri,  3 Jul 2020 15:47:22 +0200
Message-Id: <20200703134722.3232-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_094727_211994_531B06CB 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add ARCH_HAS_KCOV and HAVE_GCC_PLUGINS to the riscv Kconfig.
Also disable instrumentation of some early boot code and vdso.

Tested on QEMU's riscv64 virt machine with syzkaller.

Acked-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
Resent due to infradead.org mailing list issues.

 arch/riscv/Kconfig              | 2 ++
 arch/riscv/boot/Makefile        | 2 ++
 arch/riscv/kernel/vdso/Makefile | 1 +
 arch/riscv/mm/Makefile          | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 089293e4ad46..a7d7f8184f15 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -19,6 +19,7 @@ config RISCV
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP
@@ -57,6 +58,7 @@ config RISCV
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_FUTEX_CMPXCHG if FUTEX
+	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 3530c59b3ea7..c59fca695f9d 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -14,6 +14,8 @@
 # Based on the ia64 and arm64 boot/Makefile.
 #
 
+KCOV_INSTRUMENT := n
+
 OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
 targets := Image loader
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index e4c7c2c8a02f..c8c9e40023c6 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -32,6 +32,7 @@ CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
 
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
+KCOV_INSTRUMENT := n
 
 # Force dependency
 $(obj)/vdso.o: $(obj)/vdso.so
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 363ef01c30b1..c0185e556ca5 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -5,6 +5,8 @@ ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_init.o = -pg
 endif
 
+KCOV_INSTRUMENT_init.o := n
+
 obj-y += init.o
 obj-y += extable.o
 obj-$(CONFIG_MMU) += fault.o pageattr.o
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
