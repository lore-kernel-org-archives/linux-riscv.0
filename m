Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A790C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzaIeqz7Q8fakoxRPxil1gvHXupCsKWthjtSBVAsfB4=; b=vBF2H1GH4mFXxL
	ozMe4LOIMAenu0v9rdv/l5MfHqDjVcyisjQteXX3vFzuaM5oFTooYxJXAxv+xnyJodduC1mY08TGl
	tnUT+t3AfF4wHREqAuxX0lgIVQQ1UVlfyZwcAOYWHK7tJXrIhXUHMEv5O+a66MXQ7RJT7PwBgcUB1
	jLwU50bHrrTq72x1mkhri5TXVtkIVWrHtxwBgrEGg8nU8bYBqI6d+LjvpsBjS5y/rQ04eKp9K0/Y6
	2eGUoNILqv8IGdAG9NKk/xV26K8AD4l992UdL05nMxauxxSC1SuRs17RES57i1ySXNvYRbl4E0RSv
	aHZQvz4fKHcFkWrX+zzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWiF-00DuR1-Jj; Mon, 14 Feb 2022 08:27:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXk-00DpXz-F7
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:12 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A9D1D407DB
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826626;
 bh=7rHD29slkZOFSJhahaVYXmLu64XBgMMbFm+fpWjAlF0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WaKKEoIAxfOkklgZMZx2fUX9JLWhT1HgpfoM047+dWsO1RqrEcu2C2QTKthoaKaH1
 /dI6hYuE3HtU8OOLqf7QGErGvXQ9lf6RsiTuXQliR+Ifa7F8fMA9UnX1Nds2kRRQS1
 IR7eaFjWMiZe1Jt/LyzNXt8Tz990g2oqAOwJt4P3h9/7/nL/86GmxoG6mNFy9GB40p
 mrhZa+7IcsJPu6zei9N2KiYoTzIhFQSBcEraubUz1zvRlbtXzP5LQ0PBSKMRvyRUuD
 g3JcjOarnoSvtguwZc+eKqUOuek47i4wYTP4HFyMKJ+QEZmcyBnpj/FOC78LXBSKvP
 8kPKP+W0nWzXQ==
Received: by mail-wm1-f70.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso4670765wmb.6
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rHD29slkZOFSJhahaVYXmLu64XBgMMbFm+fpWjAlF0=;
 b=H1geIkz9S97nF2DCQW5NADivj5pH0oLOJkZn9re+KkAXNRRsGWjhqNkGAUKxHyyafS
 4zhi0aH1+0nk637eFEIlkR4xyqKsyAAzaxQN1Cc8CAfC8V/dWTDI08zlAd8irVpdI2JM
 aJaVxkFIcs65Bdz38LtvG4zSWXTSoPnzqSqeV8V0toUg2iwRKLMEIv1C3iMHKyL8Bcce
 4BdsxqVwo3JyuNkJg2K7dYZgvOKift6CGC6l9Fn3zzk+0Qd7kjYUJWSM0xM6rkbQeisF
 4Vsn8UmIFfHtZ9pXp0IKiRSt93+BRxgs4PQX7RwVn7MDW4UO1Peoh5r6sBNZ6SsecZPu
 hLHw==
X-Gm-Message-State: AOAM533kIUG9NzciFDtEC7DNyDj9i9VxEMiy5Pj5os9quMDSbGZ+5h7S
 1pDcPPN8PrI40umieTiAzmh2xTItQmuxojFf4K2VfN6h/7rtiM8qP9fwc3LAc83VIrH1kkkV4zW
 ElKbGVwunbfTlyikOGP9bdCB1n8raVqpO+W5BW07dqvy93g==
X-Received: by 2002:a17:906:6496:: with SMTP id
 e22mr10192495ejm.263.1644826615558; 
 Mon, 14 Feb 2022 00:16:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpvkONiH4FS0uQPH9alYGubO9/o9pYJXoAtA309TiungpCh9WYv1lWlRgqPAUTIAinl39jGQ==
X-Received: by 2002:a17:906:6496:: with SMTP id
 e22mr10192484ejm.263.1644826615405; 
 Mon, 14 Feb 2022 00:16:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:54 -0800 (PST)
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
Subject: [PATCH 10/15] dt-bindings: pwm: brcm,
 bcm7038: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:00 +0100
Message-Id: <20220214081605.161394-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001708_757531_A96B7F8F 
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
 Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
index 4080e098f746..119de3d7f9dd 100644
--- a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
@@ -28,7 +28,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
