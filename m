Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64523C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 01:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2H2Feqki0C2nWunJDsJWa/YGFcQlYOTcLSOxAdqaKY4=; b=WUKt4GVTVEeL6E
	N6kWaC+h7EWQiBTaqil9LaLyS82FexV+BTNeuCXHy6JJzGx36YaP/HqPQ1XHymTCIH12S88f0e3rm
	3iGynaoghHjVFwtjqDQ8q8TYNvmpr72Dk7vYcm1WeYyPyfYYmIfEkcAaDteq8YELr98R1zVHU5Kca
	PXfrz1/HEg2NauUDlPNkBI4mzAzgCjQ7Y9EL1PYxXnLRfzWaYd/1/AqZ2jp2Qo4LsqASlP1AxNEVd
	YK9Pa+2/oz/i5pdgs6HxPyHLb2OwPxIXRlJAt7rUXBbQRjXwtidH7jM6714+sknhPcFfnhBl9mTZ/
	hzn0CnoXo8kd/qi7TiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzUQi-0057bZ-Pf; Tue, 21 Dec 2021 01:59:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzUQg-0057ZW-3M
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 01:59:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BAF861357;
 Tue, 21 Dec 2021 01:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1343C36AE9;
 Tue, 21 Dec 2021 01:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051940;
 bh=0GufEJv9qksg2WH4eWqdNCSXMqqHuUecF60Y8d57qx4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s5G21W3yGYezWSdbctQpmog+mUisFiZ8Cce44LgCquCiEHzIF+iv5DPNAvBigdYwG
 2iywGOsjTaiTsFMAF353SuYWA3G2ZGj6O+JTvtehQrk8bl4Rinqv4HbVbhTjNFbsHp
 lPG2vSYTDrEMR7ByUjFHzWGiDqMGzHbT2/7otR/qijqSVayBdua99EBSWcg2y9YWYM
 txys2Kw8Zk1Go6wVBXCvHRF/VI+qBnhFJFTuw/e51CtArCYOO8DV1PW/LyitcMs/On
 19W61CraL2BPDnAAzClG6/pWh8/0y7kN28VUeSDEK+QIuhjsgrURriGVgbWCyM2PCv
 zsuyRTnpoLlpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vincent Pelletier <plr.vincent@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, qiuwenbo@kylinos.com.cn, yash.shah@sifive.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 26/29] riscv: dts: sifive unmatched: Expose the
 PMIC sub-functions
Date: Mon, 20 Dec 2021 20:57:47 -0500
Message-Id: <20211221015751.116328-26-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015751.116328-1-sashal@kernel.org>
References: <20211221015751.116328-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_175902_217454_2C6188B8 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Vincent Pelletier <plr.vincent@gmail.com>

[ Upstream commit cd29cc8ad2540a4f9a0a3e174394d39e648ef941 ]

These sub-functions are available in the chip revision on this board, so
expose them.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 7ea1c8da5fb2e..dd110ba00e871 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -80,6 +80,18 @@ pmic@58 {
 		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
 
+		onkey {
+			compatible = "dlg,da9063-onkey";
+		};
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+
 		regulators {
 			vdd_bcore1: bcore1 {
 				regulator-min-microvolt = <900000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
