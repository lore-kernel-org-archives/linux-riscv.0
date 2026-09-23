Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57540C98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3uASLb+pJY0r+CKXAl4vHtqZJDNjeE7C0T60vmv9Lc=; b=r4/GosB/2smawL
	7quxiHFPvRV8cbtaicQf5wkXxy8/vRMzoUV/xecY7NzwGy4CVexGVTNg45XFsdjJPXaZlraff3Et3
	Z9QaVmk6mGDBQ9ZsfWNxpAhYkvyo0t6LQFul9Pt3US/cGK5uT79hRg5xclvqxLiWOKhA+BW+mVzix
	L08RfX5VcBUKt9OQ0u9TKmYqk1LQVUCSRrYIy0ynxL3UOzjxE0CLcIh5l6BD7oozD5h9vYdCjzQWI
	jRC4wg88AZTmuxhIZPcByyj7CB7v7z5Jslmnyrvu2+a0UD9HQn4RO9T49D6lxQ0CQ4Av8Heu2k4Ki
	abxhZOdSoxD7ezZdu2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8v-00000006t7p-42iP;
	Wed, 23 Sep 2026 01:51:29 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8r-00000006t4a-31cL
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:51:27 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398c066106cso282738a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128285; x=1790733085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=MoKesnMkGT91RXFlcYaXcOhcuW7ugn0+kdLLhIU9i5sxS7h0vvSsJKV5Duk9mFQnf7
         E7EmnFEv0G+aMyxkDl1M8ea4v/5XDXAdEck4Y8foANqgmEdh+HlZn+ROv7BaOtS3j40V
         nlt0Y8OAdgE9Xm4DKoSzXABHPtcdftvxRuTyiih55U+lOoWOOkUtKxW8b/PdEmMhNteM
         J6iUS2L4SgnXY1O1cfPKRKw+VD3fs0pV21wPFVzpfMn4B2GjNkw2eTJHdqTu5sGItrOU
         mhmeLFlWkodF1ehw6oNiK6cWvBF+Qvw1YmOObllvMf2jeiuCPU8IXE+AML8J62KiSrgR
         4D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128285; x=1790733085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDcKCilMboIAKoprvjC5MEiUMCPSH4NgyIgQJv6TvI=;
        b=N9U6mQageNP6Z1hbjeS0L1aaJ9PA5BiIjSnLXged2Z0P1+M4XJlGGe73sQdO6n7fVL
         ZU9e+RQ5/HihEfiOfTqi/bQ8G3qmP031WrfErKEE00m15SpFP4O+LSEcFmXOKHaygOi6
         yHBQO+ec0eaNhBUeUsLFZ2JV1up4TQGnz6m9N0Yvtvge3aGcJlm+rGn/tIGutSZzY+0V
         4fMi0D0CenYLPFx6ewlBh45yiG9wXODBvop2TWA4hp9aWRgGmy53PB1l3ZxjHh+7rFzq
         5rTloC3ySFeccuZoEWg7anF3Z7wft8dbBUgiDqfC0dm0rkfeUvJnyzurWDmVWzJ7tVmp
         fCCA==
X-Forwarded-Encrypted: i=1; AKwUvByTFyQfXv/esLshQuKFP/TVOyvUrd+ffLPCUNtdfFG7R0zQQZK69wDyifvejrc3nu6evbp9qUPNoqk/oA==@lists.infradead.org
X-Gm-Message-State: AFuF++l82WEpuvj1O0pqD6qmJ24KXNWll7AibCMh0Q093XoJDOAJ1VOh
	4cw7XjXolKgghNjObnGUdG7Vc/GZfueyoAvFvrx5khv8K1/SzODpb/vBidGPpQ==
X-Gm-Gg: AYBFou1ESIEAJXhsYS+1eM4i7jTz9Pp5ndYbST801FDThVxr2m90eQX64oPZ0GKcWmf
	71HTaorYYyWXSQv6uRzGvWj7m7ImvO1of/05YW6u8KExwJppOTef9aOf+RCo79tjnww3frMlZcs
	IN41VGlQrYPUYjM/fpl/pCCo7P3rbbq8TAJ6z9LAqvR+qQP1D1QBaH2RjwsERuyI54+Ui/tCa/H
	Rse8IX/e6gVctj24/FwMV6yf72XHLm3WhyKddcf328m8hECqZGNrjsB5sGaWzVAsnEqEHidlwlU
	dsa4B8vZpgdAUzgSFZthDnBUKx8q/Cirp4TdLdeAKxtqOMJcsLBIfL2dRs55j5VVTzY4tZL01Tp
	ktbzeD3aVWXlc1ZFqqh2jxa+FpnPb1d9lntMaTpY9aGWXAB67vd+pFcZuilBsyLaTgln6QamVX5
	b6ataihplIu08tr4NxQXJ37DrxfLFxEaCMBF6juaM/LpGWfTK/sx0s/7Q9Ow==
X-Received: by 2002:a17:90b:5646:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-3a07e54a847mr1105625a91.11.1790128285046;
        Tue, 22 Sep 2026 18:51:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc01df8sm1881084a91.10.2026.09.22.18.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 23 Sep 2026 09:50:14 +0800
Message-ID: <20260923015016.64069-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_185125_766700_32F288C5 
X-CRM114-Status: GOOD (  11.05  )
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

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..af32e427c0c5 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 PCI Express Host Controller
+title: SpacemiT K1/K3 PCI Express Host Controller
 
 maintainers:
   - Alex Elder <elder@riscstar.com>
@@ -12,28 +12,32 @@ maintainers:
 description: >
   The SpacemiT K1 SoC PCIe host controller is based on the Synopsys DesignWare
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
-  controller, and supports 256 MSIs.
-
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  controller, and supports 256 MSIs. The K3 controller uses an
+  external MSI interrupt controller and may use multiple PHYs.
 
 properties:
   compatible:
-    const: spacemit,k1-pcie
+    enum:
+      - spacemit,k1-pcie
+      - spacemit,k3-pcie
 
   reg:
+    minItems: 4
     items:
       - description: DesignWare PCIe registers
       - description: ATU address space
       - description: PCIe configuration space
       - description: Link control registers
+      - description: Data Bus Interface (DBI) shadow registers.
 
   reg-names:
+    minItems: 4
     items:
       - const: dbi
       - const: atu
       - const: config
       - const: link
+      - const: dbi2
 
   clocks:
     items:
@@ -66,6 +70,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +90,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +103,43 @@ patternProperties:
 
     unevaluatedProperties: false
 
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 4
+
+        reg-names:
+          maxItems: 4
+
+      patternProperties:
+        '^pcie@':
+          properties:
+            phys:
+              maxItems: 1
+
+      required:
+        - interrupts
+        - interrupt-names
+    else:
+      properties:
+        reg:
+          minItems: 5
+
+        reg-names:
+          minItems: 5
+
 required:
   - clocks
   - clock-names
   - resets
   - reset-names
-  - interrupts
-  - interrupt-names
   - spacemit,apmu
 
 unevaluatedProperties: false
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
