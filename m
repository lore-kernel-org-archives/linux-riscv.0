Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56775CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJ8NC+v2+oPXmG8hdxE7t9Jdq4Mz/5btQVfc2ZE9up0=; b=R6WjGDw+DkLVIf
	4NvSBM46TaT/UboyamIMmUjYqmlmeROgQyPb4KSINZPfGzJO0lvj+ohZYthl2gWFDxq9ZX2D8UjPz
	HZOV0x7UkXqccEMRVgg+tnk6xfRI6L8Kod+wziJsSmziepebJ7GRM60qghwSqd6kk8B86rcz2q8D0
	sIsZDUAfq6KVWET9m/vuwhEmCbLiShtA21MSYbb/OGpgDXMFw/0jm0ElcUumhzS2YKibRsngJ97gW
	bFlF7oSixHI+iGiWswmvp4EEwmLis20JQMy7kphUcVSrWrFlB65RpT0cFbOkQs1IlKqauxgvU/dvs
	vDNHASdVhD5Ho+rpHFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNk9-0000000E6BZ-3ABt;
	Mon, 27 Oct 2025 13:58:41 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNk7-0000000E69S-1FTC
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761573428;
	bh=GOXJjc2R6gLa1S92DIipgJyO9ajzHcGqwyH0ghoII7E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=bnajnwc7ehSEX5rwdK75D0zKcqZA3hnb8P94a2eoSLLV+hzroPJ2lSVvvGkhtEqol
	 PTovOKMyVfYVoISJEY/GUJ+45cTHzSehy3ctdarWZNnkqpv3IZdDNcs/GXUB7Z01mx
	 B1jQ0UPzpuYlHSpM5kH8inyRr0NfhJone63KcmiA=
X-QQ-mid: zesmtpip2t1761573420te99bac9d
X-QQ-Originating-IP: x1+tmePdSRc0FAZX9Ga7DFEbiQ13Tyh9xloMBXd4/2o=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 21:56:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14346178185621163239
EX-QQ-RecipientCnt: 15
Date: Mon, 27 Oct 2025 21:56:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
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
Message-ID: <DAA41086C5EBCCFD+aP96KqT06FswX1uN@troy-wujie14pro-arch>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie>
 <mvmh5vk67in.fsf@suse.de>
 <aP86TltQ2uqeK6FY@pie>
 <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
 <20251027103147-GYA1541054@gentoo.org>
 <aP906fAZZfFXp-2D@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP906fAZZfFXp-2D@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M7eFa8nJlnSLqSQc5BgdAu5X0ClM8oPFqE4IgMb+Nk4Am1tlXtV8Ff/0
	VtWO0G61nYq1pZmfH44Ogcnf3w+UOiZMdOqOdvcrxxCmk+qnIrC8q7Lh56TtYH5iNfQBW7K
	EcUhExixahqX42I8u7Ao86Ba2u6P9GlIDPVZHU+gx0TY5PR76oA/zsQhr0ISV9Zp8KU3hIE
	TUWglEXKvUJX33XzeTkALl/Xtk1nH4R7w8umNTvzSf1HsKPPqB12kb2tTpgO6JQWzTlEOLb
	GdyNglkZeNiv1Oz+C/tapzLusdVJRvvEgWRlMAE1sV4/5MH6Gp1VLU0f9lPAMtCPEwW+zMe
	qgbZV0CmaW1YWQeWY6okj5kRIbHQrlDOwEXIJPqQIHOQqfrG4q3NMYt70EDNVuRG431Cse4
	MNk8W7ErSj4IHqeTBnOyiIdKRnROZG8tnKRPhsqXgWDGKxpER0LkAZT8EpF9f22SZ1V3hJT
	ydLxnn2SIYJ6ULSyF0cyzxYrttu6NCiEfQFinHkGEVvOeNPSHcwRq7u2D46ML5XG5vn7RRq
	hdXV6fZWIVWRVCpfJ8BaRaW0g6QnuuB2OAbzrOMSCCZyZmc40G307eTdPKSn9a+laP9LHje
	cpx34h81gvbEMeViXKJie/AM3mj64L02X74MQkfZQuapF5qPCXaGsOvjnn++gyca5X9w1JG
	2xbCd2JUF47oUhdRTasestahS+qb2UTa5nJsu8HvvLGU/zchyZxudjvYlJa2vAtrevrBzHX
	DbwHEWNp9XAXRzogm9WSWh2AJu3kE0d3Y6dFDIEmrSHrmJZD1la+c439qAUYscpXA4Ys9m6
	uDu+ree9Lo9oOjX4rbHXqkBaXoyXCtzm8X7zLY7pqoCkiE1n/yqI/72f2Bf6pBTa2TDuTU4
	kcXu4ykIXrjAHQOUb+PD6QedNjD51HiEaxL2zp38au7c0QD7gNdLEJv9GHtCb0Pk20Js+KT
	JHWM9CB1RFkINqxpiYLAjWYiJfpVGhNkMlnXHORec5QL2Uf8T1vulTC94L/y5fU9QySo1yR
	AzQgoixarGLluyUpgk+Y8jLxAgc0j9AAKsFCvCIIYyAeC90dNDB59vfZxA3tZobFgHlAHH+
	gJy2JkhTLwgAfCtB6/HkoJjo1k9yyaq6nicmZ6n7o2GCR8zoWhLVqFWJ3SHNlSApvVzI/yx
	TqEKGh5mOe70qpgfVJYLo7DSKQwiDqZFbDBb
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_065839_631325_5059D485 
X-CRM114-Status: GOOD (  31.97  )
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

On Mon, Oct 27, 2025 at 02:34:33PM +0100, Aurelien Jarno wrote:
> On 2025-10-27 18:31, Yixun Lan wrote:
> > Hi 
> > 
> > On 03:17 Mon 27 Oct     , Emil Renner Berthing wrote:
> > > Quoting Yao Zi (2025-10-27 10:24:30)
> > > > On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> > > > > On Okt 27 2025, Yao Zi wrote:
> > > > > > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> > > > > >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > > > > >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > > > >> > index 8248895ca9038..61c16f3d5abc7 100644
> > > > > >> > --- a/drivers/power/reset/Kconfig
> > > > > >> > +++ b/drivers/power/reset/Kconfig
> > > > > >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > > > > >> >          help
> > > > > >> >            Reboot support for the KEYSTONE SoCs.
> > > > > >> >
> > > > > >> > +config POWER_RESET_SPACEMIT_P1
> > > > > >> > +        tristate "SpacemiT P1 poweroff and reset driver"
> > > > > >> > +        depends on ARCH_SPACEMIT || COMPILE_TEST
> > > > > >> > +        depends on MFD_SPACEMIT_P1
> > > > > >> > +        default m
> > > > > >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> > > > > >> I believe that reboot and shutdown are actually essential functionalities,
> > > > > >> so it might make more sense: default ARCH_SPACEMIT?
> > > > > >
> > > > > > I don't think there's anything preventing it to be built as module by
> > > > > > default: even though it's "essential", it's unnecessary during kernel
> > > > > > and userspace startup, thus I see no reason to build it in the image.
> > > > >
> > > > > Wouldn't it be needed in a reboot-on-panic situation?
> > > >
> > > > Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
> > > > could switch to another boot option if one fails to boot. And if it's
> > > > caused by a (very early) kernel panic, then reboot support does play a
> > > > part here.
> > > 
> > > But if systemd is running then you've at least got as far as the initramfs,
> > > and have the module available. So I don't see the problem.
> > > 
> > In rare case, if got kernel panic before load this module, then we
> > should really fix it instead.. Besides, there is no restriction to prevent
> > user to make this driver as built-in, right?
> > 
> > So I think this isn't really a big problem either
> 
> A possible compromise here might be to use "default MFD_SPACEMIT_P1". 
> This would defer the decision to another level, but I think it makes 
> sense to have all parts of the MFD either built-in or as modules.
I think both the regulator and shutdown/reboot drivers should be
`default MFD_SPACEMIT_P1`.

Otherwise, enabling MFD_SPACEMIT_P1 alone doesn't make much sense,
right?

                              - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
