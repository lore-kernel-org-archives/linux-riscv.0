Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF576C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhkzMm1V3cvD8ZQB9JLgabcCl/VhzkyhZXT8ZhAC/lQ=; b=kQvXYIA28nP1eS
	0fMNNOFBpiPNUhUzHrkPaDflo3Kl+ILSxaN4Mz9ih8U0QaeYO0aE6Y4veo24LloqvL0NrU3AehQ93
	EB8gPGL1XH7ukJbBMS7mBoZWoFwBL/B+h8y1bpNHSTDEoCScLoYyptVpJ0KNkfPRoHHp+jqY5HRf2
	aV63GRBkg5tLDxdOTmhQeRhWILHImPG66e58jIeETXPrGGZSz/vsstQaQYbtxxumtLLh7MDLA/r4I
	hz6S1WfpHHNhaA5523afReY0XQ88L5Jo3cIxcZ+h5YOnSYPdJ6RXRNa6QeV7gpXMc75Y/5kkhCL6q
	v+M3AwUE8Aruo0ogujYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rV-000kTE-2e;
	Mon, 08 May 2023 14:29:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rT-000kS4-2E
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-643990c5319so3055585b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556149; x=1686148149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1nY2tFDgGEcA5BPTW/qPM4ksEcua9dIFA1MwwOUg+w=;
        b=Y4KeKeEH2HyNjQj1MvzsAagGgVRUdpfCpDFHN+2mKM/yIL5V4lC3/r8BWTBVPv8mr8
         crG2m3zs5hnPIFNLt92hug/24EbFLZl8MHqF6s0UAd9n57VO1wIMukU5t9t3dDPg2PRO
         sO9zoJNKGTBkOC3klDG6HaL02odtnyoCMZY6HzIpeP2+t3qrT/fC9nsHjjuQ7NCuBZj+
         aq2dtuWODDaoxaCpgUoNZGGP1z628C7yRSBp+4ZUOT0oExNHPCeb8h1cRwyar7P0p+2V
         wseYx1vo0wkd9RoXyot8Efac9RcekQ3hmC2u3e4HorVZQmu9AI0obr74p9qEtJZc0r2+
         fkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556149; x=1686148149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1nY2tFDgGEcA5BPTW/qPM4ksEcua9dIFA1MwwOUg+w=;
        b=FdS8DzesR/YU/2ZYNxDqQIe1jRfVMiQXjrIya/cH+isWj93znro2SqdSqxM/hzCGom
         Q+wLyhGd2hE1GVfLThjB+iVm+CEgYVKWqMRl2a41YRP4xavT8oSXKg0/ovoZfTqMbjJ9
         o0PypVSrfESk84RUR/MnDr8Q6CyG/QMhOJwHc598eY5XdwVjMm1+Afz4cJM27M+kstla
         70tYcjD3/AhrdZg4TwbdVEYvwjR+qZq8sQlc+NTnvYUBMOXe6OkF7ryK9Gkz0LP60OeJ
         punSEsgozXRx12XH1Xjzy8hKKGCveIpILVuDFk9M+KykLpCV++Te8gWgpZBEAB5mrHsI
         87ww==
X-Gm-Message-State: AC+VfDw/bNpK7DBt4n/rN6p/DOxwq9r3r751YFGmzZsDFTbO/cMXBxKa
	vIhXJvtdbwiCEBJuJHPl4BBBmQ==
X-Google-Smtp-Source: ACHHUZ7gDrZ3JRghPX//cMrvwquC37PoOqjAFZxHaVQQxUAxuCDyhmWrefaoupApJJIMGX/LlXhLUA==
X-Received: by 2002:a05:6a00:1503:b0:643:96e:666b with SMTP id q3-20020a056a00150300b00643096e666bmr13783594pfu.34.1683556149506;
        Mon, 08 May 2023 07:29:09 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:29:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 02/11] of/irq: Set FWNODE_FLAG_BEST_EFFORT for the interrupt controller DT nodes
Date: Mon,  8 May 2023 19:58:33 +0530
Message-Id: <20230508142842.854564-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072911_726314_EC7EA4AE 
X-CRM114-Status: GOOD (  11.66  )
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

The RISC-V APLIC interrupt controller driver is a regular platform
driver so we need to ensure that it is probed as soon as possible.
To achieve this, we mark the interrupt controller device nodes with
FWNODE_FLAG_BEST_EFFORT (just like console DT node).

Fixes: 8f486cab263c ("driver core: fw_devlink: Allow firmware to mark devices as best effort")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/of/irq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 174900072c18..94e1d9245cff 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -535,6 +535,16 @@ void __init of_irq_init(const struct of_device_id *matches)
 	INIT_LIST_HEAD(&intc_desc_list);
 	INIT_LIST_HEAD(&intc_parent_list);
 
+	/*
+	 * We need interrupt controller platform drivers to work as soon
+	 * as possible so mark the interrupt controller device nodes with
+	 * FWNODE_FLAG_BEST_EFFORT so that fw_delink knows not to delay
+	 * the probe of the interrupt controller device for suppliers
+	 * without drivers.
+	 */
+	for_each_node_with_property(np, "interrupt-controller")
+		np->fwnode.flags |= FWNODE_FLAG_BEST_EFFORT;
+
 	for_each_matching_node_and_match(np, matches, &match) {
 		if (!of_property_read_bool(np, "interrupt-controller") ||
 				!of_device_is_available(np))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
