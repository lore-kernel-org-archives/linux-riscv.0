Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E4C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3duAixyb4xqiD7kxQrie5gmavbgSx0J7Yi8ylcO4OO4=; b=kpj2/6Hrzt+DID
	nmaufY6pq9Fem0KcJR2n9PvHBeTmFt+vOAskXzoVMQ1Y4NUKtixPCN2uUAPeKFN/hjUrT11LlXLS/
	sOGjCrHdj2lx1F9iTLHqRPirDL5bHKMKSZ8SdqMORmayUC/YiAS048V/l2TTR3Uxtx62xyiwE+aHM
	N6ylKHzl93N1cVv83oiEptivMGunKRt8fWGXS8NFEosA71HniZzpo+A9bHtIxlRZRsPXbpXnQW2MO
	CMoR//POQZHe8JbuC3rp9UJaAS3YrOwajyZ9OCQlOmGPduYgBDDFzfoIShRiVmHJvCw9gJLQ2pVET
	nCui/Fv7mj41e3IhTDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgVO-008Ub0-9Q; Sat, 11 Feb 2023 03:24:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPP-008Rjz-Nu; Sat, 11 Feb 2023 03:18:41 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5630F6602114;
	Sat, 11 Feb 2023 03:18:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085518;
	bh=Qz2BvAFfeR2pDH8idXft8j3/6B8ejfNa6vswzgvImNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GHzfI5rdTu9/UZQWhAxLUwT9InbdtWjYgD9KO+/XqXr3fY4lXHlyWhChStvUQR01m
	 xRLs4k3bnjFo8PWBFh51vKusUx9xj/uvL1FNUKDZXF6f9TCCX2LQ3ULqnJT1TZ0Tyo
	 Rz2D4/dDd9ddU/gHRWbfF5cH8VA38de5O2pTkRwv9EqmpIRkh9frNe8X/026R1N8V4
	 Tq9vVpS9hVB1I6Osa42muP8FW4Evlh11PlZ2njTaino7d+ojKQlCzS8vR7PsyWDO92
	 Wss6o1LNqXIDWpvrF/z0PG5pbHmgejn/aF+Ufr5DMyRRDfMUSQF2ud2JT48tfS+Qgu
	 v1uC6CLBuhwsQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 02/12] dt-bindings: riscv: sifive-ccache: Add 'uncached-offset' property
Date: Sat, 11 Feb 2023 05:18:11 +0200
Message-Id: <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191839_948206_02672279 
X-CRM114-Status: UNSURE (   8.38  )
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

Add the 'uncached-offset' property to be used for specifying the
uncached memory offset required for handling non-coherent DMA
transactions.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
index 2b864b2f12c9..60cd87a2810a 100644
--- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
@@ -82,6 +82,11 @@ properties:
 
   next-level-cache: true
 
+  uncached-offset:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description: |
+      Uncached memory offset for handling non-coherent DMA transactions.
+
   memory-region:
     maxItems: 1
     description: |
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
