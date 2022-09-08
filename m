Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B456C6FA89
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3sjX3YbeK+IhBzDaWhTdFQ30Oj2zfJnU8pGSsQRvdc=; b=P8scUzZiWYqDOi
	ctsOP9RoB3ClsiuAJ32X15XuetJ1y5peJahtLv9vWA02x6yHqruKmS71pqx2a9Kr6LFz/+CJLAL75
	PirYMRLEZyuvukeEZSiS2rWe0kBkTDoILCK5zuIk9c+6e/swUw/eSOmoJguiqjQaooqNSpk0zquQ0
	PrTO7ztklOWJVFNjR8K+BfCeKP7ctt+mb5eJwa8htNW2mBF2P2nKDqajxkzrQELXvNPTcYVzyQcb0
	2DoDvFeglp25Mj62iKoiT8QkPYZBUgWEObaohBZ/qcVOkopRbZ6shWz8lhfl6Fpsn2S8ilCHYhacn
	omhkuYqEMUQ1nQ/Wscxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIXA-004geO-EB; Thu, 08 Sep 2022 14:29:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIX1-004gSq-OP
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:29:29 +0000
Received: from localhost (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD4FA6601F97;
	Thu,  8 Sep 2022 15:29:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662647363;
	bh=ACPX1O/55jmYl4XQH9KqX/fcKaXpHRpw86mnaJXhFSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NP12pTaOh/knK67jBR9i0s0Xdp9Zkjan2OZ6mS6UngUmk+pzewDfy9+UIyC6BNUXD
	 vx/WuEUFkgfbL4+hKCRHYdHntAmuaDomenFTuPmMKv1EjA2Cr30Xl/S1gBPC1h6pw5
	 GbipM+7Y/b0VOUq5mxpTS7C+C6GyoTOp8Jrt3/3r8dkByRZruQNdY0iovNOCfR08HH
	 TTEC3WJbEvjFBGeskTkLZREf079UwrqkIzkyKw66gdLhYoGChEZEvzPdlFaCgfxxJw
	 DgVcHImk12/LeX6ETVIizFJyJ43D0K00Qh2dEpUW3xNq+pLpsP13cw/QKLzXnlKgZF
	 W1HEWaGa01wag==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
Date: Thu,  8 Sep 2022 17:29:12 +0300
Message-Id: <20220908142914.359777-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
References: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_072927_964201_3B36BEB9 
X-CRM114-Status: UNSURE (   9.30  )
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

Document the compatibles for StarFive VisionFive V1 SBC [1].
The board is based on the StarFive JH7100 SoC.

[1] https://github.com/starfive-tech/VisionFive

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 5b36243fd674..5d3fcee52d59 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -19,7 +19,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: beagle,beaglev-starlight-jh7100-r0
+          - enum:
+              - beagle,beaglev-starlight-jh7100-r0
+              - starfive,visionfive-v1
           - const: starfive,jh7100
 
 additionalProperties: true
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
