Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE73EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wm16cwJAH47UAOR1Twr5qrBIHVYvGz4FhSRNJzcJbNE=; b=VRa6xJV572hoQe
	mbKp/LPbULadd9jvEagN8NsD3oJVE1gSFZelGp3kielgOhcklSYq/Aon90tGuLm8Y9J6ZmUGDlIa8
	gbaicJKyWHe/DbxUwLwq8e2yJHut7npIp00LkeBOCjD+rOKThYRDS89xp+zssdVz25qmqCHp37fUj
	FU6PDTDRToNgCsVB5NKAWlUo/Ge1RplidchUXpz0RO2i9cOv2SX0e0UtIZQRNhrtk5qoPTODiinnC
	K0UawxMZZdum7Y1p53a/UpGNPmrsIVVmVPpI+MzV6Q6QghgbD9xcUAE4I+pTmKeGGrF+PH+0pr09d
	t1Ykn57Loj8i/RQKOD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWbq-00Dru1-Sk; Mon, 14 Feb 2022 08:21:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXb-00DpPb-KY
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:05 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5FF004055E
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826618;
 bh=l15FonF8uQEq+4XEYAwpRwWSHHnXgwOoYp02FVF3qnI=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=CgnObQ6pKG+zIT2gtPZGDojVNzZAQXT+ivW4ioOQH1NdttAcL31eLSqNM4Xu0x679
 7QdIRXcYbSciPGPQmIz+cZro+5LR4+B62EgamMdTCVEJ33rVqrYN6tWczJtE6slKFp
 HC15RVaoQrv7p7A2bXGODVQsuUHzUDRA8bn60wNuqMjwH7TbIdkAWihEmL9onMHOii
 WjhV3p0+6kz7G8VdJdPRN5afHYk1rVhpBs4sMRb66COF63PmFenbsNyWOzGxMq54sm
 qsUKhizGdS2jTaXbRebOIgb/U4XvFK4VAYbQGs1Bh68kLeqkN1/fOOxlgJgkVGRwWl
 GHxNAenBVeqKg==
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso1120589edh.6
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l15FonF8uQEq+4XEYAwpRwWSHHnXgwOoYp02FVF3qnI=;
 b=sRPoBeZ3Sespd8dGsuSlfschg15chB9lrEGAmGPFtqEKFR2zwakCBl2+iCFN8/zpM2
 RBZf2I22Fl57hjQlyHneIsW0jjCANvAnxK88wnjiAaKkQqe4JFZDyCtxIbzm7h0MHgDE
 OurYzcgHiRlbX3g+MCy2yP2DxP0M3r3ucJ23D5mO3/QQkk0lRJ1mc+qXt/LaQHcbVCYo
 mIrKsbhKNZNPKvrnDP5QkVAkRFTQ+bpRKMLPpZkN0G0Jdv33Ux7PozBxFhETsPEVCuom
 vU18GJjrulVtnhZytvoI9XrA3rxLkZYtdBOBi5be6xm3BYKb0fgq7MVHT1DVc0Z1Rl1g
 +QQg==
X-Gm-Message-State: AOAM5319WZHwAWWHr/4NGu3cQTmcrSTe1s7rKJlkWJiDpkQgxLLa5lvg
 1NdHAkkXMOyb+BsjQkb1iqJou2mzQ7d7PFZmHuKvyor2IxbvQ1vKWk55//N+I4mcFdXHYmkYDj1
 FZlB/uqJjp4W7tiCjZVifOn2HgTLE8piCoC+nhebOxmp7DQ==
X-Received: by 2002:a17:907:1692:: with SMTP id
 hc18mr1264341ejc.558.1644826617893; 
 Mon, 14 Feb 2022 00:16:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7ZFaKPSqzJB7EzZe96ipyX590XuNxFjp7kl2szJXL0JpWvoFuFlVeLyW48x6LMwjXS7gpuA==
X-Received: by 2002:a17:907:1692:: with SMTP id
 hc18mr1264323ejc.558.1644826617720; 
 Mon, 14 Feb 2022 00:16:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 11/15] dt-bindings: pwm: intel,
 keembay: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:01 +0100
Message-Id: <20220214081605.161394-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001659_894614_4C2DD334 
X-CRM114-Status: GOOD (  11.28  )
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

pwm-cells are already required by pwm.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml b/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
index ff6880a02ce6..ec9f6bab798c 100644
--- a/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
@@ -31,7 +31,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#pwm-cells'
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
