Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A54AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 20:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2UrUuoobb4Yth7T3BH2s2d8BLgr+5GuV5/J/YOk40U=; b=C3ROTP1kD9kuyU
	kmdX/EbFjDT4RPkYH5RH6YR9rcVZmUa2CxjxL0hRdUZkFIAyqaLsU/l83QcxfXjbeyjM5W7vdChgg
	jaAm6tOQkTFyymsuZCSWhTUWyvQlUj0rbnbRx9wYtESzrOe3W0HzFn1ogIyi1ji40DWQuEhDSi/dl
	4ES1nagusW1p8Bj0/8oCtJJzsBDLL1sKHEZBu5TCwkiKjDAD/YEWexBWYPt3hk7ooNZkxCByiox2Y
	BfGPkHyHvLZEKkXdFCeThrL3HNOWTUcZ1FzOeCkijUE0QQpNSwEjLUwlHTzA4wDLKYHgnF6MDS4qc
	HL0l5hDUK3jOXibZ6GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7iyx-003jqm-3j; Tue, 20 Dec 2022 20:12:59 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7iyt-003jlJ-HU
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:12:56 +0000
Received: by mail-oi1-f172.google.com with SMTP id i127so10345793oif.8
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 12:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruopfQWSYHKaRdGSAx7Dg/pS9EkvkCSETDa10WdoTt4=;
        b=z1v/y/kFQNtXpqDeUJTMEuEb6hFm7lro+UFrX49+04ORdew5cR53fXXp1EvPh+vrYN
         rH7nto6lBMJqr7Nh88VuRhzbJbGdyQ87IYM03DR7VOFdbC31UfDvBus7wQXVYjBz6nri
         8xQNpj5mcBYo3uA3dKgiW7VkPvNrIsKLYrfaDaVX5KzMbwk+bEV9U4g2uE0k1Hqb9EFk
         dYPKEjIliE09kvCMEKTWijUigI5+R4CfSbyJf6WYPhKgn+g2en7BKzjyZgqHbgs2ToW/
         gdc+MO3wP7M4TmKYiZZYwPiGfgLa23oL139Dpt2dwoStP/rPDg4NUajiXHA4h45QnD6V
         pazw==
X-Gm-Message-State: ANoB5pkLKQEuXsBefKRMC8yOzNRznUPGpIahky0SqHze0De8drkpHxAg
	QAtCFqfVDwH77dod7I7sLYbGml41yA==
X-Google-Smtp-Source: AA0mqf4cugXCw45dIuigYdKqlbQQdxQ6XRRSh82vk1TcCXWrfOyDbAEW0xr/gJePiBZs+Vqyjbs6+A==
X-Received: by 2002:a05:6808:1719:b0:35b:e443:e5d0 with SMTP id bc25-20020a056808171900b0035be443e5d0mr25143898oib.17.1671567166187;
        Tue, 20 Dec 2022 12:12:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q124-20020aca5c82000000b003509cc4ad4esm5872301oib.39.2022.12.20.12.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 12:12:45 -0800 (PST)
Received: (nullmailer pid 1009718 invoked by uid 1000);
	Tue, 20 Dec 2022 20:12:44 -0000
Date: Tue, 20 Dec 2022 14:12:44 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <167156716420.1009655.13780070128515127974.robh@kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-8-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220005054.34518-8-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_121255_644240_A9D0B2EF 
X-CRM114-Status: UNSURE (   9.83  )
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


On Tue, 20 Dec 2022 08:50:50 +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         |  80 +++++++
>  MAINTAINERS                                   |   8 +-
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 207 ++++++++++++++++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>  4 files changed, 434 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
