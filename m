Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06A2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 13:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA9621906
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 13:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gs4tDl1y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA9621906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJKCtMEppXA10N61oXaZLQv+Q4YXxwVCi/h2r7Pw9Z4=; b=Gs4tDl1y2I1J1s
	BOjHxn/ttNbM4ofqqPyEFfp0mNpshnp79EOyPSiLciMW1U4gLIU+lV5UoOHVleTZVTesfcJruluuD
	Z3tOZf7vHcvtFMDHjNE2ATqg0M2ntw+JUX2SPiRH0khNe8Kf9fN22rwF1sUnO4zIpgQwqXDK6a76p
	rjF6YpEQ1LQC3LRrihklDwbpqxpokyVtvtU73Ky87yMXHLtB3D671TAzsLoxv5iizjmR+nICP7F5K
	EboA+5mZ0rA4u4eoTYXqflxxVA+cXjrgohlslXzYC6t2jcWAQ+kN9g4c2OgeawgL36P9rJDZoTe40
	u8pJKvoKvmvoc0nRr3qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Kzm-0000fe-FC; Mon, 11 Mar 2019 13:29:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Kzj-0000er-U3
 for linux-riscv@lists.infradead.org; Mon, 11 Mar 2019 13:29:33 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3Kzb-0001Ck-Sw; Mon, 11 Mar 2019 14:29:23 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3Kza-0002xR-NC; Mon, 11 Mar 2019 14:29:22 +0100
Date: Mon, 11 Mar 2019 14:29:22 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v8 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190311132922.iowselp7qvmroiaa@pengutronix.de>
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
 <1551437599-29509-3-git-send-email-yash.shah@sifive.com>
 <20190307152745.kaiv6q4ygf2apmuv@pengutronix.de>
 <CAJ2_jOFvr=sw7mWR53JbzMJa1jxwjhJSTibCsKYsxrht+PLPWw@mail.gmail.com>
 <20190308115726.smgooacsr37fmxwg@pengutronix.de>
 <CAJ2_jOFtg2_MAUYkTQM-=6KE2RN+FMxfEhLjZZfzM0k3A5RQiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2_jOFtg2_MAUYkTQM-=6KE2RN+FMxfEhLjZZfzM0k3A5RQiA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_062932_119867_2D3083A1 
X-CRM114-Status: GOOD (  15.32  )
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
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Mon, Mar 11, 2019 at 05:10:17PM +0530, Yash Shah wrote:
> On Fri, Mar 8, 2019 at 5:27 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Fri, Mar 08, 2019 at 04:59:36PM +0530, Yash Shah wrote:
> > > On Thu, Mar 7, 2019 at 8:57 PM Uwe Kleine-K=F6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > +     if (state->period !=3D cur_state.period) {
> > > >
> > > > Did you test this with more than one consumer? For sure the followi=
ng
> > > > should work:
> > > >
> > > >         pwm1 =3D pwm_get(.. the first ..);
> > > >         pwm_apply_state(pwm1, { .enabled =3D true, .period =3D 1000=
0000, .... });
> > > >
> > > >         pwm2 =3D pwm_get(.. the second ..);
> > > >         pwm_apply_state(pwm2, { .enabled =3D true, .period =3D 1000=
0000, .... });
> > > >
> > > > but for the second pwm_apply_state() run state->period is likely not
> > > > exactly 10000000.
> > >
> > > Yes, I have tested multiple consumers using sysfs interface. It is wo=
rking.
> >
> > Can you provide details about your testing here? What is the parent clk
> > rate? Which settings did you test? Can you confirm my claim that the
> > above sequence would fail or point out my error in reasoning?
> >
> =

> I have tested on HiFive Unleashed board using sysfs interface.
> Parent clk rate is around 512 Mhz.
> I have tested scenarios as you mentioned above with various period and
> duty_cycle values.
> =

> After considering your below suggestion,
>  | To get the result independent of the prior configuration you better use
>  | the real targeted period length as input instead of the last configured
>  | approximation
> I will introduce approx_period feild, which will be used as the
> targeted period length.
> Also, in pwm_sifive_get_state, I will make below change
> - state->period =3D pwm->real_period;
> + state->period =3D pwm->approx_period.
> So with this change in place, I believe the cur_state.period for the
> second pwm_apply_state() above (pwm2) will be exactly 10000000

I don't understand your intention completely. Just send a new patch
round, then I will gladly take another look.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
