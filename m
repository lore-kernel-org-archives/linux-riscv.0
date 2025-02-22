Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D57EC021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikInCZoUzQxSPMhGJCJf4gMyyhqQ9CvSH3vysZOoi7I=; b=JI8xc67NaA2qIJ
	IA+Ljkxlkv9fxL66QOFYprJZ5XBZEXtQRB+0TYSunFEBV3+7q9wc8Yvudezk2qoxewyW4cTjr1bTi
	3Rcm+01ElKy4pT+qF39dh77rbCqBoUovrqOrDyNYU+YUi8sKYgyKMFWOqX3TK8urqc9VnAiwJKFAB
	3M0wxUzXZGBL2ThPr+ulBmimav4PLYjaJdvzJQXvYumsGcVLX5y4HH02XypUKVowIm5O4MNVRBXmD
	wbVI5udvTBpo6Tr8Q/k9tFCZc3H/vjlq1dsjX/JQruRerRBGd1yuPxGyeiB6Ac10ec+oOu3dS8yuG
	+cDShFnlex/E8in62Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpeJ-000000085Wk-1r88;
	Sat, 22 Feb 2025 13:34:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpeE-000000085V0-0QEw
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 13:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B73995C57BE;
	Sat, 22 Feb 2025 13:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 403EAC4CEE6;
	Sat, 22 Feb 2025 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231264;
	bh=uJsu7Z3eUyAeqRsSEQzMEzclfBBrgVv7SPl+u/ez+H4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FG0vd4TPsQ5uc5DbIDo/fXgZHntsMOfqtC5L6IkskdtBACdYK18mYFz6HJFIXGC/T
	 DTWhxqBjD3DYVJCaLrX3R6xhpQhb9HoG8C4Iw3rs9AgNVzqU20lcqWRb8wXYd/rKEz
	 v8gVmMVwbakB7meBa1rH49FISMHGAhs8xI7WBD/p4naQwm/toYiPjQgDNQ6pg4tF3D
	 2b+miPwE4GxEM2+y8Nb7M9ltzRiVXri7ACpYZOL2jO4o3hql8cEJidhz9VI4sZvfG7
	 oU844Qus8zXj4TRXqtih4ziJefnLcoDGY+lPjKUXrwdkcjMYCipG+pE3yxtVWM621N
	 ZkvNOvifK2s6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B401C021B6;
	Sat, 22 Feb 2025 13:34:24 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 22 Feb 2025 14:34:15 +0100
Subject: [PATCH v2 1/2] riscv: dts: starfive: jh7110-common: increase mmc0
 max-frequency
MIME-Version: 1.0
Message-Id: <20250222-fml13v01_emmc_speed-v2-1-3ffc5b1f5663@hotmail.com>
References: <20250222-fml13v01_emmc_speed-v2-0-3ffc5b1f5663@hotmail.com>
In-Reply-To: <20250222-fml13v01_emmc_speed-v2-0-3ffc5b1f5663@hotmail.com>
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740231263; l=940;
 i=maud_spierings@hotmail.com; s=20250222; h=from:subject:message-id;
 bh=9gpWZSvQty4+e5gTi1J7LPpp/QLLJlyJMT9QPxYPoKE=;
 b=rQTRH8W8l+k+6KB0J0uKhxBq/QXMk1rJFTrbIikh0K5xR2A2el+LTzrFxUY/2eLhWxsKKKjOe
 zpIVYF513UsARWE/+kqYcS0q6813bnBnPMX+/60ALoEeN0RWuHr3BK/
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=Z2m97WkDS9Sm3JnKpIpH4JwQtLm2Yw8oFCNw6uMBqb8=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20250222
 with auth_id=346
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_053426_208780_395083E8 
X-CRM114-Status: UNSURE (   8.51  )
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

This sdio interface is capable of more than 100 MHz as already indicated
by the cap_hs200-1_8v attribute. Increase the max-frequency to 200 MHz
so users of this dtsi can increase their SDIO bus speed.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index dd2eefc295e5c8b568a02104ec2189e66b378904..19ca8dc24617c2ad565a4a9b2d9af9bd9491f22e 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -258,7 +258,7 @@ &i2c6 {
 };
 
 &mmc0 {
-	max-frequency = <100000000>;
+	max-frequency = <200000000>;
 	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
 	assigned-clock-rates = <50000000>;
 	bus-width = <8>;

-- 
2.48.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
