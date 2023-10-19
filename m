Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B394CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=izabOgbmUX4x/zbZAMjuGEZoMmjpAt3mn9zBmXYUVLE=; b=PERswR5Aa/90+c
	nQ4ZoYe6glHNye+XJPJB+Vq1WOXA5XMFMGhXAqyLeJ4RGVM7SnDaA0eIiT31tFEqNhoFIgTg8uhZ9
	pM5vK6Wft6gR2gA3B0seU0cb5Xv14sO+Q3zmSM4Yboj8JF4khFczQ7zSDlHaRJFJ+oY7+G4fHWpWh
	lh+X4hSHBl2LFL0uFmemF6ef7Y9ab0iF2p40YPetwzaT3UcItj2FsDJufpzlPyG5ojs8JwtQQjNJF
	eoVW6CU4b2OG0Tl/Ak/33V9ARP0jM7TTVJzHT2cFz4Fu1/P6ZVhcfpdHbu+rntpGvu/FEIpYfbrsV
	xOGTYbfoQm3mmmfm2NmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTax-00HayH-0I;
	Thu, 19 Oct 2023 14:01:51 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTau-00Hax4-0X
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:01:49 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39JE1Hxu028139;
	Thu, 19 Oct 2023 22:01:17 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 19 Oct 2023
 22:01:16 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <geert+renesas@glider.be>, <magnus.damm@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <linux-renesas-soc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>,
        "Yu
 Chien Peter Lin" <peterlin@andestech.com>
Subject: [PATCH v2 04/10] riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes INTC
Date: Thu, 19 Oct 2023 21:58:10 +0800
Message-ID: <20231019135810.3657665-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39JE1Hxu028139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070148_643323_FED55307 
X-CRM114-Status: UNSURE (   8.24  )
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

The Andes INTC allows AX45MP cores to handle custom local
interrupts, such as the performance monitor overflow interrupt.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
Changes v1 -> v2:
  - New patch
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 8a726407fb76..a6345469e8c9 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -37,7 +37,7 @@ cpu0: cpu@0 {
 
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
+				compatible = "andestech,cpu-intc";
 				interrupt-controller;
 			};
 		};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
