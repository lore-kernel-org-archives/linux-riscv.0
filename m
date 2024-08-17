Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F5C52D7F
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tjhZm+qrZH9BeTbtHsIYQT0SjNQT/wE9UX8sBvKxsqI=; b=1oLYRdh4NA/dV8
	lwTnuxjL4oGv2zMJ9S0RxyB1BhIfF7uhN3Sq+cfBLsujavlG2gbv9YvFH1LZTCOv/RkCy71dAqT7x
	2RrQVVEw0XZe+WLQ1jAqpXsryMZ/DwAOxyNoHEDgdSL4b77cAQ78/0IH8RCuJVHd3w+RlXZJzqx5A
	MYo97/5uXtKWXEomGsW9zsLCK2gM0pAkfX524NRSMhSLzFBiTueoOae+p0sQWjswyV/J0oMFy2DFR
	caAvrRH0/wFo8iTfZe12VPUPPmA9mJHTjw935ibiDDgbPYbEZ/HK9Ryzx06j+9pM/u28+bR0rdPtJ
	vQwr6mm4Dq8CX+v84R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfE4S-0000000ErXH-11fY;
	Sat, 17 Aug 2024 07:41:56 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfE3j-0000000ErOc-46P0
	for linux-riscv@lists.infradead.org;
	Sat, 17 Aug 2024 07:41:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso3343597a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723880470; x=1724485270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBORzQsZTXM1LbW/643seFKYzIpgNc2kY1JCnCvH3JE=;
        b=hf5ouRVsu86MNJZDd2XKsZjFanv0ydrtq21P1VcBDi9V+7gyzhx8ytyVhK6yR4uocF
         qy0iFnkEI8uECcbrb0l4jfySezwyeI3VTz5ISOdp/lBXn3LE1/XuqckDUMQQfCLienw3
         y1vBv0x3u1c+cH38R0SI/zARqulB/kwhZJ+uXsc6TZSg8tZvNrDCLRfcVpn2soUORnn9
         R4db/APdlJIJ0dJUhTGX1Cos3ERaKPfORVbp9bBvst3i0iCpNr28FZfk9w5YWcuOBe2w
         gts03N7vgg50jvszKbDDbPE+REDP/F1iLTrxg64NHumj0ZcHqpjXnsKIurAs4uDYoMIo
         KJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723880470; x=1724485270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBORzQsZTXM1LbW/643seFKYzIpgNc2kY1JCnCvH3JE=;
        b=a3aOAZ/tJmzxWVUQMZXPkUrvnUZ5a0kJGZSqKILJk0d4GZh0R4/KjhI4pnxIoil201
         bh33Dqjo53gyLagN5fuF4D4Dco+xgQwTxX3FUA0aQA1De14xmssteT4AQSRwGpJvqe42
         uPp2pLgwBUykFQRSahSZidTW3iIo/oaNRY5jjddrUEdR3QIKSU4YN6JelLwXdmzMNedc
         7Au1vMhPNgtyK4SwcR2mXhjskL+AvrtoI2mWS3oPN4EjklqczIjWn/oKlL+NQgvWyWj3
         JXEKrJBK4aPLOk8TMHomJkkdLfNz0f/F7I8KoUpm89oi9FykJYpi7wjky98bmBFv4UAb
         fs6g==
X-Forwarded-Encrypted: i=1; AJvYcCWVmAREmAHU86Nv4xIUCNK30ZPSl1YOBFg3Or8W+suvHfwmnviUPWa5KVsbQ4XhU9HE3DPjRMWgabyytGDm3On1GH9ELAZq/TzhKgeAchMv
X-Gm-Message-State: AOJu0YxSrjFdF4VveHReQ1SIq4IIMLngXBuAI5QNj074yNyfmfp2Fag/
	qRJe5uu1R/Karp1HahhwTd48oV6pRbwCEqvjQsnRRGWeL4Shflg9rpLtW5wcDI4=
X-Google-Smtp-Source: AGHT+IENhmqi+DxLc2mz1SydD0A7p9AlI66nGERR3UWKR5q1emYV4OIEyUSKUHefLCRrMdx9ictRhg==
X-Received: by 2002:a17:907:e2ce:b0:a7a:a4be:2f99 with SMTP id a640c23a62f3a-a839292f4d3mr321245066b.22.1723880469146;
        Sat, 17 Aug 2024 00:41:09 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83aeb6eb4dsm66950666b.35.2024.08.17.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 00:41:08 -0700 (PDT)
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
Subject: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Sat, 17 Aug 2024 09:41:08 +0200
Message-ID: <20240817074107.31153-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_004112_024476_2FE45D21 
X-CRM114-Status: GOOD (  16.66  )
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
casing and the restriction. The code removal also requires changing
to of_parse_phandle_with_optional_args() in order to ensure the
legacy (but compatible) use of 'msi-parent' remains supported. This
not only simplifies the code but also resolves an issue with PCI
devices finding their MSI controllers on riscv, as the riscv,imsics
binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
v3:
 - switch to of_for_each_phandle() to further cleanup/simplify the
   code [Rob]
v2:
 - switch to of_parse_phandle_with_optional_args() to ensure the
   absence of #msi-cells means count=0

 drivers/of/irq.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..b74a3f5fc4e2 100644
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
@@ -718,33 +717,15 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_iterator it;
 	struct irq_domain *d;
+	int err;
 
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
-
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
+	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
+		d = irq_find_matching_host(it.node, token);
+		if (d)
+			return d;
+		of_node_put(it.node);
 	}
 
 	return NULL;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
