Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E03C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9+8Jlr0AvP+X9QxAxXvg88vnBjf34Z0PbuYwkzKQEk=; b=eY20YQZipW5VJ5
	XaZ9KRVdVfy56NYMl9wdZbKqmVSLvuEaPEHJbNInNiMxoxAT1g+5MB3jpvKrOZki9YUBN/54CqUAT
	FrvkWeR9jKBtC3TlbsrYIVFK5398VDwCBIsFMQ61hVALYggd47SXuoHtBrgWMcqjvTNYyS69XeLct
	VVXVIM1XO+/3yoKnhJTpRh3kuIuKSkuK/N9BrpbXXkLA1XXbaKwqWVxKVitM/S0sLwf51S+4Q1M4M
	kZgpgsrBrOYKqxkgAIVvwu9JjQiqboempDTg8/hvNjqOh05bDf1MRsgKgU7laIKveRle74XwkXurs
	H1b6pYQJZ2MP7Q8754sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0L3y-00FirO-VO; Wed, 30 Nov 2022 11:15:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0L3u-00FinY-He
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 11:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669806934; x=1701342934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h8e+dDcveIhXtv4l23Jh2CJfpqVLFmQPAuoBcBH7Hyk=;
  b=zjLgsil6nP+zO6vF1RIYjCqU54FdWx4oPtNVI6BRK2BG+eGKCVCsrAtj
   3reC7T+3apuxQUfbFZXISxHXgJuUklMAjbzSILpVibHjd5eC4Exnio8lN
   Z9siuI5tVg9svQBhkzqiM0p/fgv6v3VTOtg8kDuK3Tyq/uoXr69mRgDx9
   43szZtl+DKVaT+zxhdQK80x1PLizBgBor/74D9qExI3cYqqprZYSOYnQ6
   Gs98v6sY1eKyyaCw7/Y5AgpBz2X8BnfbBP7/CqSGKKoyGP1jp18yxaqRY
   BeH9NwoTKVhWnxydSvJtE7vnAgRX0eYUPg33DEwsBSzlsyI2vxfN8LHEB
   w==;
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="189334692"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Nov 2022 04:15:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 30 Nov 2022 04:15:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 30 Nov 2022 04:15:29 -0700
Date: Wed, 30 Nov 2022 11:15:10 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Conor Dooley <conor@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v12 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <Y4c7PpgzAi+HPrET@wendy>
References: <20221110093512.333881-1-conor.dooley@microchip.com>
 <20221110093512.333881-2-conor.dooley@microchip.com>
 <20221117164950.cssukd63fywzuwua@pengutronix.de>
 <Y3Zxkt3OSPQc46Q2@spud>
 <20221117210433.n5j7upqqksld42mu@pengutronix.de>
 <Y3avobkvYK3ydKTS@spud>
 <Y3uZY5mt/ZIWk3sS@wendy>
 <Y4coL74qQX80TNaT@wendy>
 <20221130103755.lhil2jaw3oufr2sf@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130103755.lhil2jaw3oufr2sf@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_031534_742902_0DE4D6DA 
X-CRM114-Status: GOOD (  28.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 30, 2022 at 11:37:55AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Conor,

> > > get_state() returns void though, is it valid behaviour to wait for the
> > > timeout there?
> =

> There was an approach to change that, see
> https://lore.kernel.org/linux-pwm/20220916151506.298488-1-u.kleine-koenig=
@pengutronix.de
> =

> I need to send a v2.

Ahh, yeah. That looks like a better idea. I'd much rather be able to
return an actual error.

> > > I had a check in the core code and found some places where the call in
> > > looks like:
> > > 	struct pwm_state s1, s2; =

> > > 	chip->ops->get_state(chip, pwm, &s1);
> > > In this case, exiting early would leave us with a completely wrong
> > > idead of the state, if it was to time out.
> > > =

> > > Either way, it seems like either way we would be misleading the caller
> > > of get_state() - perhaps the way around that is to do the wait & then
> > > just carry on with get_state()?
> > > In that scenario, you'd get the new settings where possible and the o=
ld ones
> > > otherwise.
> > > Returning if the timeout is hit would give you the new settings where=
 possible
> > > & otherwise you'd get whatever was passed to get_state().
> > > I'm not really sure which of those two situations would be preferred?
> =

> Hmm, .get_state should not return the old state. We really want
> .get_state to return an error code. Maybe postpone that question until
> we have that?

If get_state() can return an error, there's no need for the question I
think. I'd rather return what's in the shadow registers *and* on the bus
or an error than an inconsistent state.

I'll send a v(N+1) based on the non-void get_state() at some point
soon-ish.

> > Apologies for bumping this, I was wondering if any thoughts on the
> > above? I'm not sure which is the lesser evil here (or if I have
> > misunderstood something).
> =

> That's fine. I'm sorry to be not more responsive. This development cycle
> is somehow crazy and there are so many open mails in my inbox ... :-\

Oh nw about that at all. I feel bad pinging stuff since I know everyone
is busy.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
