Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1575EC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GS1qkwJIocDUeMnfg5olU7OVUXUYWLCKt0r8EDhcLgY=; b=xQlg/M6OJeDbwM
	wbYe/7m3EKBSnFBiEMdrrSvtda/nDGSBXWif/YMMlNNvzHljIwsSwvIqZJOxoiqLZHwQOFz8vwnIT
	p5GY4vx9ma6hREje8gVa5g7CgH1J1LJR/2Hsp4QxsAsc1DsCRnNkEY0JVMLRb/LHyKRZJfJb7c3Wv
	JhBxW2/Ojaf1gxdjxpaMQG5sLbiIjbJMgtm8u3YxkGZi1vN35NFyk9IcIg65rsjne15qV1cFBseSI
	D4+0XWWKGFvUC9fiBrwh+Pey2Ru3Ob2hBtnrxWk6uSZgRVmawMJMGgR58g5k7wxePpX/lECOlvnqD
	OmG0xA7WPlYWhP99mMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxl5-003dtW-1Y;
	Thu, 13 Jul 2023 14:57:31 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxl3-003dsh-02
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 14:57:30 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-786bb09e595so45010539f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 07:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260246; x=1691852246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXTEiJgqTQSHTgMd2XgbWoza5WarJFfM5iZCV23PHFo=;
        b=cOmDCZbhIAYd71R4aHcljVw3dgaR8y/uhxuuFHpqE+slibYnw+d7lChNU3HT9jQGr8
         tcM0QCtqcZcKI9u2DVtzXm+Kxw8sGqcu0bQYHcsCktROsShcoU4bMHAgLGznsMratST/
         AZiwQJjYm15r3GhwHfouR8UUF+yAd6+JCHyxZhMKKvTn/Z4iD0BM4oyl80+nRKlryvZO
         ZPE+0Czcq7gZewJmraErAmvFgoXeJ/6EnAf7B0HkBN4Hq26aZhVAoYsrQMKwnvyAlx2l
         i6CO8Uw23kW2hz4/BA69GyE9mmkyDXrpolZ6jV5NP5xob3XqmyO4O/UbP5Ibk9lNgoz0
         x51A==
X-Gm-Message-State: ABy/qLbNylQdPJcKzoYH3l1I2CzO+oeB49xUfiM/4iX70b92eI8Z2fyQ
	XpN8GbZl4podTB+LnP7FNw==
X-Google-Smtp-Source: APBJJlEbJtUGyiRAj/0oiEUGHUE6MDV5DC9yCYrFNINS6T3YHK29EQFfzahnTjX3plIUV34wtbPcAA==
X-Received: by 2002:a92:c905:0:b0:346:3fc5:93e0 with SMTP id t5-20020a92c905000000b003463fc593e0mr1501585ilp.2.1689260246652;
        Thu, 13 Jul 2023 07:57:26 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id y9-20020a92d809000000b003460b8505easm2113677ilm.19.2023.07.13.07.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 07:57:25 -0700 (PDT)
Received: (nullmailer pid 4005390 invoked by uid 1000);
	Thu, 13 Jul 2023 14:57:24 -0000
Date: Thu, 13 Jul 2023 08:57:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: spi: constrain minItems of clocks
 and clock-names
Message-ID: <20230713145724.GA3975811-robh@kernel.org>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
 <20230713090015.127541-3-william.qiu@starfivetech.com>
 <c5ad1e1c-58f4-4833-b9c7-8876c1a0dc27@sirena.org.uk>
 <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3fd0d3f-3fe4-2e23-2548-ecbd487e9c9f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_075729_047184_03700B75 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, Jul 13, 2023 at 02:39:19PM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2023 14:28, Mark Brown wrote:
> > On Thu, Jul 13, 2023 at 05:00:14PM +0800, William Qiu wrote:
> > 
> >> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
> >> so there add minItems whose value is equal to 1. Other platforms do not
> >> have this constraint.
> > 
> > Presumably this means that this is some variant of the usual pl022 IP,
> 
> Hm, in such case this could mean we need dedicated compatible.

Except the vendor in the ID registers should be different if the IP is 
modified.

I suspect that PCLK and SSPCLK are tied to the same clock source. There 
must be an SSPCLK because that is the one used to clock the SPI bus and 
we need to know the frequency of it.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
