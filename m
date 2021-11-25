Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC704C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1l9JOezZQgaiFEwmYgFCReVNwKcTQKK83rd5RAY6yYE=; b=KIDOL9kNITt9Oa
	hgignUN+pKs+RKY/sSd4r1uxKrgIYWujeugwgBpow7cCh2Ux1Ait4/VdoKuoxDT1+ZFOzr0BQY+Jq
	mvZbCn/GaZLBOSoWeFzxEDdgvQ/FehZvQvKVxgQX2ms2CfjsyM+0ANK9JEjZxrUYBl1D++YFxOAtd
	QrHfulPYNATbOF6EdV+2a8JLLuSas4rwfI88doktfuJRz5/PppMpw4KK8S5NGlE6Ypf2zpUhVjIvc
	ot//PE6yB1YB0GePVqEyD/nueA09ma/Z2nw5tl480CwRXQwCjl1PhHpvJ8gwDcrE8oaeQftI1ZOx/
	SOt0wIiEeb2LmYPwBwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqGXo-007yof-TP; Thu, 25 Nov 2021 15:20:16 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqGXm-007ynu-7b
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 15:20:15 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:1511:ffa3:275:45dd])
 by andre.telenet-ops.be with bizsmtp
 id NfLA2600H5CGg7701fLAey; Thu, 25 Nov 2021 16:20:11 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGXi-000DKG-4j; Thu, 25 Nov 2021 16:20:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mqGXh-000gIs-Kt; Thu, 25 Nov 2021 16:20:09 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Heng Sia <jee.heng.sia@intel.com>, Damien Le Moal <damien.lemoal@wdc.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: dma: snps,dw-axi-dmac: Document optional reset
Date: Thu, 25 Nov 2021 16:20:08 +0100
Message-Id: <20211125152008.162571-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_072014_444973_C44A9965 
X-CRM114-Status: UNSURE (   7.19  )
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

"make dtbs_check":

    Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
    arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml: dma-controller@50000000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
	    From schema: Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml

The Synopsys DesignWare AXI DMA Controller on the Canaan K210 SoC
exposes its reset signal.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 90d9274e5464e396..06ddffaada295171 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -53,6 +53,9 @@ properties:
     minimum: 1
     maximum: 8
 
+  resets:
+    maxItems: 1
+
   snps,dma-masters:
     description: |
       Number of AXI masters supported by the hardware.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
