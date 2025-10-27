Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B98CCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zh2TG5V13AMadA8SC6NkxKsrOSBd7ZkQc850/vTvCu8=; b=kJbxdliUHQ8WBi
	CZHdgDSO7EgoVjiNE7I7iTYSWY1E5mD7jvVFkN9SAfCM7l5ZvEqrMr/nzEL2bIqmyHkyPI21cH2b/
	Lx9+6Mp445+BEgoG9++vchXKStGgSOu42IkRTt6U4nb6aEja5JtoWeKrENDky7d/QCDVPdgm9TvM4
	QubUgeVC4GTJFPLnhU9SGI9odWvpTuKeulsKZzsFWSsKOFjHBAlMHctWCbn+xp7/ULvPAUoX0ePuy
	rN6Nk8X3DwMF6V3F/lMYu6A8iNr7AMyPXDJngVCBRWbuWTgis9jdWmvjcqiidD2Wo5zF6xhqFleV9
	Pzlgbf+tlYc0Veavse0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKWC-0000000DfIL-0yk5;
	Mon, 27 Oct 2025 10:32:04 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKWA-0000000DfHt-1eE1
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 10:32:03 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BEF7E341A11;
	Mon, 27 Oct 2025 10:31:58 +0000 (UTC)
Date: Mon, 27 Oct 2025 18:31:47 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Andreas Schwab <schwab@suse.de>, Yao Zi <ziyao@disroot.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <20251027103147-GYA1541054@gentoo.org>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie>
 <mvmh5vk67in.fsf@suse.de>
 <aP86TltQ2uqeK6FY@pie>
 <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_033202_482885_4A450CC7 
X-CRM114-Status: GOOD (  25.94  )
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

Hi 

On 03:17 Mon 27 Oct     , Emil Renner Berthing wrote:
> Quoting Yao Zi (2025-10-27 10:24:30)
> > On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> > > On Okt 27 2025, Yao Zi wrote:
> > > > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> > > >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > > >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > >> > index 8248895ca9038..61c16f3d5abc7 100644
> > > >> > --- a/drivers/power/reset/Kconfig
> > > >> > +++ b/drivers/power/reset/Kconfig
> > > >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > > >> >          help
> > > >> >            Reboot support for the KEYSTONE SoCs.
> > > >> >
> > > >> > +config POWER_RESET_SPACEMIT_P1
> > > >> > +        tristate "SpacemiT P1 poweroff and reset driver"
> > > >> > +        depends on ARCH_SPACEMIT || COMPILE_TEST
> > > >> > +        depends on MFD_SPACEMIT_P1
> > > >> > +        default m
> > > >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> > > >> I believe that reboot and shutdown are actually essential functionalities,
> > > >> so it might make more sense: default ARCH_SPACEMIT?
> > > >
> > > > I don't think there's anything preventing it to be built as module by
> > > > default: even though it's "essential", it's unnecessary during kernel
> > > > and userspace startup, thus I see no reason to build it in the image.
> > >
> > > Wouldn't it be needed in a reboot-on-panic situation?
> >
> > Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
> > could switch to another boot option if one fails to boot. And if it's
> > caused by a (very early) kernel panic, then reboot support does play a
> > part here.
> 
> But if systemd is running then you've at least got as far as the initramfs,
> and have the module available. So I don't see the problem.
> 
In rare case, if got kernel panic before load this module, then we
should really fix it instead.. Besides, there is no restriction to prevent
user to make this driver as built-in, right?

So I think this isn't really a big problem either
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
