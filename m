Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70938C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sqLSZDFW1/5Z2+O8wpiYvtW+d3KvHB6E4AuK3LqSJAM=; b=vlVgsiSvhi1mnu
	KhUxLE0OpxkxWAoSgKEY4GVFIavaF/vT//PwHGqnD26UjTAMshv+zfux+OYIfQp/ZLEh/r5StyyeO
	x6mxUHpRDHG15a69Vk4QBbhd+HESrYGB9At4FAuQO+odoInAWMkb4RrdEGEwasrNpIgqlvza96HA7
	Jm/yeuxGTziWv+YMdU3ryUhWQfzI3o4yqiduoJMAqmyYdO8sams4dLojtogf1AA7wdLekKyCgGSzI
	BMYw/3pWWx4YVg5NkJuGW4IylvLBqW5nVR69K+Nmyn/UYUU5O4H9tjWqZCpShOszEmQZ20MUrvZl/
	8MwwtU8FXllV58aMSqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJinL-00Gy9Q-Lb; Mon, 14 Feb 2022 21:22:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinH-00Gy76-Rz
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:02 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6EEEA4033B
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873718;
 bh=Yyn2NqnfgQsqTNINvOf5kiaG/8cnl0ieMPcjnfWxCE8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=SCQAX7bth7sriNYVeHYYWth8/XFEv/d+tUPhWT5gVVKvDio4qUCPq9xBV3oPWVjcM
 neBm4F1VTU5LYux9DYolTY2kFRcaf0LKOuMPwWyR+MnhNtLJYxXxtN6YmF5UeqcUws
 jQ+XzsdM8iPIKSrh1Xm1bE2V8ovu5tmSHxfnxjEUFh7VsCVEk5WmVwD498rNGmwv+M
 OnkbU/mgTzgPphsk2zn1dV4AJC9BSZ0WM0Z+Q7PBZxBvJU1YYNhy85K9GHr5JR55OJ
 SJS8Pi1k7uqptwZLtNLh+VWjJU4yCv1MvC0qcps7i5S/Sra0r2hjTAKW+EY/GFwliX
 lNTVhCX/KEZKA==
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020a508d8b000000b00410a4fa4768so3774536edh.9
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yyn2NqnfgQsqTNINvOf5kiaG/8cnl0ieMPcjnfWxCE8=;
 b=ZVt/ZwSkykIRw6QNdpIy0BjGxWQvk5wQgA1GDbDc4ElsvdBdNx3mhdopbk6Ws/B0Y7
 uPivtw/Zsam4lvYmrGgIO+125CMflSfKz+DGrcSNrL7CiZqmuVojwFzhc0nJ8t8kYhvA
 6WHbdVbczmpxxrpqjqPrd9dmUWS5TVa21mniKoWNn4kWvNA0UowEzm9M63IpYyJSvord
 iGe4VnF0DSxlG6oxCIAX84hxPBHeTF/LHCJncinK0UTpbzduPbMSOxzuffePAuAlWAw6
 gHurVKL84m7pRJcDufNA2tuQaKlQuiUiYQERRD9lZCVTMQZEiDN8Z/GQilfcGeJV4iTi
 i9+Q==
X-Gm-Message-State: AOAM532IBhKdNKE4Th4PQH3lJcjr3mm47v6hsrQ/epULNOKVH5hW8WBv
 LGm0hmdXXFvEaIVxU2t3wEOmmzbypfrC69Xr4vYh0PPIcXK1lL4I197IzNCpraxs/NRcH81MwRY
 4nNhI96iL6PDC14ib+2cq+oFCDY1hOJ1givYXYJWrRsR84w==
X-Received: by 2002:a17:906:43c9:: with SMTP id
 j9mr542967ejn.652.1644873717906; 
 Mon, 14 Feb 2022 13:21:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHUEbKK+ige7iX5bnwzSKFJMTswdOEpqx7cMi1lNy54Z/tS1AK9z5IhoWWwB46l5Z1qT3wqA==
X-Received: by 2002:a17:906:43c9:: with SMTP id
 j9mr542949ejn.652.1644873717746; 
 Mon, 14 Feb 2022 13:21:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:21:57 -0800 (PST)
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
Subject: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:39 +0100
Message-Id: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132200_148125_6C40D9DE 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi,

Changes since v1:
1. Add tags.
2. Adjust subject (Uwe).

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
  dt-bindings: pwm: imx: Include generic pwm schema
  dt-bindings: pwm: intel,lgm: Include generic pwm schema
  dt-bindings: pwm: iqs620a: Include generic pwm schema
  dt-bindings: pwm: mxs: Include generic pwm schema
  dt-bindings: pwm: rockchip: Include generic pwm schema
  dt-bindings: pwm: sifive: Include generic pwm schema
  dt-bindings: pwm: renesas,pwm: Include generic pwm schema
  dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
  dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
  dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
  dt-bindings: pwm: samsung: Do not require pwm-cells twice
  dt-bindings: pwm: tiecap: Do not require pwm-cells twice
  dt-bindings: pwm: tiehrpwm: Do not require pwm-cells twice
  dt-bindings: pwm: renesas,tpu: Do not require pwm-cells twice

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 53 ++++++-------
 .../bindings/pwm/brcm,bcm7038-pwm.yaml        |  1 -
 .../devicetree/bindings/pwm/imx-pwm.yaml      |  4 +-
 .../devicetree/bindings/pwm/imx-tpm-pwm.yaml  |  4 +-
 .../bindings/pwm/intel,keembay-pwm.yaml       |  1 -
 .../bindings/pwm/intel,lgm-pwm.yaml           |  3 +
 .../devicetree/bindings/pwm/iqs620a-pwm.yaml  |  4 +-
 .../devicetree/bindings/pwm/mxs-pwm.yaml      |  4 +-
 .../devicetree/bindings/pwm/pwm-rockchip.yaml | 74 ++++++++++---------
 .../devicetree/bindings/pwm/pwm-samsung.yaml  |  1 -
 .../devicetree/bindings/pwm/pwm-sifive.yaml   |  4 +-
 .../devicetree/bindings/pwm/pwm-tiecap.yaml   |  1 -
 .../devicetree/bindings/pwm/pwm-tiehrpwm.yaml |  1 -
 .../bindings/pwm/renesas,pwm-rcar.yaml        | 26 ++++---
 .../bindings/pwm/renesas,tpu-pwm.yaml         |  1 -
 .../bindings/pwm/toshiba,pwm-visconti.yaml    |  4 +-
 16 files changed, 101 insertions(+), 85 deletions(-)

-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
