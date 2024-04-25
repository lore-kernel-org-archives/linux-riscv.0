Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC57C10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3qoMz/97vyxfz+JcnnfDLGsgyM/UNb7cwas08lsSLE=; b=0wV7pca2BJg/st
	PIXLaEfQFICRQwr//7ocTEqzvPufZpfFIg2bI6a6PWKigiNbidXCPUr4HKVQ5pLXyo8rgSEP77X7J
	8QRmCJk/fD6d5Oid2Jq/37CHEQOFkrBCR5qaGRi6mDY2295/cpeeSERIGx6vwi5w39TPqcdO9Xgz1
	ylBnMZOdWYzSY7BA29K6hy9QrK430ssohW3XobW/SEgc2cauoodyZCr0q42QC9WGsZsm2bn0vK0ej
	RkhgNipingBax7OVJPCaayr72q+HX1JU9klxvhoDpwol/dNQ6T1D98fNea0CIw/dSwsvMzE6hgVbW
	iQk/htDGJEf4WF1Rmcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNo-00000007Q5L-24Rg;
	Thu, 25 Apr 2024 08:23:08 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNi-00000007Q2F-0dMC
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 08:23:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A596720005;
	Thu, 25 Apr 2024 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liuHsChJKivxfUk61Ur2FQ2Uhj35E9zYaulgIuxEJHE=;
	b=L59uDhSr1cMv34KF9Or4U/nZ6c3L12kSRHqevbGt5QVGCFlUJ46YbIWG1QlgYiYntX3lXd
	ljXSiLFoC9hgtN1/mplyjMcDJVdG1LIZRn/g02ddXSywtCOXml7KVTFk6kpCmxoJjls/IG
	Pby6COfUwQt7uqZZ+xnHWZNCvWR1HOutYZjQMcxiIUDEOahdcXv+ie4MI5QC1Yj48GmdKm
	eSZOXOv8EVsfdxcTnRizXqT3QUc1aEKatvQPUkk/lnO+2cLrccQRf6lV41Tg5y1hCHXanP
	FELLVOQFJebeXDVIZcMjvgTwa1zPMSGfZVVsXbDflh8rObXRM49yfp9n2YfiUg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
Date: Thu, 25 Apr 2024 10:21:32 +0200
Message-ID: <20240425082138.374445-2-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_012302_522492_F68C6D13 
X-CRM114-Status: UNSURE (   7.99  )
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

Add documentation for compatible string thead,th1520-i2c which can be
used specifically for the TH1520 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..a7fa191fefd6 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -33,6 +33,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: T-HEAD TH1520 SoCs I2C controller
+        items:
+          - const: thead,th1520-i2c
+          - const: snps,designware-i2c
 
   reg:
     minItems: 1
@@ -142,4 +146,12 @@ examples:
       interrupts = <8>;
       clocks = <&ahb_clk>;
     };
+  - |
+    i2c@e7f20000 {
+      compatible = "thead,th1520-i2c", "snps,designware-i2c";
+      reg = <0xe7f20000 0x4000>;
+      interrupts = <44>;
+      clocks = <&i2c_ic_clk>;
+      status = "disabled";
+    };
 ...
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
