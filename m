Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D622C71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pWgfOrmfuwMb9c+4OzAX62GdBP9cMidTcdrQmdJ9i0=; b=RtxWqNL2ebiF3d
	P5IQxZ6RJNBPRVIXYD2zbjFxGlQadhFVECyMxqXK+2qVn7ckKosHa7LBxmpqgvytCV7MLlruo+Qp+
	Pe482VYtiQ2JQB4HuYwlwjSpaj2YOXNOxNswWZ7PSFeKUPMkydrp5w05ymnWpQv7205SpfvFPJNx9
	wU7O8hX889VTYVEf6hXIWsBrTIvhz88+XRSTS3GUCHeINidP8yc8+GVdZ9JItn4nGziBgjaXWqN/7
	MWfk00Cl6BdcGmDsw2U8uDwGcg68m6RZmGMpzQbQXeWS/wf8KvrFkrem+AOaYn1tAp2rDQ+GrHucd
	VulzIgFnq+GtDtUb/K/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1wb-00000004RsU-2sx6;
	Tue, 08 Jul 2025 06:36:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1qv-00000004RFd-2hJF;
	Tue, 08 Jul 2025 06:30:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3125670a12.3;
        Mon, 07 Jul 2025 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956253; x=1752561053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unrCE2h+xEs5THla5g6JIss9SJiJCc2wnfnjeuDD2ZM=;
        b=aFUcJS6R5q4T9hwMirddfOb10jdoboGGNeAvJtvWePmry1JOPPdifGZtKvKlnu1wYo
         E/yhmTZCHMdtKRybPOVG+FDfmxggNRtr6FNWmBsZtfey12OcJvoxKyWy2aRkPl2dijD7
         +4qHtYkatGG+JzCJG4VenmhKW7HpfSV/bYmFrqS9rsvFGiXI4Mods+EQ85lnjLOir8qx
         /S/67pVWAYlVEUrZpzkpWqdM0lrvaNd5bA8e/+1XusbffZuGNmPy63/mvHFR47kamRiC
         cPsQdpsQZn3LKcceCH0VzenTHeY5vWa9aCFzscVuN+QcAkZgM4+K8T+l0SKthcB5p3Js
         MZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956253; x=1752561053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unrCE2h+xEs5THla5g6JIss9SJiJCc2wnfnjeuDD2ZM=;
        b=pmay37fcddJZP8GyDIBJGBHypPWjq8xXg4SoeBf+m2EZ4C5zT+i4OgHRCqZlp72rXW
         L1nEJv5vXkF/BHEDe5RNqtf5ZgIwALstlisppiBZBmI0xyJtkBeR8Fr9qV9yWvT9STE1
         duFcoTgse95PQ04hz59ZXVM2BCwLnpv/h8843qLb9D1C+gMOFYUfQoHOUk6bb1+939K2
         7JnfVF8HuifgstooPqjI6jIgbFmojGXBftyF8LU1CGigKGPPb+l/g23y77b+iIBIt1ca
         60LWmhPJ4aWHR90GQ0Vfju23+Creuv6mDpk24LEF1A+HJio+giKNXAwW3ruumQu8WIPd
         mmIw==
X-Forwarded-Encrypted: i=1; AJvYcCXfn7d7WW7G96vj8pTe3qa5WWeUlaxXzOArMeX9RJcD0NNVpH81qwVrhT2JwsXoH3vadfdHoRGIzHC0Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbIvrf2j9sDour4V0Sd8BGQkc1wzfUYlQfzN09mfhN+ynuEbBQ
	KgqIDBCytw1siwcCmXqZgdrIs2MrOQy8Io9fY8cqiSehw4nFUz/7bTfC
X-Gm-Gg: ASbGncvkX1mFV7kEAc3ToAc+WYf+J55Amb8HPNhOvvtcIpOKKaDwxBR3ITnfe19cENu
	hK7j86P8PkS3jX7q1bNWzTR+0XPKUitxpcPBYTwNCEMMOptVmetp+9QYpHN6exkx0l5fJFeG4ci
	sHdqyI/Bb/eWBo//zggLgdFNZlRMNtDySA2TQqe3O+X0RxMw5WylhUbx40x0SxbjG6Thb62zADy
	vGF7US9sBlRA+ebnohVoywdMNp7LYXID6MUZkV1zl1yovq2zsBOmIQKFzEyMtKr/RI37G/1pZNz
	6R7WQq0sk5xwvSnbTIe1Cba9Kq3r1CO6w5uMegpLrY47MQm0vVUKlzWaQc8nWQ==
X-Google-Smtp-Source: AGHT+IG4k/cpRNSq91pRjiax3XUAglPeQQH9aGEgVn+1cSS8PugFjOb1sRvbj+Lujs1yMSOUO9eU6Q==
X-Received: by 2002:a17:90b:2588:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31c21e31fcdmr2286947a91.34.1751956252818;
        Mon, 07 Jul 2025 23:30:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c21e8b48fsm1207893a91.33.2025.07.07.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:30:52 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Date: Tue,  8 Jul 2025 14:30:36 +0800
Message-ID: <20250708063038.497473-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708063038.497473-1-inochiama@gmail.com>
References: <20250708063038.497473-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_233053_724579_E505559D 
X-CRM114-Status: GOOD (  12.88  )
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

The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
"VBUS_DET" to get the right operation mode. If this pin is not
connected, it only supports setting the mode manually.

Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
new file mode 100644
index 000000000000..2ff8f85d0282
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X USB 2.0 PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY app clock
+      - description: PHY stb clock
+      - description: PHY lpm clock
+
+  clock-names:
+    items:
+      - const: app
+      - const: stb
+      - const: lpm
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@48 {
+      compatible = "sophgo,cv1800b-usb2-phy";
+      reg = <0x48 0x4>;
+      #phy-cells = <0>;
+      clocks = <&clk 93>, <&clk 94>, <&clk 95>;
+      clock-names = "app", "stb", "lpm";
+      resets = <&rst 58>;
+    };
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
