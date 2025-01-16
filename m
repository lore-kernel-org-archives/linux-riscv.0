Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E35C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W46VBSEOhFiFRixDayOBNXxBBMbIC9kZZfq34QqqesI=; b=0N0ueXk4i10tlQ
	XmkjqkJPFx2iJgOKOwcDbhMsZkbxqHqXMPO9qtlLslWBWdYf3ucePspXs4l1SjQiXRjz5bYh25K7P
	+hsFXGsyVhINAf8/DcSuZ1XKMguKFi5Qp9eIaLad4TDU7nANIUaJgBj1tyaw53STfhZSY82UmNpuS
	0IsPEOTvsfz4aO/GltkUdWIN5tWAy6v6j248lDTzSHtD2c/haPC6vwY0r7++c9d2J4xjVJKwZLEgu
	dZJHCKCeYrAGbSmrYYllMAtgQ0vPrVJyGVdXyzRaXsRzRC7kzeXRYZJh3xOjlEG4Yk8GFfnDnBTRq
	Q90veoVXg7o/Z82sd+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZf2-0000000GedG-18P5;
	Thu, 16 Jan 2025 23:52:28 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZao-0000000Gd17-0hlY
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:48:07 +0000
Date: Thu, 16 Jan 2025 23:47:53 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
Message-ID: <20250116234753-GYA20457@gentoo>
References: <20250108142122-GYA3300457@gentoo>
 <6a8bb914-858e-479d-a7d9-09e0ff688160@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a8bb914-858e-479d-a7d9-09e0ff688160@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_154806_233797_B0411EC5 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd:

> On Wed, Jan 8, 2025, at 15:21, Yixun Lan wrote:
> > Hi Arnd,
> >
> > Here is SpacemiT's device tree changes for 6.14 cycle.
> > All patches have been merged in linux-next tree for testing.
> >
> >
> > ----------------------------------------------------------------
> > RISC-V SpacemiT DT changes for 6.14
> > - basic device tree support
> > - pinctrl dt node info
> > - update MAINTAINERS info
> >
> 
> Sorry for the delay in pulling this. I just had a look and found
> that your branch is based on -rc3 while the soc tree is currently
> using 6.13-rc2. I try hard to avoid unnecessary backmerges of
> upstream contents into my tree, so it would be nice if you could
> rebase it onto 6.13-rc1 or 6.13-rc2 and resend.
> 
sorry, I will keep this in mind, and will rebase to 6.13-rc2

> While looking through the contents, I also found a mistake
> in the contents:
> 
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -0,0 +1,459 @@
> ...
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart2;
> +               serial2 = &uart3;
> +               serial3 = &uart4;
> +               serial4 = &uart5;
> +               serial5 = &uart6;
> +               serial6 = &uart7;
> +               serial7 = &uart8;
> +               serial8 = &uart9;
> +       };
> 
> The aliases here should be in the k1-bananapi-f3.dts file,
> not in the k1.dtsi file, since the mapping between exposed
> UART devices and those available in the chip is board
> specific. You normally want to list only those devices
> that are marked status="okay" on that board.
> 
> I would suggest you fix this in a patch on top of your
> existing commits, but make it part of the pull request.
> 
Ok

>       Arnd

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
