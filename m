Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34194C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0oNtCaAZuQSlQqmwSZnOsy7TmG3HJ2fr0tN2qVLCxk=; b=e7+TmgtKbmYZ1d
	6R3cxQRCHD6C1biHbwmNrAYf7B+0SPmqVUqu523lv8iWvlXRqJkPbrw6tdN7qsETzDfqXNFl4ge/K
	Xuij4Wq7AMuW+4/ioKeslgI4ftxKFJ2MrKVef8raOZVf4b80DWi9YYHsEqzueWycz6SjcQVhaPmi2
	XaxRy8jCLYWztAljxq1JhJdRYUYX51bja+oGfjEvV4WUR38FbK10jcB/Hgurh9mDHlXkoaYyPix1C
	GTtVf0nHru5Auyw5yDXaOTpgkOLL9oL50EM1cm3zI4JPZsVTpQ+QNl5EiYU5MyWeovXscwPbGg/SW
	IjNhYNOBM2O+hc1wmLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7o-007aGU-KS; Tue, 21 Dec 2021 16:36:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7l-007aCl-Q6
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 560D66168B;
 Tue, 21 Dec 2021 16:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DBDC36AEA;
 Tue, 21 Dec 2021 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104585;
 bh=j5BMG/TlqJiS3H88CCcEO/YtNAJlUD2an1CKTCwrVQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z7Ah1c3xM04iiNkRDzJp2uJVpNvC6tg64M0I0MlmMf5NA0Aw8idG4DSy1RXB7pWHi
 bCwFoUMWucI9zeFijSY6WekCMibm8n9RYH7MoDjSqZEcx8gdSmsDzVRiWw2E4WlShz
 KTBEvThGy7ulrgAk1xDX29kj5VGle2+wO13SdWxUV1VSXG//4985CCTgEWDPS71Iuu
 jIfDhTtBkFjXSrvIuWySEkh8ZM9HESTtVlOJasS7t2zp4d1ivfhVNmLijUv9I+2IyY
 sn7z8zFz3Jo9vb+WV/4XOU1EOMAB+oOFe/L+72ErEJc/kaXAFlEJqXTxmQz6viYRj+
 kFXPnI4TtUlPQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 09/13] riscv: compat: init: Add hw-cap detect in setup_arch
Date: Wed, 22 Dec 2021 00:35:28 +0800
Message-Id: <20211221163532.2636028-10-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083625_961684_F385F638 
X-CRM114-Status: GOOD (  13.11  )
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

Detect hardware COMPAT (32bit U-mode) capability in rv64. If not
support COMPAT mode in hw, compat_elf_check_arch would return
false by compat_binfmt_elf.c

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/elf.h       |  5 ++++-
 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/kernel/process.c        | 22 ++++++++++++++++++++++
 arch/riscv/kernel/setup.c          |  5 +++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 37f1cbdaa242..6baa49c4fba1 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -35,7 +35,10 @@
  */
 #define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
 
-#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+#ifdef CONFIG_COMPAT
+extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
+#define compat_elf_check_arch compat_elf_check_arch
+#endif
 
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 9544c138d9ce..8b288ac0d704 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -64,6 +64,7 @@ extern void start_thread(struct pt_regs *regs,
 #ifdef CONFIG_COMPAT
 extern void compat_start_thread(struct pt_regs *regs,
 				unsigned long pc, unsigned long sp);
+extern void compat_mode_detect(void);
 
 #define DEFAULT_MAP_WINDOW_64 TASK_SIZE_64
 #else
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 9ebf9a95e5ea..496d09c5d384 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -101,6 +101,28 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 }
 
 #ifdef CONFIG_COMPAT
+static bool compat_mode_support __read_mostly = false;
+
+bool compat_elf_check_arch(Elf32_Ehdr *hdr)
+{
+	if (compat_mode_support && (hdr->e_machine == EM_RISCV))
+		return true;
+
+	return false;
+}
+
+void compat_mode_detect(void)
+{
+	csr_write(CSR_STATUS, (csr_read(CSR_STATUS) & ~SR_UXL) | SR_UXL_32);
+
+	if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32)
+		return;
+
+	compat_mode_support = true;
+
+	pr_info("riscv: compat: 32bit U-mode applications support\n");
+}
+
 void compat_start_thread(struct pt_regs *regs, unsigned long pc,
 			 unsigned long sp)
 {
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b42bfdc67482..be131219d549 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -12,6 +12,7 @@
 #include <linux/mm.h>
 #include <linux/memblock.h>
 #include <linux/sched.h>
+#include <linux/compat.h>
 #include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/of_fdt.h>
@@ -294,6 +295,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
+#ifdef CONFIG_COMPAT
+	compat_mode_detect();
+#endif
+
 	riscv_fill_hwcap();
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
