Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EB4C43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 16:24:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E35C22AAB
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 16:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S3OdJXmq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2eFT/IHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E35C22AAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNs3hJ1CINKFUpZHaLSD0sRXNBzGLm1E9ehraqNYyeE=; b=S3OdJXmq53/DENbaQtZotFGYJr
	UD2eJIFIM7yNSsaiIzTKTv6tRTHnjnVbxW93atu3dJ1/c2cO8m8RHepM+Fsr+Wk+ms6Rw4sJ7jyvM
	yhdBhCxlQ/obfjdke8aiLgKcVdPMgzuzynbnC9/GVeF2BtB9Rg4OfHao21uXb6AfjtbODwkR0HfP9
	iaaWSzpRLDYG+gzpTwHSLj6wBt08C/dlFiDAl+HZBrEjhvXYC2pc7FcQyOkr7ZV6I4rlng06kz+pZ
	jED7aHz+2liQVwgWBTKywGnqkLIb17z78ciZF/v69FSMVjMrIH8GRKNmJFtmj/CqxqNWtDLFjIspB
	HoYfPBZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIaEY-0004Xh-LE; Wed, 16 Sep 2020 16:24:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIaDe-000491-SV; Wed, 16 Sep 2020 16:23:43 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9600A22A84;
 Wed, 16 Sep 2020 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600273422;
 bh=fNcuVWkN1TjhyVwmEX+PcPTSMs1C1wjtAwGI/ZRYd+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2eFT/IHdk8kMc/sJr3aSUS93e7LsG7FvG1/lyhD03N9x4hHEjJcen2uN41Pr0BUUJ
 cIoCliYuD46rWdiSiZ/MsWqo9yW/KgSCOUEdnQXn6GrR3/XLHts9Anzhk3/2cZ5gie
 G8SYT29d6WLaOA2cDY0mZLuXoIdliyUA6me1lePs=
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
Subject: [PATCH 4/8] dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7
 compatibles
Date: Wed, 16 Sep 2020 18:22:46 +0200
Message-Id: <20200916162250.16098-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_122343_020378_B69430E0 
X-CRM114-Status: GOOD (  12.13  )
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

Several DTSes with ARMv6 and ARMv7 i.MX SoCs introduce their own
compatibles so add them to fix dtbs_check warnings like:

  arch/arm/boot/dts/imx35-pdk.dt.yaml: gpio@53fa4000:
    compatible: ['fsl,imx35-gpio', 'fsl,imx31-gpio'] is not valid under any of the given schemas

  arch/arm/boot/dts/imx51-babbage.dt.yaml: gpio@73f90000:
    compatible: ['fsl,imx51-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index 737756e081fb..ad761e2f380a 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -21,8 +21,20 @@ properties:
           - fsl,imx31-gpio
           - fsl,imx35-gpio
           - fsl,imx7d-gpio
+      - items:
+          - const: fsl,imx35-gpio
+          - const: fsl,imx31-gpio
       - items:
           - enum:
+              - fsl,imx50-gpio
+              - fsl,imx51-gpio
+              - fsl,imx53-gpio
+              - fsl,imx6q-gpio
+              - fsl,imx6sl-gpio
+              - fsl,imx6sll-gpio
+              - fsl,imx6sx-gpio
+              - fsl,imx6ul-gpio
+              - fsl,imx7d-gpio
               - fsl,imx8mm-gpio
               - fsl,imx8mn-gpio
               - fsl,imx8mp-gpio
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
