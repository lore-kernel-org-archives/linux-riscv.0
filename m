Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13357C64E7B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 14:58:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650D221D7F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 14:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650D221D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p8v1KgKlzRKN81deF5+hi8i3WJSktIHOAlcCgqTeGxo=; b=VVG1e7nBDwRTKC0CBL2kO40/k
	pIhIWtkoyypa7zy5CHVyFdJl5MGqCjrhF90A1RvhREBmgqKWk/XJUJUXDold9K2j80ti+tBypWaBO
	GqAotf+bxI30eKqut0RHH7DN/nD3a84bJOg9LC7nxBr0SSXWBn/EsSahTMR+xt3sDCCaIgTyV+aVN
	+XX7Nm4r1Bj5FrE0NcQ/0BlMsl5CmLLboS8zVVZm2qFWw1+WChoHUaATXPPHcprrpK9KH2NHgD21X
	jpYAlXiViX/Ld9aXrl+H+5lL6R3zon2gukF9lx4QphHFCvfAMcP3sjwKBXKTKj1FleywLivSPXZzq
	boff49qMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkTaS-0005MD-Au; Wed, 02 Dec 2020 14:58:32 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkTaP-0005L6-OG
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 14:58:30 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kkTaJ-009sny-Sv; Wed, 02 Dec 2020 15:58:23 +0100
Date: Wed, 2 Dec 2020 15:58:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201202145823.GC2324545@lunn.ch>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
 <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_095829_814779_A109234F 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 sachin.ghadi@sifive.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, bgolaszewski@baylibre.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 6b25a80..1966b2c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -3,9 +3,11 @@ Device tree configuration for i2c-ocores
>  Required properties:
>  - compatible      : "opencores,i2c-ocores"
>                      "aeroflexgaisler,i2cmst"
> -                    "sifive,fu540-c000-i2c", "sifive,i2c0"
> +                    "sifive,<chip>-i2c", "sifive,i2c0"

Please make this a full list. At some point, this file will get turned
into yaml, at which point substitution like this will need
expanding. It is better to do that now.

     Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
