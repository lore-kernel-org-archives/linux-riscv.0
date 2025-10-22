Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733EBCCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vVK5PPUS35/UHdx3iBaVvv2tCFBx7PjAq/cNCK6KEY=; b=YrbjUHnp/NA7R5
	/kRWnK/9WZryt+Wi8s9IBEQQNhgzrJFbpV8BNblSk2yql6GTWKvmYJvZTPJA/N73SfQWZAkA8K3BP
	ZEQ5eR0oWxEuw8KA/7/BB/PSvSaveKTIIy/iY/1+E0MVTT8k3MaFAcUXQIJE0j2dw3A+O+U/8N/pa
	clNqp2ToMjtilp8vVWVNbDkQKI5L/ywLUDIEk7xHhq3V7tVRsFuxzUStitTJDPRJ935z+QrfFLUZe
	1n80NnfTHAF2uR5hy2SiR2gyiSVX+iaTl1V2e8TbKRlj7TwQkhJtD/RRuBl5GWFWjwVzCRITQpB08
	ZBOCG/pqas87zeCm25gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBc1I-00000003fEV-2o85;
	Wed, 22 Oct 2025 16:49:04 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBc1D-00000003fCr-3ZnR
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 16:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=1nnTTQGLKpg2Y4zlHS/zCgkMJs42TpDEsJXY1zhm+kM=; b=NtR8svfECruwcJup56bQs5SOZR
	GSG9JZvkRgw08/1tQ7KRuGSchIL8sCR1vKcjUnjjdfOYgJn9mJmS8T2l8weWJxj1JrPcQaMr0dom9
	rW/zi599vslZV7xW0lPrZnyZ/KIGZsFnKzThIXlB7gtYUcvCRhsul4lqlNfIoFCFm7HDxBi6ed2tJ
	0B9kuB3OPw0jwENFYVqp5XMvqqhpC4nTIlWT9CNIKNFlhG0U+rndTeod+7MZSe6Ku/FE+CnXQgk29
	zlivSvW3jiyH5mV+2MYtrBvFGDPRIsWizpmAQwMQeae9ezHZvjrkAZ5kS39/KJL6uSMhlnzv9JtI3
	+yI5AVcg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vBc11-000AgZ-0O;
	Wed, 22 Oct 2025 18:48:47 +0200
Date: Wed, 22 Oct 2025 18:48:45 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <aPkK7aEHhxKScoCN@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
References: <20251021201451.1013640-1-aurelien@aurel32.net>
 <20251021201451.1013640-2-aurelien@aurel32.net>
 <20251022004830-GYB1522542@gentoo.org>
 <aPhtd0j6iBpqiGUQ@aurel32.net>
 <52468F28CD7B50FD+aPhurJD4HTXqIGDT@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52468F28CD7B50FD+aPhurJD4HTXqIGDT@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_094900_321674_BAABC6CF 
X-CRM114-Status: GOOD (  27.29  )
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

On 2025-10-22 13:42, Troy Mitchell wrote:
> > > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > > index 8248895ca9038..6577d73edbda4 100644
> > > > --- a/drivers/power/reset/Kconfig
> > > > +++ b/drivers/power/reset/Kconfig
> > > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > > >  	help
> > > >  	  Reboot support for the KEYSTONE SoCs.
> > > >  
> > > > +config POWER_RESET_SPACEMIT_P1
> > > > +	tristate "SpacemiT P1 poweroff and reset driver"
> > > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > ..
> > > > +	select MFD_SPACEMIT_P1
> > > I'd suggest to use "depends on" instead of "select", the reason is that
> > > using "select" will sometimes ignore the dependency, considering
> > > the reset driver here is tightly coupled with P1, so I think it's 
> > > reasonable to switch to use "depends on", also refer below link
> > > 
> > > https://lxr.linux.no/#linux+v6.7.1/Documentation/kbuild/kconfig-language.rst#L144
> > > 
> > >         select should be used with care. select will force
> > >         a symbol to a value without visiting the dependencies.
> > >         By abusing select you are able to select a symbol FOO even
> > >         if FOO depends on BAR that is not set.
> > >         In general use select only for non-visible symbols
> > >         (no prompts anywhere) and for symbols with no dependencies.
> > >         That will limit the usefulness but on the other hand avoid
> > >         the illegal configurations all over.
> > 
> > Thanks for the pointer, I'll fix that in the next version. I used 
> > REGULATOR_SPACEMIT_P1 and RTC_DRV_SPACEMIT_P1 as examples, they'll also 
> > need to be fixed.
> Yes, I have said here[1].
> Do you want to fix that? If you don't have time, I can do it.

For the reboot patch series, I'll do that in the v4, but I would 
appreciate if you can do it for the PMIC and RTC drivers. I guess it can 
be a patch series with the first patch being the one you already posted.

> > Note also that without the select, a default value has to be added to 
> > MFD_SPACEMIT_P1. 
> Yes, I will add it in my patch. Thanks.

Thanks.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
