Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB74C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v6TXxJ71sKfkdWJNWEQnCyD3hu6Gl0TdSLWH+IlmebY=; b=kpR13pB17SGiNU
	ijIkn7nu5bWuHt4mrw01liWaBGyi6u6qDLa8hf/LohQiOyj3Rx6m96D9Duh+mXuobLzrlaVXlb/R7
	C7d0mtqXwFUlLwdM//mJGiLr8BjPS+8L9CuhHdorfBZFJNKSTBihIiHonysxN7msyz+b91pXBeh/Q
	KZSr3FpDPFzbKQNCioITxuPCwVwkWFuzUMwsfYZabnoF2YK1DJxyyn8ntYvLGfEZqe3dP6W+YaiVk
	pCyDnOmUxMTezZQp7V71q0EgzOaWWVQP3EYlxioQGEqNpcS1TuUc+ibDmRisyv125pPZE3RdmjLOx
	QFq2ZQ+uuy3BcM29MR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1przAX-006LNZ-2x;
	Thu, 27 Apr 2023 10:48:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1przAU-006LMv-2L
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 10:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682592487; x=1714128487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DJAw9VNz1ZsUBRAPmSWDnMHm4RxRMWbc9EwxSgNFsyA=;
  b=EpESjzeGPsTYVVZt40mDL+mBdqR3EU/d5N/K4MnKN7vjk0246d6WgUAZ
   BbmC0h8hXEKjMqaoEeALLCnZyAPOXasIlD1rFk4Wo+SVjxrl2y84kVWip
   9Ahc8kcWIHOUuDl+vswRouB24FN1ixQscgfUjX+9S5dGP27TFEcDyWedE
   LrV+2XxyerhX5cyBT+dBRIilxTj0blOfdnLlsG5BUNW7Gf7oVlGr9KO++
   ltjUmEEfhMM9h5dkr4XIWJkva/HmG8+//AZeYu4kKRLr8HHorkO0ulICT
   YGhxh+VG1SsVH5aIT2oOjwAInmF2rDXw5fgvwH6mFl/GfluFCnX0t2va9
   A==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
   d="scan'208";a="211435929"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Apr 2023 03:48:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 03:48:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 03:47:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] dt-bindings: riscv: explicitly mention assumption of Zicsr & Zifencei support
Date: Thu, 27 Apr 2023 11:43:42 +0100
Message-ID: <20230427-fence-blurred-c92fb69d4137@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DJAw9VNz1ZsUBRAPmSWDnMHm4RxRMWbc9EwxSgNFsyA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClegdfq/j3oPnKMb1NS3+TYBa7qN1tclAtfvXphfWnXyXx2 9/bsjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykai4jw93ZultuPgqb/fbiv19RZ+ WthEL+JXDOi5AWWcEZrctuc5iR4c6uQ/7qxdpei0/3/YlSq1K7lPTYfsWKuy+bbCS5X3d/YgYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_034806_980096_08269174 
X-CRM114-Status: UNSURE (   8.25  )
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

The dt-binding was defined before the extraction of csr access and
fence.i into their own extensions, and thus the presence of the I
base extension implies Zicsr and Zifencei.
There's no harm in adding them obviously, but for backwards
compatibility with DTs that existed prior to that extraction, software
is unable to differentiate between "i" and "i_zicsr_zifencei" without
any further information.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 4c7ce4a37052..a93bc7eae928 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -85,6 +85,12 @@ properties:
       User-Level ISA document, available from
       https://riscv.org/specifications/
 
+      Due to revisions of the ISA specification, some deviations
+      have arisen over time.
+      Notably, riscv,isa was defined prior to the creation of the
+      Zicsr and Zifencei extensions and thus "i" implies
+      "zicsr_zifencei".
+
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
