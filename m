Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06990CAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bc4dkKMTWLUPElngXhsK0BmePit2AoQPoDJDN5dL7j0=; b=Tx06+yqf+LR3A1
	v+8S2IVq/U4aA/kZwt73xG0tU21egu7Cgfy2LgV0/DjG6YEYwONuJbk001DooPQuORShnjgISq0Xv
	ToR9iliEuS9d4bUlhYAdblw7p6Lq9ksf4s8GStOzRcb4hTMUq3LEPiMoTmwrjkcMXJDKCQ+v4MM8H
	+cYc07l/MB6+10Rg01/aDmtnt0Cm+ji46QnYQW9E+F1Znle89nwnqz1NUSTrX9Wz3YGd2euxu0IQ/
	hpxPJTmCGU259N14VgQy4/qMTuZkTDZrTDOJRtbY5je5MPoXtQLEfPJc1mL6PjBVmcTHxhqdpCJcS
	Zatft1Drnpo/3GepJ1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtda-00000006XMq-2Njs;
	Fri, 12 Sep 2025 02:35:46 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtdX-00000006XKo-3Szp
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:35:45 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-74ed00220f6so592731a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644543; x=1758249343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=PMk11UpDaGOVkTf8x9B2rP0pJLjfByFqYUnF6zkZClei/cY2HXmyHp0c+7tn1aLwfE
         MYuydk0+YKiaZAvCORchXVYTEQLCRLm3XSqLQ3kGL8DT5Jv6TWvQH8zu/JgTFU6jcWT2
         nDhgYWMItS3kLDpMW9tiLD0EaFiNwGgd9BA9ALmvHwGpQHSABoFv8S1+zYdZYk9qgT5J
         DPLplOtdUxZRcQWz0FRKwWVjcwm5zX4X/eYV/8MwGDwwLInKQBFr7/PuY73ib4aadjCG
         QZGdwFpwlWyqCsdRhEigidImL2dZbfAedoam3Ow/nUbTHg1iRDm/o+W//raOirodBFSn
         FhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644543; x=1758249343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XFM07Z5n/PQZ1U15JfmMTCdL390KHJnWHFIuZFK96s=;
        b=A2NjdjEP4RW8BCLPzbfPcUDw9YQGvt5kNEvO2kS40OeEya4ya/MSyi+Z/0nNFBryQG
         DYunH7lEJiO6gN0EvKLX0yOnhn3YmFSSAfVC8I2zturk4kvjcQI7qrma+l7Ra0VWKMie
         H1CL1Th7pH4UCHUrAUwdmzCmFNoC/bofwzDVUbV42s/58+u5V0hoaJA11WaKD+FSpfo9
         4mdfAL7nLso9zmXLuQo4sMB8zsqy6GFntqJR1H76cUMx1PvEIBSeO35Kr2zaiOT8gIxy
         IXDteBkhuKwlHWcvB8rcj6cNeJIc4EA6ST9Nd2bQ3ul5pT47W0XYKvYrFu0YxVtjxpFY
         oz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf9djeuo1S9iGBV1/ITxMShJHih6LNyjmPmFyqgHToVFgfgQvUgQnjbxrOlgXL8lal/lck0YR+eAaUFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl1C5eweymq8dhPea9dAl5uJqC/sVqvWBEmsf1yxU0UczjUBev
	tK67fk47+fkF20qM36V7C8p+++Mhxg5WI9hayYeEueMhaLUffM9PG9ae
X-Gm-Gg: ASbGnctydM9MI1Cw/TD8U5WpuMoG3p9Pguiy0NjY2Nq/CNR3UdkLBFMvu5AIz0st1vK
	jMsDMWFVJFhmHh6Z7grNLwAxkQhbItskMZ6RXGEEIh7/kDSZw3jNdSEtBGhvHu5wJaJ6rnj+HVp
	84qG+nF8RKkmrm8Y9qieaol1bMO21h0HsiZu6fErXXvGqQ2X0+zK8DxJZfMdjQcJR/21uumP13e
	LyV3uODDQecjX1Y0RVi9xLW0e33nPuM1zT/3zXnE2mf5MntDxtmW1kdKeyD90mR/BP5ZYzWQZpz
	9iv9uOmZQR0gOx/0POoqnqBWXVeb02PSvMLdvO/0HZ3ZFUxseqHqsvXwCSjG4Z6O2tWW3tuXxgQ
	NdKuObuWWjKKNo8X0YNDs3mtCqbUF5jIZ
X-Google-Smtp-Source: AGHT+IHQMNFCh86X7WUtfRMJW33oGIfkq7JFshCaD1qyzjsyBvpS3iS1S6F89Dx5xJzPUg1mM6pJVA==
X-Received: by 2002:a05:6830:67d5:b0:744:f0db:a199 with SMTP id 46e09a7af769-75355abff0emr852539a34.29.1757644542764;
        Thu, 11 Sep 2025 19:35:42 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524be797e6sm739170a34.29.2025.09.11.19.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:35:41 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 1/7] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Fri, 12 Sep 2025 10:35:32 +0800
Message-Id: <2755f145755b6096247c26852b63671a6fea4dbf.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193543_872825_D597B479 
X-CRM114-Status: GOOD (  11.56  )
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

Add binding for Sophgo SG2042 PCIe host controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..f8b7ca57fff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
+
+description:
+  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pcie-host
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: cfg
+
+  vendor-id:
+    const: 0x1f1c
+
+  device-id:
+    const: 0x2042
+
+  msi-parent: true
+
+allOf:
+  - $ref: cdns-pcie-host.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pcie@62000000 {
+      compatible = "sophgo,sg2042-pcie-host";
+      device_type = "pci";
+      reg = <0x62000000  0x00800000>,
+            <0x48000000  0x00001000>;
+      reg-names = "reg", "cfg";
+      #address-cells = <3>;
+      #size-cells = <2>;
+      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
+               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
+      bus-range = <0x00 0xff>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      msi-parent = <&msi>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
