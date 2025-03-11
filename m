Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870FFC35FF1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ek6hDhF+1BxlCzBlPvnGj886PEDienEsG+WjVm+4Ok=; b=cJZ8I2b1U49+6X
	+trR+Cc6Mtc2ZC9ZAdk8JQfMDHOn1eaXAxOn9V0vT8y6m8iqWmBMI9CAjwYizW3R6XNjys1kaf2Eq
	4pOHLrSlGuuzvgg2NTQXr/kim7bnu6luXjRTB6w1ZJrA3S46Jfp2dzasawTtB/4SXRGggk526c3hj
	xah167dTarXR3Re8NJSL8r8PYhkDPjSXwusLZJORNK8ykR6eUpdWREPs8ilNJ1V/qL5dKQ83rwSp1
	cMjeDXQC7oZWaJb9UBB3xSwg33eGTSFCSjbmiAvWG52rNYLD4ZdEagpRNK2DWZmuv32o/OfHSjv/N
	5Ee7yppCkGaVvHpyIa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru9d-00000004r0A-2HX8;
	Tue, 11 Mar 2025 07:35:57 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tru8O-00000004qda-12LH
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 07:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1120; q=dns/txt;
  s=NAESA-Selector1; t=1741678480; x=1773214480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HI9Jx3eMM5SpoCOoPSVqpDRMyDdMck9kj9YOu3HUkkE=;
  b=ZcjS1LzCWsFo0VXbDEjcAd0MxbF7nhGc6gD3EAfPfqGcP++xlNttHV4X
   scRhrMuVa/xXa7n7ijOdqyQT4Q6LRoPsr/Ya2FvAxPnN5CI9VBNrTNnxE
   ROYN25GdbqF9yNSBTn5xHMbUcOrCpj5ehDqfn4NXZpmqdD7/i4l8/r6c9
   IdRua6TOkU+uSiretCiufe/fHyDZYZWU9oEfOeTaAa+QvBP2SzoC0ZiZw
   Tf4O1CinYCHLgYx8a3ZSgUZfR3kS8/+gKmwDYsu7SjkqxzEnYDPTlsvlj
   UjP9711UMFf5yJeiS2KXbJrzg4LS/HoCBAv7YvcG8Xj1/+owCC2YDJTMk
   g==;
X-CSE-ConnectionGUID: sGPYVkuGSfK5DY7AB+DwTg==
X-CSE-MsgGUID: pc+M44thRaOdEnI4ST9Y9Q==
X-IronPort-AV: E=Sophos;i="6.14,238,1736838000"; 
   d="scan'208";a="79624717"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 11 Mar 2025 01:34:37 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Tue, 11 Mar 2025 13:04:32 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] dt-bindings: vendor-prefixes: add eswin
Date: Tue, 11 Mar 2025 13:04:25 +0530
Message-Id: <20250311073432.4068512-4-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Mar 2025 07:34:32.0805 (UTC) FILETIME=[0816C950:01DB9258]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_003440_364478_9CBC3396 
X-CRM114-Status: UNSURE (   7.94  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add new vendor string to dt bindings.
This new vendor string is used by
- ESWIN EIC770X SoC
- HiFive Premier P550 board which uses EIC7700 SoC.

Link: https://www.eswin.com/en/
Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..07ff140e67dc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -490,6 +490,8 @@ patternProperties:
     description: Espressif Systems Co. Ltd.
   "^est,.*":
     description: ESTeem Wireless Modems
+  "^eswin,.*":
+    description: Beijing ESWIN Technology Group Co. Ltd.
   "^ettus,.*":
     description: NI Ettus Research
   "^eukrea,.*":
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
