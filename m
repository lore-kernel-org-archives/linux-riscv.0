Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0503C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNd3UabhIGMd3pD0LmaZup8kyKJlBPBR862PdykCqoM=; b=gaAkN3j7lgplTe
	+RoS4EpzGNf+q+AzoZGr0k+hbZgpxZkP/qGOVVmLZn5i5FMw4BVcVNmK+o09ISeZNUzJ0N3dfSN//
	mbvErIG8LKPRvumK7jJ9ZCyrac4p+3YX13tHNF82p+lGBTwYWos6DA/np4tbzp+7DuEAu2fVEQaOl
	4usxpBlf/qPKB+VQx78EQ1Xca0OKWgZ+MLN3wH7NDTCHw5cZiZoFZDcJj92GselrOr/o44VvVPYA1
	xjSXBw0O1ufXs20RohCaUF1pSMkrU32K3iaItTiPavcmlxjMwKsHpQI1sTolxKZIAOs6sSgr5Ixj+
	tPlcX5Sy+ETIDQXWk9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG7p-0000000GVHx-1HZ5;
	Fri, 24 Jul 2026 13:39:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG7m-0000000GVDT-3NLg
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 13:39:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5A504E40F26;
	Fri, 24 Jul 2026 13:39:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B98860395;
	Fri, 24 Jul 2026 13:39:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F04611C12509;
	Fri, 24 Jul 2026 15:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784900372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=eyUYSsg2coHiCNrbgbB0nPMXe3+a5ilhxAZu+w9jOoY=;
	b=YtyPMYTPCn0uNgIsxL52ARPZLPxyXw8mN05kGNuwpMf730269zH2/gVsPY0b6Z09rM3FCo
	jmEUpusknh4Mgsuaz07HKAGuh5CbbbAZQrZoiE1edj9LVeQ+cu72GIN9pDuNTecEXJNWmA
	9zx/r3djRQ5p/1P/yYjhVjO6lC1mWfwYNrpeiFzkFfqy62aeRoEbQVAw9AeUj8SQ9DdVzY
	ptkMP7+vnzNYqvUG5ZTA65erfpDK0/FhGgA9Bj1JVrjd6ytTehjYd4lsBG2w7MtMW5ei53
	bBHwicRIT6Zjrm3Q0O+dxbAwBXCBV/4OCe5zsyjWmFoFkXIgxcb/XfM+bZITtw==
Date: Fri, 24 Jul 2026 15:39:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: kr494167@gmail.com, dlan@kernel.org, linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: spacemit: handle regmap_test_bits() error return
Message-ID: <20260724133930d86e7b97@mail.local>
References: <20260724024220.10113-1-kr494167@gmail.com>
 <39995013-3520-4290-a791-1f5d6a25388c@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39995013-3520-4290-a791-1f5d6a25388c@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063938_984627_749C96B6 
X-CRM114-Status: GOOD (  27.72  )
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

On 24/07/2026 08:32:13-0500, Alex Elder wrote:
> On 7/23/26 9:42 PM, kr494167@gmail.com wrote:
> > From: Surendra Singh Chouhan <kr494167@gmail.com>
> > 
> > p1_rtc_read_time() called if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> > to check if the RTC was enabled.
> > 
> > regmap_test_bits() returns 1 if the bit is set, 0 if not set, and a
> > negative error code (e.g. -EIO) if reading the control register fails.
> > Using !regmap_test_bits(...) evaluates a negative error code as boolean
> > false, causing I2C/regmap read failures to be ignored and incorrectly
> > proceeding to read time registers from a failing device.
> > 
> > Fix this by capturing the return value of regmap_test_bits() and returning
> > the error code if negative, or -EINVAL if the RTC is disabled.
> > 
> > Fixes: a6de182daa2b ("rtc: spacemit: support the SpacemiT P1 RTC")
> > Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> This is an I2C-based regmap, so yes, we do need to test
> for errors when reading or writing registers.
> 
> I think this is a good fix.  I have a minor suggestion or
> two below but either way:
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> > ---
> >   drivers/rtc/rtc-spacemit-p1.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
> > index 43ab62494bb4..c1820c920ba3 100644
> > --- a/drivers/rtc/rtc-spacemit-p1.c
> > +++ b/drivers/rtc/rtc-spacemit-p1.c
> > @@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
> >   	u8 time[6];
> >   	int ret;
> > -	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> > -		return -EINVAL;		/* RTC is disabled */
> > +	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
> > +	if (ret <= 0)
> > +		return ret ? ret : -EINVAL;	/* RTC is disabled or error */
> 
> Since regmap_test_bits() can return -EINVAL, I wonder if a
> different error code would be better to indicate "disabled".
> It can return -EBUSY and -EIO too, as well as anything any
> regmap->reg_read() can return.  Scanning through the list of
> basic error codes I don't have a good suggestion, unfortunately.
> 

No, EINVAL is standard across all the drivers. I considered changing
this to ETIME or ENODATA but that would break userspace too much.

> Otherwise, perhaps just:
> 
> 		return ret ? : -EINVAL;  /* comment if you like */
> 
> >   	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
> >   	if (ret)
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
