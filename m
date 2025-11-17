Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2742FCE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=niZkTHuyE7gME55Grh6vjz1B8cSgRZVpL8b1FZHLlfM=; b=aEu1wRd/QCrVUR
	db/Nt0mvK+pGjwpthiJbZ30u5Q05r0WsCfA/AtaDL4f+8L13XC+e90ApjQ6gXQyH/Lwt5QtAqWJ0w
	i6IeiUxCGagqtpj4TS7QxFVZPh8U4FwLXbdB4qHegmNLUPm62LuibxKhLty3qETk/5geP5dsQAtG4
	MX8c9jz7eSeLiljZos4D/p2OmHKrctLuhvNy5rp2RIiiS+4gw44X1GjpCijK4Gf3aWYquek8rihVY
	ID8T6XuGQqHu2q4xpyr6uV4Crw/bU25wZapHBbYLbUx8dOgfOlGTDAJ/ix9CsldkAQzpI9Es4Wczp
	IVWeNPYwnooJZcndvIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2FW-0000000GPcV-1tia;
	Mon, 17 Nov 2025 16:38:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2FU-0000000GPc8-0jlX
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AA034189E;
	Mon, 17 Nov 2025 16:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D64C116B1;
	Mon, 17 Nov 2025 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763397519;
	bh=ggY0CM1uMMAhQmcHdo4hDKorWC1gmId184WwoW3Rkko=;
	h=From:To:Cc:Subject:Date:From;
	b=shfyhP/n9j/AUTeyS3ba/BIKKGqjwXhLWBuJTvepk2GnW821mRWcUIUy1rE7gAiJJ
	 fqa0fqLM5v94yI49iNnRKYn3Lf6BEF7dqiKZ0zQAaAOOEr3Fp1KSJyQ9M/hOpIe3KR
	 Xwig9B1W79hAzqT/Q6My9c2ap9GWDqjOcNZA1ASx7+kgQpaBEnX1ESxF9wVZTPVnEV
	 StHpPIIYgF5kLKrHUawOmZULcbcFg1ue2tAZv+o+CUXaz56rpufj0Al+x780cZcEVd
	 TxYZNKNFUSYo3WC2oBisT9sbCR5U2LMh4ftJn0VHfGUzRguF+TlfLzTLX8vuyF+qhr
	 12/zC4gQvt41Q==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [net-next v1] dt-bindings: can: mpfs: document resets
Date: Mon, 17 Nov 2025 16:38:18 +0000
Message-ID: <20251117-twitter-sternness-f2b3a1506a6f@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=o0IWfGy7dLFMHxxCcDJkwRXrJajdOduLEpHVlJIjoLc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnS/hU3S0LTBUTVNjAcP3/uq9YBrjRusf8SQsHL7F6U+ ZjHV7zvKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETu8DD84Xm+6NAC3pP7TSX0 9jQF1Z197jrV+1yc7/uqv8p7865sEmVkuL/NY8vNvlkJIcd+mfwvm/Spn7WWJXW3zt8uY5ZFjtY LmQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_083840_237493_8AC595FF 
X-CRM114-Status: GOOD (  11.05  )
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

The CAN cores on Polarfire SoC both have a reset. The platform firmware
brings both cores out of reset, but the linux driver must use them
during normal operation. The resets should have been made required, but
this is one of the things that can happen when the binding is written
without driver support.

Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN controller")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This is the second mistake in this binding, both spotted because of the
driver being written (although this one sat downstream for a while for
w/e reason). I wish I could say that I'd send the driver soon, but I am
busy upstreaming things I wrote and therefore understand at the moment,
so a driver that I'd have to go understand and review before sending is
low priority, sorry!

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Vincent Mailhol <mailhol@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-can@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/net/can/microchip,mpfs-can.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
index 1219c5cb601f..d2a378064c50 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
@@ -32,11 +32,15 @@ properties:
       - description: AHB peripheral clock
       - description: CAN bus clock
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
+  - resets
 
 additionalProperties: false
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
