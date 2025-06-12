Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F33DC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9ccKkOMzZeUQV/p08tWoS9gEoZ7ZWtlf/gEdx7cBus=; b=pUhYrCx28ub4h3
	5HEVTl9WX/M4b+csDFRcsyPEVJY/XwiO9ZqLVwLuuKmj8s5Lq8CM1bMomP3YXkis4CC5XXnk5DfHW
	RmcETh3HmnjAzvYwM+EA5taEBVXkTOvNTW1/4hov3ZhsibHFK67tLyS3rPJtJk3JF/3iIFSf6G0Po
	ILfUEXclqvE2JVaj7QPLCfpcmkRfDJDLU4GEru+ZbPwJTYWtzXzCJVKY0kLHvLR5kBAeJWy+eLiwj
	6uMZoVyT5qZEojsxh8B1G7kxOShUYv6hvg5fKFRgSunGIEpEDB8KI0vaAZ8DPJAfFKWBBHv/Hh6HU
	BfJIAyFb7XTngfdQ7WyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXuz-0000000Bzh2-0IAf;
	Thu, 12 Jun 2025 02:43:53 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVth-0000000BnKZ-2QzH
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 00:34:26 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7d09ab17244so42120285a.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 17:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688464; x=1750293264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4cnX0EhvoTvV363ROgxXVvXp5RchZqTY+BHR1peIlQ=;
        b=gNDlgjeNNKy2lHotFdVj31aPw71IxbOSe/ZPukr/mHXJhuhwvzdYw+vMw80fqNmoEs
         XDT/M1aRacbdtVB8mj7AUErvH9gUPr9tDSmjmJXFOWBbbc7Jeie5s0IBp5djA24kccpD
         W/ynULCd6b2SneRQ066q9ks5dXceu+uupUVQ7q53UBm+QJl3UCMcH5/8TYnxLctpTZbY
         4rZNFklq6BLJy/T5XDG1CuK8C7IYb9Li9erefgdYlhA5j3QqF3XTMlCQCKXYOQsqGSet
         A3Zx0uYcmjLGSgObO8k6a6keHq5t6C9aVusD3fIYgDAU1PQgveoxKbEXmDEjNQNsUSpR
         35Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688464; x=1750293264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4cnX0EhvoTvV363ROgxXVvXp5RchZqTY+BHR1peIlQ=;
        b=rHyPrZdz7Fg+cVtiwxdoXw3ifB6wLOLTW2i7FFGWL8q1MHaKXNhrVrepsF1Lf78tF6
         j6Q5mflbtWV844mO+jaDbHr8SRKZMjwH3VBAKpDXRt+wGfe7VTATySM/n5EgtDFfLVkz
         dpvpNyMk37VEITzXxu8POclTGSWDMMah6YnP/InSDwEB6uYMqjNU6LsdSaVHzPcKx565
         pMkhWA0Ex5s8zVwAusAhWz4etC4nc1gibfiR16U3Y1aWDYLDUIvz9SC8eJ8S/4CHU7As
         hENN+EGnuayDTEtdiOFObFeNkHwGrzo6OnwMRQhqt46EE6OGVrP+1ihqKk92nAosX+zF
         zi2A==
X-Forwarded-Encrypted: i=1; AJvYcCWmVvvJnEAgqI5DdxeuJaMDQbvbMsjLoF9MSUIV/sHDd9u1qQySmt/MJgBmAyYH89TLjnLXH1QcBfYNpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjoPhbuQooqYhCxFc2xxV4WXgYMEGQ7WlqlfoUhpyXbtvGM2Jf
	s+pXATudEYHw4vobx73UwI0I7WeVelM4zc5icFVbkVPxpqkE85tqiH0X
X-Gm-Gg: ASbGncuIc5ltK+v1q6aOWN0MFrPxFjAHJr12ruDKEbyYKBzysUYQIkC9Y4Za/O/fkSw
	H2Ioc3WkXRYjInATESQGVI1nCpwbRqf4+2tskYOsBTV72Yccf0MCM+nGPIuI6hza0Sfr1wLbt/n
	o/6Mi7/v1dI1HzwgS6aY7IfVeB9q2zY0NR3IcvSqyYi/gneg1iCgtWolHTi33BDr6Wcxe8Nmluy
	PupkSm8DawvffLa9v3aFOc86e3Nst2lJKjVPI77iJxngJlGJ3iuUsnI8KIhBnhKaAFCLh+8Yq5F
	qvSPX+ik7f2BcR3aAK6MLxCf1n/zoBmmsbywjA==
X-Google-Smtp-Source: AGHT+IGS6qXzX1rhsw1lo3B14jV1zL+YdAy/l3s2f7PapW2jiFo2sgI8OTVrHVYxwYZAApjNnHhfeg==
X-Received: by 2002:a05:620a:24cd:b0:7d3:96ba:78d9 with SMTP id af79cd13be357-7d3b2a6bfb4mr231743485a.29.1749688464229;
        Wed, 11 Jun 2025 17:34:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d3b5282c06sm35379685a.95.2025.06.11.17.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:34:23 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:33:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: mdio-mux: Add MDIO mux driver for
 Sophgo CV1800 SoCs
Message-ID: <m3rqdpoztgbdocm2yx5ajcnfk7p7b2sifp6fibj3htsmw53mbl@icnaj6xndnjf>
References: <20250611080228.1166090-1-inochiama@gmail.com>
 <20250611080228.1166090-3-inochiama@gmail.com>
 <eb419ffa-055f-48db-8c6a-60bf240fbb9d@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb419ffa-055f-48db-8c6a-60bf240fbb9d@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173425_619977_879994E6 
X-CRM114-Status: GOOD (  18.10  )
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

On Wed, Jun 11, 2025 at 06:13:00PM +0200, Andrew Lunn wrote:
> On Wed, Jun 11, 2025 at 04:02:00PM +0800, Inochi Amaoto wrote:
> > Add device driver for the mux driver for Sophgo CV18XX/SG200X
> > series SoCs.
> > 
> > @@ -0,0 +1,119 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sophgo CV1800 MDIO multiplexer driver
> > + *
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/delay.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/mdio-mux.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define EPHY_PAGE_SELECT		0x07c
> > +#define EPHY_CTRL			0x800
> > +#define EPHY_REG_SELECT			0x804
> > +
> > +#define EPHY_PAGE_SELECT_SRC		GENMASK(12, 8)
> > +
> > +#define EPHY_CTRL_ANALOG_SHUTDOWN	BIT(0)
> > +#define EPHY_CTRL_USE_EXTPHY		BIT(7)
> > +#define EPHY_CTRL_PHYMODE		BIT(8)
> > +#define EPHY_CTRL_PHYMODE_SMI_RMII	1
> > +#define EPHY_CTRL_EXTPHY_ID		GENMASK(15, 11)
> 
> There are a lot of defines here which are not used, but as far as i
> see, there is one 8bit register, where bit 7 controls the mux.
> 

You are true. Only bit 7 control the mux.

> It looks like you can throw this driver away and just use
> mdio-mux-mmioreg.c. This is from the binding documentation with a few
> tweaks:
> 
>    mdio-mux@3009000 {
>         compatible = "mdio-mux-mmioreg", "mdio-mux";
>         mdio-parent-bus = <&xmdio0>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>         reg = <0x3009000 1>;
>         mux-mask = <128>;
> 
>         mdio@0 {
>             reg = <0>;
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             phy_xgmii_slot1: ethernet-phy@4 {
>                 compatible = "ethernet-phy-ieee802.3-c45";
>                 reg = <4>;
>             };
>         };
> 
>         mdio@128 {
>             reg = <128>;
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             ethernet-phy@4 {
>                 compatible = "ethernet-phy-ieee802.3-c45";
>                 reg = <4>;
>             };
>         };
>     };
> 

It is good for me to use this. I will have a try. Thanks.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
