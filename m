Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7369C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ooRRrxxu+AJFm4VHehJDJvXsImSmiRwEBRAUpRX7/4=; b=1n+oPVzBu2j6rp
	zD9VuaoesNAQ8Oq7KDQy9fQpfkA3iD+pLcOgv4KWsSTvmqUUpRoGlwuwaG6BZjiAitQui85HZ66pi
	khVD0jolYo1RaCNNyco8c83NuZ8hbU8urJiIStJCX/m2ufgJLkKjc6PnCg0g6YfM8tGQvinRwNJh2
	TkeYig483+OsnpktDSKjzGyqwvf3Ru083UXE8c3msrp85dMCTIdHJU+R8Ax0xm/uonfWmINC9irRw
	vEiJJlnRXuwH47qP0PMTPZibZm8Lk/M3t+edkzk20RgeDT3h2yiC9COzqT07rYDTmpwlcZvTN8sFy
	VbfeZ3UWJQ88pWtE0ACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWiT-00DuWr-1U; Mon, 14 Feb 2022 08:28:13 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXn-00DpaS-Ka
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:13 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5581F40518
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826630;
 bh=icQcZ+WFXKpPn99IyrrodPILDL6gHPyC2MLITlx0dJQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=I82Yq2+hg0DtcNZi46wLNtmQO7vsr1YNxMRZLPXqt7AU+015LtuC3dXMsy9HEt5Cu
 dkHC3XqyofEyV3xncAdyiBpy6NzUbGm4fV90IE3kO5e3wXzhmPHncVRKNAzt56gS7D
 3FToPArx2YHcILXgu9Nk9JIZQe1EDSrwzh0gX5Nc39X2O+tj9Z1Oqi/6jGbytXihvC
 CfqtLjSKeJ9zqofKycHpIcOiQGXk4SzmyEl1z5NuRZ0th9DSLZuaKuTrJ0hrE8pdgb
 Tp2b3gR7Fy/TznSboNhAdyp+CCyQ8HyE43PR+mU+mMZKf8hesfg92OOrSGfEHWieJP
 UFbvfkpDp1tKQ==
Received: by mail-lf1-f72.google.com with SMTP id
 s25-20020a056512215900b004406a28c08bso4976792lfr.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icQcZ+WFXKpPn99IyrrodPILDL6gHPyC2MLITlx0dJQ=;
 b=wGV1Y2+RN9YIsBhEFzYF0AAwzempz/C0SxWF5K3I5iX89uNGogQaN4HdcYANGg7+Ke
 olMVFSwif4kzE7UZ36oFwg8B15i6vybkiZkGOLeOxlpXIUnPXsCbu7J1BuPj6mf84Or9
 jKmjJrG1BeAsTNKjliUM7RVe+LTkoHiKy3whnTQuWGa8XPLX/d8Fu+Z/6AzFUrcUqeuT
 W1BrJxTyJdxtaftV7mdUcSYtOj3eB179OUwVeCdzk20ZY8lwABI/i8G3w9e/SEH+dPGy
 6Mzg58J8X6SOFdpUy/wbvY/hW4qxcZ3fwVW4YIixXEmHbUMVjplNqgbHmJb2nl8SQAzJ
 OBeg==
X-Gm-Message-State: AOAM530d+PeIkR4tObvW1ZHZ94lRWiPXJlOBWGZZWc1FDCLw1QCKlPKx
 hC3cdFJqH/AKNHssnlUepChLuxZ/IsXoZ1IhT3u/uzHczGkVMn7apMDFqM0B4YtGo4Xdm1magym
 66ZJdY2WB8GyacBO4hRgBuzfaTAWbk7gdAi10cWm+XegLtg==
X-Received: by 2002:a17:907:7e9a:: with SMTP id
 qb26mr1455498ejc.294.1644826619429; 
 Mon, 14 Feb 2022 00:16:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo1kloneuL4CK5f402ZmLsMaBH9PsTCXLm/PAvrgWgzMOv7fXj/4RlM6Dc+vRLwWlSy4wiTw==
X-Received: by 2002:a17:907:7e9a:: with SMTP id
 qb26mr1455469ejc.294.1644826619203; 
 Mon, 14 Feb 2022 00:16:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:58 -0800 (PST)
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
Subject: [PATCH 12/15] dt-bindings: pwm: samsung: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:02 +0100
Message-Id: <20220214081605.161394-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001712_096848_21659278 
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
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 188679cb8b8c..fe603fb1b2cc 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -86,7 +86,6 @@ required:
   - clocks
   - clock-names
   - compatible
-  - "#pwm-cells"
   - reg
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
