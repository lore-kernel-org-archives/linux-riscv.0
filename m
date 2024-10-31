Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB0E68954
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2ZoEDRO2yr9y0hOmlYvF2lSkIPYFTz+HgPyAuwjDTo=; b=TQxvRdBh5wuvfh
	M9NRObuinffia7nL57LQ4KOQWsl06aCG+XZGv/I1jt2NXJBOmN7hzO5LB1RCxho7VFyz2QoeAWqax
	1yBvc5nv8/0yWbJv6ODOu/AqUNS38LycUwMsG2Ap1Qtm7X8yW/jS6BnzzqSIau7KzgKYajOHY2twr
	4qLptAe/qKG5BR218pn87k1RJIN+LauOIMZFV8ktgRTCdaRNHTzSEy0lCMFybhMvDP7RoYxCxEi+W
	TNF7aG8sybASfUmkNyW9VWowpl6j8BHjH5VdP365JiQ0GyMUrSevlnbgyfXXH0vIob4jpVYVbZV0G
	laY0Wsf5FjTdTdmI8IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ONG-00000002eOT-1ZNk;
	Thu, 31 Oct 2024 06:09:38 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ONB-00000002eMD-0qOv
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:09:34 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-71809fe188cso289225a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730354972; x=1730959772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc02FLxhfy5Xf8qTwvd6Nubgfo1jmCVxaCk2RIUB6RU=;
        b=mak2TJPwxcEuDx1MV2yhfLgfmeULoFvqP84YGPuaGgT1kMS/si4Af1+DvPtZH6q2NZ
         swKjRlwA/MLylWgunRN1tAgEZTDuNNte1+GhE8IeSLn6EkWLWyAwuXf3FffEWqBSYrBq
         1HgnshsOTrFqMlg7L7V/KkNjA/kpu2M4ThvbXhlIlwkwMsOGPiqZyNskTKD/HqwBJcUL
         p9k5T5wydOstfrahw/6VGhCK72uJ5luBw74k/Ttp50zn99cUqoRpoPAdv6Nj55Ca67E0
         dFweuT0Q3mZZNL5ZagjDfobb10sgi1Y4DTEa6uTynU0Fesd3v+UGN8lDZS8CP75DyMM4
         udmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730354972; x=1730959772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc02FLxhfy5Xf8qTwvd6Nubgfo1jmCVxaCk2RIUB6RU=;
        b=JTKi8GaMXCj62QFpZgvt1i6ojO9pRWrEaHIeugbIRUbMIOK0bw/1H30x/w/P0un84G
         psilgaPMYIuDQwvD/DZTPCL6h0YfTLnp8gFYiHP6g0oM9CDuMvynS6hxAa+3gafSmV6h
         UWZyTQ6Kxg5OnvQ2yMSGT/str5QBXQ9EhXujus5HW8yMo5KexrCtmsgQw6CUMM84CTiO
         z7v/hQ4h2+/m9a/dO6CW5JWHgAWCRqzezD/bgGPd5mbeIpO2oLcEFq+WHJR7eHo/Dam7
         Ma5MnkqWubQQKYs+IKfWYPQXDqGN/9McHNC7NGMltKZjk5IwA4b4bNbBOAz9J4do9vQr
         sgwA==
X-Forwarded-Encrypted: i=1; AJvYcCWXXfd8A31OUB9tjVOyh8LFn2tCy0Ne3U+RcnoUnrj4EP8QVV9flG/hoXiObkErPtt3WJ1PX5JNC9n35A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw61Cn0FWLylxPAquQr2YJajXEE9dDrBuhj30tkkepCfZ1UxCJh
	/uBudOezjn/mI7cL9yYWQG8LZ2p821NEd2S3hdS0IzQ8ID3lCPJc
X-Google-Smtp-Source: AGHT+IHmQUwN5TmL28+PKCqGNDrUt7hwzuLbah0KAI2f5gIPh+ZYAz6Cypl98SuyGh7fKujgz8DCMA==
X-Received: by 2002:a05:6830:6015:b0:717:fe2d:a4e4 with SMTP id 46e09a7af769-7189b4f40e0mr2421240a34.19.1730354971846;
        Wed, 30 Oct 2024 23:09:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459fdee2sm491505a12.58.2024.10.30.23.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:09:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Anup Patel <apatel@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
Date: Thu, 31 Oct 2024 14:08:57 +0800
Message-ID: <20241031060859.722258-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031060859.722258-1-inochiama@gmail.com>
References: <20241031060859.722258-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_230933_266528_BB7D6368 
X-CRM114-Status: GOOD (  14.89  )
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

Sophgo SG2044 has a new version of T-HEAD C920, which implement
a fully featured T-HEAD ACLINT device. This ACLINT device contains
a SSWI device to support fast S-mode IPI.

Add necessary compatible string for the T-HEAD ACLINT sswi device.

Link: https://www.xrvm.com/product/xuantie/C920
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
new file mode 100644
index 000000000000..64559ddc931a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The SSWI device is a part of the THEAD ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a THEAD
+  platform. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2044-aclint-sswi
+      - const: thead,c900-aclint-sswi
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 0
+
+  interrupt-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts-extended
+
+examples:
+  - |
+    interrupt-controller@94000000 {
+      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+    };
+...
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
