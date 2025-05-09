Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D13CC3ABBE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 02:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evoDibmLz9rn+uuXY70MvznkznBplQJH96k+iagEUUs=; b=zpl1NNRq9XwHpn
	3Zy3vDqnel/F5S1nmZ3DlPggPit4HePp7Hfnw9o31OVaWSGvKGCkoVLfO/itH5kt84kHaD1ZlcK2p
	/NgHUa77wUTdDxPPgmrToUtK/+HWZjAN9b4QJT7tef6lNyjlX7qWGtsipABxfnv0O7PQYO/qrgtgh
	ztaaZ0HqcQTC/dm4cgE7v8nZNx2ZwBvaQ2ZSel16jJlBB9BZgcDUSMivOFaALee/2Zo7n+4/P3i3J
	/VbgNbv//kV8avwe1mRwsefibAr4tMyYTb3Nik24BJVP+mAcZhajXKjwcVeLKrr8BOLWO1RPXwXwx
	BQGtE3WGBIa8HTeo9qdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDJa-00000002Eaw-0jwq;
	Fri, 09 May 2025 02:18:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDIw-00000002EUZ-26D9
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 02:17:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso1757693b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 19:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746757057; x=1747361857; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COuwbILi4TOhg1B2xAx95PCBRZphUGdmgoB7CQvJQtM=;
        b=ZNM+RfFgiwO+tUDUUZjwv0GLGpoB5U1yMR3mulX8K7cRwiAVcn02Qcd2JqVngDq7wd
         cZmc0Un6eT9Rx+BSAJ5SM4+bq9+HJt3jxFMEkeZ2wZfkhVGLOdS8bYtnqbaz5U33NLL0
         vc6TPUhpsXopeRtVtG/Z7U9dUNDC1TRAmcqbYlOa0O2Vb01xzShR1RHvNHWXcu6/kJEL
         29g8sxuk9Nh5I3paupsGJLYOdxTf5dc2VSheQHZKHA8tW5b4gRtJ1h5X7kY5CSE1gpg7
         dqO+ewYLPT0gVI2pWkR1exwiO45PwcSjGCR7pdailRDzFI+jOFAENzDdZEb1HJ6toGzY
         r/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746757057; x=1747361857;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COuwbILi4TOhg1B2xAx95PCBRZphUGdmgoB7CQvJQtM=;
        b=XLV3Vz1b1Sc5VXlIShEdlnMVC1cZWwwuIk29VXS0Y1r6S1owW2VAJb6d3VVMeBh+QX
         hZDE8dGvCSVllArE57bIAr+41OAoHX2XKl1OqoPsypM0oy58NeY+lgVM9Ins8c4Jc1qN
         Ykz5pgu74aulifphsx2yI3BJyDsIHBr5TBb3gCHeDvfhjPwJxelLHIHRiKqbu0yvMLxN
         MR0sRRzEaJfLiATm2KlqCstuG1wpNndeT7bHeLEYZXZm6fvngEBc0EYNzVrmcvd5h+UH
         yw1gM5JnEJ4ImRSp8yHQU4PoduzKroOo/xxgM0eno6ju1kzQGmnansc4/tMjsW9C5it7
         UIRA==
X-Forwarded-Encrypted: i=1; AJvYcCWE5N2DDyZfXUIOg7qho7UVkzffdpgh+KQrNJ/6yZsvk/foouGEZrb1bGpQXJZCHYWCugMS81ArYkoo0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQJXXu35S/uGmf3Lwj8pBzXrIEFwhDKKRW5KYSZV6QnI8NsfHe
	vwaP8zLZ8VWbBeZFwomLHIxfJL324JjAXLqvSNI0hqZCEGtcBklEzA8PBCC+m7M=
X-Gm-Gg: ASbGncuhYkV6gDVaj551FXoQt9n0OmXpOBDtuvH2AoJ/AJWwR1xIo8FYSPiCTz9zVAq
	VLqsREWRdEaevqzYnwwhhQ+qpEvzSbK1F0Nv+zwFMNhar+/VzIezRcsjuNOYT7yPLgzURSN2ihA
	poClcM4qKXZP/e4eW4baP4xJPjiL+VV1ybBb7ICsi8rsJkZws1NCCfWEr2epe3Jupee4oUkHOIY
	5AQDjVJ1XlohYZG/2agZdDp+/BfkbIHto1dC+tTaDZ+mPmw00Rm4/TYupZh5LAIYUKJdtJmqUMZ
	6pKEn2LBuk2KvadQ0Wgs/YgM+ofJtBANJxHgDV5Q/H2fadere4NfA1QI+XDp5zs=
X-Google-Smtp-Source: AGHT+IHrxCZaQsfenVelF9R0H8Ri61vJWq7kBW24FBrc2xBa8NbB2J48U9ZpAcGWfdq7Mgah8BLxkQ==
X-Received: by 2002:a05:6a20:6a13:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-215abb3816dmr1810793637.20.1746757057126;
        Thu, 08 May 2025 19:17:37 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3dc09sm744688b3a.141.2025.05.08.19.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:17:36 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Cyan Yang <cyan.yang@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
Date: Fri,  9 May 2025 10:16:04 +0800
Message-Id: <20250509021605.26764-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_191738_562694_E2F06208 
X-CRM114-Status: GOOD (  12.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SiFive Domain Management controller includes the following components
- SiFive Tile Management Controller
- SiFive Cluster Management Controller
- SiFive Core Complex Management Controller

These controllers control the clock and power domain of the
corresponding domain.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..7ed4f290b94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Domain Management Controller
+
+maintainers:
+  - Cyan Yang <cyan.yang@sifive.com>
+  - Nick Hu <nick.hu@sifive.com>
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description: |
+  This is the device tree binding for the following SiFive Domain Management Controllers.
+  - Tile Management Controller
+      - TMC0
+      - TMC1
+      - TMC2
+      - TMC3
+  - Subsystem Management Controller
+      - SMC0
+      - SMC1
+      - SMC2
+      - SMC3
+  - Cluster Management Controller
+      - CMC2
+      - CMC3
+  SiFive Domain Management Controllers support the SiFive Quiet Interface
+  Protocol (SQIP) starting from the Version 1. The control method is
+  different from the Version 0, making them incompatible.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc0$"
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc3$"
+          - pattern: "^sifive,[ts]mc2$"
+          - pattern: "^sifive,[ts]mc1$"
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc2$"
+          - pattern: "^sifive,[ts]mc1$"
+      - items:
+          - {}
+          - pattern: "^sifive,[ts]mc1$"
+      - items:
+          - {}
+          - const: sifive,cmc3
+          - const: sifive,cmc2
+      - items:
+          - {}
+          - const: sifive,cmc2
+
+  reg:
+    maxItems: 1
+
+  sifive,feature-level:
+    description: |
+      Supported power features. This property is absent if the full set of features
+      is supported
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: ["nopg", "ceasepg", "runonlypg"]
+
+  "#power-domain-cells":
+    const: 0
+
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          pattern: "^sifive,[tsc]mc3$"
+then:
+  properties:
+    sifive,feature-level: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
