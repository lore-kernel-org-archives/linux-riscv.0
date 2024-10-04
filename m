Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE3ACFA752
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dptarhNMnKJV3jD5WoM5CLpGZSxjdwQe/gbGvFPh2uc=; b=dDvM9S2UWb4PUc
	rghw0Ekl+Bc2RTT5u0fv/2b1vyzhI9SlabaEgRHFGYinEJlAgvsw+gpN3FZSw+icLkinsciGELHQr
	5lf+Mg0CDlmBbBmwIiBg3HQ6MGoUsKxPHFHkRAlWHS5fv8B/Bh/RmcnfId5u3Zos9gDIkWMfGcbwq
	+/3uiGydTONbgdBe7lJBFQruRJQT6eGldkK9gETTL7LDtNY17hPI8sPLSdh90weqa7Z/kWJUzPnKJ
	uOVoRCoTtDExnqM8MAF8hv2C4yZBzLs8nGtWg7THOYCGTfCDRkdSq2EAEsyn5fScE4gc01ZBJdfmM
	30eo1+jKgFTT6kWe4w/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdSI-0000000BMXV-3b6w;
	Fri, 04 Oct 2024 08:14:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdKc-0000000BKe7-3dp8
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 08:06:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71dd2b6cbe6so1547694b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728029194; x=1728633994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn7EDiPk8tvD+amgfWsMTbLvOA9JjMtSP1WSiPFeqcM=;
        b=V+Phqbd6xW7bWMF4cSQLNvkclDnfFGQos1IpGtqzyZWaD3fCOMWkDidt2DgMXIck5t
         6hZlH1plVn4NAy2n49W3GM+mBb8tRzf2Bf3hFwzA93Rcoy2Bd5+HT0wHzOtcY6kpwOSN
         tiBgBgMBbpHQDNJ7QfuRcqCXIXN8yY9yhbpjy9nRDUSZKUFSWtxInL0slq3IM1CcrXTx
         ddtqCSCJOiHAmn/Y6tLtC+vUjFXW4q6HLGlScQZLYivjbHZIwB9XOJmZQR3tYDca8M7x
         Kcj1VrAFNw+3/CQGjVeD2xw8k0i/6RU/JpAInSCaUyR3VDsl1NEjL3dnA0/oKz7WTly5
         MpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029194; x=1728633994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn7EDiPk8tvD+amgfWsMTbLvOA9JjMtSP1WSiPFeqcM=;
        b=Qo9hiWNfP3LU0dm7naPpHJ6GPwE8GlTSpU2S5VPkidRmr/dRvxB+lxNnTrPfFltjFN
         WgBNLqw5icX04nU5hES3P3+sLgKI1a+wegprtntB8r+BZjeYhj6MZEOSyVhLcrO0esZ/
         vT5gpzLiFZzIEek/+Gxf2SbbXwud8hRX8C7RmNtpg5/E/ULVy4oqPGtdDaY3XekX11Rd
         V5u3CJ9Xk1WRfnD9vE98InciSQyUdtMAgsRgxcXCPB3aoJtOtnEHXe0beeIkaqcxUsB+
         FxN1H9v1VXslRm9w/0HctnfWl1BhvgQNR5o5+DpabbFN9vEkT/uEYMwBfvrj5sj48Mua
         Dzbg==
X-Forwarded-Encrypted: i=1; AJvYcCWSNexRcwW749FmqlcGOgNyRtIifKoElEF0jcJbx/OkcIxzSsMoTl/gKsprsBUcuZfrFoh9mDfBYHZ9pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk5vDY+N9w2eRrLhyfn5WGMNQLnUxYrk8s6zHRG2PZMsoSTPdP
	CSw6Kajia+5ekWJw6sSC8tO7aIIWwbuWYVHyW1NV405eq8kfE0WB
X-Google-Smtp-Source: AGHT+IEPhKOYkZAH1L27GVScnktHV29Zg6rnYt7Aao9Pj+ivGpNBxOMvq6N+e5012LjWTi4Tl4hdpQ==
X-Received: by 2002:a05:6a00:3c83:b0:717:8ee0:4ea1 with SMTP id d2e1a72fcca58-71de22e8399mr3349322b3a.0.1728029193671;
        Fri, 04 Oct 2024 01:06:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71de63d0014sm689798b3a.190.2024.10.04.01.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:06:33 -0700 (PDT)
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
	Hal Feng <hal.feng@starfivetech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
Date: Fri,  4 Oct 2024 16:05:55 +0800
Message-ID: <20241004080557.2262872-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004080557.2262872-1-inochiama@gmail.com>
References: <20241004080557.2262872-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_010635_012458_87EFBBA2 
X-CRM114-Status: GOOD (  14.80  )
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
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
