Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82DCCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQJBZgG3EHTH5KnvpBtWBa+QWG7APcLSe1Z8eeaIv50=; b=kZWoxznLmab4Dv
	duq9f6KExuKr6AzBosRsdeyytPirVmw3Sap8W909nC3xVG5GVdLK7BlLk7hZbr/zH2WAMpoH4XPTj
	4oKZyyMKXB/YYL0Uh4GEvs/L0x2NIILLsm9nBvPGgy7f1oIf70YxIyxCUKPE+fAiCw/PHFSDuD8Sz
	jeYDAbQ02qVz+wqEoXhfBc8wzrfZdPCbfrKgj34ixoGrilh7pYRje+bdMce1HGx1rxW0/Dw7DFyc+
	MVfZGKwnofJLMWmOtO4wUBAQJWk29SccSmS+r6N0v5fbARntFLtKeRnCmfRjgOlphvXy+bwBw6z6J
	9T5ROE75Oq1E8Q2RsO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNN6-0000000E3jk-43MB;
	Mon, 27 Oct 2025 13:34:53 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNN3-0000000E3hk-0Z5f
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FCv+dqvI3maIG+5BMD6tWXqw54hjChMOqdKu2w6RxCQ=; b=doTz7BiHKAV68V9mLQoNkeTWn3
	tZG46n6g8lMx0xIYE9pVPyqG3b4TtAD4mu0u1d8tS8q+ts7yszvyHUvRUXzV6VSHh1tTxrcyYc4SX
	bqjWqvkQOExysQBvnsr5MhFJBjjpGoYNuZSsZ8ayNA0Gdo8OLmHT/7v19kTSvv6FsJP4wo37T0HUK
	1tpKyvr9XVcbwbvuHnLadItl/LE6w9lnwAZZMdYD/xa4c6eviingRVp9O69BdNYzdwkve9VqRtwOG
	yLoDE0iOvU8crVbzx1Rek6AJY0qEIcbgnvoXwc4021JdvocJMQ58kw3wCnfDP3Elq8zvXj9ko904S
	qviSGMRg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vDNMo-006zVe-1e;
	Mon, 27 Oct 2025 14:34:34 +0100
Date: Mon, 27 Oct 2025 14:34:33 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@gentoo.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Andreas Schwab <schwab@suse.de>, Yao Zi <ziyao@disroot.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <aP906fAZZfFXp-2D@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@gentoo.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Andreas Schwab <schwab@suse.de>, Yao Zi <ziyao@disroot.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie>
 <mvmh5vk67in.fsf@suse.de>
 <aP86TltQ2uqeK6FY@pie>
 <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
 <20251027103147-GYA1541054@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027103147-GYA1541054@gentoo.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063449_590319_112D1353 
X-CRM114-Status: GOOD (  29.68  )
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

On 2025-10-27 18:31, Yixun Lan wrote:
> Hi 
> 
> On 03:17 Mon 27 Oct     , Emil Renner Berthing wrote:
> > Quoting Yao Zi (2025-10-27 10:24:30)
> > > On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> > > > On Okt 27 2025, Yao Zi wrote:
> > > > > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> > > > >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > > > >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > > >> > index 8248895ca9038..61c16f3d5abc7 100644
> > > > >> > --- a/drivers/power/reset/Kconfig
> > > > >> > +++ b/drivers/power/reset/Kconfig
> > > > >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > > > >> >          help
> > > > >> >            Reboot support for the KEYSTONE SoCs.
> > > > >> >
> > > > >> > +config POWER_RESET_SPACEMIT_P1
> > > > >> > +        tristate "SpacemiT P1 poweroff and reset driver"
> > > > >> > +        depends on ARCH_SPACEMIT || COMPILE_TEST
> > > > >> > +        depends on MFD_SPACEMIT_P1
> > > > >> > +        default m
> > > > >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> > > > >> I believe that reboot and shutdown are actually essential functionalities,
> > > > >> so it might make more sense: default ARCH_SPACEMIT?
> > > > >
> > > > > I don't think there's anything preventing it to be built as module by
> > > > > default: even though it's "essential", it's unnecessary during kernel
> > > > > and userspace startup, thus I see no reason to build it in the image.
> > > >
> > > > Wouldn't it be needed in a reboot-on-panic situation?
> > >
> > > Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
> > > could switch to another boot option if one fails to boot. And if it's
> > > caused by a (very early) kernel panic, then reboot support does play a
> > > part here.
> > 
> > But if systemd is running then you've at least got as far as the initramfs,
> > and have the module available. So I don't see the problem.
> > 
> In rare case, if got kernel panic before load this module, then we
> should really fix it instead.. Besides, there is no restriction to prevent
> user to make this driver as built-in, right?
> 
> So I think this isn't really a big problem either

A possible compromise here might be to use "default MFD_SPACEMIT_P1". 
This would defer the decision to another level, but I think it makes 
sense to have all parts of the MFD either built-in or as modules.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
