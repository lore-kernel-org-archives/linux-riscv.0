Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C30CC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb7cs5jaZ6RG1IXYibeEDLJd7fxaonif6xggnr3DbLo=; b=KvvrxoKmgL6h2w
	tHJwB7fTrj2wmIv08B5g4xkdlgKEmvywQI6o9HngDhDhUlVi6sWHBb68Nl7/8atfeeeVotRwgJsbG
	Cm3zTMoWfdpbOexLbbndxpklNDScna98Q/tJ4NABg0Dj5n8b2EJs1mGtx/pjBBDiLR3KXql6oW6rO
	TeWR2mLElSfnR2fSoYxyg4/XlhKF/sxKbxCD6rAHk06jlifHclAT9Oj4dKKPTjCIYgcvZNxC0olqx
	iXDn0xGwohBlGFO4ny3KXEig+FN3fCUo/AwcLNXU+8YDcAI0y7sSqWDb4PTvEqQobN0OUVuwdMgz6
	MzxRlqUKFEyKgUpRwNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgm-00DagT-5k; Wed, 29 Jun 2022 18:45:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgA-00DaDE-Dh
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id i25so18272875wrc.13
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sKeykQQRtYj4kj+xEuSgs82fAmu7DyyvRULZ2/Pb6I=;
        b=BMdHLMoOwn6zAxEtDDa7k0h1f/DZxYTgThu3U2sNuU1A+J2K+WADunh8MBK6GQasvX
         bZvbX2AUE3WkwwdX1tNkMtXNA8L7f1blGzcC68saXHEBzsdK22yycaVeMLYkxq7AyhLL
         0C4t2FTjsmp0VGR7E+AoaIvn0ZeON/zWIol2+bxphxTssK2+9gqxMql6G//GigObaYxf
         /NoPS2HGfbugk99X8z9aoWaMuWtx6qv4eWquj/tnR5Pol/4lsSCRVCWYtIA+UAXYn6Mr
         TDsy1g8lVTt47WmMpnvavQWY3UdJ+fGtNafwfqqmqUbeYTMgSgBnM66BgnnczfD5P+y+
         Hv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sKeykQQRtYj4kj+xEuSgs82fAmu7DyyvRULZ2/Pb6I=;
        b=3u5E5ixdNfgov+tmP7+hiByAsjtggODVA4OJnIhisMjQIXrGM31vTeAoxaimMYAjOt
         /bgChrfkWgiwjetSF7LzdZTE3hAwW7L/l5xZfFGe2MXZE3QHZd97ekpWp1PqqZuhZ0At
         rGCdIFFVpL+B9PxKaHZqMOEQo+BOjXK4K/z2xW21ZzVjUzPAp6j0H2cYs3KpwO7cwiE4
         PlkM7bTwMWVJolgU1sAEtw5fzCwKe6WNV3tFp5b1TbjhFGC/DiRuuKjy8HNVZYThyN1w
         bU8AMOkWHaBn02i+OcBjd6p2vE2zSEqfH2OXRPft31iV4ExIx2hlMOT+PR3xwDrsVHhx
         39Dg==
X-Gm-Message-State: AJIora8YVISb0GMImoOXiogfpp4ZTMRLbw2vZj0r1EGiFFuV5i7dkICQ
	G+PAVz/mfZ3WdPaMxKupoqD9cA==
X-Google-Smtp-Source: AGRyM1txmcVZd3QPq2DQpn3PG07YMXIn7w8Wmsh9JviOd6mCe5xqRBVB6TunKvps0uLWXYGFL6mRJA==
X-Received: by 2002:adf:d1c9:0:b0:20f:c3dc:e980 with SMTP id b9-20020adfd1c9000000b0020fc3dce980mr4479112wrd.552.1656528284293;
        Wed, 29 Jun 2022 11:44:44 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:43 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the number of interrupts
Date: Wed, 29 Jun 2022 19:43:34 +0100
Message-Id: <20220629184343.3438856-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114446_493149_63241B14 
X-CRM114-Status: GOOD (  12.88  )
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
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..e33ef22aec9c 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -34,7 +34,9 @@ properties:
       - const: axidma_apb_regs
 
   interrupts:
-    maxItems: 1
+    description: per channel interrupts
+    minItems: 1
+    maxItems: 8
 
   clocks:
     items:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
