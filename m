Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43749C36005
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvk9aGt1NU9aEqLXy+v2DcyLn8UJro1mMBgNnsP8xDo=; b=epmXOUP3Wyy2WW
	wvGh6fL3Kf9uTcjYiei9vVi4k/ZjmAUrtFSWfGajoGFra/RACxXx96k0wW4ac4gc7NLCrkL6s4Ijf
	Kjz7I9sYoCVdpzh5eBDvkq+/jDalh60iGScnsgoswsHETrmYSp/XT4UiYvXToZcjBhiEmeugKjXP4
	Zc9Ozd9CabqN8IqxHPnfw1vx6H5u4nd+3f8v5v+/ILEXExJ0/rFSMik+84qyLBjh6lKsxXlsygWqn
	I9xX3YYNozZsAVecSYeuDam/yQX4Wurw44/Jp+ewecksHVLKQfN0RlSuTgtM4Clzw/fGQhnbROEQf
	6R22kUT3kjoF4CuHbqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg5X-0000000FgVd-006f;
	Fri, 21 Mar 2025 17:23:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg5U-0000000FgUh-2wfe
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 17:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DB3D5C66F9;
	Fri, 21 Mar 2025 17:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E91BC4CEEC;
	Fri, 21 Mar 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742577795;
	bh=LdttrVC9LW2Uc3o+DVofFcVX4D2cSxS5O7oMwf4zgfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pXFejIhekIOHt6FPHNmavV3/wo1faMIUIPdbQPRHIv9Yp4TujjIF3RQQmVtOP6Q0K
	 FrjvuKZhXWmY3hGWT8CU4+WiedUsXo8pAzDvUWLBJZGfM3ToEY9jVjZKgdRRpZfbJc
	 ARbuy8DQMrmhd+4wGV4QXKWxh/f7qXXo92WZn9eCayt08ddyz7A1c9hMqAYPdqT/Hh
	 pXqPYCSyI2FZ9KwJ7RMtumoSvG9o+54ddYPaPqF5ZvdzdgE8JRrVeIPTTFlZT5F9vz
	 af6LCWAJ5y/zssaebvm5BGxJ4/yHK5HJ4zY9gtHm7GZz8KWE6tSNZRoI5OAskMbyiF
	 wlIbc9uibJDZQ==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/9] dt-bindings: mfd: syscon document the control-scb syscon on PolarFire SoC
Date: Fri, 21 Mar 2025 17:22:34 +0000
Message-ID: <20250321-idiom-remedial-daeddab1dcd8@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Y7+f8bm7u98Yh7HV7dNWDNUXNbue9Uy4E1rY4YoJEmg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl3F0Q4t8aefREhwSHkvseLkTn27609HtOlZGeucZ0eK 578Ky22o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPJ0mb4ydgruO2n4uf2nS85 OBvrHh8pSk9ZkMoicVT2xLdg3l/lhgz/07Yb6J1iX1azQ7L4nWP0iVxhnoSe92eaVBovrlwoM3c LCwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_102316_783232_AD06639F 
X-CRM114-Status: UNSURE (   9.11  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
add the control-scb syscon here too, since it doesn't have any children.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d67ff26d445..777a7a5b22dc 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -88,6 +88,7 @@ select:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7g5-ddr3phy
@@ -187,6 +188,7 @@ properties:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7g5-ddr3phy
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
