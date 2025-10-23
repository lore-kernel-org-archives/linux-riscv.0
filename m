Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC17CCD1AB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 01:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEvBm63me6ZtqD2eX5QoHAmMsGtt3T4vBnT65Lazl74=; b=FzCFJvyVj153+Q
	47yFHzbgzc8cvoIl8GArKPFdAYqsJDUsnAB6p/Ell3Yca1Vu81oMHE6xaKvBVPssSmUzByW+ZOWnj
	MXBbWysgSX6XYRkPuVbGmpzu1BhIfgBkjrSCXSwKK3nufjaGRObk7uVHTqsQlVqiNS0tIVuCkhb27
	xtY4bKK8WK0W+Asr6o+d7wE/ZEwBFJZB3UKS+eg5vC+HsLthagljQhHL95i1XGLjHcsrBLQJhq0Ra
	lNuC4dMjUwj8v22X8p4N+3hKqqI7kCvXWwYhR2MK5PsDoc6r0U1QGTmz5CswpEFJD84jgLZKcg9V9
	mbLct+yikmS+O9SRKPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBjnG-00000004ilm-3j9Q;
	Thu, 23 Oct 2025 01:07:06 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBjnC-00000004ihC-2HkS
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 01:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761181563;
	bh=XsRWgb+mLGrtoREAsHT1s5qba4+X2pYPCy+f+7l7JVg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KrCle4za38OHdE0XaUM+0lv+bzM6zFKskgyX/sW8nZ8va+Fz2puY9bFR4qYw/0BzP
	 ec66T0WtfL7zQKN9nOGf/Ow3PvN5evs7VliQGLZpPvy51cPkbKJli1Zx6T9PcK9gxK
	 tVUvFWk8+XhpA/zwWa5cYcOeLvS3wYDxaF+TTQNM=
X-QQ-mid: esmtpgz14t1761181560t1645cf02
X-QQ-Originating-IP: gkSINpiiygpxneEIVwBY685Q0g+hGSeOD1Z1ltMwcms=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 09:05:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5511248865145279605
EX-QQ-RecipientCnt: 12
Date: Thu, 23 Oct 2025 09:05:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <4A64F9771A29AB00+aPl_duwqfb45u4NW@kernel.org>
References: <20251021201451.1013640-1-aurelien@aurel32.net>
 <20251021201451.1013640-2-aurelien@aurel32.net>
 <20251022004830-GYB1522542@gentoo.org>
 <aPhtd0j6iBpqiGUQ@aurel32.net>
 <52468F28CD7B50FD+aPhurJD4HTXqIGDT@kernel.org>
 <aPkK7aEHhxKScoCN@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPkK7aEHhxKScoCN@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ofb4FPpL3MXsJM99P65gXmjLbYsiTCXyawC0aoBwdBlosOQt9w+p6Jgc
	E0n1sU02RSyVoLZ7DSO3EQOarHIBJ3TWh6F7GWDMRGrYAnkaejCuIe4W7XTQara7ZYAENvw
	3XGnHr7ith3ApvPe8wpfvyFiwFYaBGXQQkE1OO3MUbdHzS5oak6c9Y5pBHkRVtWjpGkxelR
	wQvivGIbuVBS16YNmhSzVyKv3bu54FQ6RuCiZWiewgKIoujbUUXQEfXDL7vq+WLeH5/Mi1z
	m3VKocjKuX0CeqOcKglSrDFYCdkHTDVLDNQ6aRUXQBjF+4jj/sEo+4ztSVyVSwqzGYWkbLB
	GXfq9Wip7E6BzBzyLX1cLaJ6jDifG7zxzUzXpCURbVFpKMpY8dUiX8FMKhn+slV9xkXSNQN
	igPW9wTQGgva7tmYA2GkEZXz9jeVFFILoYkod6epgDbiWFBXbe5mzZqjPkPjc439V4F1Fh0
	NIg6zWXbMFZaTyNO1T+fwRHWfoGUUm+E6uiD1NorCULJ2VqHmOs94p1SR1+JZaqFnFNYkUf
	XrL/6NcW9Wog8I19QTnZhPzJG95oQA2xKTzFFH9wIulFGlqtsDoRA4ul0hcizf/dTxtU7rR
	hQIp98UTSX3pgHmR7o/wJR593gsy8k/L+yQU+VB6OU4RRMZvop1WaUYO8ibC7J0V/CTmYfP
	s+A98ZSF5nVtGL83K8g53Aj238BuA0r+XcXlaw9VC2Jj8uya/81PP8SVUVKNIsUTNyHMYd2
	lEq+ZHMJ/WqbhPB/u3oSEgIjIl5alBLFJBvN4Yw1QXH3rEF4bqdZoI6m02W2e57OnOXvfQu
	UTmlh6521tn+8YOee1b3RbM/iGJhIe1r/E1hkD3BE95a7jCBOhbLxm5wjkzbspkaiqZm0Vh
	8N0EZYHaFZ1frSORZkW7Q1cKp/G7xVZ1WbOBJcCg/ELWG8Jiujvnjb8VhxUsDY56B4wVeGC
	Fn82krpkKfaEedjCL000sgo4G4wD6UvdAgW5PhDJy4n+opmKk0kDw/bqsBbpRL3QGdUCBkN
	p5oD4XAXttbokom0GEsaiyBN0hF3+/Gu50tbnG9QSYlJRU7r+C3FYoImJgWD3q3MY9MGO1l
	cVZJ+jVvNTc8rRCocUvABA=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_180703_413182_33B5622B 
X-CRM114-Status: GOOD (  30.51  )
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

On Wed, Oct 22, 2025 at 06:48:45PM +0200, Aurelien Jarno wrote:
> On 2025-10-22 13:42, Troy Mitchell wrote:
> > > > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > > > index 8248895ca9038..6577d73edbda4 100644
> > > > > --- a/drivers/power/reset/Kconfig
> > > > > +++ b/drivers/power/reset/Kconfig
> > > > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > > > >  	help
> > > > >  	  Reboot support for the KEYSTONE SoCs.
> > > > >  
> > > > > +config POWER_RESET_SPACEMIT_P1
> > > > > +	tristate "SpacemiT P1 poweroff and reset driver"
> > > > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > > ..
> > > > > +	select MFD_SPACEMIT_P1
> > > > I'd suggest to use "depends on" instead of "select", the reason is that
> > > > using "select" will sometimes ignore the dependency, considering
> > > > the reset driver here is tightly coupled with P1, so I think it's 
> > > > reasonable to switch to use "depends on", also refer below link
> > > > 
> > > > https://lxr.linux.no/#linux+v6.7.1/Documentation/kbuild/kconfig-language.rst#L144
> > > > 
> > > >         select should be used with care. select will force
> > > >         a symbol to a value without visiting the dependencies.
> > > >         By abusing select you are able to select a symbol FOO even
> > > >         if FOO depends on BAR that is not set.
> > > >         In general use select only for non-visible symbols
> > > >         (no prompts anywhere) and for symbols with no dependencies.
> > > >         That will limit the usefulness but on the other hand avoid
> > > >         the illegal configurations all over.
> > > 
> > > Thanks for the pointer, I'll fix that in the next version. I used 
> > > REGULATOR_SPACEMIT_P1 and RTC_DRV_SPACEMIT_P1 as examples, they'll also 
> > > need to be fixed.
> > Yes, I have said here[1].
> > Do you want to fix that? If you don't have time, I can do it.
> 
> For the reboot patch series, I'll do that in the v4, 
makes sense.

> but I would 
> appreciate if you can do it for the PMIC and RTC drivers. I guess it can 
> be a patch series with the first patch being the one you already posted.
Thanks for your suggestion! I will.

                    - Troy
> 
> > > Note also that without the select, a default value has to be added to 
> > > MFD_SPACEMIT_P1. 
> > Yes, I will add it in my patch. Thanks.
> 
> Thanks.
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
