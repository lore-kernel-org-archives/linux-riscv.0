Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB68E6FE54
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/8UCeBIhnbNh0rDcANMxmLVkTGW8OgWUdZXBzBqf6s=; b=1Avw4ZVqLdEBTq
	SfwN/WtAbqRfu7EZlaJwUqxMkHp2atZRM+UWQ9EtAf99vfRpwH9NAAKH9C4R5IkSVjHemOveH1zNA
	zx9VX0oa91DvsWNIU3yVhcjrmqYxhhW7hnbkL1zZEGsv/6/vJf72GTTxhHqWuPyZNIoXYcCpyz4ir
	123pNT6YnmyGmlaL+AVzSYRPBI2gGEdTnBKoWPe2y4ayEv84XZOistOXW0QPmSrzGCpbzbjxL14j4
	AdVcJGfnSqDih5G44mhgxe5bP8UmXrTwA20lu+tr2UXr/t3wYccvTItSkOmwcyUnN9fqI6XkriOqH
	M07/dyJyfAr3OuePJbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhvK-009Id4-1k;
	Fri, 22 Sep 2023 15:18:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhvH-009Ibk-1u
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 15:18:29 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-692a9bc32bcso698972b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695395894; x=1696000694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28ycCMVqr+jLHcID+cLGjL2F35QcRv/+OsF8PSg4e9w=;
        b=pNunVg2yyZlraGuV+McvwSAnKmU+InQ+yPt4DYhwM/qwl3mXoYzLycV7zE9uXf2VxS
         82qjcTzKtfSUHGBrHNSBO1Y8zMmqIKEL8MHy1d35w0ZIn1lG0KhLPj1JNQ6Gjxiuzgfc
         afIedmzAyXb8TXXuQsdMtOXZUJ7PFh3gaFslVh7Gnr71rU9BNFwrh3N2Kzb+qsJKBjB2
         30PJ3m0YvCBTPhgN4aNEjeaRx2/bSjxdgmGg7LkTurbWVrNs4s5RaTsWaxKzTbDh3VTY
         EVonFVLkQatvP2xM+dlZ/6s0/6jQ3cBWnclysquO1uqqdvGAOEaEFWW5xpNtCdxK4veR
         2D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695395894; x=1696000694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28ycCMVqr+jLHcID+cLGjL2F35QcRv/+OsF8PSg4e9w=;
        b=whOTZ+lCbnXlTN43fYW8X1LHQi9nAee2mofuRY5CqA7pDwxWEn8dvKwJlHt/0/IoaP
         LLYtrKhUtj9JWajVTOaMzEJIPiBwVg3h2bqqaMuKeDelzZ8VbgYAwY5rxYMWHdL5oeom
         PXbcIo3OumRPKY3JZ1aZ1qnmuGw9TDK1l+vlM06EhGTdKKrlczpjqTKerErPS+ROnzYC
         phdk2LwQ6JNBPNXn3o2NS7NqB0iiiwErmViaLpCQysr4ej7ShAYE59+vCTDFH0xkDtf3
         augDwlVu8ha2dvE4gmHgBNngdrqTvgMVXvDA2TDFy688EoixxhYT035Tp0F+7L5XfRCH
         8E/A==
X-Gm-Message-State: AOJu0YxPOW96IElcQd0c6gOO1kvAg9G9tm2VVGICsN1efIrOFU4IoM1A
	s9W3ijoifpjOV32ErH/gfcpVaQ==
X-Google-Smtp-Source: AGHT+IEYqxKV/Zdv/b6QlfOjx23Mb/9uFyIcZZjiFtr8f5V9ahoe0eQHX3dZEw5wH7KcGntm/EnFFg==
X-Received: by 2002:a05:6a21:4881:b0:14c:9a61:a310 with SMTP id av1-20020a056a21488100b0014c9a61a310mr7787505pzc.24.1695395893958;
        Fri, 22 Sep 2023 08:18:13 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:c44:77f:ca7d:adec])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b001c1f4edfb87sm3614450plk.92.2023.09.22.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 08:18:13 -0700 (PDT)
Date: Fri, 22 Sep 2023 08:18:11 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
Message-ID: <ZQ2tP48Z19C5xRug@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-1-49f76c274fb3@baylibre.com>
 <20230922-parish-ice-a22e93dc3027@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922-parish-ice-a22e93dc3027@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_081827_627119_A86BBEF6 
X-CRM114-Status: GOOD (  22.32  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 22, 2023 at 10:57:36AM +0100, Conor Dooley wrote:
> Hey Drew,
> 
> On Thu, Sep 21, 2023 at 06:49:48PM -0700, Drew Fustini wrote:
> > Add compatible value for the T-Head TH1520 dwcmshc controller and add
> > thead,phy-pull-up property.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > index a43eb837f8da..46b768d46712 100644
> > --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - rockchip,rk3568-dwcmshc
> >        - rockchip,rk3588-dwcmshc
> >        - snps,dwcmshc-sdhci
> > +      - thead,th1520-dwcmshc
> >  
> >    reg:
> >      maxItems: 1
> > @@ -60,6 +61,9 @@ properties:
> >      description: Specify the number of delay for tx sampling.
> >      $ref: /schemas/types.yaml#/definitions/uint8
> >  
> > +  thead,phy-pull-up:
> > +    description: Enable weak pull-up on PHY pads
> > +    type: boolean
> 
> Why is the weak pull-up required? How would the dts author know if they
> need to use this property?

This is a good question, and I don't have a good reason beyond it is
what the vendor SDK was doing.

There are only two boards right now using the TH1520 that I know of.
Both the LPi4a [1] and the Ahead [2] have the pull-up property set on
all the mmc controller nodes their downstream device trees.

Rob suggested on #devicetree that it would be simpler to just enable it
in the driver and disable support when needed. I like this idea as it
will simplify this binding patch and the code in the driver patch.

Thanks,
Drew

[1] https://git.beagleboard.org/beaglev-ahead/BeagleBoard-DeviceTrees/-/blob/v5.10.x-ti-unified/src/riscv/light-beagle-ref.dts
[2] https://github.com/revyos/thead-kernel/blob/lpi4a/arch/riscv/boot/dts/thead/light-lpi4a-ref.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
