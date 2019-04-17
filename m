Return-Path: <SRS0=fLp7=ST=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A347C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2019 16:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC82620835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2019 16:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOZrqFs4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="cG2lr7dm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="cG2lr7dm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC82620835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=akkea.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v+NsUchghSY57WVFaqGCfQ8plzgfCvcW1lqaOgGQYb8=; b=UOZrqFs4o76IqwbspJYwbOOU9J
	RiV8Aql6/yg4E0vJEpRhNGow6gNZE2C2vP0cs1nVX3CAVG09FZNS+86rAIAMZLqziGmkdOY/bMuUJ
	TfWxTAteF3rjVEMI2qBxb9/cIuXwkJPNQHKS4YqtXRcIHjMBY0l8bjZXFDFslokk/K1ykdlnFQJsf
	kjrcRhMJoa8+678jJSRqP5f0X5oPlIrXzqpno1Cty9GxEm5BAj45hyrx7HRX+D4vG1D5+T33pHhcU
	JC3yb+DfKIdeF2Jattqu+90pzkm8DjmLf0+And0bkbJNtcDFaZJtAHNksQLAytEMDKzhV6Tci+zXa
	B2Rcw4Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGnr0-0004st-Sg; Wed, 17 Apr 2019 16:56:10 +0000
Received: from node.akkea.ca ([192.155.83.177])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGnqJ-0003x9-HU; Wed, 17 Apr 2019 16:55:28 +0000
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 67A3B4E204B;
 Wed, 17 Apr 2019 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1555520127; bh=n7NBmBuXCoAUjhYQQ8du0zofSB1QjAXtffcxycHtgrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cG2lr7dmRKvNu4Uo0YgSWkjNNio4CsyOYpKJ32HumP9akTv+Bnp2T6ffpa5vOq4HH
 KL61lm8jlZcJr37hYgRjbuuv0R6LxvRlphpqnMqsnSyeL6BJIwLwWAjTisOIagF6sU
 0CB7204fpl3C/ofG7aHFXWtW2bIaQwNXkGPNdKtA=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwsdRxblYHvA; Wed, 17 Apr 2019 16:55:27 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id 0D5AF4E204D;
 Wed, 17 Apr 2019 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1555520127; bh=n7NBmBuXCoAUjhYQQ8du0zofSB1QjAXtffcxycHtgrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cG2lr7dmRKvNu4Uo0YgSWkjNNio4CsyOYpKJ32HumP9akTv+Bnp2T6ffpa5vOq4HH
 KL61lm8jlZcJr37hYgRjbuuv0R6LxvRlphpqnMqsnSyeL6BJIwLwWAjTisOIagF6sU
 0CB7204fpl3C/ofG7aHFXWtW2bIaQwNXkGPNdKtA=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: angus.ainslie@puri.sm
Subject: [PATCH v5 3/3] dt-bindings: arm: fsl: Add the imx8mq boards
Date: Wed, 17 Apr 2019 09:55:14 -0700
Message-Id: <20190417165514.18689-4-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190417165514.18689-1-angus@akkea.ca>
References: <20190417165514.18689-1-angus@akkea.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_095527_580177_15353945 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>,
 m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add an entry for imx8mq based boards

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 06762fe57227..ecf63a123950 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -175,6 +175,13 @@ properties:
               - fsl,imx8mm-evk            # i.MX8MM EVK Board
           - const: fsl,imx8mm
 
+      - description: i.MX8MQ based Boards
+        items:
+          - enum:
+              - fsl,imx8mq-evk            # i.MX8MQ EVK Board
+              - purism,librem5-devkit     # Purism Librem5 devkit
+          - const: fsl,imx8mq
+
       - description: i.MX8QXP based Boards
         items:
           - enum:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
