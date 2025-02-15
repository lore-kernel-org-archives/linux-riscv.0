Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A1C021A0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EXGNdjFRJWaX7wjC/jHWfAGbr6kTAGqnWDSk6nMaJkE=; b=0Xyw1R92SlpA7Q
	5Rx4BwS9hCMP2TTJ4CGf7chIbSXzQMEf6RPzvYlknvMR4PHCV2XXrAMso1EIbm993gzd6kV4+d64B
	H8/u3j4kaguZ0+85oAYi9MewgKcvxXS8aoeQCjtFHMyxgGt+Nj1Ek0JS/KHGrblOHMrJKksFUux0t
	0ndXuF1GWXQX0swJwgFmdVvSv37Y2pa5t7iCmvHOY+8tkpfmYqXvwz0PNbadfRXw6A5x0hLXeYQ13
	JQek9JfcN47akPmtboMr9pggrVPnxZ/RdAbsDUG/s7A2thaWcbnzFANv/nCmttAR3w5E4zgkSfylD
	FtDxk7/Jf+ZetNh9ZYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEwq-0000000HOKv-2I7A;
	Sat, 15 Feb 2025 09:58:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEl9-0000000HMpQ-3e2G
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 09:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54F46A4031D;
	Sat, 15 Feb 2025 09:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18F2BC4CEDF;
	Sat, 15 Feb 2025 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739612810;
	bh=JaoDCVqlef7TKkto6nX2vIsKnIPc62DALi/qmnmAW1o=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CFJ5ddGra9P0ybP1ZswNAj7bp8nNO4qrNrmggV1Vs20hsu5fNA9UtTGvnSTH2htcb
	 NIVOgVBJttGUlkPgbdQBguk+tTdcep6BP34ciTQD09F949Vs7X7P3yfNK+VSYUvqks
	 yATK6zVfUywbxPi99pg1f0jJHwSyYwEjBVhFBe60dAME/nnQTPkMYvGNFYhsJ1VYoB
	 aQIfLh0FYfQkUDGjJRMuX4kYHyLnFLfq3q4+gn/rw+2KjXiyW29Js0NwhwwYFCvuDA
	 +Es1wMKQTsYDjkVPq668wsBlQVy6iRMd63SUwqle0Sbbp3dQ8ED9tjnD17sO2kSQGd
	 LU4GHUajbVKJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F266BC021A0;
	Sat, 15 Feb 2025 09:46:49 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 15 Feb 2025 10:46:47 +0100
Subject: [PATCH] riscv: dts: starfive: fml13v01: increase eMMC bus speed
MIME-Version: 1.0
Message-Id: <20250215-fml13v01_emmc_speed-v1-1-e3bd224ae0e8@hotmail.com>
X-B4-Tracking: v=1; b=H4sIAIZisGcC/x3MTQqAIBBA4avErBMc0/6uEhGVUw1kiUIE0d2Tl
 t/ivQciBaYIbfZAoIsjn0cC5hnM23isJNgmg5LKSIVGLG7H4pI4kHPzED2RFWVVo5psM2mpIZU
 +0ML3f+369/0AZumOPWUAAAA=
X-Change-ID: 20250215-fml13v01_emmc_speed-67812bd9b404
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612809; l=1547;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=Qt3zVrtNxWWmhv3zol8ojyDROGvggaowhiJ4UV1nnpE=;
 b=ABsIVsrA7IzSOMBc4BWZIT3O7KPYMp7Yc8IZ6p9dAl9a6kVX4JD1KwgZJwIhwFCZ5hE8xVmRr
 dSiZK0HOv4SBEbNstLQNVK3+ycPP0TrdD42NBGv3rCQEFrVCIdDw6Ni
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_014652_052244_3024D645 
X-CRM114-Status: UNSURE (   8.59  )
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
Reply-To: maud_spierings@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maud_spierings@hotmail.com>

The assigned clock speed of 50 MHz is and max-frequency of 100MHz are
limitting this interface which is SDIO 5.0 capable. Sadly at 200MHz it
fails to mount an eMMC drive, 150MHz (really 132 MHz) is the highest it
was able to get.

This improves the seq read/write performance by 2x~

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
I put this in this specific dts instead of the common one as I cannot
test if other boards are also able to handle these speeds.

This patch depends on [1]

[1]: https://lore.kernel.org/all/20250207093618.126636-1-sandie.cao@deepcomputing.io/
---
 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index 8d9ce8b69a71be78ca57618ae842c9f415648450..1f4bac9f89463a6af844b8f1743bdfa659e612ab 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,11 @@ / {
 	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
 };
 
+&mmc0 {
+	max-frequency = <200000000>;
+	assigned-clock-rates = <150000000>;
+};
+
 &pcie1 {
 	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
 	phys = <&pciephy1>;

---
base-commit: 0bc08ec1ff5a32449d2b04704173dbf3ebd6b014
change-id: 20250215-fml13v01_emmc_speed-67812bd9b404

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
