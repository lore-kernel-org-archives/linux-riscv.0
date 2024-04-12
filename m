Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F3EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ga+/vfH++dc3LCBay1pjU1853jQaMLIlWNKC5P3Sl+o=; b=0IqntwZbnj8Rii
	bHAuHKMZCSzf4sZ54WVSJZACqC9Jy7Av2kv8uUYQ8GnI+KcD4tJyrseJcKGIwkLIIwMXnhAnFz1uE
	brB5FRtoaIqUXVAmIdjyD8NgeNvFxQTUN0orFwann6liuTExUawk+3sTsYl4z7D1X91vtex+XH7rn
	M8c+varhGqrmpPF8d92jVKprVbPvXJiW617MzgrvwHfdmtbD0im6CISD06XYqCJzfu4QE5Y6Eae6D
	pOS/8Tidc+fNEpOjrJu4uN5vkpHFinFvtcLo3SPuThag/1ogtNSYnhcHW7GGg6JB4b7/xCyE61kVz
	LvuHPD/Guc31uXzJBCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF6M-0000000GvXb-2XV6;
	Fri, 12 Apr 2024 11:29:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF6I-0000000GvTx-2OW0
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 11:29:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so756563b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712921381; x=1713526181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TANC/O7vA+JiKQebAKkUVF/9/SWuImLeD8ZhsV9CTg=;
        b=m3dk7pdQVPvuRVli2iAGFAQJnIe2GtmweAuWyAdhNcuuR4Py3jQgMShgywq1SjMFm1
         m57ic0CLa2t12W3TED7dpwNJ+pXyBfakyvEQq0oE50VnY9zuBGwIECGlVXpsensnImiO
         f6yP21kgmHafk2dC7RzVRif5Qx1TFuuZnNTxzYO41WJ+lshQFocL2VT/iboLTNGoGlW2
         WyGOPcaeKqFbL96pvE3kUvHa0BiGZdSPk4Sp6ZAyL2c52SSgerqqHIBFhC+Txfqt376x
         P86sngiSh+4OUfGVHxonFSVSAxeP+rB/XmwzRWswwMRxBdhmQQf81efi67n0ZwcAD0bK
         fivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712921381; x=1713526181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TANC/O7vA+JiKQebAKkUVF/9/SWuImLeD8ZhsV9CTg=;
        b=F1VqH5eY4dJIsgWt75DPENuTzJwbZv/vVJgnmolD7R5MX5Y+2lk46nSnd0c8FtoW1O
         1C1hr2ndgY5md9HgjpHsw2Y7QsnnRsuQKdFvugxznMF/KkKi4k3ZN6Y7tYjkaPKN1wLw
         hBaMTkAelH9ZwIHDUO3eBohrRwEE2wMwEtGbgG8c66rmjWFB3NKGkcTYDiJ9JYGYGgeL
         rDwr14ZFQc7zngBw0z82cAJqkFOjsPlMB+nJFNqVzQSfRSoo1/kfVwrANVAN/qtr56h8
         xp9QuEM31ZhMg0lsU/BiAvNDgUn4YqgbFFyhIxrGFcx5f5VfA87hSSX+A/mkb9C5zqjc
         mIrg==
X-Forwarded-Encrypted: i=1; AJvYcCUnuW/bxJSwJTMlIDuhIt7HFHJMMUumEgfg93yY48ZXkfKnQp67PGv1DHfu1Zs6od1atmnUBsjQuZkIl7i9gpfghfCXDa5NZXnFnV4dAhG9
X-Gm-Message-State: AOJu0YzVVgTio3ULDWfhcAOIHR+dZeiW0KaJuuTO33eMqTVU9icTVkcE
	Fv3xeTMR1udiV6IyXW15asxOW+PXL86t2p8A7trUfawYhQCPm8Ak+qHIKbocSsY=
X-Google-Smtp-Source: AGHT+IHY387bs/fjhRwu7PR3437O21AK+7fM8+la7npbiGwsFsFXlYS6TqYUTcepY2PQZxgsLVeTfA==
X-Received: by 2002:a05:6a21:3395:b0:1a9:9664:ef12 with SMTP id yy21-20020a056a21339500b001a99664ef12mr2609342pzb.43.1712921381190;
        Fri, 12 Apr 2024 04:29:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id i89-20020a17090a3de200b002a005778f51sm2832846pjc.50.2024.04.12.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 04:29:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: [PATCH] of: property: Add fw_devlink support for interrupt-map property
Date: Fri, 12 Apr 2024 16:59:31 +0530
Message-Id: <20240412112931.285507-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_042946_707180_73915BC8 
X-CRM114-Status: GOOD (  13.52  )
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

Some of the PCI controllers (such as generic PCI host controller)
use "interrupt-map" DT property to describe the mapping between
PCI endpoints and PCI interrupt pins.

Currently, there is no fw_devlink created based on "interrupt-map"
DT property so interrupt controller is not guaranteed to be probed
before PCI host controller. This mainly affects RISC-V platforms
where both PCI host controller and interrupt controllers are probed
as regular platform devices.

This creates fw_devlink between consumers (PCI host controller) and
supplier (interrupt controller) based on "interrupt-map" DT property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/of/property.c | 53 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index a6358ee99b74..ccbbb651a89a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1311,6 +1311,58 @@ static struct device_node *parse_interrupts(struct device_node *np,
 	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
 }
 
+static struct device_node *parse_interrupt_map(struct device_node *np,
+					       const char *prop_name, int index)
+{
+	struct device_node *tn, *ipar, *supnp = NULL;
+	u32 addrcells, intcells, cells;
+	const __be32 *imap, *imap_end;
+	int i, imaplen;
+
+	if (!IS_ENABLED(CONFIG_OF_IRQ))
+		return NULL;
+
+	if (strcmp(prop_name, "interrupt-map"))
+		return NULL;
+
+	ipar = of_node_get(np);
+	do {
+		if (!of_property_read_u32(ipar, "#interrupt-cells", &intcells))
+			break;
+		tn = ipar;
+		ipar = of_irq_find_parent(ipar);
+		of_node_put(tn);
+	} while (ipar);
+	if (!ipar)
+		return NULL;
+	addrcells = of_bus_n_addr_cells(ipar);
+	of_node_put(ipar);
+
+	imap = of_get_property(np, "interrupt-map", &imaplen);
+	if (!imap || imaplen <= (addrcells + intcells))
+		return NULL;
+	imap_end = imap + imaplen;
+
+	for (i = 0; i <= index && imap < imap_end; i++) {
+		if (supnp)
+			of_node_put(supnp);
+
+		imap += addrcells;
+		imap += intcells;
+
+		supnp = of_find_node_by_phandle(be32_to_cpu(imap[0]));
+		if (!supnp)
+			return NULL;
+		imap += 1;
+
+		if (of_property_read_u32(supnp, "#interrupt-cells", &cells))
+			return NULL;
+		imap += cells;
+	}
+
+	return supnp;
+}
+
 static struct device_node *parse_remote_endpoint(struct device_node *np,
 						 const char *prop_name,
 						 int index)
@@ -1359,6 +1411,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
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
