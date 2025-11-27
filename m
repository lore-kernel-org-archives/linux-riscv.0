Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC66D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHjnlVMVkymkEFAxekT/bCoRiybjI6SRvRuGyYNxXZY=; b=LsZ9rxT20UFIOA
	yGbj3prO+Q3QOEZC/h0uHLasBoo9/q2mIUuz3Mhf9+g7tDcIFUuZMNNa1lNn/1rN4O4+xPreqpkpA
	tH+kSz8HInJEHspOyadqA2L7dbgHyAGp1C+i/HRG+wMJCUByD83hzvhxb9PT94B/lJnLSUBJdqLz3
	WUC5uGG2KM6J4RMiOKQSxhbUvgkFrU5YYZzLCSJutxcDI9ZwJm0Ht50QkUhUIoy5NhA/MVjiKGC9L
	xMpKM/H8xJqdmC1WRLIjaSWaMLyXa9ZwuPj/X0J99/CELql6NbueFQQ5yaFe777x7K1oXOCAh0RIS
	f6pIwAh3MqqVqxWbhn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObWF-0000000GcGy-0VZx;
	Thu, 27 Nov 2025 12:54:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObWE-0000000GcF7-0asE
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Nov 2025 12:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=Cn2qLDcM5Q0Hk7ii9P/KQYaMCaCobwGUqniWS6mOX/s=; b=GftR8W+b92ZbyxKakXQRmGYqYO
	kNp3YEHgFW1YkcVDfX0OKxNQPc0UXMJs9haMgXN6uJDZMBfA+im2uJK4sWPAvIwInmt1/XgVgMwKX
	YzcX6WnoeSSc9ZBl+xXKP3VO7PO/BiEPv14cVmEyT35L54kQosNy0cB3kRkUmF16wSPl1OXtyUhI0
	lD3/HJmxAsbMnQ1gXaibVCjY0zg5mWlveMBabN8BO19fm0RPd3ODOrsmWW3qlIVdd8leuP2FvbLDV
	lErmFXBLWHfFmH9yGccJWsXNM2878F/YH/X3sA/rbeFYWUwu8TvS2jM7Q59Xlb6gizlAlG8gO2vc/
	e1TIRjkQ==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaeQ-0000000A6Q3-0wlw
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 11:59:16 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29ba9249e9dso9652855ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 04:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248065; x=1764852865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn2qLDcM5Q0Hk7ii9P/KQYaMCaCobwGUqniWS6mOX/s=;
        b=lIbatvoVpHYdPxLeEcFxg4lX3SCiIGFbJtkvb9O+Y3hcAbFI+WAt+C6onv9OwKiMnu
         HR3F7Ny4aJk03J1McIV5XfsI7sGiHDQUBWcrp3Q7kAvAHw+ZX6hKeU+xiu5IiWEBcMeo
         TDmIrF1/7xrC0DVR2UmeJXY5W+JW+UqQEjJHogRtnZoc7VVvJeP/iqMHdCoAxpAyF3y3
         tv+qhyiDIfuOXKOfCT03+pn+kq7by0WkOSnd+ggPw2MYWnz9i9LPakFB/RcdXIg7WgJz
         AYhi/I+d7RMdxUhUp3PseBdqbdF8AT2WaYk4jmuAjgIyXWB8G7zAeAmfNkydZFy7k0GN
         EUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248065; x=1764852865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cn2qLDcM5Q0Hk7ii9P/KQYaMCaCobwGUqniWS6mOX/s=;
        b=Zks117RK3/0wk/61/kVlPb2LZa/pnD/IjnnSGw9z8aRf9BfhPyJdcGjf/zj6NJ5Gk1
         wR1y+kUzpLi3Cbwayl+j5q3KbiRBrgj2LwMUmrAanlHiizgaR8mUR6Z0RIHiG8dZrSgG
         j8qVKEf/4Y5+H+NmLHvy2bHM09p60blzvugTGK8GEawOzsKD4uqYbTaTOz5CYhVLHgc4
         bOYKUI+YlGb0/jvzd1uC5aQVp1MbLlmvhYzDtfH0bJmhJ0V7WdTXGQcbIy0D9R10H8x0
         lZNQtIy9685599OSuy0jCzyetJyFGv2pVmx6pl6B6bTKpqSWvS+w5atjlQ0KsvB26MX1
         cJWA==
X-Forwarded-Encrypted: i=1; AJvYcCV9wCdd3Yu4Bqd5k7NIF6ateVfdJMqjU5OvMQaTo60hrsWEEQSx9dNyuHzC/SvrNt+hoZNWNA+ILn7jQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1rZQKxBbTTMTb3TiOmUtbqIAgVmYWFBhIHnSxaiwHJCM7TJLH
	T+qFHsiX6vfWSQZY8SzcwLFed/DVygCbr6wk/fNZRORGr+oitKLgxomNCkj4UajcSj0=
X-Gm-Gg: ASbGncv4W8+iZMyk46t6PKdcBzV7QteK+a91G8rd8SRoGjtaHnVdl1xjjyF41oryU4C
	jEtIBzHqSx6tnRxj0hYr6AwIuh1FkCVD/36LEpPBVmzkXSZfH1XC/E7/K0dL8iKRBiKdkFtJNj3
	TxQtYk5x4BOxk4Iase5wo16qF+fwrnL3SxykL4Dvk/NBLRMoGsPjKzroTDCNL1VJcalpy2GN/D5
	MjxWTt7zISiv1xS7/4um2qveE1agdy7gBKj5yg9I+g8+t4D8aBRlpYbylxkUL0YwPNmLWyw873d
	a3HE/+OX2Vc11dGL6y42yVcRJDprQYLlWzSEOD1ucu576JlQcqSZccjt/r23If9YsKK7200lAhW
	0eN4lHq6VojpWSgwukY+dgjk0rK++HGPUlxIrP3liVV7TAvw+blELqKWsWDWPK8tIqJrgse/wcd
	7rngTHaHVPQpbpCveVjHwiSc28DN40fy5cCfL5Y1f9qgsB
X-Google-Smtp-Source: AGHT+IEAZqTGZJVNP2wrNdlYDnUqTCKW3NgeNK+bqQtAShTypNyKnPlwOxZ/5vWOPg+U1HVeecPksQ==
X-Received: by 2002:a17:902:e890:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-29b6c574f95mr278040245ad.38.1764248065275;
        Thu, 27 Nov 2025 04:54:25 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.54.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:54:24 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v3 8/8] drivers: firmware: riscv: add unknown nmi support
Date: Thu, 27 Nov 2025 20:53:05 +0800
Message-Id: <20251127125305.89961-9-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_115907_241019_AB1B43E8 
X-CRM114-Status: GOOD (  13.68  )
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

Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
event. When the system becomes unresponsive, unknown_nmi_handler()
can be manually triggered, which in turn invokes nmi_panic() to
collect vmcore for root cause analysis.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/sbi.h           |  1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 68 ++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

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
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 85aa65f31943b..d98015d1cb893 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -7,6 +7,7 @@
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
+#include <linux/sysctl.h>
 
 #include <asm/irq_regs.h>
 #include <asm/sbi.h>
@@ -16,7 +17,10 @@
 	do { if (type & (mask)) func(__VA_ARGS__); } while (0)
 
 static bool nmi_available;
+static int unknown_nmi_panic;
 static struct sse_event *local_nmi_evt;
+static struct sse_event *unknown_nmi_evt;
+static struct ctl_table_header *unknown_nmi_sysctl_header;
 static DEFINE_PER_CPU(atomic_t, local_nmi) = ATOMIC_INIT(LOCAL_NMI_NONE);
 
 bool nmi_support(void)
@@ -52,6 +56,35 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
 		send_nmi_single(cpu, type);
 }
 
+static int __init setup_unknown_nmi_panic(char *str)
+{
+	unknown_nmi_panic = 1;
+	return 1;
+}
+__setup("unknown_nmi_panic", setup_unknown_nmi_panic);
+
+static const struct ctl_table unknown_nmi_table[] = {
+	{
+		.procname       = "unknown_nmi_panic",
+		.data           = &unknown_nmi_panic,
+		.maxlen         = sizeof(bool),
+		.mode           = 0644,
+		.proc_handler   = proc_dobool,
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
 static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
 	enum local_nmi_type type;
@@ -69,6 +102,35 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	return 0;
 }
 
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
 static int __init local_nmi_init(void)
 {
 	int ret;
@@ -101,6 +163,12 @@ static int __init sse_nmi_init(void)
 
 	WRITE_ONCE(nmi_available, true);
 
+	ret = unknown_nmi_init();
+	if (ret) {
+		pr_err("Unknown_nmi_init failed with error %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
