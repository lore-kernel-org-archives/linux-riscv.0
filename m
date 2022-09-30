Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCFEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUCKM+sgLEz7tDHSF4U4E1i2jtzwG9ADBAcci+sijJg=; b=YooLDoTlzQ379H
	aCMRYLZ7P5M2r2tPLa3lohQmjxX2uUa0HI8AbNEiRGMyUzwuTC0apSo7WqMQD6KUlN5Lnas274loV
	DU9CTyKAB8L1vWyhVYhWQFWkDol7yb0GLrGlPPr2aR1OijwWdxCLox7fguMzsD5/k//Cp9hx/MtO7
	HhqOf4TaW4FeIU5n0FsKK5Ox+JhQT4KLqQMLo7lDGgDO5g7k36U7TuROhqnKTasN+oQ30QgT773IU
	VCC0tlVvwrXfZX/sV9FyaaXqTgQjnRGceWwOzxmvfjbHAEL/xGBhqPuo7aJyWohFbvPLwCNBC9pwx
	H2OQ+haiUQVIcdEIUAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNYq-00Bcqh-Ir; Fri, 30 Sep 2022 21:28:44 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeNYn-00Bcp5-So
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 21:28:43 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-131ea99262dso4599851fac.9
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 14:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=S7CiI3WwjpNrhXvdHD1dIIAHLPRZYnaexnei+ztfM3I=;
        b=LKd+2VoBhyJ7/VpVBXvCx57xYaP4pYhXuABH/TkhfWQDcvNbuyT5yCshxVPw2naxda
         x2Mp3qYxFccSNxzIRmDiZ9hZIllrNUIJOqikTOFY+SjnnOjYhw+9Ysp8ST5iv+AVJ7r/
         BNzh9uAA9OaORBLh2kUmH8UlQR7UCb8PP/V6VaoetYqSyN3wUvNzAguLmk91ZccZbQyv
         oPskaWsbpgGEaQG3277Og2bBQlxOQ0QR8Ey32pSfjIAhgwT57IdbHGkaXIcElYx5YQ9I
         XqIqJSvaQnZBBRutIBIlI9FoOLoCXU//uzvqSJAMpkpMly337/5OUICwlRYO5row0Q0D
         vhaQ==
X-Gm-Message-State: ACrzQf1tb0fEKbp8SJITQl7pAD27DmCb7Zxm6JwmtlVBu0eLSAEL+MhO
	jMwkmC6qpaDZBzIsNuBUROD1GULvng==
X-Google-Smtp-Source: AMsMyM5bcRhjaYikR+Xk6ykHgQ5zOQndbLZNNrB7CLNt2bq/KWaPcLT0xLBWvFaWjME3DkVdHURUeg==
X-Received: by 2002:a05:6871:689:b0:12c:52be:94f6 with SMTP id l9-20020a056871068900b0012c52be94f6mr93380oao.214.1664573319960;
        Fri, 30 Sep 2022 14:28:39 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u43-20020a056808152b00b0034f937c50fasm748202oiw.49.2022.09.30.14.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 14:28:39 -0700 (PDT)
Received: (nullmailer pid 1076968 invoked by uid 1000);
	Fri, 30 Sep 2022 21:28:37 -0000
Date: Fri, 30 Sep 2022 16:28:37 -0500
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to
 "pinctrl-starfive-jh7100"
Message-ID: <166457324093.1075476.18009315584754055366.robh@kernel.org>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930061404.5418-1-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930061404.5418-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_142841_950167_AB9B8FF3 
X-CRM114-Status: GOOD (  13.78  )
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

On Fri, 30 Sep 2022 14:14:04 +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add the SoC name to make it more clear. Also the next generation StarFive
> SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
> No functional change.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
>  drivers/pinctrl/starfive/Kconfig                            | 2 +-
>  drivers/pinctrl/starfive/Makefile                           | 2 +-
>  .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
>  .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
>  6 files changed, 8 insertions(+), 8 deletions(-)
>  rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
>  rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

Would be good to pull this out separately and apply for 6.1. It's kind 
of messy with cross tree dependencies.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
