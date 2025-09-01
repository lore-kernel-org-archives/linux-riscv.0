Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AACCA1005
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6d0R4DPxn5QJvSXSbMpQ8kn8v56bAxVFxj5dbg8GFE=; b=P1Uz/0MryzKTA6
	N/Nx31nwTrL1QO1X7xZ0PzuDGA2frsS+9qL+YjPVCQ5dAeVEgCa2Galnbwbld+MaWLne0E0QDtKf6
	0GSK3Vnmacewm1ioscqn/Ws37STmx1ZR3zZcR3l36Sccavh6UkXySO7QR3QvNznzImqQmyjErg7qr
	eeXSbVEQ6WZNR+94OfVOLJQ8zU2u71rlHiB3/01phkTw2lsDGqvmhZN/6VayeBGBHDJEWu+4g9+OS
	wZuBD8UksNglaqkmMakS31/aMxa4rF9F0BVvY5D/ttcTrPGO+mBh0MMLKVIov0/L+0Aws5TaSTIIQ
	q93VkmTq/zYR+dKwMM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4DS-0000000Ccho-3YR3;
	Mon, 01 Sep 2025 13:04:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2LN-0000000BzQn-2W62
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:05:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A051B44F1E;
	Mon,  1 Sep 2025 11:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF20CC4CEF4;
	Mon,  1 Sep 2025 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724699;
	bh=jECQWUPeqYIp+kYy0qMp+mxlsYrMNhCp3lRCnaD5i0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfWQ9sjzOXKkzgqnkTBQAdhVnJYC42z1ZpCbvzM6Ofdj71q+CKR4qzih3qMObRcqK
	 2EjhcTUaN3J93IPSS1pp1Wi+z88E56LFeyOHwuHMEla8MP7CrWYXoiKlQUL7JGX9GE
	 S0lpQmaavEZpx41L0ByTP8Tz9y5/zHuTQec39Us9ocDGA1Xo5dtFAZArV06AM6IwgS
	 FD02yt4WO/1F7ze2Roly+MB7PVH8vEAvAoC+KgR/PK9TxsWr1u2cdnpFryHEFOB+j0
	 fBN7IAQ1lQ8DSxOmalTnrt8aK4haCMCerEReBB9dzzHZVnnEt9v0sl6FrrD3cR9BeW
	 57XhFajTAsWMQ==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/9] dt-bindings: mfd: syscon document the control-scb syscon on PolarFire SoC
Date: Mon,  1 Sep 2025 12:04:13 +0100
Message-ID: <20250901-shorten-yahoo-223aeaecd290@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901-rigid-sacrifice-0039c6e6234e@spud>
References: <20250901-rigid-sacrifice-0039c6e6234e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5rg4qG6+r0Tz8RYgLEQxmEix629uHarZjM4QelP6QtY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlba9ceDjmisSn0m1FVy/3tt/Un8UrKr/j4d4ooV3PWg l+NsyoFOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARBm9Ghjcx7eELJzgLlW/+ dJNDVVdPO7D7uZxLxe//VhOnCqVe+szwV/p59wtRNY+mH61y13XP6EtxvSx+WHD2QkxYbdeHhKn WjAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_040501_695028_545A14F9 
X-CRM114-Status: UNSURE (   9.16  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The "control-scb" region, contains the "tvs" temperature and voltage
sensors and the control/status registers for the system controller's
mailbox. The mailbox has a dedicated node, so there's no need for a
child node describing it, looking the syscon up by compatible is
sufficient.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
add the control-scb syscon here too, since it doesn't have any children.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 27672adeb1fed..d18be50dd7127 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -90,6 +90,7 @@ select:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
@@ -197,6 +198,7 @@ properties:
           - mediatek,mt8365-infracfg-nao
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
