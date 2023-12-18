Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09628C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up3MgpP3G1bGRpUyhib/LJCnmUtBxNn1mv+RfYS6V5M=; b=MnZKnY6uNXQMlS
	VMxCi/Od6ZYmii6bEZ1RZGDnFmzVXi0v5t6YUwMTtQUUnlb7cd2WXTYpjVAG37KK9O0CQas487syX
	xK9+i6ULYD9IutO82s+QRawzQPBVpVwCb3reuX2bLMsvpTo/pZ63p26RE3vIOZfM9mVfsJSFkSIIA
	OA6IvThrYy+YBaASxLCg03aV6Jl8sMaTJWyx2E2Y0pnlG3l2s9cQKmAB/pGw2TgLJQ5GSr5QX4yfM
	Oa/3WG49nDNsmhhJNmS+novmnCKC660J0BcY0WS/tA4yoOrddm3bJxpV17Qa01Vdp3kjkrAF6PGsz
	HM41s3knZNWQmvMvxbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLQ5-00C99b-0s;
	Mon, 18 Dec 2023 21:45:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFLQ0-00C962-2H;
	Mon, 18 Dec 2023 21:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702935894;
	bh=gbMqiSFoR5LPx4Im1XNHPktHQYnQ4AzMO0qHDjq0wBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QiF1Pkq59BiNjuwKLlI7G2SvuPu8d4HdABH7OIv9txKZMtcYO/Zi/SHD/0pV9S0+N
	 xhJeBZ0un9Aw/uqrDtuaX3Lc2PG9rdJ2EBQWi5p9Q9MaFN20yTQbR9Jm4NnJoQZfFp
	 kurNhVjvnlmQW00/QPItqeRNj+b/YYI9xZ6tAW/oajoAbR8inwEsmR6SzgXCOa1xl2
	 oFPYUWCs6Nvl9r3+LRVSWpk4rHZjfGanUDjjQwtPjWv9rvd5fDEGiHWVigZQ0Di5+t
	 fa+Z0NAUDrT0kVeFjmHw9TVEHiq9qQauxcfy7IzWrMwEEC7NtWo06GYjnbR00+Rme7
	 GPekFWKakAH3Q==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C57D3781476;
	Mon, 18 Dec 2023 21:44:54 +0000 (UTC)
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
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 1/9] dt-bindings: net: starfive,jh7110-dwmac: Drop redundant reset description
Date: Mon, 18 Dec 2023 23:44:41 +0200
Message-ID: <20231218214451.2345691-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_134456_908532_6BD65C11 
X-CRM114-Status: UNSURE (   8.54  )
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

The reset description items are already provided by the referenced
snps,dwmac.yaml schema, hence replace them with the necessary
{min,max}Items.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/net/starfive,jh7110-dwmac.yaml       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 5e7cfbbebce6..d90cb82c1424 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -55,9 +55,8 @@ properties:
     maxItems: 3
 
   resets:
-    items:
-      - description: MAC Reset signal.
-      - description: AHB Reset signal.
+    minItems: 2
+    maxItems: 2
 
   reset-names:
     items:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
