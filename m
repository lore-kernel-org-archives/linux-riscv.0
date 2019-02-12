Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF641C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C27A214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="beeXBDSi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="clu9Clm+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C27A214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kELjD4mZ6QopsqTD+7Qe6Cwg437LRd5xUnWSGAvjB+0=; b=beeXBDSiioh31evIrq2CsktQsJ
	4Soz41KVMQ+Cvh9LS0GXvlAcs39HYouad+xZZ6LUdI3yNvTFU4TDAeZksn274tJEmpAHDj0KVumGQ
	MH3YQBuN92FCAxdIMuVDl40/icSqjU6hbPvf6oFsAqSgGIdyIBNOb1tyPgqE/v1NyYmCymBLPG6rR
	ckmpdkknMcNLa80QyzBqy0YxPRL4TXtqlFFao/BUog1etB1Gjdy5dXGCoMv2km/YHnVXhuEZAVsW2
	wLiZEdXXK0H+7UBE218cARLAKubrCz/S3AHjA00rj5X39ziyW+WiRzcQBUqOF5oasLmnUeSKwlRdY
	kvGNHIaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtXYn-0007XS-SE; Tue, 12 Feb 2019 12:53:13 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXYk-0007Ul-Oz
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 12:53:12 +0000
Received: by mail-pl1-x642.google.com with SMTP id k15so1264152pls.8
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 04:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KN7W2zftQeNZmthGr7261iLl0/Bm6gqlbkD5vYrU3Gg=;
 b=clu9Clm+93UAt2QM1XWrn1vYPSq8oKz3lHcIePW3ElbCv/vD1r/1EAYTg4Dsy8ZvyV
 PzCZ7vqUm9CIxcohKr3rfqfPZPBiNLyr9MYaqSiWF8zX9o9Kzeb00pXDXUIk+uQ+EBCF
 +Oh/zxkUTtWxZHDLdCNVbt4CivKTEBMeosjUlv8wIrXzaWiyN0zI26MRyg/OGMoiU84K
 lmDfJ6Kdqt5+hSGJg3U7R/49sSxcfwwZYCzCaKwoVLXP6n9ZeGmzQjTLQ2epB0JNxKVa
 WAuThza2V7FR07Xmco8aD1OZR5aLpGz2hx3HVz88gT9TklF6RP6Y/hGESlTNI28YJqah
 oXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KN7W2zftQeNZmthGr7261iLl0/Bm6gqlbkD5vYrU3Gg=;
 b=auQuSkDFP4+YWhVwKD2TkK4FiV8pAlA1DWUdH5rS5uPi8ybGYIXSuFsuFCjtQ9M2B9
 u5JjvZzDFS0mjuiQVpyxsQAkE5r92HBRmN9xfaCyUIw/xDWQV7NNLHjPEQMs3bCKYBxL
 vuqwnJ4WVl4NUofd6aJbNbNzhV/2XBp/VS250RU46ywNzzZYz5gWygyEj9GeqpCVl83L
 eJerDJWA6P8ns3jVqLbyRVEqMn+AeyJaNz4X4cbBdWrTkl6YK1O2dOjcslTEE2ajYADv
 6emIJxAkI77PUsGRxAweDYhjn61o4zGEdzvJLKJgyhOA9pnSDABFcO8e2nIABwBOadCy
 K5aQ==
X-Gm-Message-State: AHQUAuYdb9/JerPqNqEPw/MdbTVqZx3ffM3Ocd7lEXrSa+eR4/yz8a8/
 RX2MC595wtAQT+LYas9GlNIrLg==
X-Google-Smtp-Source: AHgI3IZXlLtSjUmye988PQqP+32ZggHZf2XeImz4rG1qXMbBln/IxB0Jf0Xl+N9odDXR/sJQCv2bCA==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr4030967plb.10.1549975990187; 
 Tue, 12 Feb 2019 04:53:10 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.205])
 by smtp.gmail.com with ESMTPSA id z67sm27894828pfd.188.2019.02.12.04.53.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 04:53:09 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v6 2/4] irqchip: sifive-plic: Add warning in plic_init() if
 handler already present
Date: Tue, 12 Feb 2019 18:22:44 +0530
Message-Id: <20190212125246.69239-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190212125246.69239-1-anup@brainfault.org>
References: <20190212125246.69239-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_045311_125232_8151EBD0 
X-CRM114-Status: GOOD (  12.74  )
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
index c23a293a2aae..da09f46fad64 100644
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
