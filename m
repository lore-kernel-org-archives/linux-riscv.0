Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EEFEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YHb6l7SR5avodbwuxbKqqoiX+fOr+ixeSaKt5vr3CU=; b=msUP/JCQdHgkFp
	X3c/5315FoF9t/8jURUofN0JIHT9N5ZWd9UHJuyiK3mZADRp9Tm6jkx8ebSyLOQeZxIkmhkZmgYgu
	d8pDAWvPuRgKJpU8lk320j3onL2vvj3qQQymbLkB1Rcsz7qgmWJ1136K87JV2dl/xVravGsoRULe3
	hTe+frxLd/SEGG+77pgKnErDeWSTuRyzNA5mQEeunl3gwfp2mUN1sGFs0o+++bmiJrtKQf9UpQACq
	Y0bMgV1ovEJemS/xZuAIx3TMXbWwliZDiklhlItoo1E4Y+jvKTjblnuBF5aBvH9GsnLMhgkPmXMfk
	hIh1n9rPo4iUnnmEsEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMU4a-00BID9-32;
	Thu, 20 Jul 2023 13:52:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMU4X-00BIBP-37
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 13:52:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-66872d4a141so526408b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689861119; x=1690465919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwIjpadbA1bA+sFrh7qCEP0xay0bdLfI0ypl9RcKrcI=;
        b=IhvSszQH7ed5TdLQb/bhOsEEIP+Ti0MkfkYGqt7ql/69xRHHL7UfR2C0woZnzRxj4M
         wKZ13zLz+NT/Sjq9PqG+ncOpY+pxRLudha7/fqfiqsjW8PueNjqggffIFnocWL2F+SxM
         3YQ279j8kREhvC0zy5sclfszwT0fQn+POzPFYIr6odeP9tEGjT2F0bI00dhSmAkOa0kc
         GaudZfPloQNfmuUiH6rlF+9PF7ak7XwXfiIe57vpXx+S+YmjAyD392jnF9kY7F5DHpxt
         v+Jny5mkuXnvvHrKbZiABGpuoaoov8tddSudAw0eYt97XWovnpYh9ptj57+BN71t9RCa
         K/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689861119; x=1690465919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwIjpadbA1bA+sFrh7qCEP0xay0bdLfI0ypl9RcKrcI=;
        b=kT7iiiRSapswy4SHDgphIzpIbfTTNGxSUEkynlWAf0x/dkJvECNRzjO5RxiyB86+sx
         oA8x+n3CzE74D+eG21ESFXMNreJkLgu1uqB6dg82cY0Cso6J3XDqKzpZ59WzNxYfG7Qn
         YEBHCaXEvoRMwwW0MykoiNHMpYbA1iCKz5JxNz8lbN3c6SdpdaRoaSRADkDoMirGhfpq
         TflFn1KNwi7CJX2ImRkHvGZd0A7NWkCTChTZ7V5KFVl2IjrsQHivHlqaiaX/05Era3ne
         p/pMgaiYNotJZY9Whhu14s3cbKPfLsCF6nu8pjnzQ2NiWLVzMP4B8MhWomtS/nBTwUa5
         UgjA==
X-Gm-Message-State: ABy/qLbs8SaV3YmkKPurL6G3JYf35hGYU7OlVMnX8j1qld/1cS7v78NG
	oJiZM3uckHC1TaHtVhQ3n6Pcxg==
X-Google-Smtp-Source: APBJJlG0R23vqKexKWkbs1Zy4QZQSyTSNTWmgwbdNzmyOhYsE1lhy3kIgnsfh3MEtlFSekjQ6Tdxkw==
X-Received: by 2002:a05:6a20:549c:b0:135:4858:681 with SMTP id i28-20020a056a20549c00b0013548580681mr6149717pzk.9.1689861118900;
        Thu, 20 Jul 2023 06:51:58 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j18-20020aa78d12000000b00679fef56287sm1197529pfe.147.2023.07.20.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 06:51:58 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	will@kernel.org,
	mark.rutland@arm.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Eric Lin <eric.lin@sifive.com>,
	Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2 cache controller
Date: Thu, 20 Jul 2023 21:51:19 +0800
Message-Id: <20230720135125.21240-2-eric.lin@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720135125.21240-1-eric.lin@sifive.com>
References: <20230720135125.21240-1-eric.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_065202_008202_A43E007C 
X-CRM114-Status: GOOD (  10.95  )
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

This add YAML DT binding documentation for SiFive Private L2
cache controller

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Nick Hu <nick.hu@sifive.com>
---
 .../bindings/cache/sifive,pl2cache.yaml       | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml

diff --git a/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml b/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
new file mode 100644
index 000000000000..ee8356c5eeee
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2023 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Private L2 Cache Controller
+
+maintainers:
+  - Greentime Hu  <greentime.hu@sifive.com>
+  - Eric Lin  <eric.lin@sifive.com>
+
+description:
+  The SiFive Private L2 Cache Controller is per core and
+  communicates with both the upstream L1 caches and
+  downstream L3 cache or memory, enabling a high-performance
+  cache subsystem.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: sifive,pl2cache1
+      - const: cache
+
+  cache-block-size: true
+  cache-level: true
+  cache-sets: true
+  cache-size: true
+  cache-unified: true
+
+  reg:
+    maxItems: 1
+
+  next-level-cache: true
+
+required:
+  - compatible
+  - cache-block-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    cache-controller@10104000 {
+        compatible = "sifive,pl2cache1","cache";
+        cache-block-size = <64>;
+        cache-level = <2>;
+        cache-sets = <512>;
+        cache-size = <262144>;
+        cache-unified;
+        reg = <0x10104000 0x4000>;
+        next-level-cache = <&L4>;
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
