Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A7606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1KMB/vN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5sWRQtX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B02sJiq0MoXk9kqtEbCXtSx5p7z+HtdIWDXyim6/pKI=; b=h1KMB/vN/v0Etgz5Sd7uFZBqeA
	FEd1Va2+h23rm++89Uypl/u/C8YU11BMHh0aXM273sl1DA7/8gOFppAPNZIVK6P9OTUB3JpWz/+Rm
	j6pf89bKxmQ/ZT7Uo/pcZ0fCiJWOKF3//9Pbpo/fr0sne0COTrbrfR+wfmAkKHnT2kYzkwQCIo6na
	tyAmtQj/4VJyQRouv2LOXI3iT/JhuE3vhXjHoDiE7UZAObDeSZ4orJKbQlAvzdMJwGX4K7dn8c2+/
	ZMPbz0Cm5rxvrbLu70icUu16uQELiswlRYHwAcRApf9hKlktqVJAHMeLP0mdN8hkLq9JN8YcXukmn
	WJSSq5Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4QG-00000008NIH-2J8i;
	Wed, 25 Nov 2026 04:15:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4QA-00000008NCg-0Td4
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 04:15:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a05b210703so2483839b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 20:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580149; x=1796184949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=g5sWRQtXur6qnJQkcKe328dDE80bno4uyJ/Vovs7US0xZooXglAarGK4XbzGRn9hgw
         dhc5b9pud2bgJQ/3amAKPec9+qP9pW8I80oT13Z/EOs6ettKkvdjoDq1saoQQFoZWRh+
         bW2pN4TcAUP2fLS9yFEc6IuwB6Tfgiph8heV7aSk5Ui4ccLJhA4Qm8Igb+xP4D5E9qXW
         O5/nSrCsYHsj6b2d+NkD3MCXTFk59iFEXKZOqNHqvZ8YQVyvMzTd+2lApSLhoB7CHr3k
         agpjBWh3ib6x2+bR8tyju7zFnEfUHn5u1CQC6M6v24D2tjCic7dosktviUuaGtztilvl
         gc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580149; x=1796184949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RsxGu9Qo+d5h2F4SHHbDEzcGRL3TV6KceFfHx6kJUw=;
        b=Het8i8TbxVTNrr98Qpr9Rl3PFJ9TDlzDkENQU8z4K3l1lRMFq3QB6h4J5JvKQUuhar
         QcscHpjBNNfOn4oSsIcvUnAbRQVUPWSvyC1ONxjZnl9PHzjyCoo5N1l5LMWrXn6omt0w
         u9QcaiLchOhflG1tyfmBeL3VQuWNHe9Q58tzsR61Yp8/A76nevXAZA4PMyCFpZIqc/c2
         b2Hj9P3QEJvrbcCjppZqKHTFP+VxwsX8OdlSKaoO6W2xw2jjWIoQxVeJLoyl1z5wQDVA
         gbzPUsqixdm222417Hx43yIVoOdIwO1umPOIelnCdrqM9ifa0UGXad9iCm3tonaJZr+u
         OQ8g==
X-Forwarded-Encrypted: i=1; AL+hErHZFiIOe4vnLqEAwYZNNbigxgQorQ27jrqJB7mxPH32i/Y7rvKZ3FAu5N+Xd2xKSfO/MiHF/aZO+aOJjA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+q+4Gbjwq+V1qXipv6un2yynE3VLFJj5AyjaQdcETCTG5t4HaS
	h90QLwFb1S8932kY4AqtEDdEnUHJM/b7yZ6+Tjn4lH6+FSP0idkbuApx
X-Gm-Gg: AZFdTZczE0EG2jNEM9jMTy+dDRJAMGQlsIF2rLoQJsJE1SH9YYJvQVjZEVBacr7uCpd
	PFqXgN831/SLpgfamJ+TstNJzksXoFeDD5TXMypAhWFW+3STZ0K6Zx4kZPyjevUKOECzOjkiS1Q
	iWjOYhZvQ+SgWQR+BWR4AwNvLUxRXW0eKD1Wy7GhIXi/C7EXJ5GCr+Ma8hqR7+3X4EE39ffT/3j
	fIu/PlUzbjElMyhYqrhnn4ck7k+DWCJFcGLHe3nIArG4Qt7HQCLnFYEbOVKj5EALQpAZrl60b+7
	NlU9ebeY+dlkrM0TFQcHZcRk6Z15LzKETsmKC0meHr2tMj6IPr4yRmHivi/7YUnHz6NhXneuaMt
	02tgFnsbP7VVC8B85vFnZ29ckxaBYlIWf1IsmNAqpPgOZaCPje4HwD3i9KpYxQJn9Egw1QrbDJ+
	HUleitWanj1KSgPzabvxXypWdpUBCGHQt9TxLcFzL8u5f/xG0Bz05v8gdQ7eh3YIPD5Qs2TBnCw
	qjrpg5Uv3MbnEbpZ90KaBrRzUWvpdYjoq5GSN7N6hlKxWs/aFUBkaZ0TY0oDXYcSnTcxLl/gG5J
	7V36maLhmC+DYp81tWExvxms01g=
X-Received: by 2002:a05:6a00:1f14:b0:89e:9c7e:fd49 with SMTP id d2e1a72fcca58-8c87b9cf695mr14659779b3a.20.1795580149082;
        Tue, 24 Nov 2026 20:15:49 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8204660b3a.46.2026.11.24.20.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v8 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Wed, 25 Nov 2026 12:15:19 +0800
Message-ID: <20261125041523.242588-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_201550_440942_B87BFA0C 
X-CRM114-Status: GOOD (  11.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add binding support for the PCIe controller on the SpacemiT K3 SoC.
This controller is almost a standard Synopsys DesignWare PCIe IP,
with some extra link and reset state control.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
