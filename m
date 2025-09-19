Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F1FCAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9NP9fx0cwiBE0GAZg6sxAfwqaOUJkF6Zp7W/fZB8w4=; b=uzftz22zCw7Qsa
	6wDQ+JSsG48SkWbmGge3K18CfZ2y71Fp32d4+LdORzmdBH5oiDUrPKDfUufjVv66J/y8+GUashmQM
	H1MW7hvko9NHgGolxGwaFisq+VS+U1nksi0J5B3JFiRpxHQiN7jpFY0XYhplwvh0zAiWzVQLwHeB9
	MQtgqXZ3lPbhebmPqOipu9rpeFRJJkuOJxv04qWnNG4FdStQ1oKr3ZE3EHuV4omktzLfuis8H0X5b
	hRtEW9SosLOMoU5m8ME2YDTotnHB1DKN2iuyB+9QkHlDLcvELxghyKb8lLozCBBNjT9c6rwjUUkso
	br4AZ/0qSKkiVpHip7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzV7a-00000001zhs-0JyL;
	Fri, 19 Sep 2025 07:01:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzV7Y-00000001zhC-0nSP
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:01:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7728815e639so1246155b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758265287; x=1758870087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab3i3SAEiCM3mWXvINF+8OQsYTxxSN3LITXrtSETem4=;
        b=VP400ri/8w94UXVv9gLxNSvvfizjJzUpNTIHofzoVgN9rMa3oao4yrzKVd301Ekuw8
         AOxwbg+0hJxW4z19hNy9Vi+8G6YP0oPk5ph693+AHFQ8xRPFvHrIHVqOXGZUsMyxsa1F
         C0xjqOFXJdmQVug0J9V4TZYbHs5t0aTpTDaTRT5EOLpTMnXqwd5nv8bXOEoSATdJe7QX
         rGg6qdj1RuDWuyXcrceuQ1BRtzwInql+I3RQOJybgWVD9ajXaqg5nLpwKObQcFju563s
         ipleMj+m2pUIM2MS9AeDWBZ5OuGyJDPFKfRdxhc+z+2ZPXFanGpTiUoPLb6RsrybOOFE
         v1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758265287; x=1758870087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ab3i3SAEiCM3mWXvINF+8OQsYTxxSN3LITXrtSETem4=;
        b=f4cVi4833b/RJxBH97SjXpNhpwLlSRtrpg7eZr8/nz6EQYkB7M02Ecg4gRs/UzshJX
         CawuDYpBw4x5ehndDXV0+DTdSqEsrisPi5AfdIQkmNjz7xE4f0mxnzujlIxV8OmFCB+k
         S88XQMoHlp9yWCogxqIrC/SgwAPUyciAdDYgEhHrrHlHmb72DRd1ZkWqdP9wuq80qRX+
         WMprTcJh3nODT9RrPgnsnz3qai5Wfoooc3R6e4lhCAmWI7kVeyeMcQqPC24qS8WTxJdx
         A/77zeN2MB5bL0upqWRMnIWPh2tTh1dOWAqXGmZHSUGhq/Sa3pVK4NF80de6bbtG7CYJ
         3SsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxuyt7xMVjnU9+2PZ/npCIbJn0fJHf69BFc2kfCk3hyyI4ls6v/yk+uH3fse5L8RnO243pOUTrJeA4ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylxMj6e4Ntm87P4dim/8X5EqZVMaIh/vBfD2f8mjgtJermBSUH
	gAGfl64QOXDwKtnuuc7syQTgwa2AmHpcehMqpU5xpJMhh3g/shPnpZqrOOmw/Es/u8c=
X-Gm-Gg: ASbGnctkf8J6BK9hqX8P5pYJ33kjp5zjWRrMWYY3OOaC60QTePmd5LuFFe9+JlL8vsC
	cJ+8ILvOl5Im606Yb/iLq5g+MYRCu5eNdt5U0l0ubak9rh2oHUOaYSlQZCwm9cw+r0NPaffIio1
	jaGDbOrO5h0Y1GLHB7pC13JnaGG9GZYCPFSWv8kpyuzSoa19knwUPdfWIdKNIlNERZsSaDzgoiT
	76aRIFyYWVt0fvREkkW7XtMcUprUwMUFBWELs9y7wQxDzCX2dVaVCSPRL1QkMSEwSReRKbYkvMy
	ZsmbiNekv2Cg8q8OoaYjAf5+G+jxjnmm4INAuR95MK3Wkw5N5RAOjBUxkeCuxb4hhw9jwskbcjH
	IHZ9UVrMR6WRTwU0vaEB1G0knrdMjvuEkrvLlM3HN2hkPOlgGfdUO
X-Google-Smtp-Source: AGHT+IGD8AJEImnKfKuuhZhrYKTm9Rj3WupGLE/Dh4zz0ZaxRpZnsGB2qoYWsNp3E3YyLR4iv/o3eg==
X-Received: by 2002:a05:6a00:3e0a:b0:776:f8f:8ce9 with SMTP id d2e1a72fcca58-77e4ecc343cmr2714103b3a.22.1758265286801;
        Fri, 19 Sep 2025 00:01:26 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dc606e10fsm2938738b3a.65.2025.09.19.00.01.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:01:26 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	apatel@ventanamicro.com,
	cuiyunhui@bytedance.com,
	mchitale@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/1] drivers: firmware: riscv: add unknown NMI support
Date: Fri, 19 Sep 2025 15:00:48 +0800
Message-Id: <20250919070048.94646-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250919070048.94646-1-cuiyunhui@bytedance.com>
References: <20250919070048.94646-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_000128_237231_6097A35F 
X-CRM114-Status: GOOD (  18.11  )
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

Unknown NMI can force the kernel to respond (e.g., panic) when the
system encounters unrecognized critical hardware events, aiding in
troubleshooting system faults. This is implemented via the Supervisor
Software Events (SSE) framework.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/sbi.h     |  1 +
 drivers/firmware/riscv/Kconfig   | 10 +++++
 drivers/firmware/riscv/Makefile  |  1 +
 drivers/firmware/riscv/sse_nmi.c | 77 ++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/firmware/riscv/sse_nmi.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 874cc1d7603a5..5801f90a88f62 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -481,6 +481,7 @@ enum sbi_sse_attr_id {
 
 #define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
 #define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI			0x00000002
 #define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
 #define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
 #define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
index ed5b663ac5f91..746bac862ac46 100644
--- a/drivers/firmware/riscv/Kconfig
+++ b/drivers/firmware/riscv/Kconfig
@@ -12,4 +12,14 @@ config RISCV_SBI_SSE
 	  this option provides support to register callbacks on specific SSE
 	  events.
 
+config RISCV_SSE_UNKNOWN_NMI
+	bool "Enable SBI Supervisor Software Events unknown NMI support"
+	depends on RISCV_SBI_SSE
+	default y
+	help
+	  This option enables support for delivering unknown Non-Maskable Interrupt (NMI)
+	  notifications via the Supervisor Software Events (SSE) framework. When enabled,
+	  unknown NMIs can trigger kernel responses (e.g., panic) for unrecognized critical
+	  hardware events, aiding in system fault diagnosis.
+
 endmenu
diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
index c8795d4bbb2ea..9242c6cd5e3e9 100644
--- a/drivers/firmware/riscv/Makefile
+++ b/drivers/firmware/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_RISCV_SBI_SSE)		+= riscv_sbi_sse.o
+obj-$(CONFIG_RISCV_SSE_UNKNOWN_NMI)	+= sse_nmi.o
diff --git a/drivers/firmware/riscv/sse_nmi.c b/drivers/firmware/riscv/sse_nmi.c
new file mode 100644
index 0000000000000..43063f42efff0
--- /dev/null
+++ b/drivers/firmware/riscv/sse_nmi.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/mm.h>
+#include <linux/nmi.h>
+#include <linux/riscv_sbi_sse.h>
+#include <linux/sched/debug.h>
+#include <linux/sysctl.h>
+
+#include <asm/irq_regs.h>
+#include <asm/sbi.h>
+
+int panic_on_unknown_nmi = 1;
+struct sse_event *evt;
+static struct ctl_table_header *unknown_nmi_sysctl_header;
+
+const struct ctl_table unknown_nmi_table[] = {
+	{
+		.procname	= "panic_enable",
+		.data		= &panic_on_unknown_nmi,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
+
+static void nmi_handler(struct pt_regs *regs)
+{
+	pr_emerg("NMI received for unknown on CPU %d.\n", smp_processor_id());
+
+	if (panic_on_unknown_nmi)
+		nmi_panic(regs, "NMI: Not continuing");
+
+	pr_emerg("Dazed and confused, but trying to continue\n");
+}
+
+static int nmi_sse_handler(u32 evt, void *arg, struct pt_regs *regs)
+{
+	nmi_handler(regs);
+
+	return 0;
+}
+
+static int sse_nmi_init(void)
+{
+	int ret;
+
+	evt = sse_event_register(SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI, 0,
+				 nmi_sse_handler, NULL);
+	if (IS_ERR(evt))
+		return PTR_ERR(evt);
+
+	ret = sse_event_enable(evt);
+	if (ret) {
+		sse_event_unregister(evt);
+		return ret;
+	}
+
+	unknown_nmi_sysctl_header = register_sysctl("kernel", unknown_nmi_table);
+	if (!unknown_nmi_sysctl_header) {
+		sse_event_disable(evt);
+		sse_event_unregister(evt);
+		return -ENOMEM;
+	}
+
+	pr_info("Using SSE for NMI event delivery\n");
+
+	return 0;
+}
+
+static int __init unknow_nmi_init(void)
+{
+	return sse_nmi_init();
+}
+
+late_initcall(unknow_nmi_init);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
