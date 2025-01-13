Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D23C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+n55JTuWrFFMDKaD6oj7CmHjXEUny7V7e6ActswL+A=; b=a3ERU7t5cCymP5
	XV9ON0uXhFk3y7F6bkOuYTsyooxCehHg84iRn6P8ufb5LUK6dugflVtVxhnWKwvHztQ4U/RtP/YON
	bQ7NV5M6BYdD2U+N7wRLPgjd/VLoHi+/Wpwwbn241LWbL3OgZmsl0Vi8i5CDUfuHbekROfjzsD60N
	gNwBrYDt5tgloyjKCIuVTsOq77nE+Me7IBSBW5S15CRh8eX9YtLJcY7O5eIw2X/kVQ+PYkwQvW6NJ
	WU9Ly9PXUe8MjoOWmAZr4Q0ceSAEhVR8CqH/R3UewIAtfjWxGt7VjAYMuorTSiV+1z/gwkZvnI+NZ
	1WEk0SG0kTVRjs2TDvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkJ-00000005jOO-1QWI;
	Mon, 13 Jan 2025 15:52:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM4d-00000005Yy8-3LQ9
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:09:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f441791e40so5836994a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736780991; x=1737385791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tAG6GJW3MF21Mh57oZZANqeC7wGfZvAtMDVyVUp1HU=;
        b=Lb0punTOZ+03BrzaPZy4bJHsoV2e9+paQhrP2PbYLRq7gJkyFLDPiLB9TBPtREsQj8
         KNcktzyAMSnqEM6wb1270skw8FYLO6cBy5Ib+8snCBGEiHTAKJRRXh/agRRtYQG7WJ/x
         cDR/BV5w4baXEW7jFmCB2U39pLwX2N6IvlBrykdevkgg6oTz0uMpkrR2BqYWz9hs636b
         2vbJKbS+zJcr0JHq4qRbD62S0uN04Bg5vztkxhMwdfVON23FOnS9VY22MrfCxA/my0UW
         KMIQc47ou27/yXOn3Ms1PrCxRDpfO7HmnmlnxYNCNh2MqEmVWOJ/TlUHI6vbr+V+K7mj
         3Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780991; x=1737385791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tAG6GJW3MF21Mh57oZZANqeC7wGfZvAtMDVyVUp1HU=;
        b=FQ4EoYdZooodYCRvCubylKOhhtua59gSDXpLfY5KX5P7w220MSf0xXzTCEfqMcghN4
         Tzm3dkOZwaHR3Yiz5WuYhQUSfws/NNa8n4TKD8MyRhsM8DDkBvSr8ivQVNw7tkZrNc67
         s+6ID1sww6R92syhBR1dKMwZG5b27/r5GUB31UUhC1yzl37+bwuA5gp2yrPmz4Mai9hl
         /A0v+LidH53Nm29cpodFspptWYu7lUYsdubEv8n8ByhkytQyJao4G1S5NfO7MYao+Yyq
         GyZiULVDTDaCucPpu1+f7wHqfw727Ki3k+O20+IghRtG1Zm0GHj1U1W7Hmwz4ajdgCHl
         wNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi9IjnMqgK2JsdxFbmPReST49cGKzLFQmmkJ2hMrjxZdaUtYNwEjtWBFVLQiWo5wbh3Xcl1Wy4ueFCbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl0mfFdlgPxV3CgdV4DJGS1Rq+8qlyt/zcy+Cr0fMs9k4BLKSR
	Iu1jVEv+tjIU+h3G9bx+gn6DErWhlK0cQmb3c+Ej32S68wPUSADstWjGzIm0A3A=
X-Gm-Gg: ASbGncurJdXljLpEyoEnGwXnHi05wRW9v4GrOYVDMn+gmTp4asfvQvc7fXLd/g7veLT
	xPhQ412+h37BzdwZC71/lc16Tu1vrCrp2E3O54ufT8xzwafy+J1rGMNbFvrGAt10p5GUY2WGb1r
	SiqTaCRSzWp37UiiTQGS7zxAm5hd+53LUCsg4i1ha+UtGCDITqyVaAXNC9qFC5F4D7fZ8K7ghFx
	zu6IE6dxc/udPS5ru+OAf7YRHPCfZj/z8xH4Pvxsm59ytMrMRIgkS5qXUe/jV6uEV3IlmaBhQUl
	lvYg6aTX0CU8kPdlN2Sy+oI2aiozmpchmLP8lF0=
X-Google-Smtp-Source: AGHT+IGkg/B5xoLgr4lXkJUxodnWnKzHEdv4YVq9gdKarJbd4P8kwx5YFz8lMmYv1IPj3sNvze9Thw==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:d024:e4e2 with SMTP id 98e67ed59e1d1-2f548f0feffmr32200664a91.7.1736780990816;
        Mon, 13 Jan 2025 07:09:50 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26ae2fsm10193120a91.9.2025.01.13.07.09.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 07:09:50 -0800 (PST)
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
Subject: [PATCH 2/5] irqchip/riscv-imsic: Add a threshold to ext irq handling times
Date: Mon, 13 Jan 2025 23:09:30 +0800
Message-Id: <20250113150933.65121-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250113150933.65121-1-luxu.kernel@bytedance.com>
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_070951_831949_3B577AC8 
X-CRM114-Status: GOOD (  11.48  )
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

RISC-V's external irq has higher priority than software irq, timer irq
and pmu overflow irq. In existing implementation of IMSIC driver, If
external irqs keep arriving within a certain period of time, no other
interrupt will get a chance to be handled.

This commit solves this problem by introducing a threshold to the number
of times imsic interrupts can be processed in each round.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 31 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f..63097f2bbadf 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -20,6 +20,8 @@
 
 #include "irq-riscv-imsic-state.h"
 
+#define IMSIC_HANDLE_THRESHOLD		20
+
 static int imsic_parent_irq;
 
 #ifdef CONFIG_SMP
@@ -76,6 +78,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	int err, cpu = smp_processor_id();
 	struct imsic_vector *vec;
 	unsigned long local_id;
+	unsigned int handled = 0;
 
 	chained_irq_enter(chip, desc);
 
@@ -85,21 +88,23 @@ static void imsic_handle_irq(struct irq_desc *desc)
 		if (local_id == IMSIC_IPI_ID) {
 			if (IS_ENABLED(CONFIG_SMP))
 				ipi_mux_process();
-			continue;
-		}
-
-		if (unlikely(!imsic->base_domain))
-			continue;
-
-		vec = imsic_vector_from_local_id(cpu, local_id);
-		if (!vec) {
-			pr_warn_ratelimited("vector not found for local ID 0x%lx\n", local_id);
-			continue;
+		} else if (likely(imsic->base_domain)) {
+			vec = imsic_vector_from_local_id(cpu, local_id);
+
+			if (unlikely(!vec))
+				pr_warn_ratelimited("vector not found for local ID 0x%lx\n",
+						    local_id);
+			else {
+				err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
+
+				if (unlikely(err))
+					pr_warn_ratelimited("hwirq 0x%x mapping not found\n",
+							    vec->hwirq);
+			}
 		}
 
-		err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
-		if (unlikely(err))
-			pr_warn_ratelimited("hwirq 0x%x mapping not found\n", vec->hwirq);
+		if (handled++ >= IMSIC_HANDLE_THRESHOLD)
+			break;
 	}
 
 	chained_irq_exit(chip, desc);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
