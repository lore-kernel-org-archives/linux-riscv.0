Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5A3CAC5AA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tCbA3tC6QIDajfGVP/a+KL3ixawPocFBq0VAxtRqII=; b=QUZUiId/trxruk
	r2MOHSRvnwzz+Ln9wHVhkRX1dF56joK/Y7TcSEtqCk/8K0iYQ9hkiK10IeTptsG09BSmCuPmFOo2H
	Vbvf5R95j0QA8Rjn5OSqwg2dabxnzF5ZbXtJ42H29tF3NFo2nQbCwR/hlLzxjPeMxlLDfMff60oU8
	BYDLI3/DPXNYDID1tyg5crTio7/8DVrPyIwfDZHL46EvyarQi85Z+oMd4njT3ondXmDkbpjm7krSn
	irOtV9Z/D8iIe34Wzdqp0flVPB1XFoXEdNY4dKib0S6Ugv0mwJJ94z+7HWUIQCeecka87aQ1n/GCm
	EZnXWEBoq5pTAXgNPlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rEh-0000000Bw9g-3LN3;
	Tue, 23 Sep 2025 00:50:27 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rEe-0000000Bw79-2lto
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 00:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758588572;
	bh=tVo0Mj6EIacICU8Zva+Nvkjbbh1bFJr07yTobLy1i8s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=iCrjq/+94WB8ZK2DA45Ss5J6kidmAsVrx81XOnHYGgkCU2caZeelIG3spxrz+xRAJ
	 1OHe2ZlsQfwbbeXpUurQj1AGiT3qWmm6UrZ1opwhlyPvV8lDr+HBSAYcTeTd6kohqf
	 9S4Ckpkut+CHwcRHQw3Z+cZ9XD0eLHn9iW9VFbCw=
X-QQ-mid: esmtpsz17t1758588565t349df697
X-QQ-Originating-IP: 5SFyfcmSsoOR4HcPrenmCrCBMq375FcJCu0OZG3kW9Y=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 08:49:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15703022042497834592
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 08:49:23 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 5/6] i2c: spacemit: ensure SDA is released after bus reset
Message-ID: <88C40EE66EF5519F+aNHukycHdAifY9du@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
 <aNG36jhaWN-mtgMm@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNG36jhaWN-mtgMm@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N5P8YjqDjrfy/hQiz0Myj1FjXNUs8PdgUUuMq2jBhf97aXpLGTodLUHP
	pMa1rca5Xo/wgi8RbUbAez5R+GDOy4zxjWc11Ncl4IFEygZMM3CYwj513HobTOAFFL3tYH/
	OE2tWRNIlEU9H6jGnQAzcJmLNWgU25UB2GgBu4YpGsZQtu4X/PEJfEjNc7umaIuQgokJ7TI
	HoZZCWoGZjDMEqTCFa94OBponCuU55Q8pHOhU7xvFAU22qwEig5R72CT+ld0GUbeA54HS7X
	YnqiC7Pjs3iN6i1av0sWohuLFhbWRJnT0+ME+RgBAQ5dzqnZu3hRKwQMb3AWa3tjEiHiMA0
	apKO/FNz0kB1JmnGyJYG+Ng5K7aEIwObIJxUr5ynegttYiFKQFHQVEVvorLNEWMvD3QQA2x
	+StohkJJZzGascFW495smxtmLxGTiEh2Y0O+3NzpJrDWPiOMv7ZCi/gUokb5LACcacXTTTq
	7q22oo1pf9lM9AYlVsW31KR7TaVnTRO2P/vbnqAx57COgAMw+WyPQFqbH5S0fVV2/gW3z5u
	m32evAqZbX5qk4lfmO8kKsfvkFtdnQSI9pqDew912U0c8yXPFdSwy0mdM8sho9U87FWjX3h
	c33TKyKCln8EBRaVcasF7RKC3CDb+mzRw5OWLWtEG0ekdurKBMvp7vVnE0N7uMM8dCihduQ
	6J0HCXWV1ko9XfLk7GoY9UWs07fMn5/Ah7pQ9ij6PHoCnyagHLclSM9TaUbkfnmqSZglLGj
	/NZ22T+BtZyFXVRkp9uoiEa7H4YyT2d8C2KOybpCpbHjDTek+mYJ7ZuOkCgeZvJD5suh3dN
	hTN8HMd922vQR5aWi4eHIjZa/5P6B0rlik7CbKgtpHCUfnrboucWhDEpVAklmuT5Klvh6+h
	0+gmXbWkP8lu7uuzcGHbNAsleNMh3pDPtwgxxOOuMW1UlESNj7W3tnHhpnVTS7kYYBem4LL
	3FFG62rQWgcO/Sgik4i2GbTmXo7mlUvxagSlGHoFhzjAcBfdteaG6fYGnQULZTa/lqzzxvN
	bAoWgukePspXIAfkVangPSwOLh6R0YBBuS2BbzQIfdaOPK/x8jaMqR6VcLGaV534Cd+swGK
	ysYIEJ5Mg0SGYU7rZEr4G5FckHxG1o6HaWGvWovcQX8
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_175025_380848_E6CAAF54 
X-CRM114-Status: GOOD (  28.94  )
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

On Mon, Sep 22, 2025 at 10:56:10PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > After performing a conditional bus reset, the controller must ensure
> > that the SDA line is actually released.
> > 
> > Previously, the reset routine only performed a single check,
> > which could leave the bus in a locked state in some situations.
> > 
> > This patch introduces a loop that toggles the reset cycle and issues
> > a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
> > SDA after each attempt. If SDA is released before the maximum count,
> > the function returns early. Otherwise, a warning is emitted.
> > 
> > This change improves bus recovery reliability.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 4d78ee7b6929ee43771e500d4f85d9e55e68b221..d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
> >   */
> >  
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/i2c.h>
> >   #include <linux/iopoll.h>
> > @@ -26,7 +27,8 @@
> >  #define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
> >  /* Bit 9 is reserved */
> >  #define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
> > -/* Bits 11-12 are reserved */
> > +#define SPACEMIT_CR_RSTREQ	 BIT(11)	/* i2c bus reset request */
> > +/* Bit 12 is reserved */
> >  #define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
> >  #define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
> >  /* Bits 15-17 are reserved */
> > @@ -78,6 +80,7 @@
> >  					SPACEMIT_SR_ALD)
> >  
> >  #define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> > +#define SPACEMIT_RCR_FIELD_RST_CYC		GENMASK(3, 0)	/* bypass the SDA glitch fix */
> 
> The comment here seems wrong, datasheet says "The cycles of SCL during 
> bus reset."
Yes, that's my mistake.
I'll fix it.

> 
> >  /* SPACEMIT_IBMR register fields */
> >  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> > @@ -91,6 +94,8 @@
> >  
> >  #define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
> >  
> > +#define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> > +
> >  enum spacemit_i2c_state {
> >  	SPACEMIT_STATE_IDLE,
> >  	SPACEMIT_STATE_START,
> > @@ -163,6 +168,7 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
> >  static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> >  {
> >  	u32 status;
> > +	u8 clk_cnt;
> >  
> >  	/* if bus is locked, reset unit. 0: locked */
> >  	status = readl(i2c->base + SPACEMIT_IBMR);
> > @@ -172,6 +178,21 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
> >  	spacemit_i2c_reset(i2c);
> >  	usleep_range(10, 20);
> >  
> > +	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
> > +		status = readl(i2c->base + SPACEMIT_IBMR);
> > +		if (status & SPACEMIT_BMR_SDA)
> > +			break;
> 
> What about just adding the return here instead of checking clk_cnt 
> below?
> 
See below.
> > +
> > +		/* There's nothing left to save here, we are about to exit */
> > +		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
> > +		       i2c->base + SPACEMIT_IRCR);
> > +		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> > +		usleep_range(20, 30);
> > +	}
> > +
> > +	if (clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX)
> > +		return;
> > +
> >  	/* check sda again here */
> >  	status = readl(i2c->base + SPACEMIT_IBMR);
> >  	if (!(status & SPACEMIT_BMR_SDA))
> 
> Once we have exited the loop, I am not sure we should check SDA once 
> more, maybe just display the error message directly.
I'll double check it.
If it's unnecessary, I'll just return directly.

                - Troy
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
