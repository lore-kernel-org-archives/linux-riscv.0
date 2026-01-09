Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78BAD277C1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMTIxDW0tdg5JitiU9R+l13rhM5eIMw/KtJWXbjBV+k=; b=noJd9G89LbrnUg
	4p7Vin0/BV9cD+oIVIQoFXw/msV8mdYBXhKMV9pEp/UUKlEtcqrTZC/xls8PNHKnxKMIZtYKZpa+R
	GjqfZ/Tx8Pt2PkD81bQl+HN881SzbFAMwGugZqj/fdxQSfZ1xD6YI7dhgbyxdxY/KEoSg5YKcK8sp
	bmQuw4NC6NMkMx/S0BDQsBUs0bHnG6vSTCgOmnScJiW6q6QeTrQfIqX3m1yzD8bYeyWIQY3jgMpjA
	DODmfcQrIi9uSHs3y8GqEXoelJ1IKmfS11BkupPVUdipqAzZ78lkIFAPlm4w7fm8WPD++eYIHFaVz
	trLTHJtqn/iGJx3Qww2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veL61-0000000353s-2EZJ;
	Fri, 09 Jan 2026 22:36:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veL5y-0000000353P-1Afv
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 22:36:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B20BD4E42036;
	Fri,  9 Jan 2026 22:36:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E8F9606C6;
	Fri,  9 Jan 2026 22:36:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EEBF103C88CA;
	Fri,  9 Jan 2026 23:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767998192; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wynFLlX6mYjoJcbTa5UiblB9kASfpYaIWVxoT0vaxKM=;
	b=meAzkYugKslZ0w5vH+Las8LuHo2L0EiP2Emip9GRfGdey1zHwFwpBC2e3mLCT+5H0uKHuE
	FQjRRMsJXMg3F4brKyo7rSFKhlHbtIKNIjsh/u45qm3jT/E6pP8MGESwxRtWKTRlOuTDUT
	1Rt06fXkg1EgXp22TD6ocBKoD20Dbk0bR4or8cz1CyAuEw7WyZsy+ENogaFyrfq2YirIK6
	xXcglKFQmF7EmDIosJZ7HnJGFr96kkadXkKctVQDd5uvwVHajVrXFMWmsa1HE8pCJNuDoy
	oNmI3OAVQJuRoqK6IIx+NOwm041E8S+gQWwDKxbxh690bNVekauCovDxa8yS+w==
Date: Fri, 9 Jan 2026 23:36:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <20260109223627b566d2b0@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_143638_805059_63FAD97B 
X-CRM114-Status: GOOD (  34.35  )
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

On 29/12/2025 19:46:59-0600, Alex Elder wrote:
> On 12/29/25 6:51 PM, Alexandre Belloni wrote:
> > On 29/12/2025 12:02:23-0600, Alex Elder wrote:
> > > On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> > > > On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> > > > > The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> > > > > caused it to be built-in automatically whenever the PMIC support was
> > > > > set to y.
> > > > > 
> > > > > This is not always desirable, as the RTC function is not required on
> > > > > all platforms using the SpacemiT P1 PMIC.
> > > > 
> > > > But then, can't people simply change the config? I don't feel like
> > > > this is an improvement.
> > > 
> > > It's not an improvement for people who want to use the SpacemiT
> > > P1 PMIC, but it's an improvement for all the other RISC-V builds
> > > using "defconfig" that would rather have that support be modular
> > > to avoid needlessly consuming resources.
> > 
> > But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
> > this doesn't have any impact on other RISC-V builds while it makes
> > people using the SpacemiT P1 PMIC jump through hoops to be able to use
> > the RTC as this is a very uncommon way to set default values.
> > 
> > My point is:
> >   - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
> >     have MFD_SPACEMIT_P1 set to m
> >   - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
> >     is built-in doesn't really hurt any SpacemiT P1 users but would be
> >     the expectation of those using the RTC.
> 
> The "hurt" isn't about P1 users, it's about everyone else.
> 
> >   - those wanting to optimise because they won't use the RTC, they can
> >     already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.
> 
> 
> The purpose is to make the driver a module (not built-in)
> when "defconfig" is used (without the need for any Kconfig
> fragments to unselect things).
> 
> 
> In arch/riscv/configs/defconfig, we have this:
>     CONFIG_ARCH_SPACEMIT=y
> 
> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
> (added by patch 2 in this series):
>     config MFD_SPACEMIT_P1
> 	default m if ARCH_SPACEMIT
> 
> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
> to benefit non-SpacemiT RISC-V platforms.
> 
> This patch is trying to do the same thing for the RTC,
> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
> by default.
> 
> I think you understand.

I'm sorry, I must be dumb but I don't understand. The current behaviour
is that when MFD_SPACEMIT_P1 is m, then the default value for
RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
(MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
the default of RTC_DRV_SPACEMIT_P1.

The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
correct one and the proper fix is then patch 2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
