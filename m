Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74F1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 11:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B980120684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 11:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dn+d661c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B980120684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HEpfmtKEers8z0xttlsC8P920wmVirkzaoEAM36bFY=; b=Dn+d661cwGBAHB
	9KGx+SvbHAm+LgaTUTMZvcyfrRqM7Fc4x6DCE5Q9og7fJnTbfD92Guyr90SP6YwtDA4M1L4Fi/LS5
	Ntk/8Bk+9L0PhaOnhry/b0ZYYuvl4dDqW6iVjrRxZAexe8QPk0Lk9GiL1Ox9Hc7ZUNAxJAXtctRdr
	YlfS28QMrV1ktUSJXpOMyt3tm9NImlezg7HnWKjwFr/7rnehZ6gsKnn7+0LhbmCuy0s2G3ORu8DmL
	3iqq1Ilc4+0FfQf35ONT9mgX1Ug8dmiMQnzE2ZIaFog9C43GDhZE0rwyoA1qczT4Hsttz8SXKfBq+
	rWNNJcsQCa5BlENoGcPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2E84-0001U6-Fo; Fri, 08 Mar 2019 11:57:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2E81-0001Tj-PP
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 11:57:31 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h2E80-0003WO-6a; Fri, 08 Mar 2019 12:57:28 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h2E7y-0006fT-Mh; Fri, 08 Mar 2019 12:57:26 +0100
Date: Fri, 8 Mar 2019 12:57:26 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v8 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190308115726.smgooacsr37fmxwg@pengutronix.de>
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
 <1551437599-29509-3-git-send-email-yash.shah@sifive.com>
 <20190307152745.kaiv6q4ygf2apmuv@pengutronix.de>
 <CAJ2_jOFvr=sw7mWR53JbzMJa1jxwjhJSTibCsKYsxrht+PLPWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2_jOFvr=sw7mWR53JbzMJa1jxwjhJSTibCsKYsxrht+PLPWw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_035729_982986_6A669C80 
X-CRM114-Status: GOOD (  16.36  )
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
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Fri, Mar 08, 2019 at 04:59:36PM +0530, Yash Shah wrote:
> On Thu, Mar 7, 2019 at 8:57 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > > +static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device=
 *dev,
> > > +                         struct pwm_state *state)
> > > +{
> > > +     struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> > > +     unsigned int duty_cycle, x;
> > > +     u32 frac;
> > > +     struct pwm_state cur_state;
> > > +     bool enabled;
> > > +     int ret =3D 0;
> > > +     unsigned long num;
> > > +
> > > +     if (state->polarity !=3D PWM_POLARITY_INVERSED)
> > > +             return -EINVAL;
> > > +
> > > +     mutex_lock(&pwm->lock);
> > > +     pwm_get_state(dev, &cur_state);
> > > +     enabled =3D cur_state.enabled;
> > > +
> > > +     if (state->period !=3D cur_state.period) {
> >
> > Did you test this with more than one consumer? For sure the following
> > should work:
> >
> >         pwm1 =3D pwm_get(.. the first ..);
> >         pwm_apply_state(pwm1, { .enabled =3D true, .period =3D 10000000=
, .... });
> >
> >         pwm2 =3D pwm_get(.. the second ..);
> >         pwm_apply_state(pwm2, { .enabled =3D true, .period =3D 10000000=
, .... });
> >
> > but for the second pwm_apply_state() run state->period is likely not
> > exactly 10000000.
> =

> Yes, I have tested multiple consumers using sysfs interface. It is workin=
g.

Can you provide details about your testing here? What is the parent clk
rate? Which settings did you test? Can you confirm my claim that the
above sequence would fail or point out my error in reasoning?

> > > +     x =3D 1U << PWM_SIFIVE_CMPWIDTH;
> > > +     num =3D (u64)duty_cycle * x + x / 2;
> > > +     frac =3D div_u64(num, state->period);
> >
> > I don't understand the "+ x / 2" part. Should this better be
> > "+ state->period / 2"? Something like
> =

> This eqn is as per your comments against v5 of this patch series.
>  frac =3D (duty_cycle * (1 << PWM_SIFIVE_CMPWIDTH) + (1 <<
> PWM_SIFIVE_CMPWIDTH) / 2) / period;

OK, then not only the code is wrong, but also my suggestion was. :-)

> > #define div_u64_round(a, b) ({typeof(b) __b =3D b; div_u64(a + __b / 2,=
 __b)})
> >
> > would make this less error prone.

This still stands. It makes it easier to get the code right and makes it
easier to understand.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
