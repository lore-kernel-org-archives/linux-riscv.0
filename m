Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C520CDB46C
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoAl+o4eWjyK671DsEYS3M2HYIvr6s00+szJyC+wPJE=; b=01djnBv+883Goc
	T44MpmRWwmj/a+Vh/QbPZWu69+twrjSHYUMCKb4RJfjCdEsr64g3lEu/8WrA89aeIK/VSfT0We4iJ
	BOd1CacZxE2zPoSysVBLxrhIQF1C8tLQx2ghEZtqnhr3ETTcMXAnrDuFY8T5V5XqN8ypp8DIAqt1L
	HuSwykL4Ebtzk+7mPUARPn4+FjooHlR5VHCNwBZueEsw4oQ+o5EBhlfNiD3q+0PKnAdyTtnmb2o8T
	QTYombLEi2fqA9FflGkAqtPTQX7dfLOuQ14Vs8x2PAfByeYWtMU642Dq+uQXeAvH5w76FqIjNIASA
	ygJ/+LPJbcIhDNYOTspg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6g-00000003CAP-1nDd;
	Sat, 20 Jun 2026 06:23:06 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wap6c-00000003C7q-077k
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 06:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=OmX4eD9vf59jP6Lq5Q979aBQWLB/rxIvO8yHZPRXNAc=; b=D5V0pxww8KL6qL9RNHMebLabQx
	/SmftApCtfC7zXo1feF3C+nnOE10bIbWBoqgknPwoXqIB5CvicJcLjFAihdlEyICONBQBIM2QkrMv
	K7aVuhRldjFbbfsyGYoji238onVBKUFicKUNUDRwZQot/pL5loQy80l7YMADxRnJkMI8es8kz4sj8
	3L8lgGigvfO1b/cOHXrHd+6qDUiilL9MA56R0Svls3RmUS+rN8jlRF+jwYMiPLq0Ciqe3kTiVqtuW
	GnNFk+w7hhATxQ7jZh7bJXqmlo/nW1OcfRcIAYBmxYLcpPd2Enno6VSQ3MBmvkLLb49/KxZo/ha28
	iSi84aNQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wap6U-000000006e1-1LqJ;
	Sat, 20 Jun 2026 08:22:54 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 5/5] riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
Date: Sat, 20 Jun 2026 08:22:06 +0200
Message-ID: <20260620062238.3199108-6-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260620062238.3199108-1-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_232302_062203_821CF0CD 
X-CRM114-Status: UNSURE (   7.79  )
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

Vendor kernel enabled ALDPS (Advanced Link Down Power Saving) on the
RTL8211F PHY to save power when link down.

Vendor kernel also disabled the 125MHz clkout clock signal, and indeed
the schematics confirms that it only goes to a test point (TP14), so
let's do the same.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index bf64b6c6f867f..e12d798b48a49 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -234,6 +234,8 @@ phy0: phy@1 {
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <10000>;
+			realtek,aldps-enable;
+			realtek,clkout-disable;
 		};
 	};
 };
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
