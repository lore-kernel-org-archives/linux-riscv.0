Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0394C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 00:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zLwkjXYht8lCR+y6j/ToIlRF+OoRXdAwW/3+AfK868=; b=EKSQ8i8O/H9X92
	gp7oW0Yx1LBXSaqmUS85kVhNCaYkX9WkZdf9W4IS9CABMb89WSjNAyHEZuoVaOUqdXmrjgg7KNFcM
	R86jVa2UfJcIzZ8fx+HtcUPziW55/lYtkaniyOkX6My+o0bN3Ji+MC4vH0kMMfuUXtr2bdB8ELi68
	2qxMtiMaHuiliwhlzh0m7SdepH/Cpq2yGGn+hDWw03DSvPgk/ST4TmE5VCcaB5DTGAERY/AlIpIlD
	VfSB+1zFOHkfHq0zfTUtHrKAsJW1z4hnQA1Adk6TNDi3CMoZ1GsnONhRFOCeErb6EHhQSqzBt6kLk
	eWsIIjbuovEY609Hv4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Pxs-00HYUw-2H;
	Mon, 27 Nov 2023 00:59:08 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Pxq-00HYSN-0s
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 00:59:07 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b844357f7cso2393824b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 16:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701046744; x=1701651544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlbXLStT9Yzi3MnsBsStbxN6rymsbOLs17hYyIxF/KU=;
        b=FlP251mHJjohHNS/8+F7NkLoyuo7ik/ZE6qGo/GdFewHY47QyK/nqQKipTgjnF6ad8
         7W0nKNfAX/zz0bU5klN7t4zitsglVi4Q3TiRsomK5MRsx6bxCkvaUyq8hZzT4cNj/zt+
         KK4vjZfc/LXA4y0XRRT+D/cc+V5f/AL+bfn+dNCxocvTBp3ZBF5CE2sQRzKuhUeYziLI
         gCjeynxKLVq0bJXlgoY3VHKwv4xHkqJMx2XF8ZhUdemPM0jsFBqU55xRbEKhzSRrd6Aj
         SOvV6VFLwzCRaRlKMJKsye1P9e8g6l1Vhh3HplGEC77G9v4tDaGNEY5Hp5n2YrQgpCxW
         f+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701046744; x=1701651544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlbXLStT9Yzi3MnsBsStbxN6rymsbOLs17hYyIxF/KU=;
        b=w5RM7FkISEWIUrOGQnOpu31EW74n0IqNZ+n/1/XUt4RrOMgLPRAC13HBFMxyFDIogg
         MdBhhTfXr6xtFj7zwqNC0+FfJPf0EUDIg+7zmGQ767V9bRNyZRp+OqrKN3Dlrcj7cPGu
         9MoxDRNOYBJIduHrwaGGnssjaXUWX/U8UAI+J1/4zmYMP5dMuZgBorowHkuPewL9gaVl
         lzzLpOLecIUoY67vj7AvYxqLWLsWP2omVh3vVvvINXP9Q4El4Um3cJ9u5xFsjQvPJE9x
         PrDRJgm8A8ikRdh1nIsRSSFyk8+k9RS+c496zbaW8s5sqrg+HrmtxTAbUnya25Yd1/a+
         S1Tg==
X-Gm-Message-State: AOJu0YyxuDpvGgFkcxxrHaX5iWyxF5BIe7jVvYpKpNzuWRo4WvuStNCA
	Dt7QMqnRYbTnrh0Z+04FWog=
X-Google-Smtp-Source: AGHT+IEOHGPYpq8xKiYClAuavGogKA68qGd2W4TI8bWaSZhQ+hgMr+x/Oldd6BLyBMVKqO5xGXN1Pw==
X-Received: by 2002:a05:6808:3024:b0:3ae:251b:5552 with SMTP id ay36-20020a056808302400b003ae251b5552mr13085224oib.12.1701046744290;
        Sun, 26 Nov 2023 16:59:04 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 2-20020aca0f02000000b003b2e536a96dsm1307697oip.24.2023.11.26.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 16:59:04 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 2/4] dt-bindings: soc: sophgo: Add Sophgo syscon module
Date: Mon, 27 Nov 2023 08:58:56 +0800
Message-Id: <6ff37629458cde4549067e0caddeb5cb640ca7f9.1701044106.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701044106.git.unicorn_wang@outlook.com>
References: <cover.1701044106.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_165906_308848_70B4021A 
X-CRM114-Status: GOOD (  12.82  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller Registers for
SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
new file mode 100644
index 000000000000..329d645091b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift to configure some modules, such as clocks, reset
+  signals and pinctrl.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2042-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    # Child node
+    type: object
+    $ref: ../../clock/sophgo/sophgo,sg2042-clkgen.yaml
+    description:
+      Clock controller for the SoC clocks. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@30010000 {
+        compatible = "sophgo,sg2042-syscon", "syscon";
+        reg = <0x30010000 0x1000>;
+    };
+
+    syscon@30020000 {
+        compatible = "sophgo,sg2042-syscon", "syscon";
+        reg = <0x30020000 0x1000>;
+
+        clock-controller {
+            compatible = "sophgo,sg2042-clkgen";
+            clocks = <&osc>;
+            #clock-cells = <1>;
+        };
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
