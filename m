Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D989C64EB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD642082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9P+bLwu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="w/ILh2VV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD642082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w+Fg1U8aw2dUQbkaBm0s96OdGD/D+9/Po5ezHoEZusA=; b=q9P+bLwu43NwSZCEkKl3EfPizm
	MO4ziq+Svu7EbqphAX8wzdwp5hlUa1XClssu47+9mEmF7iyVZI5voTon/FJt5xz/hIY7jWyISurGb
	h/3fkaLapZume/wG2UwLKpSNdhkJxVGDBCPPu7q5npVvoUjvfqTYXwXdRc1ssKgJ1sU+DgoY6d1Bl
	Db+ZuZR1QwRRBR9ZZgCiZDLhA/8YmQJrBuy1UBGfAC2CcCEOiy8H5nn2kWgOskmmHWPg0B0f8etEp
	s9JE0U1atiGt9k3nlE1oD4jFZZU6lcYU9McOdmPSjfwgVkqJKoXVd1fZ4hdqIKQs3KyBlwnPsCtrV
	PQbLSG1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdlG-0003rC-Ji; Fri, 30 Nov 2018 08:02:54 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdlE-0003nR-72
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 08:02:53 +0000
Received: by mail-pg1-x542.google.com with SMTP id w6so2154026pgl.6
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 00:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y8woPMXFiJ/bqS4NqZSMmewmTRycAL+/cf63Vbbt8Og=;
 b=w/ILh2VVjIvb0OZr5mEthR5pDNyfJ4RqF0CC5updn9x+yUZ5JCQFeH9LK0n2Jlw+nG
 lavR/ssF/qZdGeBR53w55ygWWcx0zKOrmofHnjani0VuFFUKM3DYIqp/bqxUqbHK69OH
 XOWfF6MQK7mHVSn6PWLUOtpkUcCZy8GLQEdEvuAfbvDJCArAc8oYbFNdi9AOA8CbiRqf
 6mVLYfVaUamIN6W+8xoqF3W+y4c4cY30gjd5fn0ARl0NK5Y9dJ7/vbHy/BdJ80/ZlJt/
 Q79Rt96aih642QXCNkGIMgxFeKUsm6t5FM5vW3B3GiU0g9XPfwZMH2XSkeR16JskCWm2
 Sk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y8woPMXFiJ/bqS4NqZSMmewmTRycAL+/cf63Vbbt8Og=;
 b=o/oYf6y8NNESo74nzIsO2JkSe8lSNJBJT8FBbMvbLqnfAYpmSgzuZ7skjw8fTevGVg
 b0i/qFZmDgG17afLi0j5lkdXNYrKfflCNnoOA8h566PBdehWv6b2dMC8lTF1TjfdbVEP
 1fCSEAkwe9wY8SJnctJiTN/k1RqLCCjgnG0GE9M6PfyG2fUJKJk0k0g5E/OZj9Pbvs6s
 Uw1MkAfCytNJ4IKkk4JgP9df0gPdGp8N48PT+78zDoT2djAAPToH/Tqc5MZ/A5mq+T/Q
 4l9nuyysweyh0hlEDdTbj4ilucYHFoYeAoG+LKeQfbUazQl2uelHd7fyB92rVtf2XUbM
 hJig==
X-Gm-Message-State: AA+aEWbYaMYrrgXw5ISskf8WXGfbr2kS0GYuqVes8ujyCs9G99pdUAno
 XGp4On0PvvuPTaj0ZpA5o3/RCw==
X-Google-Smtp-Source: AFSGD/X4AHzSy9NqZFPoML2SPGN1tycQC1cBP094GX+P9vrmXoBVGeYoFWgsJk4IhYubWnVVYh6CNA==
X-Received: by 2002:a62:5486:: with SMTP id i128mr4533509pfb.215.1543564961520; 
 Fri, 30 Nov 2018 00:02:41 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.52.208])
 by smtp.googlemail.com with ESMTPSA id
 q187sm19218333pfq.128.2018.11.30.00.02.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 00:02:40 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v3 5/6] irqchip: sifive-plic: Differentiate between PLIC
 handler and context
Date: Fri, 30 Nov 2018 13:32:06 +0530
Message-Id: <20181130080207.20505-6-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130080207.20505-1-anup@brainfault.org>
References: <20181130080207.20505-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_000252_251885_58AA75D2 
X-CRM114-Status: GOOD (  12.44  )
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

We explicitly differentiate between PLIC handler and context because
PLIC context is for given mode of HART whereas PLIC handler is per-CPU
software construct meant for handling interrupts from a particular
PLIC context.

To achieve this differentiation, we rename "nr_handlers" to "nr_contexts"
and "nr_mapped" to "nr_handlers" in struct plic_hw.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 3d4f205f8abe..17269622be21 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -70,8 +70,8 @@ static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 struct plic_hw {
 	u32			nr_irqs;
+	u32			nr_contexts;
 	u32			nr_handlers;
-	u32			nr_mapped;
 	void __iomem		*regs;
 	struct irq_domain	*irqdomain;
 };
@@ -199,10 +199,10 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!plic.nr_irqs))
 		goto out_iounmap;
 
-	plic.nr_handlers = of_irq_count(node);
-	if (WARN_ON(!plic.nr_handlers))
+	plic.nr_contexts = of_irq_count(node);
+	if (WARN_ON(!plic.nr_contexts))
 		goto out_iounmap;
-	if (WARN_ON(plic.nr_handlers < num_possible_cpus()))
+	if (WARN_ON(plic.nr_contexts < num_possible_cpus()))
 		goto out_iounmap;
 
 	error = -ENOMEM;
@@ -211,7 +211,7 @@ static int __init plic_init(struct device_node *node,
 	if (WARN_ON(!plic.irqdomain))
 		goto out_iounmap;
 
-	for (i = 0; i < plic.nr_handlers; i++) {
+	for (i = 0; i < plic.nr_contexts; i++) {
 		struct of_phandle_args parent;
 		struct plic_handler *handler;
 		irq_hw_number_t hwirq;
@@ -251,11 +251,11 @@ static int __init plic_init(struct device_node *node,
 		for (hwirq = 1; hwirq <= plic.nr_irqs; hwirq++)
 			plic_toggle(handler, hwirq, 0);
 
-		plic.nr_mapped++;
+		plic.nr_handlers++;
 	}
 
-	pr_info("mapped %d interrupts to %d (out of %d) handlers.\n",
-		plic.nr_irqs, plic.nr_mapped, plic.nr_handlers);
+	pr_info("mapped %d interrupts with %d handlers for %d contexts.\n",
+		plic.nr_irqs, plic.nr_handlers, plic.nr_contexts);
 	set_handle_irq(plic_handle_irq);
 	return 0;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
