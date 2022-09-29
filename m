Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E78C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 18:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ6y+AWWY3E1AOCD2VK84XiBanLKhm38Ln704pYETDM=; b=V7IbEqRqJWD0WS
	BojFBdnzwLS4SyKXZOJNZ18uwgH/Kzwg86XEdCHJjywDsHmXbsKxZg+rMkZivl/URW9P7vVyViN2t
	uRLrELKBrRz7eOgCU+V4TuaoWFmxDFLv9bGv5kbih5HmZ+9anvYDjDec/TsaofvkzIwcWZLs+SpTU
	EA9Zdh0hvZJARpDI6mMS8N1et1+l3M5b8ebZIdHynHAM8POBlyX+WyUQqSdMx/F+JRb6dtLRNmVBB
	u4VEd+yvHy2fswyZDVHPq/s6ITdiPYIWkYQp5maCZLIbWd1gzwPTw2WhDhFpvoe4wTo7ZM1tbOTRV
	VYavSJUh/GGARFl996Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odySi-004yG2-53; Thu, 29 Sep 2022 18:40:44 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odySf-004yDj-21
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 18:40:42 +0000
Received: by mail-oo1-f49.google.com with SMTP id r136-20020a4a378e000000b004755953bc6cso695507oor.13
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 11:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JUknpPDEYJa9Cq2iz50zjd2tB2wnF+7kU0AIJz4j5e0=;
        b=lqe7tHdUgo9u3qu/KhM2F4F/4PePUaIheLA7WAqejI9mOc6P2Coyzpb8H49bT38M00
         V2bQcY5mg07AZrNT9psqooCdKY/3xcOSDVE1BdQ2yTC6y8kVPUtx64ClnfvwCyMFP6eC
         bzE/ob58UfB+vl/F9dVxzrz3m6xbtunrlFF6yzmplW48gYHO4Wi0c7tX9o9aJ4/Yjt40
         FX6ehotA4toqc15OpUpInZdrcLkvS0zKye3ht0w5AuSYTp2noTd4RLPPMq9HZxfchVwe
         TCtpId8krUx7OgXB6hgJ0BuvBfdmjPrM7j7Huk699Xz5E4EjQaMx9nF5WlhvIxxWQDbE
         msCg==
X-Gm-Message-State: ACrzQf1DeAlOd9R/SDUEShhVxfjP3kGruhJncFyQ+m84pB+1i7S+cm0Y
	G2IJEtmvlV7JV/sIzWhNpA==
X-Google-Smtp-Source: AMsMyM6Qwd/fCldskNnRa938IC4Gy8WNyKg9DAcQiW8XIA6ZypiOLor4C+h5FDq8rJOyuTG7W+BVJw==
X-Received: by 2002:a9d:6258:0:b0:655:f63e:8e6d with SMTP id i24-20020a9d6258000000b00655f63e8e6dmr2033084otk.166.1664476836064;
        Thu, 29 Sep 2022 11:40:36 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 188-20020aca06c5000000b0034d14c6ce3dsm31215oig.16.2022.09.29.11.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 11:40:35 -0700 (PDT)
Received: (nullmailer pid 2551224 invoked by uid 1000);
	Thu, 29 Sep 2022 18:40:33 -0000
Date: Thu, 29 Sep 2022 13:40:33 -0500
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset
 bindings
Message-ID: <20220929184033.GA2539242-robh@kernel.org>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
 <166447556924.2514425.231552070734010562.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166447556924.2514425.231552070734010562.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_114041_115156_4832DBE7 
X-CRM114-Status: GOOD (  15.83  )
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

On Thu, Sep 29, 2022 at 01:21:56PM -0500, Rob Herring wrote:
> On Fri, 30 Sep 2022 01:51:47 +0800, Hal Feng wrote:
> > Add bindings for the reset controller on the JH7110 RISC-V
> > SoC by StarFive Technology Ltd.
> > 
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> >  .../bindings/reset/starfive,jh7110-reset.yaml | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/reset/starfive,jh7110-reset.example.dts:18:18: fatal error: dt-bindings/reset/starfive-jh7110.h: No such file or directory
>    18 |         #include <dt-bindings/reset/starfive-jh7110.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/reset/starfive,jh7110-reset.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1420: dt_binding_check] Error 2

Looks to be because this series got moderated and came in waves. In any 
case, patches 11 and 12 can be combined. Same for any other bindings and 
binding headers.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
