Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1284CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTg9QjaQdFVzfIACOnR1jg8PwEFUghT0q5LDjQajr38=; b=dT2uA6wjMzm5TI
	eSdWAJ1kvDiTSFzSldhQ1J7hK+imdo9KDrYT1hzE6Q7ue1q2k/fa++QIVzhfyHEXR0JWjAwAWcwnI
	29NP7Y/HExZ03MpQR2OdK/h6EotylHCg0SzeIuiHp4sW5FGqXZ9rbzMYGwa9l280fjzmp6TWkFUdS
	S0imcJVmaBZTkTnz1F16JWm6O59EHcmcYG/zppd/RQdM9Y+yuNPpkifTTT82o5r+sqzTMW/PtrsEA
	ESf2B+H/DrMC5sNPCn6ibZbyvvEMo8F2J6xsry9N6yv49u0zLhE8HpSsUyxAEtOSN7wDrbjOkZPQu
	dMQ2riqC+cXdrEjwAh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNN9-0000000E3lH-3lsI;
	Mon, 27 Oct 2025 13:34:55 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNN6-0000000E3jY-3GsH
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:34:54 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso3343810a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761572092; x=1762176892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Odjt5uwfHY3ZdJdP98Hf6WpyJ1jiYTTMXBvSsOEEh3w=;
        b=aTQfvxFspw4cl+FOkEYVbcJOdpPbsuX7EtsbbHW25DaTSQLpgh+w8a+RKsc9Q/DP6g
         nPLfA8DJMYnm6ncgrDGnknUXIZxn9WbahhOXwZ3KYcHfkBjhtCygbykC2WAvWa5xAzqR
         JMwB/US+E6tS59/O0X3ake/b86SnfYD5Ljj9uTj4Ra85z5C1c88BQJkAJ43HyAB3LSQ4
         UH1KAsZx4JF+2PEgBdxemev5UyGI1RHf4Ghm71JSDJ3SLFdcE+/cIUzJPR3HxJITx5Rr
         VMWYdb7ELzWHC+3NWK2Cx5FxJ61DO7UVLLNW2rHOG6A5x8IPiHym72tQcAVZr0EuOJDc
         C/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572092; x=1762176892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odjt5uwfHY3ZdJdP98Hf6WpyJ1jiYTTMXBvSsOEEh3w=;
        b=fa0Ul/aWrKB79pVr3DrROFBOUlo9odYYegQgwpX+ZQmDFojAOl8HqJLGA8uS5RBwXN
         vMGwHrF2TPPNLMgdLa71NLgwu1NnSakI+CFLd+Lty6l8ZG5AatUWloPFzijvYrpvNoFH
         Mk9Hea2kF9kRF/oMg34k3BOPrDdZAkZzLrCfP8sRrSN791Rk47749ObXr6mmUbHP5vLJ
         L4UKAeQ8gmzVAz3IqRODgUSOfWM0fFp/T7dzaK46gCNLWxnnfxdRbpIxvZXWX4uQqh0T
         OIDs7QEKUMhUmmFpFur+vb7R+PC+iWOGAnXS9j8DRrDVVpZKdHmD5ZXCBdZSNCq9wfrW
         nuKw==
X-Forwarded-Encrypted: i=1; AJvYcCWjn7dMRJfT7pPuWpGW4XzvqWGM+QleWdekcsyMaJRiNsKzBwDCk7on5mVVumHLipkORVjd+fabPq4enw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9dtQ+krAHonlBXeLv/y9/k58DXkhohlRGB7m9h0l+F+DE0/G8
	lqmVHNEHIExZEoVp+QFLiSVAl9BLyFcIa0wzbm4DbbTqyOcTVw8XPOi17YSHW3emmao=
X-Gm-Gg: ASbGncuIAkGk8NXper4iQisrwOaZPzdEEdTnFAFAeMjxMARE6GNpLEs3mPR16q2LrZe
	LcE+u2clrCAeosEAnE4jVWLwaAelPRJnA7HxZdSE2R3eWivtQ6wR6NIAFe0HecHUinSr+Ocwoaa
	Spy+dLD0Je67am5SrczlEL6V1ovXse5aTAEuToyjlohZCP6oHWApa1AcpPDP0bq703y8jjGGzGO
	U5WDSIVBecsjxVQHh8LD5UYyxthrid6UcNJyQCWO/9SC8Ip+YRJo4ChunNp+9lJcs/5U7mKAh8V
	JrPDjGMb9RZKsADItGw4JA8YrtQptDBgyiAE6fTgYM8p32ZkNSBGBJc7xfX9deUM1miCifVPAH4
	xt0qMrMqli66rgtBHcdf74luzpi5rJaiLCaDBXT0p/fVjCyeH6afcPJeB4ZpAXVtLZCKWAVYIDE
	vTlOUdUlMPwzWbD93JvPqX+VHhoLAjkrB2dyJqzn11me1V
X-Google-Smtp-Source: AGHT+IFne5ygW7GikNTE03OCk2Tf1awZTN7o9D47u9Fff1p6EABVNldt8hq5taNPKjC6COMH28Qghw==
X-Received: by 2002:a17:903:22d1:b0:27e:ec72:f67 with SMTP id d9443c01a7336-2948b957623mr161838015ad.6.1761572091789;
        Mon, 27 Oct 2025 06:34:51 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42558sm82144935ad.69.2025.10.27.06.34.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 06:34:51 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	apatel@ventanamicro.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	songshuaishuai@tinylab.org,
	bjorn@rivosinc.com,
	charlie@rivosinc.com,
	masahiroy@kernel.org,
	valentina.fernandezalanis@microchip.com,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com
Subject: [PATCH 1/3] drivers: firmware: riscv: add SSE NMI support
Date: Mon, 27 Oct 2025 21:34:29 +0800
Message-Id: <20251027133431.15321-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251027133431.15321-1-cuiyunhui@bytedance.com>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063453_360902_879BBCB4 
X-CRM114-Status: GOOD (  18.57  )
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

Add support for handling Non-Maskable Interrupts (NMIs) through the
RISC-V Supervisor Software Events (SSE) framework. Since each NMI
type(e.g., unknown NMI, etc.) requires a distinct SSE event, a newfile
sse_nmi.c is introduced to manage their registration and enabling.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 MAINTAINERS                      |  7 +++
 arch/riscv/include/asm/sbi.h     |  1 +
 drivers/firmware/riscv/Kconfig   | 10 ++++
 drivers/firmware/riscv/Makefile  |  1 +
 drivers/firmware/riscv/sse_nmi.c | 81 ++++++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+)
 create mode 100644 drivers/firmware/riscv/sse_nmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8bf5416953f45..6df6cbec4d85d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22057,6 +22057,13 @@ S:	Maintained
 F:	drivers/firmware/riscv/riscv_sse.c
 F:	include/linux/riscv_sse.h
 
+RISC-V SSE NMI SUPPORT
+M:	Yunhui Cui <cuiyunhui@bytedance.com>
+R:	Xu Lu <luxu.kernel@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/firmware/riscv/sse_nmi.c
+
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Guo Ren <guoren@kernel.org>
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 874cc1d7603a5..52d3fdf2d4cc1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -486,6 +486,7 @@ enum sbi_sse_attr_id {
 #define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
 #define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
 #define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI		0xffff0001
 #define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
 
 #define SBI_SSE_EVENT_PLATFORM		BIT(14)
diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
index ed5b663ac5f91..fd16b4c43cf01 100644
--- a/drivers/firmware/riscv/Kconfig
+++ b/drivers/firmware/riscv/Kconfig
@@ -12,4 +12,14 @@ config RISCV_SBI_SSE
 	  this option provides support to register callbacks on specific SSE
 	  events.
 
+config RISCV_SSE_NMI
+	bool "Enable SBI Supervisor Software Events NMI support"
+	depends on RISCV_SBI_SSE
+	default y
+	help
+	  This option enables support for delivering Non-Maskable Interrupt
+	  (NMI) notifications through the Supervisor Software Events (SSE)
+	  framework. When enabled, the system supports some common NMI features
+	  such as unknown NMI handling.
+
 endmenu
diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
index c8795d4bbb2ea..ecf2b31935d9c 100644
--- a/drivers/firmware/riscv/Makefile
+++ b/drivers/firmware/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_RISCV_SBI_SSE)		+= riscv_sbi_sse.o
+obj-$(CONFIG_RISCV_SSE_NMI)		+= sse_nmi.o
diff --git a/drivers/firmware/riscv/sse_nmi.c b/drivers/firmware/riscv/sse_nmi.c
new file mode 100644
index 0000000000000..2c1eaea2bbabc
--- /dev/null
+++ b/drivers/firmware/riscv/sse_nmi.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#define pr_fmt(fmt) "SSE NMI: " fmt
+
+#include <linux/nmi.h>
+#include <linux/riscv_sbi_sse.h>
+#include <linux/sysctl.h>
+
+#include <asm/irq_regs.h>
+#include <asm/sbi.h>
+
+int unknown_nmi_panic;
+static struct sse_event *unknown_nmi_evt;
+static struct ctl_table_header *unknown_nmi_sysctl_header;
+
+static int __init setup_unknown_nmi_panic(char *str)
+{
+	unknown_nmi_panic = 1;
+	return 1;
+}
+__setup("unknown_nmi_panic", setup_unknown_nmi_panic);
+
+const struct ctl_table unknown_nmi_table[] = {
+	{
+		.procname	= "unknown_nmi_panic",
+		.data		= &unknown_nmi_panic,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
+
+static int unknown_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
+
+	if (unknown_nmi_panic)
+		nmi_panic(regs, "NMI: Not continuing");
+
+	pr_emerg("Dazed and confused, but trying to continue\n");
+
+	return 0;
+}
+
+static int unknown_nmi_init(void)
+{
+	int ret;
+
+	unknown_nmi_evt = sse_event_register(SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI, 0,
+					     unknown_nmi_handler, NULL);
+	if (IS_ERR(unknown_nmi_evt))
+		return PTR_ERR(unknown_nmi_evt);
+
+	ret = sse_event_enable(unknown_nmi_evt);
+	if (ret)
+		goto err_unregister;
+
+	unknown_nmi_sysctl_header = register_sysctl("kernel", unknown_nmi_table);
+	if (!unknown_nmi_sysctl_header) {
+		ret = -ENOMEM;
+		goto err_disable;
+	}
+
+	pr_info("Using SSE for unknown NMI event delivery\n");
+	return 0;
+
+err_disable:
+	sse_event_disable(unknown_nmi_evt);
+err_unregister:
+	sse_event_unregister(unknown_nmi_evt);
+	return ret;
+}
+
+static int __init sse_nmi_init(void)
+{
+	return unknown_nmi_init();
+}
+
+late_initcall(sse_nmi_init);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
