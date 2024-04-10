Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0E5CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYw4BUr/gEQurM4NlgDIhjUdAfYutvjJy7bGGaU19NY=; b=CWl7+MRyayvpK3
	qAU8IjpviaE2CzDYpuMlv4ey09X3gLjHJvzLbcQLXd7SMUWNBcscRgK3XgfFmOseid+pE0Fi2bb/C
	8qaXDfLW7sdOshHw+SxtB9FDJpoFKY3BcSWc8g/g4un2UM4FnMqssLGfqJ8s5ObDAH1wWs4m6L58Y
	97jZJjXERg+CEwF+mvwlrDZNfqAsXGVSQw/qRKyWCKhisZDN/StCkwC8iSAwg4cPpmilVxCEy46l/
	pVNSDkL3gLmQCbkhd1e6AHU0KNDSSRI4m9DwZlNHvTL8Un2i+K8nZX2l+klLVDo2wbRJJSKQENrxt
	rmniJVEBb3nE9RVhQK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYl-00000005Prs-2h9X;
	Wed, 10 Apr 2024 06:35:51 +0000
Received: from smtpbg153.qq.com ([13.245.218.24])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRYh-00000005Pj2-31st
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:35:50 +0000
X-QQ-mid: bizesmtp86t1712730896tvu5ywkv
X-QQ-Originating-IP: r0h3XHYT18sT2yt8k08GzNHSk4HTIBc66vnGcRK0aQI=
Received: from HX01040082.powercore.com.cn ( [14.19.197.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Apr 2024 14:34:49 +0800 (CST)
X-QQ-SSF: 01400000000000B09000000A0000000
X-QQ-FEAT: 3M0okmaRx3i4lw8jCv5pRZ7eo/gTlSNfqfJCPj1K7jvvSLIS40Dayz+ynQ2CK
	68XPUeRpihraguLeHHDc5Ady/t6uyuXAWz9D0gg08WMVpbdPkCpxYKWJ46mJRHekC77N4gq
	7eHNphwxlOOSmvR2iEiuWYHe1bWWaBuubSPXEHA6DPiBfdt3120CrKvB/FuppwIth/AlOjS
	oFwQiLyd9wlMT9+VRqYsS3NnEVUFosFvo0XnHfuqQgp0Zb4hqrYhdgWwiRTMtD7xAbfEE5m
	bGVsfo39affMyu2danRjhIP67B8TMJhHRq6ayu2OELnse0uQUCL+Lwhn7xyMu/iCKGMk6Wn
	3QQEsF2X2a7p3pGnrxGxJnV+PYquzqxiGgxiyrleUUh0ZOEu3nBrpuo4Hqz5nmix/+o/0ex
	zlZ6ECdTLx9zkkKO+eIghg==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 10304416365381800906
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: [PATCH 2/3] riscv: SBI as the interface for the early console
Date: Wed, 10 Apr 2024 14:34:31 +0800
Message-Id: <20240410063432.23058-3-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
References: <20240410063432.23058-1-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_233548_664940_D668BEB6 
X-CRM114-Status: GOOD (  13.82  )
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

Use the SBI interface as the early console output interface
for the RISC-V platform.

Signed-off-by: Jinglin Wen <jinglin.wen@shingroup.cn>
---
 drivers/tty/hvc/Kconfig         | 12 ++++++++++++
 drivers/tty/hvc/hvc_riscv_sbi.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index c2a4e88b328f..48658d2b700c 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -118,6 +118,18 @@ config HVC_RISCV_SBI
 
 	  If you don't know what do to here, say N.
 
+config RISCV_EARLY_CONSOLE_SBI
+	bool "Use SBI as the interface for RISC-V early console"
+	depends on RISCV
+	help
+	  Choose 'Y' to use the SBI interface as the early console
+	  output interface for the RISC-V platform.
+
+	  This configuration is a temporary setup for debugging
+	  purposes during the boot process to address issues as
+	  early as possible. It should not be enabled in production
+	  kernel.
+
 config HVCS
 	tristate "IBM Hypervisor Virtual Console Server support"
 	depends on PPC_PSERIES && HVC_CONSOLE
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index cede8a572594..6686dcf62853 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 #include <asm/sbi.h>
+#include <asm/early_console.h>
 
 #include "hvc_console.h"
 
@@ -81,3 +82,31 @@ static int __init hvc_sbi_init(void)
 	return 0;
 }
 device_initcall(hvc_sbi_init);
+
+#ifdef CONFIG_RISCV_EARLY_CONSOLE_SBI
+static ssize_t (*sbi_early_putc_common)(uint32_t vtermno, const u8 *buf, size_t count);
+
+static void sbi_early_putc(char c)
+{
+	unsigned int termno = 0;
+	int count = -1;
+
+	if (c == '\n')
+		sbi_early_putc('\r');
+
+	do {
+		count = sbi_early_putc_common(termno, &c, 1);
+	} while (count == 0 || count == -EAGAIN);
+}
+
+void __init hvc_sbi_early_init(void (**putc)(char c))
+{
+	if (sbi_debug_console_available)
+		sbi_early_putc_common = hvc_sbi_dbcn_tty_put;
+	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+		sbi_early_putc_common = hvc_sbi_tty_put;
+
+	if (sbi_early_putc_common)
+		*putc = sbi_early_putc;
+}
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
