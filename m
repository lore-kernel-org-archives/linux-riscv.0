Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDC6C3ABD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrxwzs5msEtYRn4BZO+e4ta3SBbBnm88Eevg6zVR69w=; b=HtF7HzFmXZtQYG
	pKgKLNB2LN5YQ4Vs9gbC6SSSrlb/JE8cp/CHsqu7dXzhTChO42ucnaLk/BtisHO36n8VUdSBG/32R
	JjQp4Rv0JXO87+poz/t8G5fN+vp7eGGdH08mk7DtpH5/+iipqGfDV+/dBcHmyNqMaRoTUNxQP4fYu
	1Fy9kH2EaRIEnav3E9L9Vm7UgHffgdzk3JbAWa+APUyQpxzSU5Xcj+YLGHV64XZ3uh2jcfRmgTMig
	fnvVs3CP3VU2zHBKQGApBZgBZNPBkc4tPlBGidC1mVghrPOMelLH7pGiQKKkxRJSaQ90IyND+0k8W
	zjYvQ0jIJJ4Ep5ihOcQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzeR-000000099ev-0t4z;
	Mon, 19 May 2025 12:31:27 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzP8-0000000976S-2Bb1
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 12:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PmTUCqIdUyvmW7PWX4aAOOzNodfH1u1N7Kcy3QmzJPc=; b=Qh+mbn
	zFLY0hpDPfmflH6PF98+Q0hLr3jjcnPR81neRsOJDI2nmqdqQiLlT+0DiycM6MEN
	59sUq4vijLtpXh2WOzvaFF0aTCzpze0mpXc/gpuvjRy8Fq0qM8ehKyAPzU6UgFP+
	aRrns7f7b7vg5z8g+bDWGCL2+HDTrn1cxAQnpqEBvkgeJhld2CxrupL7GrpyS0tG
	l19dsTnUAHhK0NpBIeUatzSVCII7sIwMpVo3Pte78XNxTZuPpr4Ln2U90neHP9cx
	mje4qDk1WL3W2xY/QWgYGwZdXZgtjRce5fQ3sA64JWml3GQsEkpdMwcvNNWascyg
	gwlcSAKBLJP31Rfw==
Received: (qmail 2475372 invoked from network); 19 May 2025 14:15:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:33 +0200
X-UD-Smtp-Session: l3s3148p1@E1OzFnw1RLBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:07 +0200
Message-ID: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051538_832292_46BC0DD7 
X-CRM114-Status: GOOD (  10.14  )
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

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
index bc5c84f22762..6d84efaf4b84 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
@@ -17,7 +17,7 @@ fan {
 		#cooling-cells = <2>;
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 3 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD14/GPIO44 */
 		scl-gpios = <&pio 3 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD15/GPIO45 */
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
