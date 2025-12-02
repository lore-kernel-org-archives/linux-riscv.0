Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C53ACFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcnyOMxNWRj5wBKcSleie5Px46b5O3gx4hhTLO8pY8w=; b=4mKKRLzIR57TH8
	yp1eHesbdQzl8sndvX6a9LobOlIf7tFloIwwWMaqyZfGcbXoiQ1RqMGLxg9SL78JvefEgmdWuM8fD
	k3RnJpPINuleeqaKspTl0jiO+vsxqekXY4KQqEObaR+TWtZXh0ckWSat5KVVldcUUqJGQnqIjOJ70
	JXbcBjV4PEg+sEILejMEGwE14Rr5eyeCY4gOR4prGiETRwrJ650c6PFyzAXtPGVl0gQla1oIybcX9
	04aKPxKF8itMOW4UDgnsgbaeOFSrGLe7BhZYmg31KLnzCVfBKxsugGtXrdX92ni/ScAOIxgnY0vrn
	q4rVw++n/uUXtPFHY8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJS3-00000004sO2-1Yea;
	Tue, 02 Dec 2025 06:01:27 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJS1-00000004sNV-2C6N
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 06:01:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso7091573a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 22:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764655285; x=1765260085; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+0bwtwpEeyVYpmofwpoipaViqDC4tDJleo3CtFrHJI=;
        b=PlfSEpkfO6X5FYKCSivT1nKgPxkyTQ+cfJ7Nny7feN/Y40kx67rlJihBiVPDDqMSUl
         OUFlJHDNaIiK2IU1zZKM+PKjx5taww0o1Z3kZB6D5fanLF16q4B7cuCbwZ/vPTiILU3O
         Up6TTVVDu7v3JGDMWqWIlwuVXkZy//stPr122cg1lDi98I7AGTrXoSN6t+p+FZTl47fX
         EDWrXAusFlmpL0mpt0q2IxtW6XeNUdBI2oovGhRvvqN5Q0jhy0yziY/KY+L6lfkxf1Rz
         Tmw4/pZUiOgQqkjvG9O7ZN5IeeLLYbjUqHfG7ZwbW/SL2ZzEayF9MbTbCduPE5YjtFIH
         9LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764655285; x=1765260085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+0bwtwpEeyVYpmofwpoipaViqDC4tDJleo3CtFrHJI=;
        b=PEGw+oGiJMuuaF6UH2poqFhI48PbSWYRRMd7zchGjoqPlilin+AMelVswEn/00L/1z
         zXSm//MITRScE/xs+930+Et6RtSk4aq6vT8ByoJTmR4bqImo9EKwNcp6w7LGEUml93U8
         nCp78INN6ADW6jeuRIABik7eFfKowYJN4uvn+cIzuLzBC16T7ezcwOrR368shEQQc2rG
         04U2BmlSbUt23LMEJWdvtR24FBV+GHqnWm1QbUO2h33Z4rqew/IAlZ0QNQVoDFc3o09D
         7dKnlFFtX2Kh/ZAbWoP5wvk0gCGtWdgINx1TsPvNPN2Xp+LdKCsR831iRMpKsenh+sxb
         fV+g==
X-Gm-Message-State: AOJu0Yyt0Gw6hCyodOjNSx4EOqJIEr9xHut1neCM8ZUY+Ci6IHewZYic
	SieK+c/v5doUmhy3Gjm0V/1gNMHXZRYWanumceFDTryE2hlgJeiU+F0HDXep1idVDwo=
X-Gm-Gg: ASbGncs9ZlwMf+y2R8G7InmhgJes0Onj2v7wPsjVJwmrywzxXxB+qufw8MPhLRS16lU
	9bAEgtUDgFWRg3zbjE7qS1EQ/3myv50LOPtL6mkdZqi+rOE/Vv33X4lM+JtcCJpoz2VyKEQp5ZK
	SGjeJ2eI6SNNtuhzi9abS9tyGzwcVt5fjpH+WLfGshHx5pJuEo92ICnee0YmQ42xtWwFCPrPG5r
	h97pkBKXb4NEx3iyHlhwo3td8GiFz6gP33fl8+N5bm/cpWnyHxxBsUlHMsaG9QsnJ+/6nFdU0Zh
	XTSc0oo3ZPEoFFddQXDF2DY6AHZ0tlvJifHlp2a5dEO1Wl8NXmGSony9NXHyc7hsVlmZr4GNFsY
	5fTmJpRnJI0nVqi8yI2cqe/0hhKX3BIh51O4qQWIjvdptQNydhrmWFC/IkIdx47U9sT8h2aGju5
	h9LuOLLIyQ
X-Google-Smtp-Source: AGHT+IEnfEWG66It067xSAX9BxgaSPW2cyBqDhkU4hrpj7sZyUsCv1ote9pGTUAbus8Lyv4F4oawAg==
X-Received: by 2002:a17:90b:3841:b0:343:6d82:9278 with SMTP id 98e67ed59e1d1-34733f36040mr37615818a91.30.1764655284576;
        Mon, 01 Dec 2025 22:01:24 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a547483sm19083810a91.4.2025.12.01.22.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:01:24 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Dec 2025 14:07:40 +0800
Subject: [PATCH v3 1/2] irqchip/riscv-imsic: Add a CPU pm notifier to
 restore the IMSIC on exit
MIME-Version: 1.0
Message-Id: <20251202-preserve-aplic-imsic-v3-1-1844fbf1fe92@sifive.com>
References: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
In-Reply-To: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Cyan Yang <cyan.yang@sifive.com>, 
 Nutty Liu <liujingqi@lanxincomputing.com>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_220125_567733_DF67E742 
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

The IMSIC might be reset when the system enters a low power state, but on
exit nothing restores the registers, which prevents interrupt delivery.
Solve this by registering a CPU power management notifier, which restores
the IMSIC on exit.

Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 39 ++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 2c4c682627b8cc81ad51a98a1f341aa506d649ac..d1727c343c38f6f88a25b3327aaa080c1cfe3078 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/cpu_pm.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
@@ -128,14 +129,8 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int imsic_starting_cpu(unsigned int cpu)
+static void imsic_hw_states_init(void)
 {
-	/* Mark per-CPU IMSIC state as online */
-	imsic_state_online();
-
-	/* Enable per-CPU parent interrupt */
-	enable_percpu_irq(imsic_parent_irq, irq_get_trigger_type(imsic_parent_irq));
-
 	/* Setup IPIs */
 	imsic_ipi_starting_cpu();
 
@@ -147,6 +142,18 @@ static int imsic_starting_cpu(unsigned int cpu)
 
 	/* Enable local interrupt delivery */
 	imsic_local_delivery(true);
+}
+
+static int imsic_starting_cpu(unsigned int cpu)
+{
+	/* Mark per-CPU IMSIC state as online */
+	imsic_state_online();
+
+	/* Enable per-CPU parent interrupt */
+	enable_percpu_irq(imsic_parent_irq, irq_get_trigger_type(imsic_parent_irq));
+
+	/* Initialize the IMSIC registers to enable the interrupt delivery */
+	imsic_hw_states_init();
 
 	return 0;
 }
@@ -162,6 +169,22 @@ static int imsic_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static int imsic_pm_notifier(struct notifier_block *self, unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case CPU_PM_EXIT:
+		/* Initialize the IMSIC registers to enable the interrupt delivery */
+		imsic_hw_states_init();
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block imsic_pm_notifier_block = {
+	.notifier_call = imsic_pm_notifier,
+};
+
 static int __init imsic_early_probe(struct fwnode_handle *fwnode)
 {
 	struct irq_domain *domain;
@@ -199,7 +222,7 @@ static int __init imsic_early_probe(struct fwnode_handle *fwnode)
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_IMSIC_STARTING, "irqchip/riscv/imsic:starting",
 			  imsic_starting_cpu, imsic_dying_cpu);
 
-	return 0;
+	return cpu_pm_register_notifier(&imsic_pm_notifier_block);
 }
 
 static int __init imsic_early_dt_init(struct device_node *node, struct device_node *parent)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
