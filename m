Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BE8C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2024 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HfZQG4aG9KOz1fRX/szStV5+v+XOqlXAqOV4WyWcAKo=; b=Qk1wQ3IImV2x2B
	Bhy2t+fYXzKEn8hSzYVZRFZ3/VksWLqZU7lYhEPh6B+qxnIfXUzQTtN1JNz/UK8/0bwGBQqkC8NeE
	g3+JlI2ooGW80GvnDmfznTYYaP8fN1Xeip/UXfkh9vkF09sc2KIQMFvn1zDBrZ4rVqWhFQSTxGBcS
	g1uUvfNLOSrbIOPLhkimQ8aEyg7zHHdlwwUeiQAozVrwwAOcTE1a0pFZ2g+aLKbonXSAxpHKgQaeZ
	ugd9zIUm3qU2XwxilDDrzEFcWTXRDJnGI35cEQl24EyRRI88xUxarS92Yqt7+YaBJYLwZOUsjc4sw
	4YVhM86ai98kbhMTfsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvZYG-00000002psF-0FpQ;
	Sat, 13 Apr 2024 09:20:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvZYD-00000002pr8-0FHA
	for linux-riscv@lists.infradead.org;
	Sat, 13 Apr 2024 09:19:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e3c3aa8938so10692115ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712999995; x=1713604795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69pCu+lIE1wVXKqySWp1XZJt2aC2QI11IyQxjcSF8a4=;
        b=QJwc2YJWJUa2/D+kyaIS8pXoSsUXnV5CLsCC2urv+C+tZdZC5eOhBtUxrDgnAv2Qpb
         5mpekBcEsgJ2aTMbGEy5erQuELifYmtx0cWy2+5GUd30samSPNAkfqO4iRh+7zEPrfH0
         WT0x6Pgas9C5QaZkVVDjMAi1oBh8UA4uETx/tX3X1bIXD22buBYYSz6stePHcgUvDVUH
         9QavzpCdPLdF+1178toaP9F5I2+i+ViZmnT0pZU07r7yh7ovcqne8dYJLAHmtxgsBojM
         y0ki2d1DLnR/8I+MEYaP73+luzcRcOIyC6PZ1y7ILba3KG7zUYiZd0eXjgJtYiScJE0M
         +4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712999995; x=1713604795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69pCu+lIE1wVXKqySWp1XZJt2aC2QI11IyQxjcSF8a4=;
        b=tVkZzVIP4DWEgkjeqENAZHY2EiDCXMrfseDXsPSqq6kg/CrHm7YeXlrZFxiZE3nx9X
         hAoVHG9kAf58gBP1+12daQIKGzLcJGNClihLyaQ1tc+BXswhVfdRmqzpzgPdQY0vqUhm
         DSuZCyID434etGsqPQgdvfvFXots7fKyDxIvWxRKo6VIBmGQFn+xd+mR+YaIhQzHsCrQ
         rEM5GCdZydrx0Eb0psg4Vv0r0Oc+i4MuQVR6nuqFDg4snVDpur+K/xtywZLX/mLsA393
         MIacMEqZd4lXftDRqoyiI0oeQlMXxT1kKbLuWkeuDh1ob+jXelETgXLZMeKRUucrS+MQ
         OV0A==
X-Forwarded-Encrypted: i=1; AJvYcCVRc/csBe8wzu6jT+eK0wy5slhyxYm+b8yMREIP5szUinMC6wQv5ItlH4OTb2BxPNJEOdeRDNx03+5wqhJQpEAvtPVVfcuvwQz+wMXKWXgs
X-Gm-Message-State: AOJu0Yyz7Z/Al1MNX/HP/F/vd/erP1N0EV6sv2Gk7U5UgPjKqOJKUCSq
	9pB5JGsDbztOBYz3zNmPhPJhxJdXqCL9vFBQo108NPdZFQa9chR+5dfsFwdH1cg=
X-Google-Smtp-Source: AGHT+IHtYnolIIRYPs/EmR5EEzZ1sL8+zY8lf7mTvGypESElWwhDypuX4pBANdN1oJ2iOm4IuKjKVA==
X-Received: by 2002:a17:902:968c:b0:1e2:6d57:c1bb with SMTP id n12-20020a170902968c00b001e26d57c1bbmr3726399plp.21.1712999994631;
        Sat, 13 Apr 2024 02:19:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b001e5c0ac3279sm2157153plh.74.2024.04.13.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 02:19:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2] of: property: Add fw_devlink support for interrupt-map property
Date: Sat, 13 Apr 2024 14:49:42 +0530
Message-Id: <20240413091942.316054-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_021957_125397_40353DED 
X-CRM114-Status: GOOD (  14.57  )
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
PCI endpoints and PCI interrupt pins. This the only case where
the interrupts are not described in DT.

Currently, there is no fw_devlink created based on "interrupt-map"
DT property so interrupt controller is not guaranteed to be probed
before PCI host controller. This affects every platform where both
PCI host controller and interrupt controllers are probed as regular
platform devices.

This creates fw_devlink between consumers (PCI host controller) and
supplier (interrupt controller) based on "interrupt-map" DT property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v1:
- Updated commit description based on Rob's suggestion
- Use of_irq_parse_raw() for parsing interrupt-map DT property
---
 drivers/of/property.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index a6358ee99b74..67be66384dac 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1311,6 +1311,63 @@ static struct device_node *parse_interrupts(struct device_node *np,
 	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
 }
 
+static struct device_node *parse_interrupt_map(struct device_node *np,
+					       const char *prop_name, int index)
+{
+	const __be32 *imap, *imap_end, *addr;
+	struct of_phandle_args sup_args;
+	struct device_node *tn, *ipar;
+	u32 addrcells, intcells;
+	int i, j, imaplen;
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
+	sup_args.np = NULL;
+	for (i = 0; i <= index && imap < imap_end; i++) {
+		if (sup_args.np) {
+			of_node_put(sup_args.np);
+			sup_args.np = NULL;
+		}
+
+		addr = imap;
+		imap += addrcells;
+
+		sup_args.np = np;
+		sup_args.args_count = intcells;
+		for (j = 0; j < intcells; j++)
+			sup_args.args[j] = be32_to_cpu(imap[j]);
+		imap += intcells;
+
+		if (of_irq_parse_raw(addr, &sup_args))
+			return NULL;
+		imap += sup_args.args_count + 1;
+	}
+
+	return sup_args.np;
+}
+
 static struct device_node *parse_remote_endpoint(struct device_node *np,
 						 const char *prop_name,
 						 int index)
@@ -1359,6 +1416,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
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
