Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD60CE79A7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 22:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+WYZgDW1hJVPHFonKFcomQ6ifLAd43Gv6yan0KOX44=; b=HtV3+TWMZFr0lw
	PGDk3ZBAWbwyCluj2BIbTKGlO03jIKFYw1Lpzyn1VtTeCaHBOG1kWo3Ff19CeqsK4aANaPZfginBN
	GcCs1Kl1jZvY1piAwGOX0YdyVfNGlbZ7ggJUBo8Pel2ZvW+ono4nALAerAnR1uKTjYx+PSyA08a44
	PjqOQ44m5+SAemmIQJkLtUFYbnoz/S8rGl62n2LQG8J44aalsvzr9HM0LsxtgB0iYPiQ/rG7J15xn
	hSGZ9NlQdedcwJ29Jhzmnt4XEATMq+EyV5CVEPYcWLDZKPYSgS3NqjXTAh9a08t8EDg3p75dkJHEG
	k9oBhpz9WN7oXxpti8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuHt-00F9xI-1J;
	Mon, 25 Sep 2023 22:42:45 +0000
Received: from bg2.exmail.qq.com ([114.132.197.227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkuHq-00F9wc-0m
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 22:42:43 +0000
X-QQ-mid: bizesmtp62t1695681747tvn9b2gn
Received: from linux-lab-host.localdomain ( [116.30.124.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 26 Sep 2023 06:42:25 +0800 (CST)
X-QQ-SSF: 01200000002000E0Y000B00A0000000
X-QQ-FEAT: QityeSR92A0MQJVv5nuCC9DWB6NqRLzb0Nt00+7+ZdZFXtQd+tI7WSyL9WNOC
	fnkFG8BxSL4z+x4KtcNrcR8seOIuPOURUulAxrpJmjQqP1LnskZEYIQeAh7TqLbJQrlD4li
	3VuACOa9fnkngcsF3KIGbIynUc0D2IWpUdjKYODzIYUXgIz+zmPiduG6OYqUjSeaFRhNVQi
	R0HbuNW/24Z5vZZir3noOwSkUHoulzJ2+O4FYOOXwupxn1hyjRia4sJ2NT5RJM4nXc0e8Iv
	7hAGFtYtbhAxrGb58x8hDMLmYTvcInpLmnftQdn3m6DI7DS6SGVCJU/ULhGp1PpyhutLM3N
	Q/G4gGWqnZP9rqGdHPsdsDiBO/RURWwjE7Drreilih2jBFRvf5O1ZdfOFTpH5AMIwzf0aLr
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2348411404682298682
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
Subject: [PATCH v1 6/7] DCE/DSE: riscv: add HAVE_TRIM_UNUSED_SYSCALLS support
Date: Tue, 26 Sep 2023 06:42:23 +0800
Message-Id: <ce00dad5acdd4aff099b289843e30c83f7e31764.1695679700.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_154242_590388_0B2885FD 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

For HAVE_TRIM_UNUSED_SYSCALLS, the syscall tables are hacked with the
inputing unused_syscalls.

Firstly, the intermediate preprocessed .i files are generated from the
original C version of syscall tables respectively, and named with a
'used' suffix: syscall_table_used.i, compat_syscall_table_used.i.

Secondly, all of the unused syscalls are commented.

At last, two new objective files sufixed with 'used' are generated from
the hacked .i files and they are linked into the eventual kernel image.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/kernel/syscalls/Makefile | 37 +++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..b5e726b49a6f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -140,6 +140,7 @@ config RISCV
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_TRIM_UNUSED_SYSCALLS if HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/syscalls/Makefile b/arch/riscv/kernel/syscalls/Makefile
index 65abd0871ee5..3b5969aaa9e8 100644
--- a/arch/riscv/kernel/syscalls/Makefile
+++ b/arch/riscv/kernel/syscalls/Makefile
@@ -3,8 +3,45 @@
 # Makefile for the RISC-V syscall tables
 #
 
+ifndef CONFIG_TRIM_UNUSED_SYSCALLS
+
 CFLAGS_syscall_table.o        += $(call cc-option,-Wno-override-init,)
 CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
 
 obj-y                += syscall_table.o
 obj-$(CONFIG_COMPAT) += compat_syscall_table.o
+else # CONFIG_TRIM_UNUSED_SYSCALLS
+
+include $(srctree)/scripts/Makefile.syscalls
+
+CFLAGS_syscall_table_used.o        += $(call cc-option,-Wno-override-init,)
+CFLAGS_compat_syscall_table_used.o += $(call cc-option,-Wno-override-init,)
+
+obj-y                += syscall_table_used.o
+obj-$(CONFIG_COMPAT) += compat_syscall_table_used.o
+
+# comment the unused syscalls
+quiet_cmd_used = USED    $@
+      cmd_used = sed -E -e '/^\[([0-9]+|\([0-9]+ \+ [0-9]+\))\] = /{/= *__riscv_(__sys_|sys_|compat_)*($(used_syscalls)),/!{s%^%/* %g;s%$$% */%g}}' -i $@;
+
+$(obj)/syscall_table_used.c: $(src)/syscall_table.c
+	$(Q)cp $< $@
+
+$(obj)/syscall_table_used.i: $(src)/syscall_table_used.c $(used_syscalls_deps) FORCE
+	$(call if_changed_dep,cpp_i_c)
+	$(call cmd,used)
+
+$(obj)/syscall_table_used.o: $(obj)/syscall_table_used.i FORCE
+	$(call if_changed,cc_o_c)
+
+$(obj)/compat_syscall_table_used.c: $(src)/compat_syscall_table.c
+	$(Q)cp $< $@
+
+$(obj)/compat_syscall_table_used.i: $(src)/compat_syscall_table_used.c $(used_syscalls_deps) FORCE
+	$(call if_changed_dep,cpp_i_c)
+	$(call cmd,used)
+
+$(obj)/compat_syscall_table_used.o: $(obj)/compat_syscall_table_used.i FORCE
+	$(call if_changed,cc_o_c)
+
+endif # CONFIG_TRIM_UNUSED_SYSCALLS
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
