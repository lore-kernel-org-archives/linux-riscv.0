Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43FFC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mi7fwZhN98wsElEuGp/+7wslgyfEr5cTMNIQpN+cfds=; b=EML8caNhjrUEJu
	WpWByZjWIBAbJYS+vMpodwocd8jok8Dd8s44PdtrCyKoPkmIw+A7X/qXC8eBImNGBk17j6poyF1l/
	kdCIDcryB3kbG7PeUqQZcYJ81WGGb2SRwfVpJoy1DQUBX5CX3T5z4EsKgeBFlayOALia/RwIqN2A1
	SpFj8JYGjcEJvyLMU+OMv7tFc9N/LzhOKIdJ+cAByg6+iOEsZb9gyQ6MpK5k1nbAHFJWRLLiE5Drg
	CYMfI3JBcKEt0CpvTw9LxaHJQmJEIDE+eprT1Zm0coM5mjiS1IluLNNzuKs2R7xDyk7VQv5ndThtc
	aNW5Q35swReYChkFsgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52Zm-00000001N3o-2CA0;
	Thu, 09 May 2024 12:08:42 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52Ze-00000001Mxk-0A4L
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 12:08:40 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3c969fa8fd2so458848b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 05:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715256512; x=1715861312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJC14KI5N51a3HwicqFWcq+QiW6+wpgCB8tEHpU3Fus=;
        b=ha7nne6MfD8tYAWUopD3gqjg+hOuh84JQBEYWZBiFNLWGXDW61RLw3pGZeKqK/GdOO
         4LO9PJC4G8BSL6rxpSZIxj83l3SCNCUL26bCb9zAklmYT4pgxV9V60AGECI4UfM/dnNI
         7NWbJ+62qGTSX82E73kTVrG3nkYlpUPZCx/mP/CdZMZTioLi7bzQFzpFYbah0gbj3o3j
         EIuOCWWc27zZV0iCVB/jMKYtJ2oimH5y0+xIjv0mHfER01ZSCy/4gH6PSssCXjlfGmHB
         nunThE6kpzg4fbn4aiTUbIetxv7iTYAPscZARYT41c7JxXJn4DjhER2lmGDFAVN3PivU
         mjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256512; x=1715861312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJC14KI5N51a3HwicqFWcq+QiW6+wpgCB8tEHpU3Fus=;
        b=tZiFyVZm2PTrH6fYDQwCIImtKD+WR0VmPJCZTcKh5AMBz0dqFVED/R19PpTpjqba1B
         JFfc6NvyWguK9GwnmEBxj5wYtPCl33qb2BRBNxsbqoL6X0LboixunlGpasDBinYZe1bQ
         jab2DTJnI0k3yMwYdck3ZO2ytYjpfTvqnG+1mxoduMxnel4cYHp7cvWJTOLf0T6qF2jX
         nD//kzNZzGzYHTF5PHrnhxt/lKVGnStvx2cGGa8/98Y8PH5xLOwkD2x7Gz8tBvsmddAa
         /V/uFRxpWV/1Z6hhOFbLoh3VNrp/hj4bkMAHlTFKHVs27IpVMSetQGMlmR7Uf9vnL22z
         1s3A==
X-Forwarded-Encrypted: i=1; AJvYcCXFQf2ySNu9R8nF2RR/ertwSGYllwqne68UIgMZSyuP3b09iHwQsbTNGwa29llXSRMycJ0dIauhD+ItSdsQJbiGlFMHuTrQsrxvpp0OIH5h
X-Gm-Message-State: AOJu0Yytc/1v1nStGGJ0yfWwkd0ZBuCHIGyBXCGdP8NP4YVKcC+wG1+8
	eTmxa8INiOK+6XVja3ZNRpSKz4fXp22vBu0gf1Nq1jnPw1k4akFPaWqq8/zj5pg=
X-Google-Smtp-Source: AGHT+IH1//7mPrENMJuaAc7GRP3ThX3QDeZJnAjj0f7u85adSm4sgjE+6KayPsN8zcIL2M9Mq+lMbQ==
X-Received: by 2002:a05:6808:1795:b0:3c9:9339:6fba with SMTP id 5614622812f47-3c9933974a7mr1186822b6e.16.1715256512343;
        Thu, 09 May 2024 05:08:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3c98fc97a8bsm174350b6e.17.2024.05.09.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:08:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4] of: property: Add fw_devlink support for interrupt-map property
Date: Thu,  9 May 2024 17:38:20 +0530
Message-Id: <20240509120820.1430587-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_050834_315281_A7E07459 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some of the PCI host controllers (such as generic PCI host controller)
use "interrupt-map" DT property to describe the mapping between PCI
endpoints and PCI interrupt pins. This is the only case where the
interrupts are not described in DT.

Currently, there is no fw_devlink created based on "interrupt-map"
DT property so interrupt controller is not guaranteed to be probed
before the PCI host controller. This affects every platform where
both PCI host controller and interrupt controllers are probed as
regular platform devices.

This creates fw_devlink between consumers (PCI host controller) and
supplier (interrupt controller) based on "interrupt-map" DT property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Saravana Kannan <saravanak@google.com>
---
Changes since v3:
- Added a comment about of_irq_parse_raw()
- Removed redundant NULL assignments to sup_args.np
Changes since v2:
- No need for a loop to find #interrupt-cells property value
- Fix node de-reference leak when index is greater than number
  of entries in interrupt-map property
Changes since v1:
- Updated commit description based on Rob's suggestion
- Use of_irq_parse_raw() for parsing interrupt-map DT property
---
 drivers/of/property.c | 52 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index a6358ee99b74..2d749a18b037 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1311,6 +1311,57 @@ static struct device_node *parse_interrupts(struct device_node *np,
 	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
 }
 
+static struct device_node *parse_interrupt_map(struct device_node *np,
+					       const char *prop_name, int index)
+{
+	const __be32 *imap, *imap_end, *addr;
+	struct of_phandle_args sup_args;
+	u32 addrcells, intcells;
+	int i, imaplen;
+
+	if (!IS_ENABLED(CONFIG_OF_IRQ))
+		return NULL;
+
+	if (strcmp(prop_name, "interrupt-map"))
+		return NULL;
+
+	if (of_property_read_u32(np, "#interrupt-cells", &intcells))
+		return NULL;
+	addrcells = of_bus_n_addr_cells(np);
+
+	imap = of_get_property(np, "interrupt-map", &imaplen);
+	if (!imap || imaplen <= (addrcells + intcells))
+		return NULL;
+	imap_end = imap + imaplen;
+
+	while (imap < imap_end) {
+		addr = imap;
+		imap += addrcells;
+
+		sup_args.np = np;
+		sup_args.args_count = intcells;
+		for (i = 0; i < intcells; i++)
+			sup_args.args[i] = be32_to_cpu(imap[i]);
+		imap += intcells;
+
+		/*
+		 * Upon success, the function of_irq_parse_raw() returns
+		 * interrupt controller DT node pointer in sup_args.np.
+		 */
+		if (of_irq_parse_raw(addr, &sup_args))
+			return NULL;
+
+		if (!index)
+			return sup_args.np;
+
+		of_node_put(sup_args.np);
+		imap += sup_args.args_count + 1;
+		index--;
+	}
+
+	return NULL;
+}
+
 static struct device_node *parse_remote_endpoint(struct device_node *np,
 						 const char *prop_name,
 						 int index)
@@ -1359,6 +1410,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
+	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
