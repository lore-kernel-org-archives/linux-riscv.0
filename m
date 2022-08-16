Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5CFC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLq/6Nr79dGHIfWuxdEQK9+M31pHfctAZg4L4ifNVus=; b=kYnLzjap4Z79Du
	thYplaAsGm6zZb7p6DrpITQCC+nghw9X9Qgl3ZjVmUhgnL1M5UQ9PNBLXimdBntsWeDp0WmRtpIAv
	aDeguVZskU1a9obZc6kjaQ83XN2eHhxIMMu4i56I7TWRlepbkc3L4ORihMtx/0he4+xAkxeL2x/Fp
	g52pfRbilr1LsJzhzOtZLQGBAln6lSdvKrf0fQXVPTOfLkJ2NO1LH7xPiEsmmvhR+XlnsI9tCFTsm
	a8WEVvdQtSyy/2QsBXTPDsJeNkaskHvFhcG9p1dN37RG9WfzQlxgcqu1UfvBzAMrunkK19s/RZpvm
	0EC+7y3balJIw0YMOEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvNh-00240L-5a; Tue, 16 Aug 2022 12:09:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvNe-0023ur-KX
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 12:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660651750; x=1692187750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UGvCmSdLGhHwliGLCezI146iFxUX+rnhWkr8xC90Ykk=;
  b=1m/Mji3zOo6pd43Nbb0lEzG1/dWTdTSukyIma3w9yKdfyq62Jespt8/X
   /DYK+EDQ8SPvLMrXDzROPMeJMwBPEdf+1EVgzyTx8m0nuTN8ciddHwMdX
   XIz+kDIT1BmhAyUrM81ONV6Vt3uKru4ydw9qROQsrwUSGf9qdlnhGIS9M
   DA9TogloqHQQiR7EYyXsfceNBomsV1bECINCnj5hXtKJvqu4JBRuN4pzz
   Tl6QFWPexPElujnC/tZbVhzm3B5ikF5SZSi9GPigqen8aNkZNX9tjCate
   sB5GBp1Q22PuGuhRjaGQGGAumFjGpObGtd82f/vEkZdzKW55tRPNKI7NY
   w==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="186657514"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 05:09:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 05:09:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 05:08:58 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/4] dt-bindings: pwm: fix microchip corePWM's pwm-cells
Date: Tue, 16 Aug 2022 13:08:27 +0100
Message-ID: <20220816120829.719749-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220816120829.719749-1-conor.dooley@microchip.com>
References: <20220816120829.719749-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_050910_716555_1EB92927 
X-CRM114-Status: UNSURE (   7.91  )
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

corePWM is capable of inverted operation but the binding requires
\#pwm-cells of 2. Expand the binding to support setting the polarity.

Fixes: df77f7735786 ("dt-bindings: pwm: add microchip corepwm binding")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
index a7fae1772a81..cd8e9a8907f8 100644
--- a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -30,7 +30,9 @@ properties:
     maxItems: 1
 
   "#pwm-cells":
-    const: 2
+    enum: [2, 3]
+    description:
+      The only flag supported by the controller is PWM_POLARITY_INVERTED.
 
   microchip,sync-update-mask:
     description: |
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
