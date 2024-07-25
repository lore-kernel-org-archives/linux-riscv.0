Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DAEC3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgHyRPz9gpO4sIGVmhZ/Lnx2H1T1jrDzNBMsJ8Cgipo=; b=a6KWN9JpeqCB6y
	et57rrg0EC0O3RraYT96hGXR3V+4R2su9GWLPkTe+HZqdc1lQAcWYLBPjAZ65iCGq1kb85ZjEMxzw
	Q7eyWWwFXjdQg+oZM6IBRr7ps1bGdKiCE0IDnCK6M86Ozv7hmWzfKwzuv6OtJ8r2J9gnQClrUtg9A
	wbV8o7v6EzuSULii80zWp28j3QN8lv6b3qtfJRG/0d8mHvbS21dG71LnFequS7gGS8lR1fD0Jssal
	KJ113JAtSQ4ME54+zE9KelLaP2aunO+C+TXLuFAgWThPtGVW19JvXbyH3xq7q63SF2vZSeQ+VlMiQ
	5lO7aZCNP2BiAzECF2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxP5-00000000sOX-1Fx1;
	Thu, 25 Jul 2024 12:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxP0-00000000sNg-1OEI
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 12:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+SIqls8eI0ac20/IRxW1Stx0LTKoNh1JNjidv8fC9rA=; b=eC1tiMaKXzlVcOEgg7ibMDUNzf
	V96mj4ViRj98LMK8igYLn7DMGo1ExC3zL4RRErPqFPdavc/vuoeMzOj0RPnxxaW3Y9KaoD4dO7pl2
	LE2i3+Eu9l5E4lEWT9gesq3N/0BJp1jBpvqY50CZBJuL/YV1hvaqRwihPas0avwmWqGhDx1c2hLSO
	yIBl+fYe8q4g+RVzyj534okMzpT2pKaktRazWueXF/HtxkMgRozsng5xjCOpP+nuxCCFq7ICu4MRe
	WV9mSBBPOKYuHZ+GpXREd0NqMF6zDh+IIYVX+I5hOAoJMIYVYl0Kpt39Ch3Gm0oLPjNRWx527LK8A
	B7ImmtNA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOt-0000000400c-3qhw
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909812; x=1753445812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dtgBBPeo7nvygi0hbwcfkCjlIrmmucuYE54L3T2aR+4=;
  b=djoyrawZ4n7VY0BANVw9N4M01hTSHszgAjghf0Gj+FRQ3bKrDjPKrYPu
   1+aYKgn2miXmYkRa2nubnnr9ddLIhMBVvHOR8IziszoW+1dd1VDDeClAu
   LeWwQq2Jl4wEdkjC6h1hIzSYID5kPOZPdDHKkf0Qg0O8jqKNvlp1GgBzg
   10mwycAzEuEVOhyhLGIYOPdeTghaZ/GN9H1u6tfszt7FGGYI37ZGbbaCE
   1l5A16FpDbCa4XShpJCaBspNE0RLRtJDsTjoqaIRWXg+Q7M+JnQMpw3r7
   1zD8Ol9Bq5iPNx/EJEXYngQd5/MVwUE77VZPrYUi2PgERwG7TIVmDk2yj
   w==;
X-CSE-ConnectionGUID: 73d5wsqqRUGsXcUpyIWy1Q==
X-CSE-MsgGUID: NnT9wWeKTqygUlf95wKjRg==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="260575368"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:34 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:32 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 07/17] dt-bindings: clock: mpfs-ccc: Add PIC64GX compatibility
Date: Thu, 25 Jul 2024 13:15:59 +0100
Message-ID: <20240725121609.13101-8-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131653_823067_3BDB6C8A 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX SoC has clock compatibles with the MPFS IP

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
