Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF37FC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLJ9EEhHsunDc+WJ100hoicqJRYxRyx6/MEyf7CpG4Y=; b=w/C3mMcm5ZsohN
	MwBvuNejxN1TTNRX+tmW/P26//8sQGzrR/FpYZs2x1duoNgzU/Mc7nTxxT1dkAljNWcHNPlH4phG5
	HO30fRw1XtIH8EK3Sb4PZMXXXVaul56C1CfIs0f5kljlVwQLhplFBzK1TJbm3zfzjoPv/mkGQC1k6
	Zh3Pz5Ts6iiC7DVDzhLOfubh3Vh/inoM/iMdFvPaWWG0RSHP5KkHsoJ4FLvwxObET94fqe1GAVRrp
	bFKe11zrq+omSpscHqN+NF0liKwGjyUApNbP1K9cpKdoy6trXsZIfUbVpBhdG+mH+ngwP07INz0Vm
	4s1xGQhkZm/34DvpJQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqu-003P8Y-MY; Mon, 30 Jan 2023 12:01:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqr-003P6P-H0
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:01:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so8481624wmq.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 04:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7rGW7hYEauj0lEHNx054QYhURQUQQG6A8fMOX9HH84=;
        b=lDaBzPPGiIWHSrtrjHZkaU6yOWihKZPM5+aGXtQos07HvscEZ0LT5JsXQLf6p0Gvsc
         xmzJIK6xlI4DNUGyavubQ+WC/rC/5cQQZtn3ND7ZLlGtxk1YKVMjt6+poaIocV2kXjTl
         PHCtXN43bU/uNH9elJn0eA+LYOcXZM2pM5Sozv4GLqKNRTESooyRfvsgsejqnrDDDke/
         oioyvUiezg2+Lif5ZzRSJa2XUAjPpEJEq6WAfDsgT77uHQwPuoFr4KbMl4izZIDU59U1
         HhsQoLMAM4pPN/7i+CFswIdYZoXIhW5QCsIEDV8y8Aaq4btqy2W/A2AgsC/heByJxFJE
         ebfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7rGW7hYEauj0lEHNx054QYhURQUQQG6A8fMOX9HH84=;
        b=ivr4dy0P3mvrf4hS2T8ak/GhZLQOOVllLCxSJ+QiGhjeh6weHPTbZeZq/WNK9ysECH
         yL/yJEk7trSHd6zKdIWvh2YCl+hsJBDX0pB12wcGW0YVHyc1Sm6m/mCbyOBJAFUw2ECP
         LENeY148TEiG95IkPeIu2EYbApoE30lKFcuMtYNHAe2VX4juWSdqTzDvzz7z3yAXqlsi
         lsqZtPtMDW66GqTjxFQT3XZLqOK4zIGBxIRd6uoVppCY/L/pi2GIV1OS4MGl0cvRP9B2
         jn05p52juOBSn3U180ayoN2QqPhgYkDYngJHhBj5/q11MMDhoIJD8kEL5Cz+pcyxiHr/
         lGWw==
X-Gm-Message-State: AO0yUKWZmETYbg7OqukBlhRqmEKdZtpBhk8+KemKxcCWAmspy5oGrmG6
	aixK7sqEUEM0D7D2Zk7pxINWExPPoBXtoe0f
X-Google-Smtp-Source: AK7set8ufGZSIpyQZvCciZ3L96Jv+n1WQFdPSSjUZxzSgat1S+JN+p/kBx/VXyIJpoeT4c3M8PRA0Q==
X-Received: by 2002:a05:600c:4195:b0:3dc:5ad1:583d with SMTP id p21-20020a05600c419500b003dc5ad1583dmr2344794wmh.18.1675080091422;
        Mon, 30 Jan 2023 04:01:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003db09692364sm17505943wmn.11.2023.01.30.04.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 04:01:31 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>
Subject: [PATCH v3 1/6] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
Date: Mon, 30 Jan 2023 13:01:23 +0100
Message-Id: <20230130120128.1349464-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040133_589311_AD5F69E2 
X-CRM114-Status: GOOD (  10.96  )
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

Refactor riscv_init_cbom_blocksize() to prepare for it to be used
for both cbom block size and cboz block size.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3cc07ed45aeb..eaf23fc14966 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -98,34 +98,39 @@ void flush_icache_pte(pte_t pte)
 unsigned int riscv_cbom_block_size;
 EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
+static void cbo_get_block_size(struct device_node *node,
+			       const char *name, u32 *block_size,
+			       unsigned long *first_hartid)
+{
+	unsigned long hartid;
+	u32 val;
+
+	if (riscv_of_processor_hartid(node, &hartid))
+		return;
+
+	if (of_property_read_u32(node, name, &val))
+		return;
+
+	if (!*block_size) {
+		*block_size = val;
+		*first_hartid = hartid;
+	} else if (*block_size != val) {
+		pr_warn("%s mismatched between harts %lu and %lu\n",
+			name, *first_hartid, hartid);
+	}
+}
+
 void riscv_init_cbom_blocksize(void)
 {
 	struct device_node *node;
 	unsigned long cbom_hartid;
-	u32 val, probed_block_size;
-	int ret;
+	u32 probed_block_size;
 
 	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-
-		ret = riscv_of_processor_hartid(node, &hartid);
-		if (ret)
-			continue;
-
 		/* set block-size for cbom extension if available */
-		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
-		if (ret)
-			continue;
-
-		if (!probed_block_size) {
-			probed_block_size = val;
-			cbom_hartid = hartid;
-		} else {
-			if (probed_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
-					cbom_hartid, hartid);
-		}
+		cbo_get_block_size(node, "riscv,cbom-block-size",
+				   &probed_block_size, &cbom_hartid);
 	}
 
 	if (probed_block_size)
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
