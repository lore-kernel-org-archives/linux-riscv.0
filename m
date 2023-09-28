Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACFACE7AFD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDMvQ85WbuXe9X9GBi8JtuKx74I9AUhhxdIJAhxAvDk=; b=bk/nY8NWBZ+41O
	i0y8Q8UWlFCPF1Ns5D154z4BVr52F2/ypLN2+OcyRp9UuJXiBaob9nzlVcJhEb9VraAUWJRCbrjmQ
	DkNDNm17JjYXPBo4jlaTV1Z7WHTMTs4NNzxpb9o0rNnF6QN1CR0VLAB4+kSrA/aLSnMldAeZFT9QN
	MeDt7ic4GXbJfTxjzFgl6TFvTnR8FOlezDENRpyse/Iy9/KSbD8CEPGQItia5RnLlcfshGWaH/zo9
	Wk83yUENKZx56tc3+f84O1wqAHpOC1EBh6vw0EqNo6s3pS8x/0Oq8AsFLh+fRecGtGb7wZungwauZ
	Bfm6Cpufts4WZwc6YdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGY-002Lim-2Z;
	Thu, 28 Sep 2023 06:12:50 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGW-002Lhg-0x
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:12:49 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-34deefc2016so37521005ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 23:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695881567; x=1696486367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STPmpWfv6fDT1bub5fGqVvG8FTLSWrxke8YCaHE+OKo=;
        b=UYLrd+2FDq0Lq80IBR8NlP+7zvc/EbnzRw5UIKHRhDLjy3AEZfigkbarB9AUP+77k+
         wMpO3Q6q/b24lBQfq2q/TFcdWhq3EdRXzuRy6ZXJ6QFbixMgcWDuINzbLIRtu17GQ6i6
         A/kLLSNUrU34nbQg1qIVxP03hmtVzZHIpkE8i665fCLStRQfdQQEsYhskd+OOd+DUqEZ
         vbq/wY2AkT8MEKrtcEEnyE3CbyR4jjvX3ghK7FaRWmp+/YmnhH5PiWtZ3enurGZfd0h8
         nX2Jv6Fr6WGdY/FPckA+XypdK1VnxGNCQDN8EBmRntfr5gTOwLwCShtQ/UxvVhj59Mei
         v49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881567; x=1696486367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STPmpWfv6fDT1bub5fGqVvG8FTLSWrxke8YCaHE+OKo=;
        b=Sj89x8td4eTHcJrhbGhlS/TliaUA3Gd4dAo/MW9kQhDK72WCtgh/6c+87ppJRp0bLG
         XZSaxN29d3gpYf6GCGKcA4wmiPm4Zna0MPyjGil0Dz4Jh7feN/52RlDLCbLvJi3psReZ
         9bPrIH8+jUSZGSI06wY19brq19MaewKWjNmoJLr4Xejk5Pv49xZzNlVpBz6cjqhugzPR
         2tycMtIZQcEKDWoxy9jBjktl3Tqj/9pa5/Qa7y9Giyi+vkJzT0AuEspk1aLTeBsM8avP
         tAgI56rj0kZR4+OiNHUPeqQsB4x7umPMO6gXjygl3paatiKeLgH4qbGvdRR96oI3Jprr
         C/Mg==
X-Gm-Message-State: AOJu0Yx2kRtPXv8rgoPz7hEyfbfRp/jlTXzBO3DRULLLfoHGXkCIiF1q
	jtwtGC/G3A0qhwtMPYccqdCg6w==
X-Google-Smtp-Source: AGHT+IF5cEULCrsIG+xNyOUk71v9yZPtPKH6kOyBYcgS6EY9LoX/+39gSK0f6Q4Mo9nbNIO0uKdV9A==
X-Received: by 2002:a05:6e02:1c42:b0:351:211a:e86a with SMTP id d2-20020a056e021c4200b00351211ae86amr313596ilg.17.1695881566999;
        Wed, 27 Sep 2023 23:12:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x6-20020a92d306000000b003506f457d70sm4774467ila.63.2023.09.27.23.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:12:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 03/15] drivers: irqchip/riscv-intc: Mark all INTC nodes as initialized
Date: Thu, 28 Sep 2023 11:41:55 +0530
Message-Id: <20230928061207.1841513-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928061207.1841513-1-apatel@ventanamicro.com>
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_231248_359134_FA2FDFCC 
X-CRM114-Status: GOOD (  14.51  )
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
