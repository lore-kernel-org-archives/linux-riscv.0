Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D5C636D7
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 00:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbyEi2Luo8xcMstN/6SSvnzEwrRgLBleYvTX0bhSX7s=; b=ZTQvzVSqmRoEmO
	ZBK4GTzUtrKNUDLTQwZ5+cMSYL8/Jawt0rAxzb5GcggzQ21uL7WamB/kq54GtneKd3tZI4UYExjJV
	ncVwZMYMwCbz5XTMJHqa+qWjm0zrYs+rp6fjJ/ibQappPkeE4GAeCvNmTs16cyEfEa9UNjkVCKyq6
	8lEJRHmMSHuz9NYp9vzQj27aCW6R+DtZ28PLkBE3Z9ApBBANpb4YBH9kleqcqPzjv1fhDxzM0Znr4
	hiYJ5MKG2GW0WCDU45I9bPcU8Uhh/IjREArQJC37iWjsFucjwHamOleHUYDEiBojFXWJDF+W9I4Im
	qdzHwMqtYLOPtaSpI+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxQ-00CFgu-M6; Fri, 17 Feb 2023 00:50:36 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxI-00CFcI-O1
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 00:50:34 +0000
X-QQ-mid: bizesmtp76t1676594981tzj20bxn
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Feb 2023 08:49:37 +0800 (CST)
X-QQ-SSF: 01200000000000C0T000000A0000000
X-QQ-FEAT: HH6/KuQOBEYape0K7eNPpGClNte1p9KwHz5G63svXw4+DTBNwFMoPpE5XUhx6
	05cCvEABd10oan5cv3LUnUMcUAHqyNqZq4+jTSCoUmilAXTQ9duURc8/ruw7SY6oor0tBev
	RoFEB3fWfD1W8TD67x5MtiQ+DjwwcYO78oT04ndKAyzBOChBjxfUcAYeQ4FX5k0S5OoK8Ox
	gFEhgXjlsxlrY99cZIG/3rP3A79PqE/96cPTSu6w0R+hXn7r4u9vMv+S2yzV/ofwTvSCq12
	zwDKb63xgVmxw+JXjn9VgOf31CWsu7Tgnd7untYTG8+Nkyy+99r1iatC9zrXPQh7OdEa1UY
	DB2saWPTsE8kVbMerbuqMOpDMVViphDIwHBwBVQOPZPg8P/98pX6ELE5xO/vKjwq+wBju5K
	sOzMCFPNoHQ=
X-QQ-GoodBg: 0
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Willy Tarreau <w@1wt.eu>,
	Paul Burton <paulburton@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nicholas Mc Guire <hofrat@osadl.org>,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 2/5] MIPS: Add dead syscalls elimination support
Date: Fri, 17 Feb 2023 08:49:22 +0800
Message-Id: <29e5a037ac439c40970b40692286feb6f010f8f3.1676594211.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676594211.git.falcon@tinylab.org>
References: <cover.1676594211.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_165029_409382_DAB92FCE 
X-CRM114-Status: GOOD (  11.02  )
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

By enabling CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION and setting
CONFIG_SYSCALLS_USED, It is able to remove the left 'dead' syscalls.

For example, if setting CONFIG_SYSCALLS_USED="write exit reboot", a
'used' variant of the *.tbl will be generated, accordingly, the kernel
api unistd_nr_*.h and syscall_table_*.h will be generated from the
'used' *tbl variant. the user api version of unistd_*.h is reserved
as-is.

Here is a test result on qemu with a minimal malta config.

                    | mipsel malta    | config
    ----------------|-----------------|-------------------
            vmlinux | 5041628         | https://pastebin.com/0bE2ibLD
      + gc-sections | 4474060 (-11.2%)| CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
    + syscalls_used | 4265280 (-4.67%)| CONFIG_SYSCALLS_USED="_newselect"
    + syscalls_used | 4274364 (-4.46%)| CONFIG_SYSCALLS_USED="write exit reboot"

notes:

- The shrink ratios of the syscalls_used lines are based on the
  gc-sections line.

- "write exit reboot" are used by a hello.c to simply print "Hello,
   World!", exit and shutdown qemu.

- "_newselect" is used by rcutorture to do a long-time sleep.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/mips/Kconfig                  |  1 +
 arch/mips/kernel/syscalls/Makefile | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 15cb692b0a09..868d9a871b3e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -102,6 +102,7 @@ config MIPS
 	select TRACE_IRQFLAGS_SUPPORT
 	select ARCH_HAS_ELFCORE_COMPAT
 	select HAVE_ARCH_KCSAN if 64BIT
+	select HAVE_SYSCALLS_USED
 
 config MIPS_FIXUP_BIGPHYS_ADDR
 	bool
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index e6b21de65cca..8ffba5301cf0 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -26,10 +26,30 @@ sysnr_pfx_unistd_nr_n32 := N32
 sysnr_pfx_unistd_nr_n64 := 64
 sysnr_pfx_unistd_nr_o32 := O32
 
-$(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
+ifdef CONFIG_SYSCALLS_USED
+syscalls_used := $(shell echo $(CONFIG_SYSCALLS_USED) | tr -s ' ' | tr ' ' '|')
+endif
+
+ifneq ($(syscalls_used),)
+utbl := arch/$(SRCARCH)/include/generated/tbl
+_tbl := $(src)/syscall_%.tbl
+ tbl := $(utbl)/syscall_used_%.tbl
+
+$(shell mkdir -p $(utbl))
+
+quiet_cmd_used = USED    $@
+      cmd_used = sed -E -e "/^[0-9]*[[:space:]]/{/(^($(syscalls_used))[[:space:]]|[[:space:]]($(syscalls_used))[[:space:]]|[[:space:]]($(syscalls_used))$$)/!{s/^/\#/g}}" $< > $@;
+
+$(tbl): $(_tbl) $(objtree)/.config
+	$(call cmd,used)
+else
+tbl := $(src)/syscall_%.tbl
+endif
+
+$(kapi)/unistd_nr_%.h: $(tbl) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
-$(kapi)/syscall_table_%.h: $(src)/syscall_%.tbl $(systbl) FORCE
+$(kapi)/syscall_table_%.h: $(tbl) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_n32.h			\
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
