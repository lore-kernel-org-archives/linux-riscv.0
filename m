Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61CBC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSX0AGZr5nZ5K53llOsM3jlOXbaKpnHwPmMVZ8w8xf8=; b=TwNN5eyGjK/oUg
	vA6EF9DYkiyaXmRbTCHLSi0pVnQxhj8FKMOKnphWS+squqAL06mcR0z+ALcs7FJGB9UaCETBqgfK/
	RtbKvHBo5ViI+cZ3XRZSe74iT0B/duy/HZicxArbZGz+2WIt6s5ffRk+iiFU+wHCuRbDDvq+QnzUk
	uuI+QrwQy2Odb3EFI+DXuyUr3rWSDE+nAsKtnMwhdOnHGnVJjZWja2+6OdCbbudADLoSzKrPhaGAf
	s6KHu1Px8v3szgW4Lx9Siw4q312eDx+G0G0qrQmUTufQMxXsrKAPVni2x2XzwwP4tBZV6Ln6ihiIc
	oy4foKcIyk15CGCEr/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb025-000i5E-HB; Sat, 11 Mar 2023 14:17:13 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb022-000i4H-CH
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 14:17:11 +0000
Received: by mail-oo1-f52.google.com with SMTP id a23-20020a4ad5d7000000b005250867d3d9so1213149oot.10
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 06:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WayWIOIzl168cFhbQy0mqxc8fj9xrbSB83RnDiz8R3k=;
        b=IRbncWiXVjmhwJlp1TrjnLYNCDVSWOZyckxWgjsS2Q9ObdvCqmKizFa6A+rtZdlshT
         mVgJoeIBnxnTOYX9BoCwKAWWEdWxrBxLLP3fAgPdDEy55tFLKyc5mTBugxnxgVh/O261
         +3HtvGeG26DEdesS6EZ2FkV52ZSdL625of7PmIytYo7SUL9c8A9m7JDlmvD4N14gcU7F
         tDS2WoiqIcbA0FPz1HqR5HuC+UC9BUbGQuD6/K7F/uBsaGRDpKfoog8HJUML13TDesI0
         qzGdIEiFpxPS4m2pXQdYlLbF4gtDmSm6wyA92NYbJc3nM5nvHmkS23bUXDx/xhKFLvhK
         Kmfg==
X-Gm-Message-State: AO0yUKUKxIAW2+DxqEzB/adsX/yQXMdvvLXweEn0P1l7nEwXLRMezksr
	edHIMfrkFKdSHbPUO3zSUw==
X-Google-Smtp-Source: AK7set8LV5pVOhq7euQWBiixs6oYxgiJUM68yu7tkDFISj8ddHnNo6RWeJD/0CThLBLiaIEVnWXbDw==
X-Received: by 2002:a4a:d637:0:b0:525:4058:2fcd with SMTP id n23-20020a4ad637000000b0052540582fcdmr3201545oon.1.1678544226475;
        Sat, 11 Mar 2023 06:17:06 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f1:6fdb:8060:4df8:4037:6d6f])
        by smtp.gmail.com with ESMTPSA id a7-20020a4ab787000000b0051ffe0fe11bsm1090992oop.6.2023.03.11.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:17:05 -0800 (PST)
Received: (nullmailer pid 140902 invoked by uid 1000);
	Sat, 11 Mar 2023 14:17:00 -0000
Date: Sat, 11 Mar 2023 08:17:00 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ben Dooks <ben.dooks@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <167854282659.42837.5915012938593380363.robh@kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230311090733.56918-12-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_061710_460202_A6368C5F 
X-CRM114-Status: GOOD (  13.75  )
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


On Sat, 11 Mar 2023 17:07:23 +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>  MAINTAINERS                                   |   8 +-
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>  4 files changed, 454 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring <robh@kernel.org>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
