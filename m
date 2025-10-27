Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B818CCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 06:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9GvhaA45CeOUrouAWDo9Zr8m/UVM7BjGI8uKv+Xtq0=; b=NFanhy1qNuQLHL
	ciwzwkGZy7uzkOf/kwISjWD/LhIYr965fQ4C428PHxr86FccqT78kvuOVGsHbbPevDXmdne27uyFT
	CUYLAmipUcD0UG4p8V48MhSas2TXJGdP5v5pByVGi/z1tyFm1mKk95B91cAEQJBPdClD6mhd9R3nI
	F8bIfzJt1StpDT69CQAZoIc6X5WALcxXQ9N4XOzwXgGORWBYi68QAVmgCtR3OtWK6y0iI8ihAYkmn
	0xyNNkNkx+71v3YFLqnc0Eu7U0XE5ofyqiNHCNRXNEr90fq1VqdLgB+QZjjDHn6ZLoDkOPhFEmV1P
	V40bozy0+eRVwCDZWBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGOn-0000000DAeK-3fAR;
	Mon, 27 Oct 2025 06:08:09 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGOk-0000000DAbW-3AL2
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 06:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761545210;
	bh=l3+MYw1gSrGd76gzuuq7j2y+q9z2WnobGN51l903Alg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=QuQ5dThheXeI0UvbraPlrrU59bBZ3xKZvcypL54LpAG0JItBTB8P1QhUNZqhKt+gi
	 uy2hkidR0S7GMXhvf3aJ/er030A4X1d/sU+L4Hzgkg98EWLaoLbwR0+70b4w5rY2px
	 X2clxeg2+WTI0JWmntSGBcIUbPp0uIMRd7EFR4Wc=
X-QQ-mid: zesmtpsz8t1761545207tc173d1ef
X-QQ-Originating-IP: kaW+7dLJIqioSezBmW/uoXxbeOrYpMqkQA962FFA75o=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 14:06:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17316863097272151893
EX-QQ-RecipientCnt: 12
Date: Mon, 27 Oct 2025 14:06:46 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <751AB506001CBF5F+aP8L9hBdTaVEko73@kernel.org>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8KqZ1hlqfQVPii@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aP8KqZ1hlqfQVPii@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MKzYG8XJzx27j0WWC65akscbY+LZtJglnWV8yCkpERTiSlc6AP1TKEu/
	k3+9fQJd0y5KIcL9UmcRn+IJhBnLkplgVGxaU/Z72cT3+r/j3/1HzKBnVX+L6aJZPBTHKGM
	4h+BzlINtHDE5zVMv0avvivCetlqpnNwFLW7LlYmcbHUOJTfi+dGoghFa2to0P39H/Z4XiZ
	fZw2jULovbnvakmh3wz+g8WOD+I4nJ0Nvnsrjyvyoc36IOG/rYep6y1lbwLerumyDGmV1B/
	xbGjAF/Ljs6IaeupMUeF1nNHatiKfptuuP/xyzOFOYZ747l522H2Vifl+bqlcbEXOnraPw4
	3MIoJS073nt2M1nLza8usjqPgdZgTH3VNm4dKDNv8liyFM5qAou5U5DcAtosrieHm1fwPMd
	xnme1Fx/bSfWrAVeG0Vrrf+aPtMNUOtaLnRkzimRE+16q1Fu/8YNT+1WZDcnUAJyXlEPK8Q
	31Hzut6Gu85ajobu9M8T1sYNJ7rtj6OBtH3co1VQUjhbYnPIGqX0rsy8h1JQZZvMeSYavK7
	kcjdLBVpz4HOk2yDsTGCfvJ/LxSI55qig8+am2SXCtUSeqmBjvF0/otk4XPgKSTFzfvDNPJ
	v8q2hsbd8CwOeZNSz5KoBzDicEMXkWcx2NZGrXQn1bBFPbBrEW++6KmnfwVHwh5A5C6LsRl
	mBfjOifrgDhPxPHuN74KCUZmCWKOlqibnOKqG11cs6yEyMS9ReVfP1hHRNh23frwx39Pbyk
	hZUzNrVzAtcO9n0Mh7Nk5Q0od/E0nkGBuFe76oTOG9pUVjgiTBtERB9VNNgH+WB7hf0mXb1
	rQCTw2lTCbYgWplpGDZaXQVWiMZoUpgtZyw3BYwfHonRc7r7NzIIKlwvPQU0mLwpCruIxuv
	Wx46tgqDnBt3t40FLzkwAhZA0E6ZgvYP8du15co1ony85fw28kca1tgMVvrfFIPAK1Ystt4
	7StzsZ+Kh38Cg6Vxa2YxnvDa/h6WF1x9XwgvupS/14OlVRNJaXE8SdXCld/C+mwG4P6HjkU
	i8m3jj1D2YjKyZRynDgbnUuo2bVvNgdIxeR6mYZog4aLa+aow+PoqqN5A6X7ZvaWrRDsJhp
	c2ik/5JTEXQnyUNnumRTo8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_230807_649383_B98ED3B2 
X-CRM114-Status: GOOD (  25.88  )
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

On Mon, Oct 27, 2025 at 07:01:13AM +0100, Aurelien Jarno wrote:
> On 2025-10-27 11:20, Troy Mitchell wrote:
> > On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> > > chip, which is commonly paired with the SpacemiT K1 SoC.
> > > 
> > > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> > > done directly through the regmap interface. Reboot or poweroff is
> > > triggered by setting a specific bit in a control register, which is
> > > automatically cleared by the hardware afterwards.
> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > > v2:
> > >  - Replace the "select" by a "depends on"
> > >  - Remove outdated Reviewed-by
> > > 
> > >  drivers/power/reset/Kconfig              |  9 +++
> > >  drivers/power/reset/Makefile             |  1 +
> > >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> > >  3 files changed, 98 insertions(+)
> > >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> > > 
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index 8248895ca9038..61c16f3d5abc7 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >  	help
> > >  	  Reboot support for the KEYSTONE SoCs.
> > >  
> > > +config POWER_RESET_SPACEMIT_P1
> > > +	tristate "SpacemiT P1 poweroff and reset driver"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	depends on MFD_SPACEMIT_P1
> > > +	default m
> > default m if ARCH_SPACEMIT?
> 
> As explained here, this is equivalent:
> https://lore.kernel.org/spacemit/CAJM55Z_BzfRo5aKf2VrneTymSizwDQq6OfMK_LNgyoGjp43K8Q@mail.gmail.com/
> 
> But I can make a v5 to change that, if it's the preferred form on the 
> SpacemiT side.
I missed that conversation. Just keep it!
> 
> > Or default ARCH_SPACEMIT?
> > I believe that reboot and shutdown are actually essential functionalities,
> > so it might make more sense: default ARCH_SPACEMIT?
> 
> That was already changed in v3, following a request on v2:
> https://lore.kernel.org/spacemit/CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com/
Thanks for your link.

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
