Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D72CA0EFF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APrA5XvhhOO6zopMkjAFGwvD86thTXuO/ddlwKHrUuk=; b=YUrkG+nRQnsuj2
	HpUJ24yzj+hcQPWnWW1hgYnuGtkPq2qUToyyrBhfrZZgTbVey180u33MbxP/Ahtzi2nF1HRBywaZK
	W+Z4OoVocBPZ/3xNL56ogA5kM332MajceVFdTNj2WS8YYrNTCgG1YNm/Uv5VT2YOSXZQclkPlxL6Z
	Tvc8+CS7RrqD3shX7nlpAdmdfECANMWNH5qbmBGfX5QMYKiW1h6agKUdRtqAzyC6VTvnygrGvpHpu
	9s70fuEDwgp649vHSPOCVCrPP4v5e6mdeQaYaU3bTVKhY5I4fHf9a+PsZYmaNo656gStKnAmahF5g
	K74CDFLjtlWWV1V7xOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSCJ-0000000HaTH-0a5P;
	Thu, 28 Aug 2025 02:17:07 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSCH-0000000HaSo-0LFp
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 02:17:06 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-61e06547f73so420272eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 19:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347424; x=1756952224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGcfuQl3yrFvMTXn2qxpt2B+zvl/KTrt/bi1+ryxB9w=;
        b=L98voeuGZJu+9udhjoxqSSdONnH2yOvfAYMFmp91fovjrMSYv4QTG3lfx5K3SgEYhU
         xNixYUo9kZlNIWBWkimOWlc0JR8m7e11/dheKqvZR0fmgF/KXyeA45ObiNehY8rXoiBd
         872V6HiOpyv7KaJYRKaMbHzb0F6n16DBWnRJQEj2ivNT1GGbw/SrhE8CfMGp8K1zI7wE
         m5NzudPiLwKbNVI60U/eGfNAeS8ut36FP2IVxc0Q04PcVx8XfaObIEpNRIAW9n8Emoqm
         ks9D4wKQANomFOjxOlYrP/wNVA9S0WgMMeIh11V7QcVODATl4OepV4yOJeL+ek8qGZqr
         xWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347424; x=1756952224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGcfuQl3yrFvMTXn2qxpt2B+zvl/KTrt/bi1+ryxB9w=;
        b=kclYJF+ZI5yczlQXeOkPWfe75SNjRKcjimp+E1t5Gzw7IRLZODDT3boK71kVhiQJDO
         5CP27/VeK5rdizgMMYn5wJ4H2DJ2zlIsaUgsOZlVy1tvdYfiBsqxtWozuavEMzl/Vvx9
         npymUPVsiFF5FQ1EwLoZdaEiO3mYks6EAIY96qoDj7Q4YTtoXRSEYu9Q9w1DCQtVDqRO
         CFGAXWqlwvtUecwgg+nfSmxGpx6JMiz1hbF1upbfnrlVARjNz6hApKF0eUAMH/Pvk/4R
         +almNZ/OCtG6QlPUF1rtgFBCtF3jZSsgnte6PcV8UPCJhi5y7Q2Sp9KAamwq4Ri04jnC
         auUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6674mIkkSK+hrnbX0ZNesOK2qUDNnZR8RR6o9p8dcH1KGEi1+nPZwLWrfV6Ooam8fW4QYcYrjYIDibw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybBgOeQEZPQFmJ3tWzLlT5IQPTT9V/KxCxnnD9Ta2zmZ1Qi/fs
	FpE2ZQv4bHXR3TZNEY3GRuPpoWRUicOkzJ9bOXB19yp6k1R/VSi2IPkz
X-Gm-Gg: ASbGnctIwcYrupqK5Vkd5DAfwLBdTPrCI7gHFSQ4gj87owvNKYHCyjHL0RR8jhq6QSz
	Edqq6S5bHac+FktEzH1qICVMMN+YcSEfcw3NGHtenXrTI9zbdGdJVn42GxaaeZW3tohisdaK253
	w+V7Xt9V01p/KdK9YFqFuaW1DlKIobi0csXHL0lFbdgOJqDolc76/C+nOF7HGMbI1BXNr6wgwTI
	TxTdms2X6LCbFr5j65xg0+Ob68+SJeDEdGGsEtXNz0IYL/44uMBwUP4RLqKzRCYAqvS1PlQbSsw
	gtMWzwBiEdJda5FUIUVmlSDMrRHwygSkSw4bycPVIG49G7hTleQm4Xh1p4jEPAmPxKtNYKS6Xcr
	8lDtv43EbxQX7cApSveO5M3MG7UQ5LZM2ZtTHVNWoNOE=
X-Google-Smtp-Source: AGHT+IH2Q5rRfVSJUWNf+uE6eBwAzJ9xOs26TnCu8U9MzwRkPuvLFqxwmj/xUnRfEFrOQCUo3+by3A==
X-Received: by 2002:a05:6808:4f50:b0:435:774c:c443 with SMTP id 5614622812f47-4378516a635mr10246498b6e.8.1756347423714;
        Wed, 27 Aug 2025 19:17:03 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437967dbedasm2276940b6e.13.2025.08.27.19.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:17:02 -0700 (PDT)
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
	fengchun.li@sophgo.com
Subject: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Thu, 28 Aug 2025 10:16:54 +0800
Message-Id: <c9362bb49e4d48647db85d85c06040de8f38cb83.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_191705_126270_EE5AFD7D 
X-CRM114-Status: GOOD (  11.66  )
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

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..2cca3d113d11
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,66 @@
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
+  - vendor-id
+  - device-id
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
