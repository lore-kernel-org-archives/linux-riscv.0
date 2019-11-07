Return-Path: <SRS0=OPVU=Y7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7DFC5DF61
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 08:52:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3EA2077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 08:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WiuRrWFN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="G7HveYk1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3EA2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Caf78Zyjz6RQZek8hKwPZYmZGXmjCHkuITwFLwX0N4M=; b=WiuRrWFNNcj/ratrRSOZ5I8bVt
	DpvD+B8VR1+Y0tgCtnXBqwRqQnfZ0WfHTQfdZ590g5OxIwupO/jNvVobn0UwiGrqjYWUqGtNyC44T
	jz7IJ6m2Qb1Cd25W+QtyTWOvnwE1eXSYO4ycBTmgfMrpqrIBWNJeDpgdnnybUNei2I3Q7zwPq/3hc
	/9MiRmqs9N5wObnIOsHcZeg6UtEPQKxUxx29AvtXEjqElrIMwAABPII4e4eY7GT81mD6MM1afOT49
	l7kY74rPU9fFkj9Kat5Ijt9SAuoz3XrtJJclQoEcuIyKug4Fr12U/n0LQ7Iw4nyoyyaDcfIf86lVs
	3mkYCJdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdX9-00068C-9O; Thu, 07 Nov 2019 08:52:51 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdWv-0005uo-BA
 for linux-riscv@lists.infradead.org; Thu, 07 Nov 2019 08:52:38 +0000
Received: by mail-pf1-x442.google.com with SMTP id 193so2084661pfc.13
 for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2019 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WYgJCjRBqhwY0ulINWDVeN12R2Tn8RH5kuZplnJEZos=;
 b=G7HveYk1IudPQMGmvQ2c7tpccDcJSLzQvM5gihotCO9sU2EOQLD2dorDNKZBfLnQbT
 N299NgJA3fiMAGdZgC783yJ9ZXiHACZgpJKpgs7L982cA26pzAI5GYZNrG7ANQNxjnXb
 qd0j7fsekgVSkMUTPu4TaxKbzSWwciTPEeZu+WoSCijwnzq0YqxWwyK+Y4jCYbuOIWMm
 Vpk/29WFu6gz7HwqVrz/+GW+0eRA2epF1LgMr271rBQUiHgEZMG8EBtg/A3gmYIt6z3x
 Gx9CKuJfuUJMDCInxFFvPWBGivrfBPjMSyqDt8Y96fYzEzxlSWkV1iu6zyuHfFBBAl7S
 K6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WYgJCjRBqhwY0ulINWDVeN12R2Tn8RH5kuZplnJEZos=;
 b=J30iSgU2PIgITtDw4f0ccFuyd9C3zXcgy9xxNuHNgtz5uKR30+2/JVbhzk26zRjfaL
 ttM/N44Y8lVIBlChUnbB1Cc29XB1dab4nGLiprCDktgV5E30agp969BXuDox1dqtfjEj
 kUu2WQV0N23O3yMnJy0pMtrmPAFFq0aKLxoN81yXgi+ysV8v9q4lrUULPIVmzmkOyXVL
 /9KVjKpEVaiXhwGGPp0HFWRi2nP/PqJVrBEancosd4U1KE5VNWxPdgBJoekeVhamoTZw
 AxOEfzF7DHy1gtqzPxRIpKrE2YNADxQxHoszs8ruieAr2dGZ40cJdGiKdx6JiBoLgeOs
 30SA==
X-Gm-Message-State: APjAAAV5Sr+WYZAUeDUG2iE4LT3Bic9h+2Li1KAjWtWn+CxAcBCoTQif
 xTQth7L+hwAyYbmcXI8lpoS44Q==
X-Google-Smtp-Source: APXvYqzwiffXH7qAwTNlrwNnSzFYjok1bc9tn4Pi6HSzCFjYW64y7zo3+tmzH1fmx6SaC2g7igW/Ig==
X-Received: by 2002:a63:d405:: with SMTP id a5mr3054839pgh.79.1573116756735;
 Thu, 07 Nov 2019 00:52:36 -0800 (PST)
Received: from localhost.localdomain (36-228-119-18.dynamic-ip.hinet.net.
 [36.228.119.18])
 by smtp.gmail.com with ESMTPSA id a33sm2402361pgb.57.2019.11.07.00.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 00:52:36 -0800 (PST)
From: Green Wan <green.wan@sifive.com>
To: 
Subject: [PATCH v6 1/4] dt-bindings: dmaengine: sf-pdma: add bindins for
 SiFive PDMA
Date: Thu,  7 Nov 2019 16:49:19 +0800
Message-Id: <20191107084955.7580-2-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107084955.7580-1-green.wan@sifive.com>
References: <20191107084955.7580-1-green.wan@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_005237_382169_29F8AD5B 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Yash Shah <yash.shah@sifive.com>, Green Wan <green.wan@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, dmaengine@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linux-riscv@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add DT bindings document for Platform DMA(PDMA) driver of board,
HiFive Unleashed Rev A00.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Signed-off-by: Green Wan <green.wan@sifive.com>
---
 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
new file mode 100644
index 000000000000..2ca3ddbe1ff4
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/sifive,fu540-c000-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Unleashed Rev C000 Platform DMA
+
+maintainers:
+  - Green Wan <green.wan@sifive.com>
+  - Palmer Debbelt <palmer@sifive.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+
+description: |
+  Platform DMA is a DMA engine of SiFive Unleashed. It supports 4
+  channels. Each channel has 2 interrupts. One is for DMA done and
+  the other is for DME error.
+
+  In different SoC, DMA could be attached to different IRQ line.
+  DT file need to be changed to meet the difference. For technical
+  doc,
+
+  https://static.dev.sifive.com/FU540-C000-v1.0.pdf
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu540-c000-pdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 8
+
+  '#dma-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#dma-cells'
+
+examples:
+  - |
+    dma@3000000 {
+      compatible = "sifive,fu540-c000-pdma";
+      reg = <0x0 0x3000000 0x0 0x8000>;
+      interrupts = <23 24 25 26 27 28 29 30>;
+      #dma-cells = <1>;
+    };
+
+...
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
