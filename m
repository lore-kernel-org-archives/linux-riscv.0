Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D8DC02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy1fq0VuyCQxYZI1QDu9mgNX2AhJlo62srnrsy3VlOw=; b=UZWoLDwK0rzdr7
	gguRH7+k2qAvx4dkjF8yE8LjmSNUX378iyDmgmEL1IPxo3IqD/gA6Kkp9yYWBMPef7fqTCcnDGoED
	LsAMIVkooOPwaCNk2r+PYqWrJb6SXI5jGOXKxGCNJ3WNdCzHYQufcnDs/43XPggqeaTQMW4klcv+X
	XV9/9zZv0Vk4lU5l3IfLXUYs/Ds00BOuVZrm6G9iUnGBKV8+3tc6RJzHMQGioU+mL4ajkIZRdpSTm
	KhHdEqQi5VWtWIveWjH65CmENN1950mOTNfDC473flPX2d6i+4Boa8OwDDHlenHApgFrxqN8b7Hu2
	h4GR+cHYZy8qeejvxoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkI-00000005jNO-0QAV;
	Mon, 13 Jan 2025 15:52:54 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4Z-00000005Ywi-2xFO
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:09:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso6076899a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736780987; x=1737385787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA7KmP8ZbCQ+IJq/rgtrcH9RXEk5WsfJ1uvgsMI6f1g=;
        b=ADRpzyOP9RiehPkuHNukNyYtLONCm+Tpcd17dON2PHkcyxCAIhfRQvacyBvTWeaz50
         30TInzcupVKpIJOpTX2KmMd8mWUyZu3iRhCgvrSgaRI8bnLdWK/mU6PYzelWU7q44blH
         QufuI4kHs8b9wHLOrfzzKXwTgHV1yKYuY/inFsUbQeKS7fpuNSJ60SLq0u26GNX2tGo9
         h2BrF/ymoZPlu36VusMLuxkxWCG9l6bPob74JBRuDdfBYVezOkL2f62cMefjXcz+nXFz
         FOgStkSiB3MR3Q7Xych65rKXy68CMuz/k2XomLszf52HHpusZ3bBXwsIo870STWGTE+Z
         X+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780987; x=1737385787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA7KmP8ZbCQ+IJq/rgtrcH9RXEk5WsfJ1uvgsMI6f1g=;
        b=OS9XGsylbQ8jg5P4LoSNYUiudLpwWdA6dg/0YPecX4kFF9tlj7YAoUuhQjQElYgfUM
         9PXvfFX3yakcyZO+1LiZHcPnf61BX4KvjSZscoNt71vAr2gAtvHV8uLQnsl5JY8/WKMn
         SfXKgr0k25CYtygrgQMIFNnuRuWDQ0V00zFayuj56Xv67cD1mgBmP3cNnnTD+wVTaGtL
         WJRBuf8Z5TAQbHj/IfDCbrJd+3+1/MHRu8qNmlPBBvYO7+G6eHcksL7dgC4YQU3SxC/u
         PvZh5q3zBvjEk88cm9E+6LNMzxHQz+1wVtiNzF/KWSaqZG8XfcNkWj8l7PcRvZCK2m2G
         Z8gA==
X-Forwarded-Encrypted: i=1; AJvYcCVaT2O6HIPKF0IV4MfXkHm4WAJAKYuZUJ4JWOJsZj+bHUo0+OxHL2+twqzMXHaBEO6m+ua9NslkCOTv/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4wrBhG2iPpjYENWPGcT1DD+1IPR/Lrx1wNHf47EWQCv1HdimV
	JdagMBjO9w4594M2yutolk6eza5Z3JDqi6Xi6WCl3ZfZgMLNE6g7RcFcxAVYl7M=
X-Gm-Gg: ASbGnct1qHHD3SED6zDo4vmXwyyNoT19zM+DKisTJgo3PszsM8ajpDOwW0xNqgWT3cT
	mWceSg3LGh/5eiuEKBYc7kIFUn39l3y3HrlPk2WNL1HKkblCsYt/oCKk9/b9QqnlcSrou4pub+R
	nYM2PaQ+4JLATP33PbnvUFylEjSOEsi4ENZ44r3LiGyapFsW2fI/qfz+ZXo9Ry9FVQthZPTkVHN
	lPQStfCaV5l5FRz7nvIlnoK/RB6M5SziqzwDgFzc4wXnqSWft9iWoRbiFktq7LmmTPBX8VJdLUd
	5cUBA7q9MLf75/5fPha68qdZFZhSacNiG/0n9f4=
X-Google-Smtp-Source: AGHT+IHJzieMKhjl4iGkh9csBV7gdhyeugpPqTshmdPmOPggJ8E3A5U82RjvM0JQCCbIFygmdThhGQ==
X-Received: by 2002:a17:90a:d00c:b0:2ee:c5ea:bd91 with SMTP id 98e67ed59e1d1-2f548f1d783mr30239515a91.29.1736780986704;
        Mon, 13 Jan 2025 07:09:46 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26ae2fsm10193120a91.9.2025.01.13.07.09.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 07:09:46 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 1/5] irqchip/riscv-intc: Balance priority and fairness during irq handling
Date: Mon, 13 Jan 2025 23:09:29 +0800
Message-Id: <20250113150933.65121-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250113150933.65121-1-luxu.kernel@bytedance.com>
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070947_745089_2B2E8426 
X-CRM114-Status: GOOD (  12.49  )
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

Both csr cause and csr topi record the pending bit with the highest
priority. If interrupts with high priority arrive frequently within a
certain period of time, the interrupts with low priority won't get a
chance to be handled.

For example, if external interrupts and software interrupts arrive very
frequently, the timer interrupts will never be handled. Then buddy
watchdog on a buddy CPU will report a hardlockup on the current CPU while
current CPU actually can receive irq.

This commit solves this problem by handling all pending irqs in a round.
During each round, this commit handles pending irqs by their priority.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-riscv-intc.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index f653c13de62b..bc2ec26aa9e9 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -26,20 +26,40 @@ static unsigned int riscv_intc_nr_irqs __ro_after_init = BITS_PER_LONG;
 static unsigned int riscv_intc_custom_base __ro_after_init = BITS_PER_LONG;
 static unsigned int riscv_intc_custom_nr_irqs __ro_after_init;
 
+static unsigned int riscv_prio_irqs[] = {
+#ifdef CONFIG_RISCV_M_MODE
+	IRQ_M_EXT, IRQ_M_SOFT, IRQ_M_TIMER,
+#endif
+	IRQ_S_EXT, IRQ_S_SOFT, IRQ_S_TIMER, IRQ_S_GEXT,
+	IRQ_VS_EXT, IRQ_VS_SOFT, IRQ_VS_TIMER,
+	IRQ_PMU_OVF,
+};
+
 static void riscv_intc_irq(struct pt_regs *regs)
 {
-	unsigned long cause = regs->cause & ~CAUSE_IRQ_FLAG;
-
-	if (generic_handle_domain_irq(intc_domain, cause))
-		pr_warn_ratelimited("Failed to handle interrupt (cause: %ld)\n", cause);
+	unsigned long pending = csr_read(CSR_IP) & csr_read(CSR_IE);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(riscv_prio_irqs); i++)
+		if (pending & (1UL << riscv_prio_irqs[i]))
+			if (generic_handle_domain_irq(intc_domain, riscv_prio_irqs[i]))
+				pr_warn_ratelimited("Failed to handle interrupt (cause: %u)\n",
+						    riscv_prio_irqs[i]);
 }
 
 static void riscv_intc_aia_irq(struct pt_regs *regs)
 {
 	unsigned long topi;
+	unsigned long pending;
+	unsigned int i;
+
+	while ((topi = csr_read(CSR_TOPI))) {
+		pending = csr_read(CSR_IP) & csr_read(CSR_IE);
 
-	while ((topi = csr_read(CSR_TOPI)))
-		generic_handle_domain_irq(intc_domain, topi >> TOPI_IID_SHIFT);
+		for (i = 0; i < ARRAY_SIZE(riscv_prio_irqs); i++)
+			if (pending & (1UL << riscv_prio_irqs[i]))
+				generic_handle_domain_irq(intc_domain, riscv_prio_irqs[i]);
+	}
 }
 
 /*
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
