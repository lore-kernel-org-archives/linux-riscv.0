Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B844C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=popqvA7u6//3v4fmiLd2rbO0wv2IcBGnvC5IvngujbA=; b=Th8LyvAaq+8Hjv
	K0F8NNEHU+HMhJ2wwROsWdVYWerhF1b3jfeaTsQh9NrAjBT8EevlEiA7PGmTrPUgFAsrK2Sh7cPRe
	GfsSF+hXvEDyAlGbbLuFjMXVn8kuei4J2TvgshEY1ir3+oE+atzEJ4RQkbWQ7coiQ/Nsn4IOpKepj
	pqoCqe3tsGEvZb6Q4l6Z09x3VpoSL1AlWUIG0qYzw6ZJ1+IzQB6suJCSkhf9/xhjb+n4jZEpK644t
	4TN+Btjq8sqJf447x3quX8e6vO5mXzE0Cwiu45OROdGI16MVIpwmkFfxiPG57hxU6KhHVM5j4yP6p
	CpIfNqwZFyB72kzt3BCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWYk-00Dq5d-83; Mon, 14 Feb 2022 08:18:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXW-00DpJB-Qg
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:16:59 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1109D40519
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826608;
 bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=KmSLw3KoSsrrVVK5pBda8oxItmE3Ac2fziN4zit6rsJCgRv/iQGBOsWsut54tO1aI
 +wMwuI3E1mw/MkQxCZrUu7DrZjUhyxqa9c/zTQl6TsTWHn/Z7AdoxpHLf7mzcjS/dX
 19XmzuLgNM5B+1Zg/+PrH3WDFQRq8lK9EuHuxZn6b0iGi2yy2l/lAL5ONWESBQdbxr
 vO5RncYeyX7tRkBuTpcF/MUdOjfCcbtjxYNDd5h3cSmK0BvKT6iDj0H3wMo8ubkRY/
 GeHGl+6Xg3O5yh6ADIY0h7B2E3kS4Wrn4HpHwcGGnR7NTtT1Nh/+DvUc38cab42pp4
 LM1ZD3Tiz+W9g==
Received: by mail-ed1-f71.google.com with SMTP id
 n7-20020a05640205c700b0040b7be76147so9769155edx.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
 b=nWK9PRlj44sYjn4lqL7/jMuZH4JL+T4I99oZtTZFJ4/o6krJNy7cHtnMtoJa2FGcNE
 8TQ7nAiaG44LzyyWSQN8kyiUQPdO0aUSfTCYXvCmfKTEmjOwVH6iScUi3sKhR0oMauj0
 7O/7vnQmAvHLzTOaliX70Hs5HHmnfGd0MffOWdEYyhZB88bkzmvQILoa6fBFSYQxM0qm
 /1ckCK6JCW2Nrub4ZkJQ0T/hXtta4BrdePy7q53bLL8VfVXVlSEUdb6zTXoc/m7Up2WP
 iYWGnLTIm+PVsaxVl1hW20iCIiwzkv0DU7a9jnrFdTf7cR2LAfJySxMBd4wFbDrDh3RD
 A7Hw==
X-Gm-Message-State: AOAM531aTTx7JKK7lbAPduv6EzMKIbqhaE1sn6Glm4rFFhH67epmGmh9
 SjsS4RkXAaydqwF8naOOAfOHCSnBCxX7zOUdD+Nlasuv/c0N+2gLefYsSMs24MT2ew8lNs1kLuR
 v/Fyd2Iu3Qgl+Jh61PqycV3oJQRW5eXwlp9rnwzfXxJ6TJg==
X-Received: by 2002:a17:906:29d:: with SMTP id
 29mr3045152ejf.183.1644826607512; 
 Mon, 14 Feb 2022 00:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFwQjCgryJA08f/ZPqu91gByLS1lXUPn3UYgvNgieSyLAvCFuIrk9GLlp5SVzdDUHhPKf2qw==
X-Received: by 2002:a17:906:29d:: with SMTP id
 29mr3045116ejf.183.1644826607316; 
 Mon, 14 Feb 2022 00:16:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:46 -0800 (PST)
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
Subject: [PATCH 05/15] dt-bindings: pwm: mxs: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:55 +0100
Message-Id: <20220214081605.161394-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001655_069484_B69F35BE 
X-CRM114-Status: GOOD (  12.16  )
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

Include generic pwm.yaml schema, which enforces PWM node naming and
brings pwm-cells requirement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/pwm/mxs-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
index 8740e076061e..a34cbc13f691 100644
--- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Shawn Guo <shawnguo@kernel.org>
   - Anson Huang <anson.huang@nxp.com>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     enum:
@@ -28,7 +31,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - fsl,pwm-number
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
