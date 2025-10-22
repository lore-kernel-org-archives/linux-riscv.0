Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC0FCCD1BE
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 05:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/584l2JHnVixWhmus4wC83+374Y5tl3b8fwL5tqK+g=; b=mfkywcWHV1G9IO
	SQX1GlpP8BdYPpgQdwmAHAAwDFN8+XG6utkrgx2jnGMGIDqP8vV/e3K7q01K4M9Zr9e8lv1T01WFF
	BP5OcZrX5a4Lm/FH6QMTbyTv09e33OqzOWvKlg/3BNG1SU3B2OdCFJO7V/pukQB8NUz3AN97IfMCo
	aVo0Y+FRJGmj9CzOBanEqGzg1Qt64Ehwzcb2RtqtIdP/tGe9EKa3T1qkc2xIArCZODRzC3fFePfvq
	MeKKWcgE6vdyXh6ce4T2KhgJV864aIgaMIUNfDSflAxL2cgeXrGnEXgdWRBwb6nnGKxB2Av+T/Ldm
	j4ekago5gT9Z8VJ/x+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRX6-00000001XyE-0EZy;
	Wed, 22 Oct 2025 05:37:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRX2-00000001XxJ-2CS1
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 05:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=55BpwGusbE0Q6zvfMgJToUDCvwjVEr4QNsPjBG6PryY=; b=0Up3RLUxevg5HmyNmj6t+iLeeh
	h9sk+cN5AbTz9BrLD/uDPr/dJ6yMTn4STQXIxdDeme1rpDqCwsKSqwtjgDSfuN0WhEqSGTgs9sICn
	KnndmNcMxh5kNqok6inV4Dp64af+lZ0O3tIsTW5rttpQEwqMuDua7tJl35tz6k6CZo77Zy6IXv1/c
	VpNDDm7WFADtWKZrKUI87mBA0q1axdv/MErhBQ51WFshpSAiZj84uANBFqG64Yx8a3jFIKMkXkQKL
	EpyNNauoeWcqTN6ex1m3UZviSnSQ9FW1FYLbRthOB0iYpcMFYvwxelah14H1fjC/wJ5CUg/ohlUXQ
	PKS92Ryg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vBRWp-00H5T8-33;
	Wed, 22 Oct 2025 07:36:55 +0200
Date: Wed, 22 Oct 2025 07:36:55 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <aPhtd0j6iBpqiGUQ@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
References: <20251021201451.1013640-1-aurelien@aurel32.net>
 <20251021201451.1013640-2-aurelien@aurel32.net>
 <20251022004830-GYB1522542@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251022004830-GYB1522542@gentoo.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_223709_028045_002D2FED 
X-CRM114-Status: GOOD (  26.96  )
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

On 2025-10-22 08:48, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 22:11 Tue 21 Oct     , Aurelien Jarno wrote:
> > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> > chip, which is commonly paired with the SpacemiT K1 SoC.
> > 
> > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> > done directly through the regmap interface. Reboot or poweroff is
> > triggered by setting a specific bit in a control register, which is
> > automatically cleared by the hardware afterwards.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > v3:
> >  - Allow building as a module
> >  - Remove outdated Acked-by and Tested-by
> >  - Collect Reviewed-by
> > 
> >  drivers/power/reset/Kconfig              |  9 +++
> >  drivers/power/reset/Makefile             |  1 +
> >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> >  3 files changed, 98 insertions(+)
> >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> > 
> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > index 8248895ca9038..6577d73edbda4 100644
> > --- a/drivers/power/reset/Kconfig
> > +++ b/drivers/power/reset/Kconfig
> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> >  	help
> >  	  Reboot support for the KEYSTONE SoCs.
> >  
> > +config POWER_RESET_SPACEMIT_P1
> > +	tristate "SpacemiT P1 poweroff and reset driver"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> ..
> > +	select MFD_SPACEMIT_P1
> I'd suggest to use "depends on" instead of "select", the reason is that
> using "select" will sometimes ignore the dependency, considering
> the reset driver here is tightly coupled with P1, so I think it's 
> reasonable to switch to use "depends on", also refer below link
> 
> https://lxr.linux.no/#linux+v6.7.1/Documentation/kbuild/kconfig-language.rst#L144
> 
>         select should be used with care. select will force
>         a symbol to a value without visiting the dependencies.
>         By abusing select you are able to select a symbol FOO even
>         if FOO depends on BAR that is not set.
>         In general use select only for non-visible symbols
>         (no prompts anywhere) and for symbols with no dependencies.
>         That will limit the usefulness but on the other hand avoid
>         the illegal configurations all over.

Thanks for the pointer, I'll fix that in the next version. I used 
REGULATOR_SPACEMIT_P1 and RTC_DRV_SPACEMIT_P1 as examples, they'll also 
need to be fixed.

Note also that without the select, a default value has to be added to 
MFD_SPACEMIT_P1, otherwise this makes the default values on the 
regulator, rtc and reboot drivers useless.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
