Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63944C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngTbz7RayiYAt0YRPxA+eykSvrTVPWudTjD1jQZW98A=; b=bZYt1Lm/E4xN8h
	k8RlGe9KZ/ObZBYxbUey9kHIoEPh6/ZFgLtuVQ2N20olBq6NcpHZYTVFmExFKwUeGfOZSV0EoDq10
	Bx7qIEd5I3rOwNcdE4tM4FMkEntFAiU/9zJi+MT0gBkTO/gE3jAABrcibcjJQEF2L2gnx5FlaD0Jf
	RGaOscDhCW3N6CTTMvCyn5+FYGFynzAWCaiPAF+AlV5ylQRQHI26WJVd64iDVA6dqtrBWf3DUTaqr
	nOJUja1Xs+E1avdc+Xq+DPq33pDGdyZiY4v3iEvNaKLZx8GNeNXUoPYFEi++CQESxuDBn6MxtSSV5
	fHtwTOsA6JMFMdjjK7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTD6-00000005qyG-0tk6;
	Fri, 03 Jul 2026 02:00:56 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTD3-00000005qwe-2NQm
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:00:54 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso58851a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044053; x=1783648853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSnOb5hOxX9yUplIfdpmrusjS/RN2Btqas6tLO5wHZk=;
        b=h0L4iQVbQVWEZAXS+X2iAb++OJOimJnQZR4bGsP1WTdtwahNTk5iyP24+Oi73K180n
         rtpjYz7ityFLkePLQRBm5f5SJLGb01Q3LtjssGy5hLywSlEaHeySu0WAhoJE+swPT4jN
         pDPOnP7af5s06xLRXmeIB+wT7gow585BWjYPn0hcxqYvFV+zTHXS9Gn4E4M1iAaJROYH
         l38Uk+3a9jCic6X9s3gnxRRPDozDYGxXWowaH5n+JGVtx3HaQBGp2v+NYgvvRJcibGG9
         2b506IrjV0utB18bndcvAm62+ZV1vKZTh2GZd23siPlAwEEjppO7/lXVkJjsREhMo7ll
         6mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044053; x=1783648853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sSnOb5hOxX9yUplIfdpmrusjS/RN2Btqas6tLO5wHZk=;
        b=N89y3vyeCeU+sTBPCNDyeqjrkL6iVYZoz3K6dB/8tEBv9kOiO6jsImJ7xv0dlQPXOx
         Njq1febvY6uEtZkol4pkAO7XueweZUhrPAq1qLO5P+4NHD1iMB4o0ILvYQPs4fUVfqCf
         hND2V2/aVML+Q+omcr/q8iqHRCY9r25vZPlaOjT9cvcCey9JU33YFeqYc8FlLk2sFOXZ
         HLTZ0ghmOwSI3+XDT1RxEc7Z+W1aQ6KdGoGkBgpR3xkXjr+CTaf0AxqZ7MPZ9vmDDHYx
         ED1f5AWmqz4ygZ14Ro/ejt5JscOMPW5ca7vanybTxwyzkQMbyl3IxQgGG0C6+WKrDM0q
         wYXw==
X-Forwarded-Encrypted: i=1; AHgh+RoR/T2QwCTbVndB8xyCpU2Djx0vWqBY1D685q3mBfRzHWEDvDqXmSXEpGUiYf58/p1E3AE5yXovE99z0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy01w+oWiwfGf6XoK5Px3nASQhghJXqV4n02LrJsU8cS+Mdim0W
	jlAJcIwGN2jfwXf0y5iqrT+NlZgpTMWCB5QHokK6lo8cVd0lHgCjghlT
X-Gm-Gg: AfdE7cms/PpL28HrX3Kss/CDh0TXoWRZAUDca+ymPRtTd3x/Wbbq0hMlakjuoawpD9V
	xtqA1/zZwQRbvUbPRUoOGHgv0/x/ChxNRX6LXQ8p2g4dfi+Sl7dplfr0Z3d7oy/4QHwOR2pcTkB
	kJ5J9qcIKoxWJx8W2GbjwRoxOzQmRMB4qcavaj7jW0zg8V7Y5SpfYE+TeqHBarJnlaQow1pqcih
	HYvY0u5cI3fM0ty3k9q99FfDQ0HXGW2Cel3NGME+hCPOOkHV508hAXt7XGeB1mEWeRYXL4zhK1w
	WTsv0L0NFEfObeKSZyovbuGgbMkVUyxb74Ww2oStl+B1+Tm01HPnsw1jjsGnz81dv8HthrSljXP
	YbMNW01Ae/2QflKlKgMhaLulQoD0ZEc1TgKWiZbIloFnUITt3rns4T2ZWYNSJNZa1ocKYTQBwMJ
	8SgNECG614hG4=
X-Received: by 2002:a17:90b:4f4b:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-380aa184432mr8707455a91.18.1783044052854;
        Thu, 02 Jul 2026 19:00:52 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127adeb21sm189517a91.1.2026.07.02.19.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:52 -0700 (PDT)
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
Date: Fri,  3 Jul 2026 10:00:01 +0800
Message-ID: <20260703020003.485436-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_190053_608730_25510124 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..720951b4ba77 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -14,26 +14,29 @@ description: >
   PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
   controller, and supports 256 MSIs.
 
-allOf:
-  - $ref: /schemas/pci/snps,dw-pcie.yaml#
-
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
@@ -66,6 +69,8 @@ properties:
   interrupt-names:
     const: msi
 
+  msi-parent: true
+
   spacemit,apmu:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
@@ -84,7 +89,8 @@ patternProperties:
 
     properties:
       phys:
-        maxItems: 1
+        minItems: 1
+        maxItems: 6
 
       vpcie3v3-supply:
         description:
@@ -96,13 +102,39 @@ patternProperties:
 
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
