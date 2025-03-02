Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB8C19F32
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 04:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnSUyklLO7ukDQWTYCNEetNVgccn5j0X1DCj8g3CvIE=; b=FIXOoUNkUq1+9T
	lVU9bUeGFstALtxY1jcOdr+Fcdtg7Y0/MQ9875/clcji9jaeTjgezgPAJhlwb0jL1yhRqrJ/X1dOP
	we/jq6ayiigKBllHuPMvWHR18HyTmAHIKtldHoDinkF1F5PwGOd3mbZM3noFt/BkBYXI39JMrJ+Gm
	tioDh+/RAz0pzlbyxdV9QvYUWC5NP4MUnm/bW+6SZxsMYSPQ4qoVt1IQkUisVF06n2HShvIoEvfCn
	PGgXHzHtyu9sXrJtc4c7YGfJCYFoeTd/A6J3wjSccSSrTR3xYL7EfezxkjEd9fsIKflj55zmBCsJh
	g+aZz9vRL5dqN3twhXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tobMH-0000000FOBA-0dmd;
	Sun, 02 Mar 2025 04:55:21 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tobME-0000000FOAX-1s0i
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 04:55:19 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-22356471820so52928915ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Mar 2025 20:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740891318; x=1741496118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8UA4MHprNOqDw50/1wxBBH0Wcxx4sG4K+C13w4SBrU=;
        b=fex1GE1atYLnwK8GHEw+Ymqmo2G3WVsgGjOJzUgEdvlnPR/jHgDdCJytbl1AX94R3U
         MzE5sQ+2L/gumpTSheCcx3X3rne4XgJ587etIBgWchFTWXoUEPbayOER0aUM+i1yr1IN
         TBHvUB5Z6c1zguqzw3WS6giUlNmWztwGA7iQv/oRYqjv05/yrflC43WKLFqKmO3lBC8c
         CuocUy8Crtq4UrT+XD1BRaIIuDYGFCB0Gsg/0Y2T4oJh4aKdgj5fQ9v/YTwwtRt1uzQu
         KTdkIgc6LClrsnUch+HcswmzIhkNqhQ0tEz0mN4JmgnvJ8uo+/2Lc/ZPUWrE0xBSEBMg
         Ic3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740891318; x=1741496118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8UA4MHprNOqDw50/1wxBBH0Wcxx4sG4K+C13w4SBrU=;
        b=NCIR+QJ6dEJmGVpMiNKLEUvW8v1/R1EboVkvZYRMagnQJyR8gSKZijhlJyKU52BsQp
         a+VzOib6STl0NzgOL4RpKOl4oEHgXFeqfpqAzikvgKSPPrX0tlp68spykmbbmTjTp0E5
         jHH3LiDAYhql7kG1K52BMYw0j7v7SInaPw3EBQJhv9XTt57M0EmT93jrGRoIpXGuqrX3
         VB8bKcYeiqS+aiME9HabaXnuWHkUYQYjZcuPjGRrbQYzkvvZgMlZ3AN1kiQlag4vcWPQ
         hFCEl6Q/9sodJDA+VTRBDha5ebRbSlrxiF/7pqle7DAu/uGY+K50imO84LFJihRD6eai
         +32Q==
X-Gm-Message-State: AOJu0Yx+q7vxosqp/UFm7dq1pYcT03RyB1NYEBXWDYdaHJAqWMBruQow
	HpBjxQy7zSwvZD+NK0IVsV0rT7i7sFWeDUFDDl1jlbXV9ibe3euH
X-Gm-Gg: ASbGncuxClNNVxh9zjxhFBbLDphMBA4GURiTNwb7tG9yhGTCk6CvF6bhXHIFawO7iqu
	90OHjMfdO3uDcmvQjcmW6GovC4F6Qz3HV3AquDLjYGEMvYwh1rczjpXW8EPudDgdDvXGB+Zt+YW
	ZXuN0Ira6kKAEhMLY38eEgptzO/APVCj5tOC97+vNudXQt59LeUj3/eGy1Lr3V0n00lJKK9XgGv
	dJIW+g1BzaC2CMw9Xw/n1u4TD6CMj0jO98IGq17J7Wr6mVxngoFP9YZwyoLeL9AITrp/gXTnMFU
	8o7owYgQvE8H3WxSUL/DIOBy/C6+
X-Google-Smtp-Source: AGHT+IGcOWRvVhpO+Lzj44hFBHvuT+/dqjw5qG3v2emyk6zN78mMCNj6CS1OBdlIULr+lXZ/TNO8CQ==
X-Received: by 2002:a05:6a00:188a:b0:730:7499:4043 with SMTP id d2e1a72fcca58-734abee5219mr13166547b3a.0.1740891317777;
        Sat, 01 Mar 2025 20:55:17 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb70sm6359319b3a.124.2025.03.01.20.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 20:55:17 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Sun, 02 Mar 2025 12:51:48 +0800
Subject: [PATCH v5 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250302-k1-i2c-master-v5-1-fd77ad3c7e18@gmail.com>
References: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
In-Reply-To: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740891166; l=2000;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=8g5a451T75BEcXXnmVzoZlVcgDtJc257KeDwX2a7Pbw=;
 b=3sFRXUbSTvmIrv+D7xNY3Hfk+inQnexgYWiliMhI2/Hi7sjv0rywDDRc3Y7Ef4hCv2FjMCMbu
 QGy8rHBNh8dD719g+WhOP74kcnGGWv6D4Ma4TJtuwSVFkxKr2gByQDk
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_205518_498982_21797792 
X-CRM114-Status: GOOD (  10.37  )
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

From: Troy Mitchell <troymitchell988@gmail.com>

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+
+  clock-frequency:
+    description: |
+      K1 support three different modes which running different frequencies
+      standard speed mode: up to 100000 (100Hz)
+      fast speed mode    : up to 400000 (400Hz)
+      high speed mode    : up to 3300000 (3.3Mhz)
+    default: 400000
+    maximum: 3300000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 176>, <&ccu 90>;
+        clock-names = "apb", "twsi";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
