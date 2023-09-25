Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A771FE6FE31
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feJCgwH5tNYJU1N3L6y1yo/t5e/gEpNPiejjze98x68=; b=VLb8uTo5id8xqB
	T2iyXn22eEKn3yC/uh/ZIDh+xLFcVJH3R2SMEIE7mw6OTZOrhZ+71u930zSb3wpp/mTtiQ2AIkhJb
	xw7vvHifjPxxVVTsqA/mUhUccgzt5hxVkNq32yUrZlo/vMArbnYgXbWBio3U7CWwXqaHaLIh/p10k
	wHN6HDoePcXSAmFn3ir0FBsd2Fq6ipVHnO1Re1zmyw5WprUMMtJNTjKMThnFs2rmeHiN9EZ7XnCrQ
	QwgrMY9CwqEjaOz29EhtWUdLBlrol333eySw7YoaWgYS/L0orRqSDT0Ck9NH1mRI1E3NrdNsoBy43
	oxEjmiZ8hLDc6pMAUXqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuGq-00F9ox-0A;
	Mon, 25 Sep 2023 22:41:40 +0000
Received: from bg2.exmail.qq.com ([114.132.197.227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuGn-00F9nb-30
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:41:39 +0000
X-QQ-mid: bizesmtp64t1695681678tnvf3nwx
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:41:16 +0800 (CST)
X-QQ-SSF: 01200000002000E0Y000B00A0000000
X-QQ-FEAT: 3M0okmaRx3gfsSflpNrVeZ3sLICSqSaF1U3sraXTLgAlViLSauDfSqqDtpoNW
	SpJ9yhtzh6PzBUapWeOX0uRrrOAx/YDjuGcAV/ElqISXdLVJrgKYLDHpCpA9o8pTr1UJmAp
	TZpLJKkg5BgsLqXJA7AyPqGQd4uo4wJ9kG/PcrwaYQDKWoXQAHmyI48DbJyB9TrgDn6MwV1
	xAbDs/bktubgubuWpp3z5BZzxdTfsdxIyMEd653QAHjXk0VSw0QgkTt/ZwID4tddHr20MU5
	IBenNgCrBRJGf1SYzfyD/v+sJ8AofWpCIgALXUucwYI6Z1XoKE8OaZJ5OVSdOUqOPo7jhE0
	8L83kEBlrjALbS9Xe1VQFAawPyge85zIGnGGzgYOddDAkAAqjslJdveiZm9lYGNaojrQbrE
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2541803507469492191
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: falcon@tinylab.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v1 5/7] DCE/DSE: riscv: move syscall tables to syscalls/
Date: Tue, 26 Sep 2023 06:41:16 +0800
Message-Id: <c10a50ff232a15897d3036ccd7af3d6f9aa8ee29.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_154138_291874_0D656C03 
X-CRM114-Status: GOOD (  10.65  )
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

Both syscall table and compat syscall table share some dead syscalls
elimination code, to avoid cluttering the main RISC-V kernel Makefile,
let's move these tables and the corresponding compile settings to
syscalls/.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/kernel/Makefile                             |  5 +----
 arch/riscv/kernel/syscalls/Makefile                    | 10 ++++++++++
 .../riscv/kernel/{ => syscalls}/compat_syscall_table.c |  0
 arch/riscv/kernel/{ => syscalls}/syscall_table.c       |  0
 4 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kernel/syscalls/Makefile
 rename arch/riscv/kernel/{ => syscalls}/compat_syscall_table.c (100%)
 rename arch/riscv/kernel/{ => syscalls}/syscall_table.c (100%)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 95cf25d48405..40aebbf06880 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -8,8 +8,6 @@ CFLAGS_REMOVE_ftrace.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
 endif
-CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
-CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
 
 ifdef CONFIG_KEXEC
 AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
@@ -48,7 +46,7 @@ obj-y	+= ptrace.o
 obj-y	+= reset.o
 obj-y	+= setup.o
 obj-y	+= signal.o
-obj-y	+= syscall_table.o
+obj-y	+= syscalls/
 obj-y	+= sys_riscv.o
 obj-y	+= time.o
 obj-y	+= traps.o
@@ -95,7 +93,6 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 obj-$(CONFIG_CFI_CLANG)		+= cfi.o
 
 obj-$(CONFIG_EFI)		+= efi.o
-obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
 obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
 
diff --git a/arch/riscv/kernel/syscalls/Makefile b/arch/riscv/kernel/syscalls/Makefile
new file mode 100644
index 000000000000..65abd0871ee5
--- /dev/null
+++ b/arch/riscv/kernel/syscalls/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for the RISC-V syscall tables
+#
+
+CFLAGS_syscall_table.o        += $(call cc-option,-Wno-override-init,)
+CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
+
+obj-y                += syscall_table.o
+obj-$(CONFIG_COMPAT) += compat_syscall_table.o
diff --git a/arch/riscv/kernel/compat_syscall_table.c b/arch/riscv/kernel/syscalls/compat_syscall_table.c
similarity index 100%
rename from arch/riscv/kernel/compat_syscall_table.c
rename to arch/riscv/kernel/syscalls/compat_syscall_table.c
diff --git a/arch/riscv/kernel/syscall_table.c b/arch/riscv/kernel/syscalls/syscall_table.c
similarity index 100%
rename from arch/riscv/kernel/syscall_table.c
rename to arch/riscv/kernel/syscalls/syscall_table.c
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
