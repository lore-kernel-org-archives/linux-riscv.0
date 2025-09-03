Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B7CA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fixB9jdVcq8dxoZDuLlX11ZFWTjHPABbhulQm2ZXx3M=; b=BtRIYIPFDnKF3L
	qCMJe0wpeTuGJ5FVx/V0E8riEvzgWzCJvnA+dBoztxbdbAoXzUaQphwBtnSnRMRUKYuurp0E5Gnat
	vvpkSlza4LM+gcMS46hl4qN54rKHn9WNn1TAMz47HNtBxvWzXqA2LSf+CSpNHbjHoGKBB+p4AeP57
	ZlBpX9IZuWwejiHuJ+hjFJi275XC83uN2w4qaqQvJ5Wnu4069Oqc6Jk2XqXjXlTN8PBplEMHqf1lj
	X3UMz3qTBelzB0Czh9Mpv0mq/54qxhEyWxgafdXIKBXYaiSNZoeXY41a0WTqhDH0ZyLTGEqdDSxSM
	EUiCmW/a57Nza/od1nQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlSC-00000006CGO-38BX;
	Wed, 03 Sep 2025 11:15:04 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkWJ-000000064UH-2g4s
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 10:15:17 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 6FFE9B22028C;
	Wed,  3 Sep 2025 12:15:11 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v1 1/2] riscv: dts: starfive: jh7110-common: drop no-mmc property from mmc1
Date: Wed,  3 Sep 2025 03:13:35 -0700
Message-ID: <20250903101346.861076-2-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250903101346.861076-1-e@freeshell.de>
References: <20250903101346.861076-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_031515_818866_F6993A6A 
X-CRM114-Status: UNSURE (   8.19  )
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

Relax no-mmc restriction on mmc1 for jh7110 boards. The restriction is
only needed to block use of commands that would cause a device to
malfunction, which by testing and observation [1] is not any problem.

1: https://lore.kernel.org/lkml/NT0PR01MB1312E0D9EE9F158A57B77700E63D2@NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn/

Signed-off-by: E Shattow <e@freeshell.de>
Tested-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index a315113840e5..4fa77ffd54e3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -299,7 +299,6 @@ &mmc1 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <4>;
 	bootph-pre-ram;
-	no-mmc;
 	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	cap-sd-highspeed;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
