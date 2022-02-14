Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BE0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qtc2VZM1C4vVLTUaRDQKY3j87Hi6/Y9JTdnWMzwZlXk=; b=fI2jbN2zfjd/CX
	pbZJFUZjqeHrfaMbtKzihlTT0cS5+VN92qBfp3A46bBN9tEMlVeCkMt+B5lUYswqp/oaQ06Pp1s/g
	rhghpKQBuQGcuhKmJYkV17WcaTt2K9ZIzz1ntRXQ39M/2ry1/W5eWKUl5UHpeo1nsRKohD7vXB8sO
	6kMOm7NL4O408maXxLX9lY0mT/pOLXkH07RnDcFapxRYopuhoxG3X+kxmr3d2cUIxdLjjwkh4i0Xu
	EOIX7V4/UJ/f63QM+FxXcZX0YYmISkCjSFFDozV0zo+3sHwfU61l77Vy8Pne5AIBXaij0ij3w/8tE
	7Iber553aJ0PubSOzmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWhF-00Du51-OF; Mon, 14 Feb 2022 08:26:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXi-00DpW6-B0
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:10 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0ADB0407E8
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826625;
 bh=YIMchXgxrGO/KxGG+/UkFx+hf7tS1WrOyOXtJpDqg8o=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=E2dA+AVkvXthh8MBkz8tsaMiUm8RTQ5/U9LR/H9W2uvzWqhl5FalklMksAtmQ6Dt8
 BFt7FXvDVkApOsNnidDbrZEevezYGBkt20f0H7pPLPjLnJ/XXOPCkf6+zS9+Hxe0bL
 qJn946W4OQZX39Q2b/6yORwbRNCXa8ejJ9iDpdadewuiL/go0J/oDM+kyiMsYQwpNt
 c/Wxks2+fTrC9soPDaROEfgURosso90t9bYkyWPZ4em0cm2nnlMMzPWBV5C1/hWftd
 aUedLsmvbs+w/Bh+G3bR0xHYfjDgYYhNd94u1l/QQwhCVndxnFGUYiswY3QsjcAhcz
 b6dJUdyCs1V+g==
Received: by mail-ed1-f69.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so9729769edf.22
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIMchXgxrGO/KxGG+/UkFx+hf7tS1WrOyOXtJpDqg8o=;
 b=avnNNLa2eSassLVspYwZPht2h00ftQFPTcmsKUqLOUlRVjTKVfHaQQxzbrJ7z0+OFG
 dZjp67E40hB0Fy6uPzC3GC/67o1uUlARI2uZfKkZ09O876VQnBS3k02zaYPEj9UDvl1P
 r4mXLTE8/xiBx4u8By/6EG7MNhdNNuYjx/JtbFESq/61T8r/XPgER2+I6KmZXjVs3/Ol
 AaJPs9MYjcihisWaPGNobkLrgmtBpFXM/F6CCdubam9f5XVX6O+8tMyuUgEOoef7lsGC
 FTi/1rSyvuQMLVcNsx/2U2+Xf+/eHY44trsVrS7knHUxA/7Al0ZMjkCsvDGLgE/LK30Z
 nJCA==
X-Gm-Message-State: AOAM530vuj5+QJe7wOmGg2gjPIRruqUqyhkplKWlxLDVypqDAnqe0Cok
 H+uKgnT9A+gLwFtv8/Z6ZG7dhVUp579w9Ivua4H9JAJN3AXKPJfdkOrcO2DE6/vTwztbumUs+Hd
 COspd6JoEQeEQJarZ8G0w39ABa6DZlVUgZpbQ05Xs1yaPug==
X-Received: by 2002:a17:907:3342:: with SMTP id
 yr2mr5958108ejb.146.1644826624449; 
 Mon, 14 Feb 2022 00:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfK0aywy5WjW2583ifLTvYYWtVDcJ7Gtmfi5jkghjnk2WcWRlDFdui/O6H62E9nB+KLqqdpw==
X-Received: by 2002:a17:907:3342:: with SMTP id
 yr2mr5958081ejb.146.1644826624297; 
 Mon, 14 Feb 2022 00:17:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:17:02 -0800 (PST)
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
Subject: [PATCH 14/15] dt-bindings: pwm: tiehrpwm: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:04 +0100
Message-Id: <20220214081605.161394-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001706_553546_5151F703 
X-CRM114-Status: GOOD (  11.27  )
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
 Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
index ee312cb210e6..70a8f766212e 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
@@ -48,7 +48,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
   - clock-names
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
