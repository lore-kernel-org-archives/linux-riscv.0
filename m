Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73427E94107
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 00:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lrcJUPoP1YDRh2oNJHtMm6LnGDuwfbJfJpw+dOy8N0=; b=gowC7mq6owM4pe
	16pgSq2v06Uv9uUFeBGlt5jS4eY3gfTNj/DwRTbL+hWOM+gS46n898jriQIK+rnqgyUb8P7xjsSCr
	2Yd4gZQ2W8/c94z/lKAPjNN/4Gw/UqLVaoTTviT1WB2cOUjYWxi4lG2XnlPEVEf5aIuzpzzqiTB8y
	qdY5vvlMB1tdB47kyikzPF2xxPDvMjV9LrFceEDd3odMI1v9mg3l8fzsnbw9gDHzIMjbTw7X/Ht+6
	+Q2tgchRo4k/k8Syv+fwVpStnO9AeJersBl+gEzwrkJfw8NZkt7nfZcltVuy5y01+ngJZFvzr4vCr
	UruKV2CIXrmB9AlMRnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNxu-00000004CPc-3Yf3;
	Tue, 30 Dec 2025 00:51:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNxr-00000004CNV-1nzW
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 00:51:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 690D24E41E64;
	Tue, 30 Dec 2025 00:51:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E73F6072C;
	Tue, 30 Dec 2025 00:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 484B4113B078F;
	Tue, 30 Dec 2025 01:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767055909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=v2UYhRBgvuL5HQq2pRiflGWNydMQVG1+kD2bMSHnlZM=;
	b=1rO6y0FfOg210W/91ZG+QWem4y/7X0XYctHDlEzdbyLi+hI0vJFgLFfzCIG9N9ZN0Mi/xc
	kpqSv4BS+I3glLCn3eg7gYetiJbQ92j4CD7nnz9jsHXZYyoN6zX/vGArpTcYU2K7eFdVD1
	z9tV9Kt421vLFsXkpzg2lZU6M7MJ7HQl+pzvn8hax7tHpI+2Z7E26h9fza253RE+2heiGR
	1abrW+0FdDJweNk46k4tywtdTI19Vz05hA30CSKr68z9cxjf8VVECoxBwn8SO2hB7isv2Q
	S79dAEx/DtqdOrOtvftZEVTXBjJz9uIG9r32/8DKi2xZHSJlfvx4z7LAd9KusA==
Date: Tue, 30 Dec 2025 01:51:42 +0100
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
Message-ID: <20251230005142d1bfc6f7@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_165155_882091_115496BC 
X-CRM114-Status: GOOD (  34.88  )
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

On 29/12/2025 12:02:23-0600, Alex Elder wrote:
> On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> > On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> > > The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> > > caused it to be built-in automatically whenever the PMIC support was
> > > set to y.
> > > 
> > > This is not always desirable, as the RTC function is not required on
> > > all platforms using the SpacemiT P1 PMIC.
> > 
> > But then, can't people simply change the config? I don't feel like
> > this is an improvement.
> 
> It's not an improvement for people who want to use the SpacemiT
> P1 PMIC, but it's an improvement for all the other RISC-V builds
> using "defconfig" that would rather have that support be modular
> to avoid needlessly consuming resources.

But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
this doesn't have any impact on other RISC-V builds while it makes
people using the SpacemiT P1 PMIC jump through hoops to be able to use
the RTC as this is a very uncommon way to set default values.

My point is:
 - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
   have MFD_SPACEMIT_P1 set to m
 - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
   is built-in doesn't really hurt any SpacemiT P1 users but would be
   the expectation of those using the RTC.
 - those wanting to optimise because they won't use the RTC, they can
   already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.

> 
> I haven't done any testing on this but it looks fine to me.
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> 
> I think it's a small change worth merging.  I don't think
> doing so does any harm.  Your call or course, Alexandre.
> 
> 					-Alex
> 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >   drivers/rtc/Kconfig | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
> > >   	tristate "SpacemiT P1 RTC"
> > >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >   	depends on MFD_SPACEMIT_P1
> > > -	default MFD_SPACEMIT_P1
> > > +	default m if MFD_SPACEMIT_P1
> > >   	help
> > >   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
> > >   	  This driver can also be built as a module, which will be called
> > > 
> > > -- 
> > > 2.52.0
> > > 
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
