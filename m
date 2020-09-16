Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49055C43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 16:25:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA4922246
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 16:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFjkSaFD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxmF52lZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA4922246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGafbNVds5sXoThzUdetW6DYip/DAcEBw98LpUpTZQA=; b=hFjkSaFDGVbZLNhbiyT3onszFJ
	30fK0l55ZzRQmkLLaocZqjJkTS5CMDpWrEhNSwpgfizDZj5IWPPkagz4dlnMwELIIiwioX9EeiOW3
	QHPFP0uyX0MU3z1mzhL7X228yLQbOWuFR5KYTsZqNtOIATehYVAEAMhroMckgxlqOugSoVN8Spini
	dFD/A9ObLP9NyZrnZrIMIsgpoZ1IeIAC/Op+Bk/lH6bFrLOogL4wUx8MsyobjPXjXvyX6mtvbfUwS
	9wW7vmp4wQBpe5pRyWugqRoO69z4509jq0C8Cd0p1vkN6WQYQgq0Dr7JL+EqbUY6ezQbNV7kpeUmZ
	bUnByErQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIaFA-0004tG-Bl; Wed, 16 Sep 2020 16:25:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIaDu-0004GJ-Mw; Wed, 16 Sep 2020 16:24:01 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56877229EF;
 Wed, 16 Sep 2020 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600273437;
 bh=4dW5n48JqvNP10b6scxas3MFTEWsL4Xf/7dxjZPBmik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HxmF52lZgoYDVBhxTb89piXhWW+R9uWck3a+/W6iU4V7ZQZjRq2KrMQVXMKsI257U
 pm74a+0hTPrqq8NIRC8PypqsXvlsh+zgzOchalpNewTyo+jUdNoEHybEeXi5NJSONr
 EATgyIQ1pGPmQDEOr7oopIWnf/dmxVP49dkYHs4E=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 6/8] arm64: dts: imx8mq-librem5: correct GPIO hog property
Date: Wed, 16 Sep 2020 18:22:48 +0200
Message-Id: <20200916162250.16098-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_122358_855399_B5E549F1 
X-CRM114-Status: GOOD (  14.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Correct the name of property for GPIO specifier in GPIO hog.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 56295dd2fa8f..e4dedcb58f76 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -251,7 +251,7 @@
 
 	pmic-5v {
 		gpio-hog;
-		gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 		input;
 	};
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
