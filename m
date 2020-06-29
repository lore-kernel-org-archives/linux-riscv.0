Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE20C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6DF520702
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGRiao0O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BdUD0E9c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6DF520702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZFtl/leuJOC+u6ghUfw72kJro2cO1XHGZHPlPLbn2nI=; b=cGRiao0OpPG7YRN99mYmzKHHp
	KCNfUpZ4JgyTU8nT+QqkPC5UyXcHPVZD1rKxCHNIlPxSC8QxZMTnpzF0Z3Vb+cSlARWiRr9VpeTVB
	DU/0gDgSA331JmakT3UdOupqI2GXekWLk7zASEU1tuPLDPsXDZlBY9e54kKCaXP33j7RhapYbFFO4
	dDDwpwDvV8yR/MrmfQiyC2x9G1fBAfl1TQNA/bsQK1d/N1hcUrlyH+3fAmBj0QP2hG2YZQOc0tmDY
	3MUv7EuYNlkc3+H6yLizZsyrvp2AG0JGaWvPcUi1C/WUVs5rYtm/7gT1uwfN97HfVPR7UGgRRAOKx
	/tZzIh/ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpkKN-00011l-Q1; Mon, 29 Jun 2020 03:19:27 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpkKL-000118-VS
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 03:19:26 +0000
Received: by mail-pj1-x1042.google.com with SMTP id i4so7405773pjd.0
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 20:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gesZ5upNg1RXGV/+lsgDtY0V75yfGqbAiiX0yLwNx4=;
 b=BdUD0E9cKnyJ7Y9hR0Vq3aPCNKewnQ2Js53WXLo+6SZnpnJdSdZBIYxR+Wjpo4nm5K
 AM70NnBzh9OFB3A2gwqYkialyyDojP8OVK5waMNQ/eTNM0WLROYfTMGzlsIHj54+rMan
 f162dXgnLJLqtEkX6yxZEg/54dwBDW1APP3OSFe+/0WuCYUbGjITNqaRFl7FV8W+afF7
 onoXDeeps26ev/oo3URcZSpbmNF9Se1jOAQLNKbp825xoig1e7UYMH3vQWsEWu1P5tMf
 Z0fv5D3TmLOGd2Q4O5l8JGayoIKOPMI59ccmUIRNiMo/ckusEAKHmuXCW8laQfBuSFml
 SzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gesZ5upNg1RXGV/+lsgDtY0V75yfGqbAiiX0yLwNx4=;
 b=qhBVeETggIhKTIIvXDBx2Z3vSjmljmbKDuhC3KOoGvL0AEljJH1ZOBbvxmIq6x7Hjt
 b9+UGuuqGrBTPBfWMcrpTOAlqkNEPflhn1b1eWZ+AdOmGC5R3kHHY/hTE8BaC/VCiYdQ
 7TgutHZqM95Lmejj7M+SuoBHUFzzUbkaaJLWDSQ9Sptc8fnM/tWeqjZSq4fGGPidzXEG
 p+O0Cs7MrHyn+2tYfZV4EEIhVqMU1BF3UkOkeR+dTu9b7V62v54S0dJENegFo2cHQ9FU
 rPuUj2pjr5Hr2BARfijYy+y0w4TdP42+J2yTgYNNhpBJg7nTmLnhwf+fnocBe1Xgzhez
 zCmA==
X-Gm-Message-State: AOAM5318cavNqAjmyB4TsE1UmM778V6qTpATddJF6W9AEFkIGHRB5xv5
 gQcgEAk0zkhu+p0lp0uy9xWMaA==
X-Google-Smtp-Source: ABdhPJw9NOcGyEy15wvZwxgMiqsbkeu2tq5+8bkmoxxAIUG8hgbFC2uVA5ccwNjveIJBppI+Df3gdw==
X-Received: by 2002:a17:90a:d809:: with SMTP id
 a9mr1580326pjv.40.1593400762094; 
 Sun, 28 Jun 2020 20:19:22 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id j70sm12876254pfd.208.2020.06.28.20.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:19:21 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/6] dt-bindings: riscv: Add YAML documentation for PMU
Date: Mon, 29 Jun 2020 11:19:10 +0800
Message-Id: <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593397455.git.zong.li@sifive.com>
References: <cover.1593397455.git.zong.li@sifive.com>
MIME-Version: 1.0
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for performance monitor unit. And it passes the
dt_binding_check verification.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../devicetree/bindings/riscv/pmu.yaml        | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml

diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
new file mode 100644
index 000000000000..f55ccbc6c685
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Performance Monitor Units
+
+maintainers:
+  - Zong Li <zong.li@sifive.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@dabbelt.com>
+
+properties:
+  compatible:
+    items:
+      - const: riscv,pmu
+
+  riscv,width-base-cntr:
+    description: The width of cycle and instret CSRs.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  riscv,width-event-cntr:
+    description: The width of hpmcounter CSRs.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  riscv,n-event-cntr:
+    description: The number of hpmcounter CSRs.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  riscv,hw-event-map:
+    description: The mapping of generic hardware events. Default is no mapping.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  riscv,hw-cache-event-map:
+    description: The mapping of generic hardware cache events.
+      Default is no mapping.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - riscv,width-base-cntr
+  - riscv,width-event-cntr
+  - riscv,n-event-cntr
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu {
+      compatible = "riscv,pmu";
+      riscv,width-base-cntr = <64>;
+      riscv,width-event-cntr = <40>;
+      riscv,n-event-cntr = <2>;
+      riscv,hw-event-map = <0x0 0x0 0x1 0x1 0x3 0x0202 0x4 0x4000>;
+      riscv,hw-cache-event-map = <0x010201 0x0102 0x010204 0x0802>;
+    };
+
+...
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
