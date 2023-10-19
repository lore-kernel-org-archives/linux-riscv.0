Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB884CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0+SyYFGBtLL0r090GUEwaKelnZMAXy7Vtt0cnTkXqM4=; b=jL2AKIxNtlO8ol
	TUi62wbX/cA+J/aWOclK+UBVJo+5/q6z8FA8hHtFn6CXZpoONPTDMnpVa3pDT9PRSAYDmzdH4Isly
	/CBWCGyh15uaGQ7dK1TsbjETk+ixX9TV2RJOGXxaMuwxGdIFFtiMahneoQvqWJ4Nae26bv1SO6UsV
	FlU1rKNzztA4M30QVVvx/wOG/Ue0gtE/lw5Rynn/Ami/2o99DyM3dOv48uVTYqoYufcSIutOQFuvb
	xzpgZwF7EmuLaEimcxckbrh613KOazUlNcM/d4PFQ5ja6Cd7t7qd0p47UiOaxtTlRsFjJf0iFxQHB
	zvz1LordRxZZ5HhHtZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTbl-000070-0V;
	Thu, 19 Oct 2023 14:02:41 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTbi-00005s-1z
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:02:40 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39JE2DB1028894;
	Thu, 19 Oct 2023 22:02:13 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 19 Oct 2023
 22:02:13 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <conor@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>,
        "Yu
 Chien Peter Lin" <peterlin@andestech.com>
Subject: [PATCH v2 05/10] dt-bindings: riscv: Add andestech,cpu-intc to interrupt-controller
Date: Thu, 19 Oct 2023 21:59:05 +0800
Message-ID: <20231019135905.3658215-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39JE2DB1028894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070239_087861_6DA0DE7C 
X-CRM114-Status: UNSURE (   7.37  )
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

Add "andestech,cpu-intc" compatible string for Andes INTC which
provides Andes-specific IRQ chip functions.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v1 -> v2:
  - New patch
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 97e8441eda1c..5b216e11c69f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -99,7 +99,9 @@ properties:
         const: 1
 
       compatible:
-        const: riscv,cpu-intc
+        enum:
+          - riscv,cpu-intc
+          - andestech,cpu-intc
 
       interrupt-controller: true
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
