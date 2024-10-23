Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBAAD2C542
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 00:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJ0NRJpVAudeBcFCmyNhE8CZQqtoYup4ALGvmc4mgsk=; b=VDAY0yUFsHWgLo
	mwwWN4XvXfkjEzZyPdapupSDevDfe7G1lxdvt6oeqlsZo0KfGmwdHT2l2eYgpR71GTnAbAHjUNvZh
	w8mp8+3qyj8Nz3FWm1XBHqIPA3x4FYOqDa44fezHK6u/zshAPUEDnyFFz5wpOE/9QeXmtNEJ1mynQ
	y9pTo9XaEj+NYs/F8UrtM1ylO+C/7kgPsm8Aj8uOg8TZriXSx6ObTzPBQjvyEvjWaM5jg/3xBHtGT
	pJGMkCho7F5UXgwCm0tOhpZPK9wVve/ZqzGwNpIlqUNHkjci339P3tmddmdH4zFvrX6LFiA2wOxQu
	6YKDt+PBNYkPUsr/tKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PTH-0000000CXtW-2lRi;
	Wed, 23 Oct 2024 00:43:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PRk-0000000CXeu-3AdN;
	Wed, 23 Oct 2024 00:41:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20bb39d97d1so58250655ad.2;
        Tue, 22 Oct 2024 17:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729644116; x=1730248916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8u3IDrYvAb9YyTBydXzxhlprUyGufXaL260iyoJVT84=;
        b=d10bHSFapLBNdWZIQh+Lf6bEZGMRbFysOVVEvxwl7Mfb3UDIgZ24NkdxcKuvPSq/q5
         ozrzeaoKqOxKxpabH5VFeV7t1AXrA94Ez/wUO6sE2w2tlvphKXIPXw64mWid7tLRJOaT
         ROutlkSkmZ6tpiweSOA5bDofxdwt0idXMnJPDXfJYHAcJzknwJbstNipZ48T7C9wgV26
         UkVZf2dhpN25GkYcI3eQZ2BsfDl7DGB/PrK2XEABjBZR+XiiNCg3p5JyDqAg6HIGp/gB
         hQ26KDIewlcyuxV0qPZ7rGLz0K7FZNPwpo9D8IFtYmw8WEoogxeCg2YGgUvW44q22XxB
         3Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729644116; x=1730248916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u3IDrYvAb9YyTBydXzxhlprUyGufXaL260iyoJVT84=;
        b=Ou/8GGREqCNQZApBDqgOxRq0OmOn2C7xEd9OSvuqAgCRLjXKiyIpV8VIGFH1YnXOFt
         B1K7ypvOUkx25IAuWCWRD63Xd1ZNQxB4tz6K9+vQrNB7p/BUdh69eWMzajwmA59c1GYY
         pqefh7+LAs37KiKKdHfV3PtatI+Q/GXFj4KY9jAisSj98+GnNsyYgtloKDaPkk+9bbZS
         V+ETsswj3v8A/negO+JfCz1u7woBz2OKwrkLfkvtsHugr4C00bPjrLLdMybzFAGPkStr
         viajCekHUkQoXssMojLmjdlijlkSUSFCVl/cmBtHpIoCJ16uZS+i6Cg9mmvHLa2tSlO0
         nTEg==
X-Forwarded-Encrypted: i=1; AJvYcCXRK1EoZLDi332ZLpAAcugCwIr4IhOB/ku5zfZDtgQ0sgZa3ISytrofFjcQOECEr0IU52os/mKRYLxCtBk=@lists.infradead.org, AJvYcCXzWDyODN0d573KpUaT+kL7AcIrRtWZ/3lWQhny45pnrAxB3aHGlyHR29rnHdMnXmOJm10yVSvkqMROdXxcAKv9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0FQWiPekM42owLIuB5Hh8XTABC+tPIvRhClSNFrk6i33eGa2X
	aXLWbMT3ejv163V7kGPXFrHIBRZV/zZT2Wsx+ntHJpQ73QA9DtQcuMXSUA==
X-Google-Smtp-Source: AGHT+IFbhgz4UwAzkmEZqrLZ7CxJnIMNJeELmjeckUQEiAROOsXtNCu++sLO4TJ9d5G/mSS8vtF+Rg==
X-Received: by 2002:a17:903:1c6:b0:20e:95c9:4ed5 with SMTP id d9443c01a7336-20fa9de0cc3mr13205545ad.7.1729644115571;
        Tue, 22 Oct 2024 17:41:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c4fsm47993125ad.307.2024.10.22.17.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 17:41:55 -0700 (PDT)
Date: Wed, 23 Oct 2024 08:41:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_174156_824234_9BBB86F6 
X-CRM114-Status: GOOD (  27.61  )
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

On Tue, Oct 22, 2024 at 03:51:08PM +0200, Andrew Lunn wrote:
> On Tue, Oct 22, 2024 at 06:21:49PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > > > It is related to the RGMII delay. On sg2044, when the phy 
> > > > sets rx-delay, the interal mac is not set the same delay, 
> > > > so this is needed to be set.
> > > 
> > > This is the wrong way to do it. Please look at how phy-mode should be
> > > used, the four different "rgmii" values. Nearly everybody gets this
> > > wrong, so there are plenty of emails from me in the netdev list about
> > > how it should be done.
> > > 
> > 
> > The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
> > set (a default tx delay is set by the phy driver). In the scenario 
> > the extra bit is used to fix 2ns difference between the sampling clock
> > and data. It is more like an extra setting and the kernel can not handle
> > it by only setting the phy-mode.
> 
> This sounds wrong.
> 
> So in DT you have rgmii-id? You say the PHY is doing TX delay. So you
> pass PHY_INTERFACE_MODE_RGMII_TXID to the PHY? It is not clear from
> this patch, i don't see any code mentioning
> PHY_INTERFACE_MODE_RGMII_TXID. Could you point me at that code.
> 
> 	Andrew

The phy on the board I have is YT8531, The config code is here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/motorcomm.c#n868

As the syscon only has a config on rx delay. I have
already fix the code and only set the bit when the
mac is rgmii-rxid/id.

Regards,
Inochi.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
