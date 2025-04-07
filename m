Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0E6C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 23:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=te1+CbOnd5dFtXnLFuS2i1s5yn4bFabJY4V5Rkbyb0g=; b=y1zzpnzuprVBrw
	oZyXQviaEInbrbs1qGcx1Je69KIYesTzx99YKO2uNXIlWRAqyIGYAIH0WuTmCohvNddrmeOEtcrTn
	cUmqQXDkiF022vH/pwZUzwDoae/I0np4QFapnC1w6GEsutYKLRDANChAGHV0EJs5ZjH0xwJ4k+s67
	c6wnSM7d29TpWvOw5tQsczfeIOluJIQ+G6swSeiluwdMRuRuuPsfhfup5tfIqJhlk6fE3W6aBnTN4
	MIfIYWhSWIOayjdEAGU2f2DVz093XAhYtSbWke/lIda8PmW3sriDiEMZxrtWdszQLGfJWX2EcPfvS
	P/yiwv74PnWFUfOOrTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vxW-00000002Iwo-2gCj;
	Mon, 07 Apr 2025 23:32:54 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vxS-00000002Ivz-2Af7
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 23:32:53 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6ecf0e07954so68016266d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 16:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068769; x=1744673569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gce3tpEJQvbseQHEqMDIeqXwjb5hnF6K+vDTyD8uXCg=;
        b=V5dGpKD44M4qcUqHv6JwCigtcyiFCJGbH6R2DFsA3yjxwd9dgdy/1Ja7lS7CmGeiIh
         ZwL6uNACcgJ4bIFwiUZceQOYyl7FgML5zW7XncmCJAYih7p14ojptXFeW7oR1E7ZVLY6
         jBKMqBLEYaaC6OjJ/zyg6WxwL5zXMbss2RoS+YIjcxqtZD5NCrlkC3hi0GxWMaDud2Fb
         baUorW8ZP8sg/bPhD6fpMG/Ty9O5Y667MH0Hy56kOEQKqNL2GYUcapQZUkK99ONtRXm+
         pQ6NZcOIEtBRSJAzH1/3fMsBjJKaZREUiwmApoh89/nKup+49Id6AcpTw5sXnb5z+2la
         XOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068769; x=1744673569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gce3tpEJQvbseQHEqMDIeqXwjb5hnF6K+vDTyD8uXCg=;
        b=eEizIj/syO42eHmdVqLNHl+NclRomq/sgh1Qi0iemL9WsZrVj+k9EZIuicpJtZuhki
         bZiao/pWiwPzHi6Rrk3UFh8zvZXO+ZTVkE+vO3ThVUlfUALAJXLLHK3F21jhctuMEd2Q
         6SBkrb262uH3Kgdyb+Hy22TLJVvtx9SeAAwchtbDb4oUJiPcNtAPuSvgsuK4u4wqnEjh
         2uNHJeoKSoA76fZlOCd2SgdSm1ZEE/xnooWaMpR/O+K3PqhgqdVWon5Tp6KSayyfBi1b
         TOQ5fMTc9Qccb4XYHbELwg+R23zupjUvYyIb8FGLCUnTcysbkbRbzAcFPIW4g8NkHpxl
         QBxw==
X-Forwarded-Encrypted: i=1; AJvYcCXMw+AuUmeXkVyd72L1PQdthb+c2w6WWotZM9s2oHDXzdLjajwb8e72gW8s60waouR0hqWTLkbq8tVERg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl+e3/vFXhLqfMRWm7VVDtYSqKZ3zdH16HXpkfqTSFiGy/6KJB
	ZyntRhJ04qoXH5IQdt+1yPpMchw0GJzvdoUhmK0Qr1vrt+0LP3ck
X-Gm-Gg: ASbGnct+dK9wzoY9Rf/KG8txnPABXA1hJfwGfGHdokb/45nXyzvDCJ4StmExodtwfI9
	zj5VWOnuqSkochM2NZqRzhZ5DSqkgIgMw8NAGqwxAJ2YvXsj8mq6oZ51zyJrH/Zctv8YPKFGzPW
	0OqMYg2U9qkfTcqW8yA+Yznlw8BaWIZmklZ0DJFM64880GrMskdCLeoS9USUtuQ/oz7OxhpVOUa
	5hcuwq+7wMh4n5vdhrVLKzFse1H+gfFNE4ClR6u6gv7aaUpKH2ov04PHZj1McxRMbIoc60//LAq
	Psn9AZfBfyzssja3PAvx
X-Google-Smtp-Source: AGHT+IGGFoQKhq8jM/xnT/qx+VBX8ceaYU/gWDZkhtX4DqhWCeEET7bOo/0E0kCVyVbHnelemU4pwA==
X-Received: by 2002:a05:6214:493:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f00df2bf58mr216384456d6.26.1744068769391;
        Mon, 07 Apr 2025 16:32:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f164dc6sm65186516d6.120.2025.04.07.16.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:32:49 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:32:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	ghost <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <7wklz2qbo3pej7plhdwcuwilbkntfiyuadjpihuhedkvhgvz6p@3h2hxhw54lgq>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-7-inochiama@gmail.com>
 <20250407140015.GA2164748-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407140015.GA2164748-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_163250_556195_1D8A4E55 
X-CRM114-Status: GOOD (  17.07  )
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

On Mon, Apr 07, 2025 at 09:00:15AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:06:11AM +0800, Inochi Amaoto wrote:
> > The sdhci IP of SG2044 is similar to it of SG2042. They
> > share the same clock and controller configuration.
> > 
> > Add compatible string for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > index e6e604072d3c..47b5fc1b8e07 100644
> > --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> > @@ -19,6 +19,9 @@ properties:
> >                - rockchip,rk3562-dwcmshc
> >                - rockchip,rk3576-dwcmshc
> >            - const: rockchip,rk3588-dwcmshc
> > +      - items:
> > +          - const: sophgo,sg2044-dwcmshc
> > +          - const: sophgo,sg2042-dwcmshc
> >        - enum:
> >            - rockchip,rk3568-dwcmshc
> >            - rockchip,rk3588-dwcmshc
> > @@ -74,7 +77,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: sophgo,sg2042-dwcmshc
> > +            enum:
> > +              - sophgo,sg2042-dwcmshc
> > +              - sophgo,sg2044-dwcmshc
> 
> No need for this hunk because the new one has sophgo,sg2042-dwcmshc 
> already.
> 
> Rob

Thanks, I will remove it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
