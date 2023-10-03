Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABB1E75422
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDMvQ85WbuXe9X9GBi8JtuKx74I9AUhhxdIJAhxAvDk=; b=uhR0QMmGZDVviK
	4Ub8f2BArjQ/B6t/+CL0MyRgp76ez0TfV3utw2mrRW9g4kTk9weinokV6Q0S7yKOu7FNSq2FWlQ0V
	Jq1zSZ1L40jxR3lyGYRH5o/1whTGrzOgOoip7jTqa9MacbrTOqeiIcQcUMiCcFeGUlIXB2c3tS+91
	zaxCMpWWmHD6FQFHbjX7b5pCN5PR9pXjtykLA998TeIV7PbezkHsb9cMVaEnXvSTJ78gVND6uuOzC
	MNv+8EtcaXwOlX040rTjL+YWooQTyVN31UvCGavIUn0S29lN1eYmvpUZTddncgstMmgJuFxv7AzF3
	3EEtaB74BnqIfRQul2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXHA-00Dnv3-0E;
	Tue, 03 Oct 2023 04:44:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXH7-00DnuB-0O
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:44:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso387047b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308288; x=1696913088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STPmpWfv6fDT1bub5fGqVvG8FTLSWrxke8YCaHE+OKo=;
        b=lW5uazTmVZPongrdco/pr1CPih897SeRJ70+l38m8IikPG7pkcBKhCuv3ujumasg9f
         BTwU7UHs66FRjhQILbjWQZXMWYs1IMpqQ2aZWb1K81LcuhOAzDCckSH1i8zRkHz6vY5z
         VbLb0tDhlMCHXWd3E5zLUfHHvTztwFIlsgMT65wRh22QvmHtzoo60mbfpMuALO61IvGp
         VrQErr0gufJ2vWlxd5aEUASkNevb4Ws9aeEc/WOfBnbxxBp2mD34g5kymgwOkuRdUxx6
         Q2WcLeHBCBgfx3rZVA2nSPE+V396+HDrx4anQ9MJI8YcODz1BbZmmMocqo0f4o+3RsD0
         vcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308288; x=1696913088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STPmpWfv6fDT1bub5fGqVvG8FTLSWrxke8YCaHE+OKo=;
        b=KAEtCM9yr5JYcMNgYZ3RNTDVqxiiQ1I3UWoLSuaSfjdUHKyQs2hYgTxAUu9xVFGyBZ
         s03/mFSVaBNgfjeTJY+gGfIqXF1TVS2Zyq7CzAOz31UaL9CnTNPviCoZKvp1NINy+iwq
         CNp7UAbJ+wY7HUdomoKrR/NwLFW6Fo6E9LwQW51p9t0hFVexCpL4moFgxNyyodnidZDj
         hOMgnA+xhvz7nNo5fagMlsin1CKsAHLoABZJuwxezXSR1EX6Tt+6OBpYuvaoMblS6fhg
         qDf8dv5ZUiAz4R0MN5HHJM7jzRx5fTfCp8HOwaRjHhzB5w550mT3CTU7rTqJ+QeHvNOw
         DzzQ==
X-Gm-Message-State: AOJu0Yyj5lVlWMQiQsH2IfQpngi73ef9iIC3zGZK2m7Z4iAjPDhV545C
	yVGxk6tRhkENw0zJTwJyzJcp6A==
X-Google-Smtp-Source: AGHT+IF2dmo1dKvIs9q4omK+naW5Au+dEwzuViVCk7Mt3KLduGp9n30ZoJDJqzh9tpgMQuElVmERsg==
X-Received: by 2002:a05:6a00:1503:b0:68b:eb3d:8030 with SMTP id q3-20020a056a00150300b0068beb3d8030mr15091860pfu.1.1696308288481;
        Mon, 02 Oct 2023 21:44:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:44:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 03/15] drivers: irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Tue,  3 Oct 2023 10:13:51 +0530
Message-Id: <20231003044403.1974628-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214449_156036_8C90CF97 
X-CRM114-Status: GOOD (  14.49  )
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

The RISC-V INTC local interrupts are per-HART (or per-CPU) so we
create INTC IRQ domain only for the INTC node belonging to the boot
HART. This means only the boot HART INTC node will be marked as
initialized and other INTC nodes won't be marked which results
downstream interrupt controllers (such as PLIC, IMSIC and APLIC
direct-mode) not being probed due to missing device suppliers.

To address this issue, we mark all INTC node for which we don't
create IRQ domain as initialized.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391..e8d01b14ccdd 100644
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
+		 * interrupt controllers (such as PLIC, IMSIC and APLIC
+		 * direct-mode) so we should mark an INTC node as initialized
+		 * if we are not creating IRQ domain for it.
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
