Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C5BCCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 10:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJmL18jetsIZsSObR3QM+wiaBDOGIO1IL94M1h5aq4Y=; b=wEEfSgDJKREd/9
	ZDmy1Xyt771kZvPl9tPgTVBaEutquEudBc88My9LluRfrWzTx21aBzzObYCQePBFWPNahqjQJU2ss
	Z9v0dYBcE3JoOsysFszWvDLKlP6nXAou6qD+Xt4UonWe7IP8Igu1Rabq0pMHs0lWlQocTSVGrLZ/U
	arfqLGZ1kNnvSlX2wP8nbTm5Mkcy+LpP1RbBUm/0cG84qyayNQa9BwX9ucdwxNHHGoWuPUSYvDfHe
	/pyt6E9ZnlTlHs7gzeMIPdaLntZ83tv547Jb4JS51mLomUzpGqu7oDnh+iLZmBZgq1PPdCLu+f+f2
	mAdNhVNuRIweU3mk5tnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKIT-0000000Ddnf-3BBd;
	Mon, 27 Oct 2025 10:17:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKIR-0000000Ddmd-13Ze
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 10:17:53 +0000
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E183741968
	for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761560266;
	bh=9DhDySVvD7mdReEgfjhQfxSVU5DcbAQWOe9Vkh93eqY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pkKQHn3nqe04ZTRnWokHhu+DGeHofYpmTTQ+7uiaGOvTOvFFZW/uyGN3aYqtqy4NC
	 IhYFt/HShMGy+LH43TQ/J+rs6XzTn0z/Ld7TVz+wphNs01NabFT/HSK5azJpMJVNai
	 0PKuNJpWCj9PHydibPPT1lVIjWJdoqEuHLGatxAI9jMOvqQdagHd66QABeBXvZ3M7a
	 2OxYBSaDLHX/O8WzlsCfKtlKyQ8Y6o1hXITggJ6kbWVjpfWrIHOa3xg+GIOzNAUbgD
	 /8Mosg7qudpZiLEeii+Ms6WETZUPtVya4VwYWSLiwTsS7c1Jh5Wrq/R5vFP4ERS90C
	 InCp+53xv969t8n6z9mKDE/acnNhI160yjWnRxvgCtnvNVEJAHS4R8m3Y2eJPeqBZY
	 eZsX7UT2O4BeQk0dHJspZ1LAzGdLJyLXrrJy7bNxdpLuaIj4PKI4AzKrvnx3WJpPYn
	 JtYQBe36PJNuajL9wlda6l3IFGP9ZjXSTfF4NIjGdqL8FwoJWoJvh0Zw5j2wMM0rki
	 0JGzZd3g9V+gHcjv6TiuvKX5QpJO6d5cqjtJXeFbRI5SsxNk9eTugBDzrsq/kq31zb
	 iCFOTM9b6zTzDTPra2ZkFbV7unzpinT//cgR7eN+8X8Ll3hlX+/YjWQtLLlLon0nR4
	 CYtaxJzbaji+fYHeRjvwHyRQ=
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5db24da6d69so10647112137.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 03:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560264; x=1762165064;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DhDySVvD7mdReEgfjhQfxSVU5DcbAQWOe9Vkh93eqY=;
        b=H72Z7dkTEB9pId1guJNVg3QTaaNS1rfgdRID5PxsBh2dAr+WildgnbR2gVtGApQlPw
         epxzhC+dF6PaDs927FVnj4jN1FQGwg5NlqHafw5t7zBt+7Ae9Q6OUsefKmLDITeB2toM
         TQARD4LqGYtNSATh2GjQyjHRGK2ftDYPWX9OJ5eHUnQ4H65OpCg9r8MBVuTE4mXfpIdU
         +YxHtTvF9aazWKkF1jwB2MGULTiFl+91T5+WQVQKtwOIQfp8dC+vsbi+VeXzBUIUjil6
         tb1cYZ7fMZEADhmLpFsdUhUcGvsAbSsMwTLDP2x/ok876pme6UEwDar9yP0WfudymBJI
         xrxg==
X-Forwarded-Encrypted: i=1; AJvYcCXjRe1lePvWtYUZIOaWFuwse8awKCdKifSrMN/MPyNxpOS+++ZjNFTQmSuJe1yzVTp7RlmYnZeAOZ3H0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjYrhVxz1WLgPMpgPvGy7M9z66RfQ/WRQgAzzZvgVKOn8fL+wD
	RQrIorabY7Q1KFcz03+i5PcUSVK1jDJniPj6Kk2Sy53XXwnY/DcqRry6ugXvUfp3ty6C8mja39n
	gbjhZI77Q57f/S3CmcXKoGoACqZLFZAa3GEDHp39I2cHW14/YPIBNaL8F1BClXEzzAUQL+KTIt+
	Wq7Fs/sAzH00IWEjelmirhsoSXCtYJY+9ufendWKJNuBoQeXET5W6VnG4Qlry1
X-Gm-Gg: ASbGnct4H8MeoLeNFO1WggCPKMVThEm3IL/6ev5WpKdg2mPVeaVwzZ7k1FwjCxGrUwa
	LzKsv40Q3qiL6YDzpeC0zM6/MElv82lWZqdC2Z1Q0JjOAReowRZITpgi2wtuXz6lrH/xxpBxgsK
	6Zs4pX2kRUBKgr4u0YgRGrA1YtJ3d/ZUG3Q5DA3nzoGMWSzWllF4eM6w==
X-Received: by 2002:a05:6102:954:b0:5d5:f40d:28cc with SMTP id ada2fe7eead31-5d7dd6a1b92mr14555706137.34.1761560264189;
        Mon, 27 Oct 2025 03:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdPvzfUWy+KzTQx0NZKC+viVyDjrKZWPq/ag/aFPbstdqmRZATfbto1tMny89+DUKS+pVIxA5PrA3lQ+wZpqk=
X-Received: by 2002:a05:6102:954:b0:5d5:f40d:28cc with SMTP id
 ada2fe7eead31-5d7dd6a1b92mr14555692137.34.1761560263720; Mon, 27 Oct 2025
 03:17:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Oct 2025 03:17:43 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Oct 2025 03:17:43 -0700
MIME-Version: 1.0
In-Reply-To: <aP86TltQ2uqeK6FY@pie>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net> <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie> <mvmh5vk67in.fsf@suse.de> <aP86TltQ2uqeK6FY@pie>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 27 Oct 2025 03:17:43 -0700
X-Gm-Features: AWmQ_bkt48PMnhkCO0H9qLGejhLpBvvYCPQTMfZ0eF7vE7Bd7Gc1hHCSa_6NREU
Message-ID: <CAJM55Z9w0pnFmVjJKJNMs1iqOxoL=YpkBu0L7NuUZ_0ipMtQAQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
To: Andreas Schwab <schwab@suse.de>, Yao Zi <ziyao@disroot.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_031751_608935_305AC51A 
X-CRM114-Status: GOOD (  21.54  )
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

Quoting Yao Zi (2025-10-27 10:24:30)
> On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> > On Okt 27 2025, Yao Zi wrote:
> > > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> > >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > >> > index 8248895ca9038..61c16f3d5abc7 100644
> > >> > --- a/drivers/power/reset/Kconfig
> > >> > +++ b/drivers/power/reset/Kconfig
> > >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >> >          help
> > >> >            Reboot support for the KEYSTONE SoCs.
> > >> >
> > >> > +config POWER_RESET_SPACEMIT_P1
> > >> > +        tristate "SpacemiT P1 poweroff and reset driver"
> > >> > +        depends on ARCH_SPACEMIT || COMPILE_TEST
> > >> > +        depends on MFD_SPACEMIT_P1
> > >> > +        default m
> > >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> > >> I believe that reboot and shutdown are actually essential functionalities,
> > >> so it might make more sense: default ARCH_SPACEMIT?
> > >
> > > I don't think there's anything preventing it to be built as module by
> > > default: even though it's "essential", it's unnecessary during kernel
> > > and userspace startup, thus I see no reason to build it in the image.
> >
> > Wouldn't it be needed in a reboot-on-panic situation?
>
> Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
> could switch to another boot option if one fails to boot. And if it's
> caused by a (very early) kernel panic, then reboot support does play a
> part here.

But if systemd is running then you've at least got as far as the initramfs,
and have the module available. So I don't see the problem.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
