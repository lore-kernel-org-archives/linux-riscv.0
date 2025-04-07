Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B261BC3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 04:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtThYHfaMcSU8qvpD2ckaunz7LArQekonH0jNctPNjE=; b=eSfBwY9SJDn2GR
	CpSS/8LFCIbHpjMU7WxeZUPMNNZ0mVvYfu58y2BiWmCi/LXFmOh4rBHke6PHj2fCUmeEOMBjRNKyo
	DOMnHQp45989OpB7TgNQvdiDEeloP9N26l/rt3G+juKS94+s3rqeX2fsmXf4+WytlqzSAZUPxJVAx
	XV6/EVzqQR+jkEpXcgdZz1p/OORWlTMITEB6aN+oeBSYji7Kjn72W7oTNzwzJvOCETJ88p8D+Hzyu
	222KaaVTpnV5cGO9lDHpUKuIWF/NaVrAVwQ6D34GfaSQQmV6u98KwPfeoq42rVgeruuK1yZB6T4EB
	ziN272d2J2VY95bCGNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1diu-0000000GJhi-295y;
	Mon, 07 Apr 2025 04:04:36 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dis-0000000GJgs-1GYd
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 04:04:35 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e91d323346so40103936d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 21:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998672; x=1744603472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOq1SITZwZx53Waxl1kAcNYG/rxGN0T4WohynMVLlhw=;
        b=ivCfqtZ7St4Qy8rpsq3unJ2EJoWutVLXTbdzWrL80tRZXJzJ1mlqLedEnsd50kCAmy
         vVLT6bnQRLJn57RnEP0pkiqWszKoK/OJ1DSVwTOPDRwpvV25vFsQYlFVDioNk0bDzNUp
         ktz64CNjfA8qBMaRcnmCnDjMRZtUOHZCsXiYPPVkawwEXMyga6GTvX0XzqZhL9ZnA49w
         lvlrbQY3sONix9fs9nm/uMV0c7ra+A1BFI8uaO/GU8EaWnr9fGNcqGovCBYwnC6n6gZp
         NkIsCqWFtcIZQbAfYU1+FQJaUofuflgmUDYcyLa+mXi8XjoBe6AWAnShfnIKnUHrEBoQ
         k7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998672; x=1744603472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOq1SITZwZx53Waxl1kAcNYG/rxGN0T4WohynMVLlhw=;
        b=Jq8HM2EWHsjH/4kmJ1et3NKYpVBKoP5pT5qkI6Jg3hOsb+BHfMxyjELzzC6bm0Qhph
         6I1FOoXjDgYgnXwp5I1f/eiQZ1uiEiSG7BIYVrE6vuRARm++i8Z5KZdqE+7ilqMAR/+c
         WYmhm1OPEfuo4qMheOXHipEUa90ofH4OJ7lL/yUrd6rG2JdJmbFMto68XXf3TK+qE9td
         WFs4sf5uaEyybgBjk/2BPcFHSEfra3wOJpPvCCwwGXTSf59dmf2elRlYkX+b3bKQrQyX
         urOzco9f8xtm9+pnghnlLsVr1qfkn08wdtn0hJ4VrLoXIqNCge1nkJM9MvnIvtgLD0nQ
         wVrw==
X-Forwarded-Encrypted: i=1; AJvYcCXDnlxYK07QfhrQraG2OQ7YIYo/BQozt15htQLo5zWON1EcFfn/1pIP7DdZ3uZImkQpTVam/HxVyGZrBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbFVpX/nLrUHJ0ef/m71ZHGSsnC6vhh61fWa4EOV9Vbi51I+e
	xUTNa4F2JWoBHdwg5JkKaWzBW4tPj/1Us3WpKwRoHoEr2AMdDYqP
X-Gm-Gg: ASbGnctl6us9Q/cRByo66WTiaWjMCDKf8RAheFihaXXxHbrsiIh9UM/Sod/LNXEShki
	NO16HJAuQvrevXZHzJzjnDLEttdteb0b9HTaedYygOPEl8vCh/vl4x8zFh0cvYWiNXc4CCs/XGh
	B+rfTkdWInQdYVNm2SSotN6/OLphD+flM1UK6lD3VQMzBX8+LZoajIpQEYbLj6hzwXaNdkPzsC0
	zUKdVyvc1sFmt6YB/PnMOx6SRqtScDL2eWj1J+cFGSe3Tzq13yZEOutQG4imNU6zUJrxkeMw4Me
	2an/Mme9ua8ggYnZ/u2n
X-Google-Smtp-Source: AGHT+IEFWeaPs0k9l/nRl6SOPQWLI77kf3bipNHxa565PpRnQyV/lSkvI2bJRICX3oG/ZiqYwkUBpw==
X-Received: by 2002:a05:6214:1c07:b0:6ea:c5be:f21b with SMTP id 6a1803df08f44-6eff5515024mr175586886d6.13.1743998671997;
        Sun, 06 Apr 2025 21:04:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76ea7ee17sm542867685a.92.2025.04.06.21.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:04:31 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:03:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <wqbglycwmrfqxr7cus4vpaksobxvubozx44giwtfnv3ikwvpqn@kszl3yo6mcry>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
 <20250407020517-GYA13159@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407020517-GYA13159@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_210434_339783_70A57867 
X-CRM114-Status: GOOD (  24.86  )
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

On Mon, Apr 07, 2025 at 02:05:17AM +0000, Yixun Lan wrote:
> Hi Inochi:
> 
> On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> > The MCU device on SG2044 exposes the same interface as SG2042, which is
> > already supported by the kernel.
> > 
> > Add compatible string for monitor device of SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > index f0667ac41d75..b76805d39427 100644
> > --- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> > @@ -11,7 +11,11 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: sophgo,sg2042-hwmon-mcu
> > +    oneOf:
> > +      - items:
> > +          - const: sophgo,sg2044-hwmon-mcu
> > +          - const: sophgo,sg2042-hwmon-mcu
> > +      - const: sophgo,sg2042-hwmon-mcu
> 
> the compatible added here but not used in dts (or driver), e.g 9/9 patch
> I'd personally prefer to add it when actually being used
> (so it can be validated in the real use cases..)
> 

The dts patch is blocked by the dependency (in most case, it is
the clk). I choose to sumbit these binding patch as they can be
reviewed in early stage so I can throw the dts patch only when
the clk is ready.

In fact, these binding changes are trivial so I think it is okay
to go with the initial patch.

> another concern is whether better to just use 'enum'? (maybe not)
> but I got your idea to fallback to compatible of sophgo,sg2042-hwmon-mcu..
> 
> same with mmc, i2c..
> 

I do not think it is a good idea to use enum. It lost the fallback
info.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
