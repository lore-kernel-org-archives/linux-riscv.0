Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5EC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 04:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySJJsn/kGTxpKrefLuBedDfyWyEAHlnhDRLpvQ+MYCM=; b=I7nDEaoheb5SIe
	e4V25vmQQ03WmzbQVXnMd1UQlNLGvwbDDCwhy6HfM0QVGXRLap+oE1ym8bkZLgcwyQYwiSZulvf6d
	cChza13Nl0y26myKHqTgEHS32pQgpbj0ICut9uF+Jdc933O3Qukg9uCdqcBzN/Su4FkxJY2Y11IRF
	lN8x6xdJc4KYkJ5dU3Xx1miQjoNvQxbh8Lv/Af0yUYhRUToTvzCT9TWaM4JhY7HZJBfUQh4Q1+SII
	Qxgdqlv/Pr6BMOZHAE+jQfMsZXOj2gvH8qiMScNCEK1BSVWnoiHeBAB50UmuVikDO5/d7UqmdAfaO
	iN0t3pah1IUjtvhD60gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOb-0018vB-0U;
	Sun, 29 Oct 2023 04:27:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOX-0018ti-0V;
	Sun, 29 Oct 2023 04:27:26 +0000
Received: from localhost (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ABAB56607333;
	Sun, 29 Oct 2023 04:27:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698553640;
	bh=PlB2C/4GvlsigVQBPsB7o3BhZ4Nod/EAPxHc0U5Br04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvJciyuiLEiU0mjm3j5yU+9wBhoTihTYs0be1p8pK5cxDFlWmQguAHTD2J84d5A8a
	 37Diph3gwxxywFpXLbIng8xYQtWM2gHKEawZiMGZQPDaF2mbR3PRjpTGiU2i2sPsba
	 fq3dMmfbJkv11ahyXvyL/lc8Jqtki9KOiylNSjOhoP1q6PLl0o0wd0GKlY7eu1hsHw
	 aazZuCpabGuw7t4cjMv9sHOfiJI4djx1UtAhYOpaKfrPlWQ3T6mfZgOvO2Iqdp9iIk
	 4Sk9dansjJNzr4CTm+r0j4fjCCHsdgqwIEqBJyiBvXdJqWBDQ6gfnDb4hd9uMdeT27
	 FMS6lhywrubBg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 01/12] dt-bindings: net: snps,dwmac: Allow exclusive usage of ahb reset
Date: Sun, 29 Oct 2023 06:27:01 +0200
Message-ID: <20231029042712.520010-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_212725_372889_54BA2760 
X-CRM114-Status: GOOD (  10.90  )
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

The Synopsys DesignWare MAC found on the StarFive JH7100 SoC requires
just the 'ahb' reset name, but the binding allows selecting it only in
conjunction with 'stmmaceth'.

Fix the issue by permitting exclusive usage of the 'ahb' reset name.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 5c2769dc689a..a4d7172ea701 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -146,7 +146,7 @@ properties:
   reset-names:
     minItems: 1
     items:
-      - const: stmmaceth
+      - enum: [stmmaceth, ahb]
       - const: ahb
 
   power-domains:
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
