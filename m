Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7C8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggH+e0NIxPiIacsNKZZGzdVjLechh4BfyrFtPmo6Fo8=; b=uvi7s2yUt1GuA7
	Ir6yk4QU5aDJt/ZNC72iBCczpy9BavCsVC5WmCcW2Lhm3zYf1XcjuzLU11ciVn8a1Wtzpz9HmQtZT
	iY7qLLmkULLAAqLoHuTfAIex2bYFMOee+yA0V2lCGg44HZbo2uXg5e3/8/CAuqec6mX7+XfUUuhSG
	Mjq4FokW3Nm46F6lV8URWnFiFkjVADSttR+TGXt3YLGcw/Bm3XE4mcZoj6Zqty8dsgUhkBx0dHMFV
	7doLdX0CiDVP/bCbHsxQpBt6b+LpxM6BfnBiNK7GIfYXIuok9mwBDlkloxGX3493rrrWUazBpeFob
	YGQMCc4LPUgX8yKi8EtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGj6-00820q-1h; Thu, 25 Nov 2021 15:31:56 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGip-0081rp-F0
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:31:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by xavier.telenet-ops.be with bizsmtp
 id NfXa2600E5CGg7701fXaAE; Thu, 25 Nov 2021 16:31:35 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGij-000DSU-OL; Thu, 25 Nov 2021 16:31:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGii-000gZX-O5; Thu, 25 Nov 2021 16:31:32 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 9/9] riscv: dts: sifive: fu540-c000: Drop bogus soc node
 compatible values
Date: Thu, 25 Nov 2021 16:31:31 +0100
Message-Id: <20211125153131.163533-10-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153131.163533-1-geert@linux-m68k.org>
References: <20211125153131.163533-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_073140_064689_AB3C05D8 
X-CRM114-Status: GOOD (  11.20  )
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

"make dtbs_check":

    arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: soc: $nodename:0: '/' was expected
    	From schema: Documentation/devicetree/bindings/riscv/sifive.yaml
    arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: soc: compatible: 'oneOf' conditional failed, one must be fixed:
    	'sifive,fu540-c000' is not one of ['sifive,hifive-unleashed-a00']
    	'sifive,fu540-c000' is not one of ['sifive,hifive-unmatched-a00']
    	'sifive,fu540-c000' was expected
    	'sifive,fu740-c000' was expected
    	'sifive,fu540' was expected
    	'sifive,fu740' was expected
    	From schema: Documentation/devicetree/bindings/riscv/sifive.yaml

This happens because the "soc" subnode declares compatibility with
"sifive,fu540-c000" and "sifive,fu540", while these are only intended
for the root node.

Fix this by removing the bogus compatible values from the "soc" node.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index e2efcf08210926f8..b1250c16816f5c9d 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -137,7 +137,7 @@ cpu4_intc: interrupt-controller {
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
-		compatible = "sifive,fu540-c000", "sifive,fu540", "simple-bus";
+		compatible = "simple-bus";
 		ranges;
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
