Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7066C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67WGiLp2ZuCfF0kmXs1tGdwrJJ0aCq8Aq430TIUl1nU=; b=QEu8OVa4rhtVrB
	KRh+623JmlZ3mgGmjG5bkM1WDWySZW5FOomQBlPofXyqVW2xkLn+icQJO4E7UVjN6HCjVcLUWjQCP
	pykuxU+YZiRJeCeJpSuB0NqdtlBgUrnjLV8Sc867vhxkBy5ydnRzVkSUnXq1fsDaJ8HvkpjUpUoIS
	SG6OjkZ0zS1ltMI+3mkI1qMQTJktJIoxBrK2DFHjb1asu55nLVVcZuCB9YQ4p1SozIIvNlYOvWByH
	+Srzj4zj680bMZfBA8D4F2Aczc+FRoSIdo2yO4tZHtyrrlMVOA0GyRYGtc5gMqDmsHgeing1wp/bN
	P0ROqEvA7ZwpJFdLjNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIV3-002U3d-Ms; Mon, 06 Jun 2022 19:34:53 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIV1-002U2P-6r
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 19:34:52 +0000
Received: by mail-il1-f180.google.com with SMTP id b17so8344008ilh.6
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 12:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gROz1pydceBcvf/fob5H6PUvxkDsoxGNEYfF2zFZELs=;
        b=cQsjRaNGhAyUEkoTYzML6NAZvmHzAt2iDZUvR9GTYR65tWgh2MdCYPFJZg7uG6Jcg0
         Z8KWeJTz8CMgZu8Z4gd8jBQqBPU033WJVmhMeMnydnKxIMilCje9WpSYsvFCUtGhBykN
         xN+HsJ6cjX5Czozw0+5mohF7ujmlXzc50c5Xn+UnMEuUq8OvMChSiLb/zAWcVfxzKwsx
         Iyf0ZeKCSvL+TvR0LhfZ1x8fphfyCVqrxeu1QpP7JWjAT4NSFXLqIFuyDLjIZ8FJs4jt
         LejaVy8h0EtUd5dHgiGVvGJCTzfFc36mX7yO604hmc5hl0lL/hbCZsLSpoRuSjCLgbUX
         Ku4Q==
X-Gm-Message-State: AOAM533noYVt6dNWMrT4h8Dng6/CXH/yf2W8Cizwy+tswAsM8ZIlUavD
	5NGpecxvHZuTi3fSLXsROA==
X-Google-Smtp-Source: ABdhPJyFcdHL9AJCLAhvOLjzsauecezyuHA5y8TsCzVkpu3aHcrvsi73MbDnrJ19ZLcgDNWVt3/Ggw==
X-Received: by 2002:a05:6e02:198e:b0:2d3:f382:bbc1 with SMTP id g14-20020a056e02198e00b002d3f382bbc1mr12215886ilf.129.1654544088069;
        Mon, 06 Jun 2022 12:34:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id x14-20020a026f0e000000b0032dd4094580sm5875484jab.49.2022.06.06.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:34:47 -0700 (PDT)
Received: (nullmailer pid 1129683 invoked by uid 1000);
	Mon, 06 Jun 2022 19:34:44 -0000
Date: Mon, 6 Jun 2022 14:34:44 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: linux-mmc@vger.kernel.org, Atul Khare <atulkhare@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Steve Twiss <stwiss.opensource@diasemi.com>, Conor Dooley <conor.dooley@microchip.com>, Support Opensource <support.opensource@diasemi.com>, linux-riscv@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: convert da9063 to yaml
Message-ID: <20220606193444.GA1129604-robh@kernel.org>
References: <20220606152557.438771-1-mail@conchuod.ie>
 <20220606152557.438771-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152557.438771-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_123451_289955_177E1E67 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, 06 Jun 2022 16:25:57 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the dt binding for the da9063/da9063l to yaml.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mfd/da9063.txt        | 114 ---------------
>  .../devicetree/bindings/mfd/dlg,da9063.yaml   | 132 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  MAINTAINERS                                   |   1 +
>  4 files changed, 133 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
