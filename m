Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11483C02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tY0UGzsWQsbOiuGdLFIEyjA5EUNdcbhqF1AllXD0o+c=; b=zG8Qt3qzGBxIMe
	2UKPN3wN099iBAHwUpfa3vBjfsFN5zGFATKWavA9qKkrSe/MBgUUi/JL4ayit90xu0kJkIlukmV02
	G3rZvu78Trdk+doQSKirzonHArOeW+luPRr9sCcUdjXguFXap9RFMt+VEYXxxliJg2kgYyOF2SoJK
	z37xMzc6tU8W+YO4LAfVtHjWZeREqo3AgkBKXjUL8B1otDSHo8VJm6eWX+tkgfCA/tswW/i3iudmm
	Jsgfw8vt4cpVpWzfKM2ZC5z6f3IajIAevgvRocBHmBb+4bS6y+orotXv43RfLbizFeEArb+Gd9f4J
	nuVZ+NRnCAuL4nfZ4k2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti79M-00000006TqJ-3s6K;
	Wed, 12 Feb 2025 07:27:13 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti78B-00000006Tej-1ENG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 07:26:00 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EFDCC3430A6;
	Wed, 12 Feb 2025 07:25:55 +0000 (UTC)
Date: Wed, 12 Feb 2025 07:25:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250212072544-GYA17416@gentoo>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
 <20250207-promenade-hazily-d7900cbc127e@spud>
 <20250207223705-GYA7567@gentoo>
 <20250211-nature-kilt-9882e53e5a3f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211-nature-kilt-9882e53e5a3f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_232559_376638_D804DA1B 
X-CRM114-Status: GOOD (  15.52  )
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

On 16:03 Tue 11 Feb     , Conor Dooley wrote:
> On Fri, Feb 07, 2025 at 10:37:05PM +0000, Yixun Lan wrote:
> > On 16:49 Fri 07 Feb     , Conor Dooley wrote:
> > > On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> > > > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> > > > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> > > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> > > >  	tristate "SpacemiT K1 SoC Pinctrl driver"
> > > >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > >  	depends on OF
> > > > +	default ARCH_SPACEMIT
> > > 
> > > This is effectively just "default y", since ARCH_SPACEMIT is a
> > > dependency.
> > > 
> > right, this is the plan, it make sense to bundle this config to ARCH_SPACEMIT
> 
> I don't think I was clear, I was trying to say that you should do
> s/ARCH_SPACEMIT/y/ on this line.

make sense, since we already have "depends on ARCH_SPACEMIT" here,
it's kind of redundant to say ARCH_SPACEMIT again, will fix in v2

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
