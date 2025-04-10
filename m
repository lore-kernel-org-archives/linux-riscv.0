Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72CCC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xeDarZOouwWDrldJ6EiZLW2QVgsN8ZtHFLzGSo/ivY=; b=KTE3bCz58l+LZP
	8elE8IEQ8FOvzRs4KRViUtz+ZS6Cp16ny5sHcfO+N+FdVia+MsROdbGPrByGBGSyvsTbbWVznKn43
	0HZypMeeS8DaTIGmhI8XQ+kqhcOgGmb33x5nw258XzMd9sIIn+eSP70LNuO+OUJgJ/Gk+hbbb5aJQ
	U9P9ir1UmTiPtjQqpYsnTFM5WHdKjrfyHmtIxjFpDsEJoEuA5H975csBT7OquWzNhhT0DfSdEvbDP
	DuidW3d5i9x1EJckvpnzcWkBxZYfrH9eF6pNAnx1BNNoivWmsDyF85lze+KFiZOCsbwnhWpMSHck6
	H6E7a3tTrr47mYLlCn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2itK-000000098rv-48Rk;
	Thu, 10 Apr 2025 03:47:51 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2itI-000000098rX-1KUT
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 03:47:49 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c59e7039eeso58093585a.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744256867; x=1744861667; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl2Sw4bxxEHiJQNxloPaBGado/8eDTdeu7twZOJULCU=;
        b=L7wAKiIu/fNcZ70VA3b31VQiPadJ4tL2cw/g+FpMae8AFw0H0wmfiO+BsCy+LTmxfh
         QKQOq2TF0nptTTSzvUfq0v4ZI0nED5zU+NayuWN+bN4JzUs7x6cSU4TIC5NnLJiG13xQ
         hHgbgaBRRNzpJbORDzn1OGhM7oBRUi3HqTm3nTZjwf/5u+uIJ8OMNMp/URjK3fDzDpt+
         2YqtW410FRvMBtFLSPDmG8U/W4qCMZXQu+9IKWrW2iFejgeNV2V9pitPalh6Ww899/Pj
         uw/MvLxOSypNczhViJRROcfO3vZ5mNBb9sSYV5W/eeLLkXzbYDCaEFEIoHuIBeO/AMNd
         uAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744256867; x=1744861667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl2Sw4bxxEHiJQNxloPaBGado/8eDTdeu7twZOJULCU=;
        b=Z1l64AvdyecKYqxCJeNN9Z+C99Vt3lC4KIfoica/bLDjyDCnyLwFCrjrHnkOJsnE20
         eb7eIrn6Uzmy9lkrGRhuQ+FmgLwv0EkVcGdRT25vkc41VDQ6QH7HGN6kH4AXSbN5+dY+
         0uLUkRCScwlBbCzPP2HnBkNYMYcULu0ZvyDhPBqH4WpEF8rMmAWRxHgnxdXxmr+nZ3rE
         g2pvJxxiVr8rmoJULZL5IcKUU5dvz1Ck5vevdUtdpDdBYfFNxZBROiQZfFndYte0q5bh
         s/9Ir8Se1XbOhe5l5PUhCG1jkEIfStlgQ12bMc8d/b/TdRKKN8NNpP5V8m7s0IMEdRzF
         27Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUa1cTRO5sW9IHK4fhYQ1pDRSjdTTAYmJCg8LFD7/HoFIEyVKlQYwJXVkkX8CfFP/LtIl+XROSj7NKGhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCT3wURzPc2ufAq+WC2ZY8vXULaJo04QNdooiaTGGOhalre3/p
	K+dxsXs1hegDpT5bf0BUgEPx2f3D7j14tbI6US3IutJQWnlo9CV7
X-Gm-Gg: ASbGnctGFV1ons7NgwLDxRwF56XowKiZDjDHUNCmFuNH7PWe87NeUEiSJOvNkKl/7YW
	u/T8/muh5wOrJwxv6KTWYIyqReqCZOiOkB+sXBD5iOY0RT6K87J3K4/StLbh4kwBXjnTGROZO/h
	HaJlcTKtkeGVpQNtvbI9IVpCJvJdAJ6LojbC5O86wg4mzBD/TxuKuSHyFAdLPKP7pfBZdvoOMI2
	MhZ1eZmhMzCCaa4SBm2vcDxZKfsxbdA0G4qOQ6WiP1dUnlIp7Ax38NHShZ/xj35BAaZjbZ9TTbp
	GLZjlGJV7UqYSMgz
X-Google-Smtp-Source: AGHT+IHFC2Rk9C/yn6FcOPV21K6GfuBdCrrACTPvQR733CaBYV/6ZYW0J+2NXRDP1n9a2LO4HgQDkg==
X-Received: by 2002:a05:620a:2943:b0:7c7:a555:4a11 with SMTP id af79cd13be357-7c7a76c22dcmr202020785a.44.1744256867149;
        Wed, 09 Apr 2025 20:47:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8942eecsm27221785a.17.2025.04.09.20.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:47:46 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:47:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
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
X-CRM114-CacheID: sfid-20250409_204748_400009_E177A75C 
X-CRM114-Status: GOOD (  35.58  )
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

I think this is not suitable for the most generic case, Especially
for distribution kernel. They prefer to set almost everything as
module, and load necessary module in initramfs, but the thing is as
you said, it is a tradeoff. So I will wait and see whether there
is any new voice for it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
