Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703C5C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5E5214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="naLzs6dH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Yo59uPbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5E5214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gWRnVcyiWT6UQ5roJZpaiCu3Yw9WRVpIH9no9QSvZzg=; b=naLzs6dHO3NH+LTvY33gFK4Hev
	PFtPa/2p5IPnKs29Rd6G21lO+XPUR01+YlN/o2OIN8GKpj2GnaUtvakOy1/Fy9g56uRFibFx9Od3+
	+1uWPx5Ms12XOZ3AUkG7LX0BWrS9lsOAgLmyXlnfesW4xZL7T1oIHkWhC/oYClPeenshekMQvQhi5
	yaqMUyzyz4uM9tKjZJq2aGBI1uGCcKeiutouPsIG+p7ygWj/fdgsne3miPRnWtcx3/pVYSGpmmLuz
	y2u0CMIRoWKFJJ8ltWR0ElnNc6E4c/KyQLIbTjRq7MZs+7fzUM0ny7tFEv0YE5B3Um+qAKWbfEB9x
	4xuoNWWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcTgv-0001uP-FC; Thu, 27 Dec 2018 11:19:05 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcTgt-0001oE-0z
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 11:19:04 +0000
Received: by mail-pf1-x443.google.com with SMTP id 64so9034451pfr.9
 for <linux-riscv@lists.infradead.org>; Thu, 27 Dec 2018 03:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QPq/o0R9ggNlb2oMRGbkSeTpgM0rzBY83T9WPQ+nWrg=;
 b=Yo59uPbkTm9SD+5pdmZ9lP2fnSUyBZoPxA9s9sXRsD+bXFsq2OpX1UGgalJre/PPrH
 cJ3I1nj1g+yzMjjmpckYPP3FYKhZIDIW+DTgHTqnctPT28xIQuPPyQgbgIpqvXwAnqZT
 gl6Tkio30HoAVY7uyXrJllGTTdhGrpunF35YJgVwz4uoeKorUJT7JdI68AkTB4ZxLzRF
 VgdfOvdiQet9jrG/p4XJ+Y8wwyCUUqhuLav6pSm6xJqV7oUYEwbXP/ZARzdZMpMi4K/2
 z71YvBGbaDho9bbVBFtOXPcFpQi+bW5zYYQ2fhN2Xel/0CaQFXPNyA/Qw8nHVfSilrgg
 Sq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QPq/o0R9ggNlb2oMRGbkSeTpgM0rzBY83T9WPQ+nWrg=;
 b=izJibyx9AIfnQWSUx7udZzgxZAR5q5WdMcp9VYzIJHOk1xQxg5My+cu9VtqTVgJ8YZ
 J4jd2+R0sKaQfgOTSn+510P/k0rkubjG5Tp9UkNiQkiTF50aFjmCUoS3ChppZ1ZnlMMV
 RpwOfkoSQQt04fk8SwFVGB0CNVbCJwmJyZprmuXeBO5qzkwWsIoTtDV6kqpDQpBEKPT8
 HZacOy30/YYGjc1x8LLWE9AkRQz+Xa/rSrCG8u4f26ylw2IW/ihpQFKIYS1ZWquisq3R
 sS1bH6MQN6+cr6jf3Ip95H5BQiowNMAvWOJKRuph24NO9Dm3FnKL958uIInQ+KeykpE8
 wJLg==
X-Gm-Message-State: AJcUukcpduWPycFLiHvRVzFRZ1jSej9rzjGRGBOjM6N4/4MY/XTKdd5l
 akCNxR4Mg8lGGy7IOmuTj4Ytbu463+Q=
X-Google-Smtp-Source: ALg8bN4bGjriTsgY8zh/M4PwKlWb+svWCY81ikwiyxUr4j0/Yi39ATET734Y2OTyaLIc0utXCX+qTQ==
X-Received: by 2002:a63:cc12:: with SMTP id x18mr22086304pgf.33.1545909532096; 
 Thu, 27 Dec 2018 03:18:52 -0800 (PST)
Received: from localhost.localdomain ([106.51.18.57])
 by smtp.gmail.com with ESMTPSA id u137sm66830105pfc.140.2018.12.27.03.18.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 03:18:51 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v4 3/5] irqchip: sifive-plic: Add warning in plic_init() if
 handler already present
Date: Thu, 27 Dec 2018 16:48:19 +0530
Message-Id: <20181227111821.80908-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181227111821.80908-1-anup@brainfault.org>
References: <20181227111821.80908-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181227_031903_066838_DEC19CAE 
X-CRM114-Status: GOOD (  12.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We have two enteries (one for M-mode and another for S-mode) in the
interrupts-extended DT property of PLIC DT node for each HART. It is
expected that firmware/bootloader will set M-mode HWIRQ line of each
HART to 0xffffffff (i.e. -1) in interrupts-extended DT property
because Linux runs in S-mode only.

If firmware/bootloader is buggy then it will not correctly update
interrupts-extended DT property which might result in a plic_handler
configured twice. This patch adds a warning in plic_init() if a
plic_handler is already marked present. This warning provides us
a hint about incorrectly updated interrupts-extended DT property.

Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 01bbbbffbcae..b9a0bcefe426 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -229,6 +229,11 @@ static int __init plic_init(struct device_node *node,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
+		if (handler->present) {
+			pr_warn("handler already present for context %d.\n", i);
+			continue;
+		}
+
 		handler->present = true;
 		handler->hart_base =
 			plic_regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
