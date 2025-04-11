Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA871C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WE2Ng5yAl6XqJ1mBzAXoU/s9Pe63BMm1KzsYrlSB8j0=; b=FhnDHE5p2US1xy
	7AwSj6XPQ6asQhQYZQl3bomAqI0xLWL8qhDAlrW8RAr4Ws0t5mnCPfnF1igmkq7UEg3oMjaRKVqBr
	JU1JKgDpzQwgY9RFP8n9YkOd4M3P+iXVf+PdMxG8Kzi0rzEKu4yc/p8GUblhISsI8r28pakXb7qlm
	ivVNSm7WOboKnqN0ravG5qMLP6mIOGHR2NTKPm8mrioLnF2T9dDVurdcBoSotGFjQF8adGuS+MO1x
	CIV6e63xTykUpiW6VbMwOz2m839BoApgp9uisdbwWI331jE5uh4oRJDwlZoBoLRNkjzRyllPFYtiv
	pk0/Taqzd1XmfAWxyGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HxX-0000000EU6U-2YXH;
	Fri, 11 Apr 2025 17:14:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HxU-0000000EU5Z-3FMP
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 17:14:29 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so3067196a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744391667; x=1744996467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZtmV9TuWbxyWvjRy9KTH0D/rkWddSzW49m1b9NLvBg=;
        b=BUvjjB8maUvJ+CCy29c/XzE7Nx7Odnd4FJ14PefUxWuWUrCNqP+PgHxdj6ZDsG3s1j
         muJui7ze5fKPWQ2ZuwJm+ImXkKo0YvMZpurSQ91WFSqReaBOiXOHHSgw3c6rZPkHhYpw
         FlN3ipSnMzv7HJf19vqc9WC8Wm8mB9KO8H9a4Gf8/FNilS3ihSnDw4Xb5y54fampi8I2
         uisYTHGDwTpqC747HYCL5bVUN3Cl1l5fDZKsqztKd1cwRvs7L085eTwbI9wiPlBsYvhe
         lLM5YVxVANGPr7brYQSGxaklmcGft7Wr8DYRpGfjgKHd1C4NZHuigYQNj3sDzWozU7bu
         4pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391667; x=1744996467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZtmV9TuWbxyWvjRy9KTH0D/rkWddSzW49m1b9NLvBg=;
        b=Dyt4Sq4Yi4EjrHjUW1DT8ta4awa5NyWEDDMu/d0Q3IUiMZN877R4jAweG8Zee05onJ
         kroMyXPwMt6HmF/MMEOSlkTtsRgt8qj75ajVOi0lDs4kGUuiHGPW/OX0b+BlKxMoNy15
         P7/rxHlILBzG5ytxdpPoVa4bg9EcfmO9KpA+wklOYlNFOOp8afOXPyFMiafdjStwfCIB
         OVZlfC0K3PRaQ2Xg+aGWoY7YrvuAIHvlNRS7HSnItsYcNgTk492hl8kpvHG0vrOjLOHF
         BqegMIJmKm+UDMnLFWTGANl+qAvTqOMkc3XCRvarau7+OEI390KjCgUGALgzAQoGuS1B
         W6vw==
X-Forwarded-Encrypted: i=1; AJvYcCUg6j8Sb3cnmnH+wWRGVpwF6bvRxj9cb2qdTx8PS6LECZJ+mkuFWXjIOvPknj/FOTgitNpiuW+hpi8ffw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQXwh3vVbuOAZrhiHox/QW4Fl98/+4zY5m88IbewY9vhAE9rgv
	V6pcS8tXPtrrFBkvMXcFgG3ApQ6VeVPUUCadic8kgrJ3ibah0VU4
X-Gm-Gg: ASbGncs3zI+dtp1T0zhhJ5yAPGqB75DrnpR4O9nPrsFJmqElPiCx9crRWpIYSCuKRDe
	Dpr8co3op/4OXdmlis8Mi9nFFBVzj2xMCQIP9AMLVrAbg6geWrUso4c6sxOeOBLs3RvpVmIpTKg
	8s60SN2celIpNUVZSnj9fCupL9XP2JEJwDyVc2bR3wPwTT/2Em5AuKfPhAWCyRzV2Pjivd9D+WM
	cDPktZoRNoGqyf39dI1mbgMnWB6phuvMNlgh625a/hvClflHOgWfgIirJ6B6Gf3xVZKWEfEvdYa
	ectFTdx8mfT780WCNmn0Ojrj3NNdgkpq7aF37fYG
X-Google-Smtp-Source: AGHT+IEUJgIKcaUb8JEq+V2aIJnLrL/NN4PAPW6tR0kpm23V60WZyUoVVsASzUds8R6wJCjRp3i5mA==
X-Received: by 2002:a17:90b:2811:b0:301:1bce:c25a with SMTP id 98e67ed59e1d1-30823646472mr5126875a91.20.1744391667339;
        Fri, 11 Apr 2025 10:14:27 -0700 (PDT)
Received: from localhost ([5.34.220.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171954sm6049259a91.38.2025.04.11.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:14:26 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:14:22 +0800
From: Goko Son <goku.sonxin626@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Goko Son <goku.sonxin626@gmail.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <Z/lN7qrISpbK6MQY@goko-w.tailce6c49.ts.net>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410015549-GYA19471@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_101428_813728_B1C07430 
X-CRM114-Status: GOOD (  37.81  )
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

On Thu, Apr 10, 2025 at 01:55:49AM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 09:20 Thu 10 Apr     , Inochi Amaoto wrote:
> > On Wed, Apr 09, 2025 at 08:10:53PM -0500, Alex Elder wrote:
> > > On 4/9/25 7:57 PM, Inochi Amaoto wrote:
> > > > > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..4c4df845b3cb
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > > > > @@ -0,0 +1,18 @@
> > > > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > > > +
> > > > > > > > +config SPACEMIT_CCU
> > > > > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > > > > clock driver built in to the kernel?
> > > > > > > 
> > > > > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > > > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > > > > without clock built in as it's such critical..
> > > > > > 
> > > > > I disagree. The kernel is only for spacemit only, and the pinctrl
> > > > Sorry for a mistake, this first "only" should be "not".
> > > 
> > > This is a general problem.  You can't make a bootable
> > > SpacemiT kernel unless you define this as built-in (at
> > > least, that's what Yixun is saying). 
> > 
> > Why not putting the module in the initramfs? I have tested
> > this in quite a lot of boards (Allwinner, rockchip, sophgo,
> > starfive and etc.), all of them work well.
> > 
> it works, but not optimal, why delay clk initialzation at modules load stage?
> IMO, it brings more overhead for using initramfs..
> 
> but there is always tradeoff and bikeshedding..
> 
> > > But we'd really rather *only* build it in to the kernel
> > > for SpacemiT builds. You clearly want to minimize what
> > > must be built in, but what if this is indeed required?
> > > What goes in defconfig?
> > > 
> > 
> > As defconfig is more like for a minimum example system. It
> > is OK to put a y in the defconfig. But for a custom system,
> > you do give a choice for the builder to remove your module
> > in non spacemit system.
> 
> I get your meaning here to remove/disable at run time stage, while
> we do provide compile time option, if don't want spacemit system
> just disable CONFIG_ARCH_SPACEMIT I mentioned, clk/pinctrl will be gone
> 
> anyway, I'm open for this, make it tristate do provide more choices,
> and it's probably better leave users to decide..
> 
> Ok, I'm fine with leave clk as tristate with proper default deconfig,
> but if people want to pursue more to make more driver(pinctrl) modulized
> feel free to test and send patches, I just won't put efforts myself.
> 
> thanks
>
Hi Inochi, Yixun

I'd like to volunteer to test if building pinctrl along with clock
as module is a feasible way, and will send a follow-up patch if it
works, thanks
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
