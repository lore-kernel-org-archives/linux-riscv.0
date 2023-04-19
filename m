Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301D0C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2J6xJgxGUVITXuFrMa40Le3OWym+T61KXWrf++COMkE=; b=vbweiDXGDAmmR6
	NKJzuvaHE11qmgzSoIWc1ngLA2XB0JMPSoa+8gARU3FY6Ldpr/s/Ng8wMPB5zT3oyasRTdV7Jb0X3
	wGjWlGBicOjPAaPCzOELn/o8yP5ar+OZQ+A46GrLIYOzesMJ+zsKLzNFcf1aqcdSsggVDjsKGuhDk
	xC/HgbpCjvu2PCvb8NF9YTEFrL3WcjJJ3LbUxutps4SpgbwWNUHvtyC1O6HkwcZWnv7IsedTdVrLV
	jvZ0vIthxVF9C7Sh+9EqaurPKhjQdNPER2K32daltYVeFx+dim3k6ThpV4CHfDS1iJfr5Q6aDq6qc
	aysvKqcujs6NG4FZfGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6im-005JDj-2u;
	Wed, 19 Apr 2023 12:15:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5ho-0058He-1e
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:34 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b8b19901fso2360632b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902632; x=1684494632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTUdiTLb+sfXCVtetWlAgKKAKfkEOw5o717LduaEZcE=;
        b=xsELkwofXkO/cQsRhRzGSc4LNBA8d5ZwB4JnQLYCH4ZaGVuBP+nbM8feALhCz/sIMz
         MyuAV7iJQoGOCditkX7ry8YYdS0Nawh0XkuVc25RdlnISTlsepB5DEmsSviF6P1Gq8W4
         sluFvFa7S6qFMHylgIRnoWU+6wHZRBJBUaeX7Sg9yxxQWXO1Q99it5uMYgycZZad/mrL
         L8gpu72e7D0hEFnYS3yPVgIo9Q/KR5HvUJJ8GoySwWCZyTXYyPT6AAPNupIgcX6fR6M5
         jjYX2ppBNUoKa7qiG/Pd8D5X9175xTqsx/8xUD1d+dBmEDXhg71wkyYYTOIWDsckkHdb
         50sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902632; x=1684494632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTUdiTLb+sfXCVtetWlAgKKAKfkEOw5o717LduaEZcE=;
        b=b6D7X8wOO+hELhi0OdwgaZ4ay9Wt4qqrU3FSWKqp5zHfWd8j+G3GNIPCXl7mjCCmeY
         aQwcH+4oYhU4S4ayCMNQeB7Z7SIV3bn98vEeWG4oubv+jONy+G9IyrQxSSwW8aOr/2D7
         DJKni8xAos/wst37qmqVByDF2RfUUd07cIKctbZrZSFEMzRHFq3IZ+Zwh54g9sh9d6PO
         kGzr1rSshD6DOiGlJxwSGqXGeqx9KkK88kuKu7M3AfHGHmIdhb7wg6MoY4QJ4SK49tWS
         QByNkV3QrsbcmcVvf5aX4gh0LS4t29xfeNZfVBT+3qDAei5yITdcIzT7G8ftEs2ViecN
         Xy+Q==
X-Gm-Message-State: AAQBX9eJ5bL0xaPt7UhNk/sQHxfSphRg1Ojddvzr6Zk9aymeVQ8cbEXL
	5TAUqKZBBD0RWsB60DV88Vp4Nikf2np32hUSQa4=
X-Google-Smtp-Source: AKy350brfXXAlUzH+qw561taTYPU1WAFCWw0yqnL0lAKNxrOpHa9fu+9+OhVuIBQrfZgZmagCJ0UZw==
X-Received: by 2002:a17:902:b60a:b0:1a5:5e7:a1cc with SMTP id b10-20020a170902b60a00b001a505e7a1ccmr4412371pls.58.1681902631792;
        Wed, 19 Apr 2023 04:10:31 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:31 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 15/21] DO_NOT_MERGE dt-bindings: soc: add Foobar SoC memory controller
Date: Wed, 19 Apr 2023 04:11:05 -0700
Message-Id: <20230419111111.477118-16-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041032_558943_48267AD8 
X-CRM114-Status: GOOD (  12.65  )
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

Add bindings for an example SoC memory controller that implements CBQRI.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../soc/foobar/foobar,memory-controller.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/foobar/foobar,memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/foobar/foobar,memory-controller.yaml b/Documentation/devicetree/bindings/soc/foobar/foobar,memory-controller.yaml
new file mode 100644
index 000000000000..859ee52680d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/foobar/foobar,memory-controller.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/foobar/foobar,memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Foobar SoC Memory Controller
+
+maintainers:
+  - Drew Fustini <dfustini@baylibre.com>
+
+description:
+  Foobar SoC memory controller implements the RISC-V CBQRI interface for
+  capacity allocaiton and usage monitoring.
+
+allOf:
+  - $ref: /schemas/riscv/riscv,cbqri.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: foobar,memory-controller
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in CBQRI spec
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    memory-controller@fff12000 {
+        compatible = "foobar,memory-controller";
+        reg = <0xfff12000 0x2000>;
+        riscv,cbqri-rcid = <64>;
+        riscv,cbqri-mcid = <256>;
+    };
+
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
