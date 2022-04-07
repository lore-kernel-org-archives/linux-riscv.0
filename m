Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B766C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSGV8499oMibmGHRf7adbHXgeL3MuSSaHW90V/wVJd8=; b=kYwZOMw+yChJ1g
	kqMP682amS/cVZ8zyXtnCS772+kXlwt5oOAasEfEJrHQ6M3u16leibR3r4OUY4HgDNdmOf15M7HeQ
	RgWoWuXZJtjnu3fNleoqgEbbDhyFKE10SQi3wS9Iectqctr213VcShAGBGiSaPUlSINAbpPens3Ll
	jLpmT8P+EiV2IK9+iNDkLv5B9wW6mZJcnUASwcVnPZdYAsu9jT2N93u9oCVpqCF+Woh9vBvwzkb+r
	UHDu3BUOFfQCcqJD0OfyJJZ9wGtwoTltsEDuYuZzHMSUDgbLI8l+y+3hzwR3sW0MXgAnOWNwHWjdf
	LOzyt7x3v32WjZsJscNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncXqU-00Div9-Op; Thu, 07 Apr 2022 19:31:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncXqH-00Diqi-Dy
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 19:30:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id l7so7547045ejn.2
 for <linux-riscv@lists.infradead.org>; Thu, 07 Apr 2022 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyQlFSOypZUQvhyjs80bnzIhMNmzLPVPUoFxjVcMTGY=;
 b=jP5ULFv9DKY/jZA4Xzs0MaOR7a6irPvM/bLq2GmEoU2oaWufXLh3Ef22ekYD8wbysa
 EMTUVkWP5DSd3LslZ0uEaOVljcio1a0QBqqZHg00c75/5sml6FTM6EIMbCCDdE97wGjc
 BTHlx6LtTrqwrnn3McTD8OB+v2DC07eUL0EfZX5vovliTvjrvYhX05CyFToNAI4wESrf
 nehdUATF1qX7ZWMj5a56SbiGEU2vzFX0+tIkpEoCSZmV3+hU6ybXfqSDGJyo8uQplNQu
 PIwAyXod9sZClepxA7so5gq7xBlsOTR2HFSp78a2cxValZcbx+xDC8XdH1X+uTL4VTAC
 ixUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyQlFSOypZUQvhyjs80bnzIhMNmzLPVPUoFxjVcMTGY=;
 b=iyWnU1mu7nFdQSpj88ORSOawtytqBxzziPy+IuoPRgscNdL9YSUuQr9dKpST2JT1Na
 YWVX6TNNyr8aszLwYSoe99QfpaGXhcHk9YGbY60wD2yuoEDxYCjx7F3fTTs3G4XjqlxN
 dVOTdR+PahA+l98DWaNJ+IzgCp2ZQlyYtiA5ByCntuUrQllfSNEJOh54tH+CUF3khvCt
 KO3C/0PjV/6sqI4iKeF1gOnTkPuPu+oFH7/Gn3poN6fXguyaJnY2Knz1sPeUJlSsV40f
 XxsLFmUdqdhhpuJ+9ozNCh9l2dkF/G0ED77WXarPuYWVdVXSNj7IM3QHiFdSkFxcwTuh
 u5Gw==
X-Gm-Message-State: AOAM530RwcGhzt+BGjQ0aejeTXaUMpnCccB97GMntvwhIA0++SnSZKa2
 /4NKeYc4Wa0lZY8yYuc1bvX+kQ==
X-Google-Smtp-Source: ABdhPJwmJnrqHLOom4NXtOrRUV3yDj9N0fTsVQlWFRls8HxRKNW9+x6qkHUzEBcEia+/3FLvEfmUiA==
X-Received: by 2002:a17:907:7286:b0:6df:f778:2585 with SMTP id
 dt6-20020a170907728600b006dff7782585mr14323981ejc.244.1649359851783; 
 Thu, 07 Apr 2022 12:30:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 ds5-20020a170907724500b006df8f39dadesm7964617ejc.218.2022.04.07.12.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 12:30:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Dinh Nguyen <dinguyen@kernel.org>,
 John Crispin <john@phrozen.org>, Tero Kristo <kristo@kernel.org>,
 Daniel Palmer <daniel@thingy.jp>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-actions@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>,
 Krzysztof Halasa <khalasa@piap.pl>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Burton <paulburton@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bert Vermeulen <bert@biot.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Nishanth Menon <nm@ti.com>, linux-oxnas@groups.io,
 Linus Walleij <linusw@kernel.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, openbmc@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Lucas Stach <l.stach@pengutronix.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 02/18] ARM: dts: ox820: align interrupt
 controller node name with dtschema
Date: Thu,  7 Apr 2022 21:30:40 +0200
Message-Id: <164935983571.16396.7515463979118376133.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115705.450427-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_123053_539026_F1EEB5B0 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, 17 Mar 2022 12:56:49 +0100, Krzysztof Kozlowski wrote:
> Fixes dtbs_check warnings like:
> 
>   gic@1000: $nodename:0: 'gic@1000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
> 
> 

Applied, thanks!

[02/18] ARM: dts: ox820: align interrupt controller node name with dtschema
        commit: fbcd5ad7a419ad40644a0bb8b4152bc660172d8a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
