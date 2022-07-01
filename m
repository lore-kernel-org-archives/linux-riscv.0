Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC99DCCA47F
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6tkGq7VgpRAHpMgzV6HTJ+MRW6DtM9478Gx04ltnhg=; b=iIJLO6LmV/77tq
	9emLhcxBWmZrIizPkBrCLqMAzsvnHyg/94SVhX/dvTalmhjVGYdNnP4N5YO62W3D0M+PK6ObftfUn
	ZPUcVMT9ga+ExU6dL2OHlbvxrCHcyhP53h4ftbFKk0MEqZz+elUS/2TvucDQw7rw69jHqm3NHFx6j
	ZxVvCcmA8FmIg9Hb4DF3CxhhK/fylSFdSpoWGhVdDdcBiuP1MkaIrvniCYty4DHBNZCtY3iPxamJa
	vV+hwS4zbs8KnJKnOHYBzJlB70mCmxKdY+n2tef6OvZHRRaQ1ins9b87ZsxLGDwltEFAoYPrTMF+8
	Pomlm7NRdmFCPsNu/AwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MFL-006XM0-0d; Fri, 01 Jul 2022 19:24:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MFH-006XIT-F8
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:24:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8B18ACE34EE;
	Fri,  1 Jul 2022 19:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518B6C385A2;
	Fri,  1 Jul 2022 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703439;
	bh=5IRTSJGvFO4OHAMn+9sgGglU08Ime9shNTeY7wLOS4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrIL0NFFH8GvPv14X6eBnhKCVhPnGfzzX07lePmAewtmHaPeitZxlRu5IOvEN8SlI
	 7G4EMoPHK8/OJfdGHElOOxvxKtHEGBTh//armumSOFz9SgygpEPyYZyqI3WB/e7umc
	 AAIAZGIRKQ2ob/9ffk+5nMiI1uo9wHVqrT5J0L2sEEGf1q+qs3x0O8h7KlkxhudyOh
	 xrIjmbssGpN0IuOXCgIgIzdSs3GD8enEK0Fj8RMS0uHS0tuu0OEkdYsa+XsIJHziFr
	 94Tt4K0kSGITB4vKyoCbTjhgRa3Lnz3LfdtzLexUetgtpQS8PsXArIyYWSE7rBcfEz
	 Fb1GAc9SDJGTg==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 04/14] dt-bindings: dma: dw-axi-dmac: extend the number of interrupts
Date: Fri,  1 Jul 2022 20:22:50 +0100
Message-Id: <20220701192300.2293643-5-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_122403_700008_4EC05223 
X-CRM114-Status: GOOD (  13.61  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
controller, but according to the documentation & devicetree it has 6
interrupts rather than the standard one. Support the 6 interrupt
configuration by unconditionally extending the binding to a maximum of
8 per-channel interrupts thereby matching the number of possible
channels.

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..98c2ab18d04f 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -34,7 +34,12 @@ properties:
       - const: axidma_apb_regs
 
   interrupts:
-    maxItems: 1
+    description: |
+      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
+      will be per-channel interrupts. Otherwise, this is a single combined IRQ
+      for all channels.
+    minItems: 1
+    maxItems: 8
 
   clocks:
     items:
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
