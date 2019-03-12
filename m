Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB07C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 13:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B311D214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 13:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ULSrqA7L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B311D214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcFNvRqicYxUvi1VbDZG6C5ieXq85ldSz2wWkGRisgY=; b=ULSrqA7L8x/Sbr
	cYgbUi4eqOwEk9STIi1Ee2FQOf2ARK65EV0MnfBNvo5p1RwPrQ9OopN3S8Pmevk0e7p5y1HkHmhUC
	aHlCvUW06rfv6nAiLXIixO5bBk8qZ/hWigAnaXSEzT1+5L5kr1CvDGhKzIlYAn1yMqkj02ejFZGHs
	JlcUCauwYQeH/yh1IL4Ku6rJLN/EBBidzBd6Yc+St63QQnrACbFG6Qs+hIW/TGGYlDFYXJ64eX1Bj
	DQwDl9HfFqIp+2NqmdESUE1rp9lVU2Zf9a5iO2Il567Adg+goYnzrU6Q7iGTRTMapW6PYfnr5ykbx
	QHo56bWHnKwaJkdoJFIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3hHS-0006ht-TX; Tue, 12 Mar 2019 13:17:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3hHO-0006hY-TE
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 13:17:17 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3hHN-0004BE-Cq; Tue, 12 Mar 2019 14:17:13 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3hHM-0006Qn-El; Tue, 12 Mar 2019 14:17:12 +0100
Date: Tue, 12 Mar 2019 14:17:12 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190312131712.rxiarnthcfrsgdqn@pengutronix.de>
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <1552378289-27245-3-git-send-email-yash.shah@sifive.com>
 <20190312091739.fhv2hb2ll2eamdsn@pengutronix.de>
 <20190312121218.GM31026@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190312121218.GM31026@ulmo>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_061715_103493_EAA5E839 
X-CRM114-Status: GOOD (  29.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 01:12:18PM +0100, Thierry Reding wrote:
> On Tue, Mar 12, 2019 at 10:17:39AM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> > =

> > there are just a few minor things left I commented below.
> > =

> > On Tue, Mar 12, 2019 at 01:41:29PM +0530, Yash Shah wrote:
> > > +#define div_u64_round(a, b) \
> > > +	({typeof(b) __b =3D b; div_u64((a) + __b / 2, __b); })
> > =

> > Parenthesis around b please. I guess I didn't had them in my suggestion
> > either, sorry for that.
> =

> We don't really need the parentheses here, do we? The only operator that
> has lower priority than the assignment is the comma operator, and that's
> not going to work in the macro anyway, unless you put it inside a pair
> of parentheses, in which case, well, you have the parentheses already.

I thought that, too, but using parenthesis just always is a safe bet and
prevents people stumbling over this and spending time to come to the
conclusion that it is actually safe without them.

> > > +static int pwm_sifive_enable(struct pwm_chip *chip, bool enable)
> > > +{
> > > +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> > > +	int ret;
> > > +
> > > +	if (enable) {
> > > +		ret =3D clk_enable(pwm->clk);
> > > +		if (ret) {
> > > +			dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	if (!enable)
> > > +		clk_disable(pwm->clk);
> > > +
> > > +	return 0;
> > > +}
> > =

> > There is only a single caller for this function. I wonder if it is
> > trivial enough to fold it into pwm_sifive_apply.
> =

> I think this is fine. pwm_sifive_apply() is already fairly long at this
> point, so might as well split things up a little.

I don't have a strong opinion here, so keeping as is is fine for me.

> > There are a few other things that could be improved, but I think they
> > could be addressed later. For some of these I don't even know what to
> > suggest, for some Thierry might not agree it is worth fixing:
> > =

> >  - rounding
> >    how to round? When should a request declined, when is rounding ok?
> >    There is still "if (state->period !=3D pwm->approx_period) return -E=
BUSY"
> >    in this driver. This is better than before, but if state-period =3D=
=3D
> >    pwm->approx_period + 1 the result (if accepted) might be the same as
> >    without the +1 and so returning -EBUSY for one case and accepting the
> >    other is strange.
> =

> Perhaps a good idea would be to reject a configuration only after we've
> determined that it is incompatible? If we're really going to end up with
> the same configuration within a given margin of period or duty cycle and
> we can't do much about it, there's little point in rejecting such
> configurations.

It seems we agree here. Is this important enough to delay taking this
driver further? Currently the driver rejects too broad so if it annoys
someone this can still be fixed later and there is only little harm
(assuming correct error handling in the consumers).

> >  - don't call PWM API functions designed for consumers (here: pwm_get_s=
tate)
> =

> Agreed. The driver can just access pwm_device.state directly.

I wouldn't do this either. IMHO the driver should only look into its
hardware registers instead of using framework interna (or consumer API
calls).

> >  - Move div_u64_round to include/linux/math64.h
> =

> Looks to me like DIV_ROUND_CLOSEST_ULL() is already pretty much this.
> The only difference that I can see is that the divisor is 32-bit, but
> since we pass in state->period, that already works fine.

num (i.e. the divident) should be a u64, but it isn't. This needs
fixing. But I agree that DIV_ROUND_CLOSEST_ULL should be good enough
then.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
