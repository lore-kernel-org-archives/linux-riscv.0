Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5233D13570
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xiWFZWJc/xe2CpD8Q/mBgJ3sXjlrxDD9q2okbP480Xs=; b=yvP7vzG8HeTjR1
	R4JPOhC0/BI4HZCb4efy0R7L/CQ02Ldghk1gVBTRzt2+YAsHopWqc/GZZmBvY3X7Nmz/vh37dwecE
	P43Xmr2cKa6xhku8HyNXqljs7l5yHf4bdh1jVvgBMgxnu5Ou2600pU3kBSika64wEoxpNlpQjqZA7
	lcdHPiz7hX9E5EAEFAfE5m+UZRvu0Dkmk/AhzVI3IxL4e1wJY3jVEoZP7+Spnla3VgVPFQj6DlWfu
	Ykp+kq2Zuc9vGfubqtZQq+S8kS8ol9OiLbrvgD3g31/NXhsyZyfVHh5uX2SFuJFSp14/BVHdMrieS
	Bf3cjKLdg5w1vCWExGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NDg-0000000AR2T-1Gfm;
	Mon, 28 Oct 2024 10:43:32 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NDe-0000000AR1w-13a5
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 10:43:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67E5FC0003;
	Mon, 28 Oct 2024 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730112205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DOgf6ez67TZng8zwmp8sVft1rCsBn9PrKnSYU3fqd8Y=;
	b=DX2w+DMZsjXeEOcfMxF897y+za+Vv2VoDcONqf09RAKxoi0f6P2gQfl9k8umxautxpMOaL
	eft7mBMVLmj4RKfeVZBRdGFq2CF7z0YNOg+z1/nO75j0LAqqsgGtFThhwWZ6OZsh2mY+Uz
	pUR0QuCuImCM5KYYtjbQ8t/bmxLGUQSN5sPjaucOBkOH68pdxaFVCaazioVD2ZBW6O6I/x
	toG8itNFd5UBtlQIpH7QOAqyFV0KmM18OlCJyx9zINsQnPgLyR4GNk/c5K5cfpEGW5jmPz
	4+9teLM9pq44NMQdGNkwZtotJygpYJGzkpsgFNFHTTNrTg3QsyPiayL5j8A2eA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 28 Oct 2024 11:43:24 +0100
Subject: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
MIME-Version: 1.0
Message-Id: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMtqH2cC/x2MQQqAIBAAvyJ7TtBFKPpKdJB1rb1YuBCB+Pek4
 zDMNFCuwgqraVD5EZWrDPCTATpjOdhKGgzoMHiHi83y2phSZVXLc3YUHEdCglHclYf+b9ve+we
 7JKHrXQAAAA==
X-Change-ID: 20241028-fix-address-e7f0c40eac2c
To: Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_034330_455452_3E9D7BAC 
X-CRM114-Status: UNSURE (   8.01  )
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

Fix the base-address of the pinctrl controller to match its register
address.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/sophgo/sg2002.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 242fde84443f0d6a2c8476666dfa3d72727071b1..6616f578d190f7aa2a82b233fa9c55267b41ee0e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -16,7 +16,7 @@ memory@80000000 {
 	};
 
 	soc {
-		pinctrl: pinctrl@3008000 {
+		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,sg2002-pinctrl";
 			reg = <0x03001000 0x1000>,
 			      <0x05027000 0x1000>;

---
base-commit: 45a544a62ef7cac9ecc69585a90da72ca68af898
change-id: 20241028-fix-address-e7f0c40eac2c

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
