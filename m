Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736B8C5DF94
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkukhxQNQjbbr9JB2joWigQ4uGZwvxqc1lqmcLfaYx4=; b=VmTHgUtrl3OjZ+
	LQUPUiTcXVH5so5Q8oTrdJk5mrZMhuZ062D2WYyrzXuzdtotW5bYs/+b7Na3A/oZIckOjICBmJLBC
	9xVBTVzrOIVgjiEP5gTBMcZrK651G+x2dtrrQJa2y4g49WyPhXKGrzyyqbHA8XMeStNxAtWn504jI
	cRfISvLUu6630FqD5c/3018EHAXNN5cWrBd/qctLPPVFb1cwjGwT8bEZ+TFIisbVsZ/sCEExMrxoX
	EspqWWD5ZhvDWYq9ENz7ImjzUZNWyD5WWEFE9Vb9khcJoPy1h87yHmaU3HpTZJwrCv++B8zZhmqBc
	LFHCvKo9KWEY3tEn1/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxl-0000000Fxgo-0C7K;
	Mon, 24 Aug 2026 06:15:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxg-0000000FxeV-2Jg0
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 06:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E98744FDB;
	Mon, 24 Aug 2026 06:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01488C2BCFD;
	Mon, 24 Aug 2026 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787552111;
	bh=5o3UdQ7NCWjfB/6BDLBC4HF2grF/7kX8adeAbxwnDkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uZ7pWI8mLyk1JaJKanZk/INrlBvWP5BP4K0bLjq8VlbbezoLNX4UaCPGQv+5BRsjl
	 Ze8dCT2/ftnpDqGMsvmiLKFYC8kbFIsPORQAB0xItlYIYJoqLfJ9PKsu7L3vNDqEzX
	 92Yen/64FrzhFwn4nQoTi6mRsOpsNfnf/6IzJWpyPHuX6WLQp2Pn+VNpAIWtaFVwZ9
	 LKq6MRMFExZWlTwxQv6GAl8pDX3lHfWRMq6whsVdpfCy6HYX1ohDvQHVF8gutxnOzJ
	 rH9mvxr0lMn+SD728oWVEU8HiE8X3pc75MkP13lA/Q9Coi2eRt3gt0qqiKjFsafYPH
	 MSHHIkvRlRS0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE768C5DF81;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 24 Aug 2026 13:54:19 +0800
Subject: [PATCH 06/12] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for UltraRISC DP1000 SoC
MIME-Version: 1.0
Message-Id: <20260824-ultrarisc-dts-v1-6-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
In-Reply-To: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 dmaengine@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787552108; l=893;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=GOAvwSU+bClZtaYEoEYBIUWP7wk56GD6+csu9urD+2Q=;
 b=KOhSwVprVsR8XwUee2hGHuJ8P2eGS+xmvgFGjizmPpdfUWjvSB0byKgVtUM4XmMAaS+/De/RC
 sH207vJ1wA5DiQzv7OOIexIT25aDwh0wp7thQjFVDbySqHWWN9WSrTI
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add the SoC-specific compatible string and use the generic one as fallback
for the UltraRISC DP1000 SPI controller.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index 1e70c6804d5d..896205329d7e 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -63,6 +63,7 @@ properties:
               - mscc,jaguar2-spi
               - sophgo,sg2042-spi
               - thead,th1520-spi
+              - ultrarisc,dp1000-spi
           - const: snps,dw-apb-ssi
       - description: Vendor controllers compatible with v1.01a
         items:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
