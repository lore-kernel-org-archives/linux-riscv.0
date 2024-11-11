Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088C3D12D71
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 05:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iApiFa8y7mD5QxTY5lyPSrqUCUEsZU5HL6LVKCPNYaE=; b=fMl8lkFDAHdJID
	dxnkrX0MxSb6oUa2QYGoqNGtakaQ5E/HCP0eI/eP7MrZ4fYrn4hO+Ww34pipXTJvSFbMcgwoiNr9c
	1KNQG1soB6kA1D3GIr8kxb0win/iMcNWIGkk0jMBWx/T5q+W6ZpK2AGD/4qCi3ih12yhoRgRT7NR8
	4OB02eE/uIcDEbiG0l+QZXHmo198gkXyddxb+w+S8VqjuSS8N5YSdQ8XiMj4RzM8EyaoXKNKDPcCO
	zbi3ldBOx+SYkgC1/If7Hc92CO0x3jPZQjLBaa9gpdnBBNgxD0UF8E9cW1o3LPwdVihZIJ52wMnBP
	j9JVc9KNcPLoPthgiXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANSp-0000000GQwy-1jLr;
	Mon, 11 Nov 2024 05:59:51 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANSn-0000000GQvj-0691
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 05:59:50 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3e5fb8a4e53so2303755b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 21:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731304788; x=1731909588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcDsTsbAoHrjuJNrpeEiHIIXwt512iaJZ1liGpvMOf8=;
        b=RlnWHZknGAxOkVa5xs9JPL9j9DZYHGDBz4JNJAQIhnlDKLYMYqhUvNWzGAHDCz08KR
         15Mwg5VxDb20ypmnt9apM9pf5lpgg68ZTmc/n/Mwk2lWKc0Dn2UMlDFMzH/qwxbrYrkv
         TutT6wrxVdK9fBFpf4TsRQKsN7hT7ULlq16bK0aaMctNTdlMlqVrnvAxBts62ozfzcbF
         +ZD1KJk8ICFZU+TbjOZBnnja5JCda0Z6+R1gSHRQqUoieGv2LPyZJXCrixUtDwXCeyeI
         M7hQwOqoNphwtjYk6xrMfCNgZob2ufeckGvbjaxFhKNudY6oMCmY8bdQnrUVm9dl+wmb
         25fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304788; x=1731909588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcDsTsbAoHrjuJNrpeEiHIIXwt512iaJZ1liGpvMOf8=;
        b=mgQqMWUiH4Xkvh4stwDaHxBrwSRU4mb0XxbMVpH8xJlzPKFUsE1Ve0TXVCiKqHF/ao
         AI0C8lMN08xoVWdv4OXi6wz/Sc87DVw7kVm81s1EBob5KAonuOB8excWbUSOIVjuUZWO
         TIGOXTXaG73OydW7xXpgnotmMg+PVpgURBMP1UW77x5SPLaqpQVb3E8UiKrzgzSfjziS
         bbxKENRfA/N7WqqA587CVdnIwJH9Kkq1QsNcsz0CBrnuuvKbt951OIpZd1gOEYqS1bN5
         ZM2DBQWYQ8FFIrWuSNTMsgxOdBS1PFDDmV/SMclja1cG4gGxutnz5qqpia7i2SrAPOPR
         EkHw==
X-Forwarded-Encrypted: i=1; AJvYcCXRYCr67P/YxRV0lgeQhkwfLcff5/fAZSUGn/taM2m68tR9GBbJcjQ000Y82MOq7rrllCT1b313hGfdag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKQOeLAP18jQkQWX9Zv1SDNBiIMA8u7D3+eYis3dcO04FyXa+g
	nBBo76C74RpsRHrTP47n5V+oHG8Ulp/IFbSZVPZzQBzLGuivdTrU
X-Google-Smtp-Source: AGHT+IGGuV49WNiTojEUmDK73Hy2JmrVXWdZzG5Wfg2sJpT+JoDVwiKHPnfkhzuQPC7X4Wfwh+9GrQ==
X-Received: by 2002:a05:6808:3012:b0:3e6:2408:6117 with SMTP id 5614622812f47-3e7946687f7mr9876627b6e.13.1731304787650;
        Sun, 10 Nov 2024 21:59:47 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cd706a5sm1971906b6e.54.2024.11.10.21.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 21:59:46 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Date: Mon, 11 Nov 2024 13:59:37 +0800
Message-Id: <1edbed1276a459a144f0cb0815859a1eb40bfcbf.1731303328.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731303328.git.unicorn_wang@outlook.com>
References: <cover.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_215949_095674_62FC89DB 
X-CRM114-Status: GOOD (  12.74  )
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
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
new file mode 100644
index 000000000000..d4d2232f354f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2042-pcie-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PCIe Host (Cadence PCIe Wrapper)
+
+description: |+
+  Sophgo SG2042 PCIe host controller is based on the Cadence PCIe core.
+  It shares common features with the PCIe core and inherits common properties
+  defined in Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml.
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
+  sophgo,syscon-pcie-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the SYSCON entry
+
+  sophgo,link-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Cadence IP link ID.
+
+  sophgo,internal-msi:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Identifies whether the PCIE node uses internal MSI controller.
+
+  vendor-id:
+    const: 0x1f1c
+
+  device-id:
+    const: 0x2042
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: msi
+
+allOf:
+  - $ref: cdns-pcie-host.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - sophgo,syscon-pcie-ctrl
+  - sophgo,link-id
+  - vendor-id
+  - device-id
+  - ranges
+
+additionalProperties: true
+
+examples:
+  - |
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
+      bus-range = <0x80 0xbf>;
+      vendor-id = <0x1f1c>;
+      device-id = <0x2042>;
+      cdns,no-bar-match-nbits = <48>;
+      sophgo,link-id = <0>;
+      sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
+      sophgo,internal-msi;
+      interrupt-parent = <&intc>;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
