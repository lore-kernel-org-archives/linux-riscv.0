Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BC9C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckwKhs0udQjL+R3q1No2zKxRfERvLMMqABgSNxxIePo=; b=vIQXWN6QCL6DSQ
	VJuVItTEx8uAHNgYo8rUHfr6MjqrpBO7fuGskX635TKdxRdNF2EjtNM8iOZH4XVpEOSjIkUQN6r17
	LqkgCrKUkfW4ukddMSGaYANbLnLk395zG4t8ZlmkojpnfYTbAj60g+hAz9IytIF8f6Ii6DwKxr3Us
	MItwsHCv41DEXOzL7ui8crEYFOsyYCRE4xfeWhkZdPtaR/tDeoMvjiWsa21025pcHsjN9mW3XVUYi
	xbN8hC8JqUzkg50eJy6ZIs3UsqLpBSr+EvN21CiXdXG4RkQebX62Ak7I45LPtTmvfVsvJIlLGCgOt
	8bQlm1m3SkSGv/GEV0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLM-0059bZ-3A;
	Wed, 02 Aug 2023 15:00:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLK-0059aP-1l
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:00:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bbf3da0ea9so32790685ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988453; x=1691593253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQiwHLQTp/8j8gItu3f4LCSePQxOFgN8ncFMh196Onk=;
        b=ZomLOjM+VT6Cw3N5/+aCAaLAk42zY+8L2aSAhwag6o0AC1SuBanAiEBPbWlQpjfY25
         90787ZIEmTeCxFHBMZwcKAO7Cyilf5SQQ8D1Pqols+wN9JlKhaxz3kCozc/xvoX6dr+V
         yDHcJn2LKQHDhFFpOr/O22m3nlGbPS2O/84alqq7oHQVaOAhe59yCVQF2gBtGPNmnHFU
         xiaiSXFO8ZQOt0ASrjGrT5Ba7jJREuvWSeCk0yufWxsvuECt8u429GaxJ04wZuY5us8j
         dXZ6gchBReOYyElrJbsR2O4UziIysUOhwBLkz5SDanYEwt+N/p//aU29xEPe4/zitSAo
         Tgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988453; x=1691593253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQiwHLQTp/8j8gItu3f4LCSePQxOFgN8ncFMh196Onk=;
        b=XUZxS8O8qO6aRsow7ngeWNWDjeIOlKxF4qYE8GjlitQBVM6DFfotjomn0hfa1qmlGy
         vwhp49HatN5Xl7tWQj7k6m1UO1VvQXu5wsXRd4Qlr5G+TGeUAUUGVtYrcl2kQDtiiDTb
         yA1s0a2MtvT6+46SahHqYJrekgQsI+3A0Iado+tlZWJ4S3qkXujhoZRhsXZkR3dfDGUR
         wsz1QtQmjOl+/BcWcQlenfdIuqn8SXaeR30qiRQOM+m9xMxoBYkkuMhF4d9Ez4DDnfte
         TXxi5+PAzV9L8znRe1FQ1u4JDkg0p1tjj4Ht8b4XEWk10oWlpslsvySsXE9OIWdWSb2l
         hpSg==
X-Gm-Message-State: ABy/qLY0ni+L/NV8ueFSnWi+d3Q3afH5goEs14Nz7K0BWV9lffh+q0Se
	bpiHK+c7jFTEXNRdq0yp4fQeBQ==
X-Google-Smtp-Source: APBJJlFB0C5d4eEtvQpqPpM4k4lWMlz5Q7YpzR1VjeZ8GawMXDnCiEPox11VwWBk/t89yzZF66RyGA==
X-Received: by 2002:a17:902:8216:b0:1b8:c6:ec8f with SMTP id x22-20020a170902821600b001b800c6ec8fmr12525721pln.46.1690988453272;
        Wed, 02 Aug 2023 08:00:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 03/15] drivers: irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Wed,  2 Aug 2023 20:30:06 +0530
Message-Id: <20230802150018.327079-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080054_582600_9F2BE821 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V INTC local interrupts are per-HART (or per-CPU) so
we create INTC IRQ domain only for the INTC node belonging to
the boot HART. This means only the boot HART INTC node will be
marked as initialized and other INTC nodes won't be marked which
results downstream interrupt controllers (such as IMSIC and APLIC
direct-mode) not being probed due to missing device suppliers.

To address this issue, we mark all INTC node for which we don't
create IRQ domain as initialized.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 65f4a2afb381..4e2704bc25fb 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -155,8 +155,16 @@ static int __init riscv_intc_init(struct device_node *node,
 	 * for each INTC DT node. We only need to do INTC initialization
 	 * for the INTC DT node belonging to boot CPU (or boot HART).
 	 */
-	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
+	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id()) {
+		/*
+		 * The INTC nodes of each CPU are suppliers for downstream
+		 * interrupt controllers (such as IMSIC and APLIC direct-mode)
+		 * so we should mark an INTC node as initialized if we are
+		 * not creating IRQ domain for it.
+		 */
+		fwnode_dev_initialized(of_fwnode_handle(node), true);
 		return 0;
+	}
 
 	return riscv_intc_init_common(of_node_to_fwnode(node));
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
