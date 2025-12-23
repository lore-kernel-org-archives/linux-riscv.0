Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA82E6F092
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ynLzRECs0SqNvd3S7grs29WRjnzmQSoBj4pgmJtVHc0=; b=e13ijaJjYEIHgQ
	UGm7LRgcRpUgGHXiwEl8SK+GpY54yNDN5VLSRi2KAy7ofOkArIGOaa7xT216k2kn2tJy9/X8isnf8
	BQ5MSY+TRkgcScu/PyKk573FjsvOWt6qqC1cBFqb/HJJewTp2zOCjESnfstI0wXnw5Xjdob21oTXf
	YFB7MnIm4sIpiDdqj5Fs2dFlnokZtmRqQWDSqzdBirQtn7CLmNu7JTL6XNLuSPvRKz6NFWUn6X5DV
	iSULrf/mj7xVxkHfJxymsYq0YKYF/Sgj5wYhPeSfBmWfXpX8WcjaVjuyAUgUjrCpI+eEr2KFNuEd3
	jJYROpLleNFvvrUn0tfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2n8-0000000FYiv-1nzC;
	Tue, 23 Dec 2025 13:51:10 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2n6-0000000FYiP-0pef
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 13:51:09 +0000
Received: from ipservice-092-208-105-009.092.208.pools.vodafone-ip.de ([92.208.105.9] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@kaiser.cx>)
	id 1vY2mn-003sEJ-2z;
	Tue, 23 Dec 2025 14:50:49 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] riscv: trace: fix snapshot deadlock with sbi ecall
Date: Tue, 23 Dec 2025 14:50:06 +0100
Message-ID: <20251223135043.1336524-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_055108_249312_F3EDF137 
X-CRM114-Status: GOOD (  10.35  )
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

If sbi_ecall.c's functions are traceable,

echo "__sbi_ecall:snapshot" > /sys/kernel/tracing/set_ftrace_filter

may get the kernel into a deadlock.

(Functions in sbi_ecall.c are excluded from tracing if
CONFIG_RISCV_ALTERNATIVE_EARLY is set.)

__sbi_ecall triggers a snapshot of the ringbuffer. The snapshot code
raises an IPI interrupt, which results in another call to __sbi_ecall
and another snapshot...

All it takes to get into this endless loop is one initial __sbi_ecall.
On RISC-V systems without SSTC extension, the clock events in
timer-riscv.c issue periodic sbi ecalls, making the problem easy to
trigger.

Always exclude the sbi_ecall.c functions from tracing to fix the
potential deadlock.

sbi ecalls can easiliy be logged via trace events, excluding ecall
functions from function tracing is not a big limitation.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/riscv/kernel/Makefile | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 9026400cba10..cabb99cadfb6 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -3,12 +3,6 @@
 # Makefile for the RISC-V Linux kernel
 #
 
-ifdef CONFIG_FTRACE
-CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
-CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
-CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
-CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
-endif
 CFLAGS_syscall_table.o	+= $(call cc-disable-warning, override-init)
 CFLAGS_compat_syscall_table.o += $(call cc-disable-warning, override-init)
 
@@ -24,7 +18,6 @@ CFLAGS_sbi_ecall.o := -mcmodel=medany
 ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
-CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
 endif
 ifdef CONFIG_RELOCATABLE
 CFLAGS_alternative.o += -fno-pie
@@ -43,6 +36,14 @@ CFLAGS_sbi_ecall.o += -D__NO_FORTIFY
 endif
 endif
 
+ifdef CONFIG_FTRACE
+CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
+endif
+
 always-$(KBUILD_BUILTIN) += vmlinux.lds
 
 obj-y	+= head.o
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
