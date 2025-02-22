Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43077C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAn36goC21SYmV8q23tP8D3cfGVOFyYx87b6iXbHdOs=; b=jsGnfVBDJpWtUn
	X5sXKyrwm1PSo/f5PVNSSpVpTQQDerBoRP35Jxomb6IzMC6a4ltLNPG195rDkjAVZ5e+VbmldKkaf
	ylKlmWmlLuc6kooABysQj61vJpTkjNAyG/J9fmb+DhdTU3c27ZibwBhvGVRD81fqvT/x5w3pXXltm
	+H9XjCJGLjkSKF0jKncnBBpQDK79BSgB7obmCeE2JkvE7BDl84jrJcpChbRnjDs8dgRCIg2kmvnWE
	Z9lCfJ6IpiBtjfgtDTKQOMT2vcOzlesEYzH5PsqqC3cbISLeKZYDZChQzb+BJXiIxlY2QID6hE8ga
	nBd4rJLuzul7Q3kmIRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpeG-000000085Vy-3I8b;
	Sat, 22 Feb 2025 13:34:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpeE-000000085V1-0L2I
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 13:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1133A5C57CD;
	Sat, 22 Feb 2025 13:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57328C4CEE7;
	Sat, 22 Feb 2025 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231264;
	bh=lsXh6HepfnMc+Q/WXCkVqPl5KJ3TC9cVI9pNgzO5tzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sn/XfAF1WWc6JLdoK1USOIIi2YFxmwVcR0+Af3DRone6dZk/0V4bBx8zRMRQpsMks
	 41CGA2uhlgg8XGLAVSx7Lw8JDgPSuZlo90lCvqJ5SK4l+mrzqQ07KMdm5HvD15Q8Lx
	 aBV3Ybrlv7Yh9Stuad9/6j+2w1uT2AVWSyq1vpFQ4Svfpc4nGpVAnXzo6OxAoHns11
	 Jth+F6L9S/pKapR+INq9iVIWa2u6LqbelCKUtxp8ONzXxvLmJeWs+jpD5xT26699PQ
	 P+5bYt4DPtsaPIOvkzWQ7Ic0Aov/HuNmyONWL0bjyY0imVnweyNL8whkeOs+QHRg4p
	 L/UJNRqhU27lg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CDAC021B8;
	Sat, 22 Feb 2025 13:34:24 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 22 Feb 2025 14:34:16 +0100
Subject: [PATCH v2 2/2] riscv: dts: starfive: fml13v01: increase eMMC bus
 speed
MIME-Version: 1.0
Message-Id: <20250222-fml13v01_emmc_speed-v2-2-3ffc5b1f5663@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740231263; l=1059;
 i=maud_spierings@hotmail.com; s=20250222; h=from:subject:message-id;
 bh=6oKEZmpEgAskDT6drBgPswULe7sk6pmiFucVopPkPkQ=;
 b=HISq9mxkhULqrOz8w55mew/rcWCHUqglVyJ7IgxAcKmWD/2YQN766hisLl/aobRLIwGdeNfp3
 sjHDAQxsHuyAQDKnhr3zIIoSHBveLa/iQIAvP6iCeHcVt98HumFzn2c
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=Z2m97WkDS9Sm3JnKpIpH4JwQtLm2Yw8oFCNw6uMBqb8=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20250222
 with auth_id=346
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_053426_183788_088F5163 
X-CRM114-Status: UNSURE (   7.83  )
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

The assigned clock speed of 50 MHz is limitting this interface which is
SDIO 5.0 capable. Sadly at 200MHz it fails to mount an eMMC drive,
150MHz (really 132 MHz) is the highest it was able to get.

This improves the seq read/write performance by 2x~

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index 8d9ce8b69a71be78ca57618ae842c9f415648450..63b539bedd63d39dbe2096f85aaf70ba6ab64d29 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,10 @@ / {
 	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
 };
 
+&mmc0 {
+	assigned-clock-rates = <150000000>;
+};
+
 &pcie1 {
 	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
 	phys = <&pciephy1>;

-- 
2.48.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
