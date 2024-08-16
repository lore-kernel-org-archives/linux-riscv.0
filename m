Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60CEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HIbNFhd+CPEZkHkTiLWH4dC7K7ZIGzXZu2gdC+mQvD8=; b=PihubVjgftBqxh
	TmwJ6U8NIcMPUQ7mdFX4Yqhp4zaaA7uyWUP23isZJauOReOQbb1aO0qWNSQ9AsPW4MRCSazxU3DSM
	ko3Na04ifDcdojO+NjbP/qjdBimxHwaPOZiYJ8DWlyVm533i4+jAnSnog3R9aB33ESh5cn2pa61yO
	G7S8QxO0chwt82VQOQjS33ecPW6mm8V3FwrJdRlfSW/PRkWpXSR3yK7HZa6K6jxRJlwCVPbCypjGS
	KkwzZUUnM4ujArvBNMpnhKTkWeBKFG00XUE3fwSwTa7BvaEepbysKDI6HKI2UGkoUzDaA0BxmAzCm
	Quavjb1PPwvX9JK0RwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sethC-0000000CVlb-0rB4;
	Fri, 16 Aug 2024 09:56:34 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setg4-0000000CVSB-2WIE
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 09:55:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso194105166b.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723802123; x=1724406923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoIvLUfwtlErHQHB2ji6smKiDqBoIASWBt1x369LS4I=;
        b=DCApBluywUozYXVvDgGTzIlkpgaSHv6YtM3OHIwet9aoKcGD1h81xQNDhSiv/Z5abJ
         u4UIMHD/uGByzYRNTnLV3xbIY+4h24pAaVDTkDl9TqLhFwNqpppURH3PsU0YzUQZkZmL
         FZD041UFBZJ5qS3GqiQrvQf5OLOHdQWZSyl6C5ySO0taS85GcQnZjIWRbZTWwNIqX86Y
         m8foD3as7zjoB4RuUfYTTY4LiY+W2nsKH9n9Qg3Q/Sl+gz72ndo/hX5V0bYSrY7lKlxD
         9oI0jwQtimlHIT1VEX20X/Fvyc3HSCFBxuSE43FHvOB3tSGS7UL74LP3XnTnAei35h9O
         CRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723802123; x=1724406923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoIvLUfwtlErHQHB2ji6smKiDqBoIASWBt1x369LS4I=;
        b=YKtNhRA24ksFJKKKJt3361lh7hSiHykyWArvKhYnt7HGSjdswYoQFrKoqzWa4IdNYh
         Q9JSKwcX709wME5gkzTGuayRKscikOG5yVcrpYMUgV4DUysg5iez4R3JDCiX43KICmav
         OTgZFOQA9JbFMSoOfPPFWHBzGoYFhtahW+zPuIfySrct8St0i+/TzputAaZTe+HYRqsR
         JVknzIzyTPJYPIjkaELlnA6mv3xldJ1mdddll/4n/ZzwbXBowaxXEZnReG8RKDTd2QW9
         XHcxQ24bF+ksycr1nUTRtwNczI+QcoUjJF/Hrhu+cQZWsIwfgft8dhTEOqbZxxn3AHgT
         DmFg==
X-Forwarded-Encrypted: i=1; AJvYcCVI71OqU73oNrbYf9B/xdFLC7oNycdHqen6rYg6ai5MY6uMYqn1fjMnlGudkZZU5/gqU3L1ppGCqMdkRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs9LYpzbmhovS55620jmN0uzLHN/ZtS/Nfoq0XYd7MdHx/PPOj
	w1R4/om0e6nKcEO4x8iGrJOhgTH786SFD7pUWfUeun+QbRTiqN4FMpgK7mqmIkI=
X-Google-Smtp-Source: AGHT+IEWEn1buqzvrPyI+YLyXqKvY0yYQVZ2BQACp/XQgrDhUOxKmz7wrTINSfs3M48T6a9DY2iabw==
X-Received: by 2002:a17:907:2d10:b0:a7a:a3f7:389f with SMTP id a640c23a62f3a-a8392a49534mr149316266b.66.1723802122185;
        Fri, 16 Aug 2024 02:55:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935807sm228603466b.134.2024.08.16.02.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:55:21 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Cc: maz@kernel.org,
	mark.rutland@arm.com,
	robh@kernel.org,
	saravanak@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Fri, 16 Aug 2024 11:55:21 +0200
Message-ID: <20240816095520.96348-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025524_657335_2F9233C3 
X-CRM114-Status: GOOD (  17.14  )
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

An 'msi-parent' property with a single entry and no accompanying
'#msi-cells' property is considered the legacy definition as opposed
to its definition after being expanded with commit 126b16e2ad98
("Docs: dt: add generic MSI bindings"). However, the legacy
definition is completely compatible with the current definition and,
since of_phandle_iterator_next() tolerates missing and present-but-
zero *cells properties since commit e42ee61017f5 ("of: Let
of_for_each_phandle fallback to non-negative cell_count"), there's no
need anymore to special case the legacy definition in
of_msi_get_domain().

Indeed, special casing has turned out to be harmful, because, as of
commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
as a MSI controller"), MSI controller DT bindings have started
specifying '#msi-cells' as a required property (even when the value
must be zero) as an effort to make the bindings more explicit. But,
since the special casing of 'msi-parent' only uses the existence of
'#msi-cells' for its heuristic, and not whether or not it's also
nonzero, the legacy path is not taken. Furthermore, the path to
support the new, broader definition isn't taken either since that
path has been restricted to the platform-msi bus.

But, neither the definition of 'msi-parent' nor the definition of
'#msi-cells' is platform-msi-specific (the platform-msi bus was just
the first bus that needed '#msi-cells'), so remove both the special
casing and the restriction. This not only simplifies the code but
also resolves an issue with PCI devices finding their MSI controllers
on riscv, as the riscv,imsics binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/of/irq.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..026b52c8ee63 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
  * @np: device node for @dev
  * @token: bus type for this domain
  *
- * Parse the msi-parent property (both the simple and the complex
- * versions), and returns the corresponding MSI domain.
+ * Parse the msi-parent property and returns the corresponding MSI domain.
  *
  * Returns: the MSI domain for this device (or NULL on failure).
  */
@@ -718,33 +717,19 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_args args;
 	struct irq_domain *d;
+	int index = 0;
 
-	/* Check for a single msi-parent property */
-	msi_np = of_parse_phandle(np, "msi-parent", 0);
-	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
-		d = irq_find_matching_host(msi_np, token);
-		if (!d)
-			of_node_put(msi_np);
-		return d;
-	}
-
-	if (token == DOMAIN_BUS_PLATFORM_MSI) {
-		/* Check for the complex msi-parent version */
-		struct of_phandle_args args;
-		int index = 0;
+	while (!of_parse_phandle_with_args(np, "msi-parent",
+					   "#msi-cells",
+					   index, &args)) {
+		d = irq_find_matching_host(args.np, token);
+		if (d)
+			return d;
 
-		while (!of_parse_phandle_with_args(np, "msi-parent",
-						   "#msi-cells",
-						   index, &args)) {
-			d = irq_find_matching_host(args.np, token);
-			if (d)
-				return d;
-
-			of_node_put(args.np);
-			index++;
-		}
+		of_node_put(args.np);
+		index++;
 	}
 
 	return NULL;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
