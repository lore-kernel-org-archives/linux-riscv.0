Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1F6CED639
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 22:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKEhxffuAnZEPiPAO/BPm9UnA3whEb8Z3xIzhTbRsOs=; b=Ck7yOSyLREqenf
	vN656ihNfqHB6E/dBXqupImoawAO1+TV/fOdk028E7UrV1myk5FvxMO7N5XWF+/D8AGaDw9piyiKD
	u93ReYE5+WfYSuoqFPXGD6E0HQzZlsfhYAP69fHjbxV169FV4E11DS5xM5DALxWv9pDkb6SnNqmwh
	2le7IP3ZVmaKD5m6oEEYTdVmr5e58SxABseJYeRXx2G/krxvmIyFiBKcf05LZMc2iEXDl9hmIX4GI
	bJKArMokgL4nVJ51E9hTN/sLaOz4m/Lm5KnHWTwJYfRrwquP15fGt60TUs4hQQaNqVdVWeIz3Skc6
	OCj2MtBrhFxECZdQPhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syfS9-0000000Axuo-30WI;
	Wed, 09 Oct 2024 22:46:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syfQ6-0000000AxIK-0MMv
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 22:44:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c767a9c50so2038115ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 15:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728513877; x=1729118677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm4CsYMN2YsRkev2KFCV0kWlKGRxeTSpqxFYXStuCkY=;
        b=Li0F08/MpPc16vstzEj1IYg4lB/2CmLdjyQfDGPF9jjqWLRoS3QNsl1PewdrRChCsf
         0wcsznDHBsV7BGOOVdM3LamW5jVH/X/LnEy141pHcXHBDyNrzYOsMIiCckoTdW0gP4xh
         pkt+oATirMhbbgmEMrY6BsAUCw4RDG+zOMovEg+O/ByzsD7lzeKh9HqIZsTRwxJRmPoa
         aZb3U51eN70xusdrlUi7NTjudQrBeGh3nshuGlspnlyXV1hQvbFPsg++6cMoquj3gIBM
         0Pnoqk4yNw11v95lwzu0iJOt5fQippxkul++gK2L8MZeCwp2vakeuFsScjWuUHmbKPLU
         WVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728513877; x=1729118677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm4CsYMN2YsRkev2KFCV0kWlKGRxeTSpqxFYXStuCkY=;
        b=cCc1laKEp5VpvFT2FgK+vK9t+uNcb9JcfytBEg9hOqt1Fp+0CnZO7bF/Vc2E8B/boF
         ozrwBcgjyYWr2FsrVmSfHcASxfSJhu0pKvviRdRGogk7aszQezGJKo5kBFnMTIzpN+H9
         Hh+ehLYQr4D2BNp/3aXeVh3VYcqIz9Ztgt5YX1lvp+bG8u634f11lc10Ww9vqzsXogyj
         FQrAJe84cynKg4fRmD++f5Rh2/B9+X3M2S5YQh870jgGLABsWFGfNfsa6lTjUqfqIbD2
         SXjLeq8tyuumhlYmRxtHsso1rrMDQR1zREE4Pnn1NnvW4pYEG3JCbje1hNgeD8ABxvjx
         I+nw==
X-Forwarded-Encrypted: i=1; AJvYcCVNvnnctS9jy95OTJtW4CT/YM2nME87aXReimPQS+Fk3kSpg4DskcOE1nXyxGwq6nPvc6K2cDkYnq+/RA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxizWDqeFaqC/jmDVl/XIB4QuTXxnqZNZJbx4U9bWFbIzl4kp4Z
	oleC6VqNgFat3EeEvvKqLX/yPP8qYnSgTBWGc/UDD4L3TC6Brvv8
X-Google-Smtp-Source: AGHT+IEKuoY00MBONYoYEZvNUwHwFgGZe++kurc8BivmtPoW128dTz3seqWpdUhyU5wFto11gZmpkA==
X-Received: by 2002:a17:903:189:b0:20b:b0c1:712b with SMTP id d9443c01a7336-20c63726b02mr69101965ad.15.1728513877101;
        Wed, 09 Oct 2024 15:44:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1393107asm75591135ad.156.2024.10.09.15.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:44:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
Date: Thu, 10 Oct 2024 06:44:07 +0800
Message-ID: <20241009224410.53188-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241009224410.53188-1-inochiama@gmail.com>
References: <20241009224410.53188-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_154438_150146_96C37F50 
X-CRM114-Status: GOOD (  15.00  )
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
a fully featured ACLINT device. This ACLINT has an extra SSWI
field to support fast S-mode IPI.

Add necessary compatible string for the T-HEAD ACLINT sswi device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
new file mode 100644
index 000000000000..0106fbf3ea1f
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
+  The SSWI device is a part of the riscv ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a RISC-V
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
