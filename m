Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF773C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 04:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQWyQvU/zrerrTiDLDI+VE+zDJLiFMZcU786Eg686LY=; b=V+80376t9L+Bo0
	TZKhjZyZ3UB5Dub+htANMJX+Fvz1o4MCF3e0/qoAvjmcy4m/AJUw+hrtgf6syD98moLSEm48hmy3n
	GZpwNgvM7Fu0H1TQrQqlPfO7UTGOuNvNZi2fuKLjG5ChHO9buvI5Q5m9FnLYWDY5J836J8WCihLqt
	dYkrBqUQp/n68Paex/bzreDL54V4FDXZIRO8SktKGNHWm1KALekTRe78DgRfz18px0D4WJahqb3up
	ynPIhDhRcRGmyQht6zEY3zpOixWZIOBPytrG4NPazW4j0a2w1SW8ic5e6HBNS34kpJrKJ1n+aiH35
	ZuZf0QYta+UAm5vJk0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thLfH-0000000GBe6-2uTt;
	Mon, 10 Feb 2025 04:44:59 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLfE-0000000GBdd-488C
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 04:44:58 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6dd01781b56so48598066d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 20:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739162695; x=1739767495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q5ZTUagYrO3sDy0qpYfNbuzZULfZ8CctTVEY3N8wuKo=;
        b=XIae9zqBWEGca20OSjOQD/dhhE/brzzAIEcGMY5910I/sLhVTbbRJ2KPlX9Sx8JAdj
         gw2EUR2Qqbsa8ygFGn67MAVmxZldE1NwVMBj/Zfw2/15qrAbNx+hF7KXzqNoXRIF2mfN
         TXG369OvSELad/ITg6ojr2VaWi6CdfrdxXec/boTJ60JvVK0kEQeAcOehn+nDFHmnp/N
         zA+mlHKOXzKsHQuxIMMAcYUdysIC53Uws3fu6aHWuZA+31uap8nsaimSWVN2GuLePRKx
         bbC+W7T/yHCYqiLQCq4OFps48Dz2CGS83KKhbri6gQ180yEm/7oAn6EnLk0osylPPOmh
         4mNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739162695; x=1739767495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5ZTUagYrO3sDy0qpYfNbuzZULfZ8CctTVEY3N8wuKo=;
        b=mipEGdJ/7HrN14vbToAuhkb5V97J/T+Qeh01eFaiGXMpW3JEtJb5/nTzac9BKchI1m
         5gyC/7P7Ena5aErq32Gd+Gtw6k/x3w+KH+eReUWF7TsX+t0W+DqfPka7k7Zk04tHpre9
         jlR3N73V2IkygHUep3ra7J6R+vIABbFJZgBRFJgBqLt+dgWOtyNoILrJLVpT+aHVU2Yr
         3qGQaqtT1ucXG8NAINpGXhrZz+sY5gmjU6K7+cFMOtrWvYiS+a/HlaQAjwpg09Kp71TB
         8opTXuRfYod+7ES9QVhE4EuPNq952hiX7Mx+rEfMYMHil9VGM+tXT1bBG80QmcCc6vk8
         A3mA==
X-Forwarded-Encrypted: i=1; AJvYcCU4yDZwHkyqcpkYS5bQCsfTkVuY2jCtNYASf82+iidrflce/QHd/IlrJaQ/T82wqAd5n6i8/tE+xP5KPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+DZpRoVcwCEBblUJGnWWd2VopaBgycISg496s8Wpfi2NW2p6G
	6d18IY0ATnZFoyFJ42NJJ46NKEC1o4q44cU4xhcuGKr3wdRggW+frxlyZw==
X-Gm-Gg: ASbGncvbUwJ+ySi0vvgXWMEoIwUy6y7ZFziSAIB+S6PT8hiD/OoRUsqlo2LiSGXCUx4
	//gudfdT1+SBH48nEIg2tCkU+Zcb2BzpURP4m4iML3cXASbwivG8PuQZ7WIYBmNeF4eFGjaBGSQ
	tiaGiRB3QcV/jJQRGzSNW9u0vxmseTagruUsW1+Bei37Boo8RJfEkbtmUcGNtVvjYKVxOU2EPLh
	HKGPskGFElQY1AN4iq2kp4XYtlvSgqAlz9ZuxlhmZHCCXEjH/2FqwrO3It0xnkkHHs=
X-Google-Smtp-Source: AGHT+IGvl/2pg3f4dFoe2QvRsXnrGQoEzjiLdnTh14d/1+Fa2/85a2GnXXhrKqKQfyOOGOq/UIptuQ==
X-Received: by 2002:ad4:4eea:0:b0:6e2:4d70:1fbd with SMTP id 6a1803df08f44-6e4455c61d2mr144316396d6.6.1739162695239;
        Sun, 09 Feb 2025 20:44:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e43c84be05sm41693526d6.105.2025.02.09.20.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:44:54 -0800 (PST)
Date: Mon, 10 Feb 2025 12:44:48 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <d7gfa5l6jhe5ehfm54hajknexbrhlqacjthpocqfoo7im6uus2@jndznqesxzhz>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-2-inochiama@gmail.com>
 <BMXPR01MB2440751AD7D99F33081DB330FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BMXPR01MB2440751AD7D99F33081DB330FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_204457_024731_E5C0D286 
X-CRM114-Status: GOOD (  16.43  )
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

On Mon, Feb 10, 2025 at 09:00:24AM +0800, Chen Wang wrote:
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > index 76e1931f0908..73f8009698f3 100644
> > --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > @@ -11,7 +11,9 @@ maintainers:
> >   properties:
> >     compatible:
> > -    const: sophgo,sg2042-reset
> > +    enum:
> > +      - sophgo,cv1800b-reset
> 
> I have a question, if this patchset is for all cv18xx products? If so, can
> we use "cv18xx" instead of "cv1800b"?
> 

Negative, we can only use a real board compatiable for the device.
This is why I use cv1800b as a base.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
