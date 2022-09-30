Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26DC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9IEYk+Eo6wetz96V3x4+/p8zJW597fQYH60EjqrJxg=; b=RoXZuQkQkrDWjv
	iuhfumyYjMQozulEuyQG3y/BnxV/H6Wk9tL4hQBxX+TUn0d4dVUJ7iDhD2zbPzq0dq0DlIXCqaK/D
	SZAIvsdjhE8D2tR9ehIJDZxMrxR1ra7EUoAHCYAXMHtNsd6OdEOAX9mIWmLMUzKDQscupScMIhb2v
	8GC9lnSHzCPryqFfESl3b/6qhCeUYkdaSmQZ+KZO3KLCP47XhnXrJLcf8blu6rEAniHuW5QyyTprw
	9pU2aHuNXbPQExpvhCgs+jZM9VjnRgKankdAlCH+mJus9AzERVa7SnAWfJXPeot9CwCfnsGDTOKqI
	GQGBt6IlAkiNg7ZQYHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeACl-007kpa-9H; Fri, 30 Sep 2022 07:13:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeACg-007keI-GI
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 07:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664521978; x=1696057978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i9r4cm7CWBei9MpRxT6DhwEqr1A5EdaPBWIGSPlmOz0=;
  b=mYgJEkQciS4YR+0HusNUOpm5XohwTCbb3h3nJzIdiorkfIvPZZoQLzMz
   K5itrZKaLaTFgJOwJteOcfBayrYN/Qx/e38nesDnyIqqzV64fpUjLnz0r
   WZInouLS+fgS/aRrnJuu4GkltPvxTVIo1cVoTa8OoJ3fMMksFk48yDelX
   M30N1bJvcFEQzuXcUBCR32UauifvG3fA2zD84GcQlXp/yo3jtekap0wOK
   LPaqVcH8BYIoQowWn6hfo1SxbuEipxPrgIec6em8woShsGDVBMjywvNC6
   mAXzKKh5lmSfmgQ3st8f0TlE3vsBrLgttN+sxmH28cqV7W7syrSX8WHlu
   A==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; 
   d="scan'208";a="179699630"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Sep 2022 00:12:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 30 Sep 2022 00:12:21 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 30 Sep 2022 00:12:19 -0700
Date: Fri, 30 Sep 2022 08:11:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <YzaWvrkWEvZdlwK6@wendy>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
 <YyhmZBmfJvJ9/vBg@wendy>
 <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
 <Yyh8v+MtHuc0LLf0@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yyh8v+MtHuc0LLf0@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_001258_631910_8B53EB8D 
X-CRM114-Status: GOOD (  35.92  )
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

On Mon, Sep 19, 2022 at 03:29:19PM +0100, Conor Dooley wrote:
> Hey Uwe,
> =

> On Mon, Sep 19, 2022 at 03:50:08PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Sep 19, 2022 at 01:53:56PM +0100, Conor Dooley wrote:
> > > Hey Uwe,
> > > Thanks (as always). I've switched up my email setup a bit so I hope
> > > that I've not mangled anything here.
> > > =

> > > On Thu, Sep 15, 2022 at 09:21:52AM +0200, Uwe Kleine-K=F6nig wrote:
> > > > Hello,
> > > > =

> > > > On Wed, Aug 24, 2022 at 10:12:14AM +0100, Conor Dooley wrote:
> > > > > Add a driver that supports the Microchip FPGA "soft" PWM IP core.
> > > > > =

> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---

> > > > $ ./test 255 65535
> > > > period_steps =3D 255
> > > > prescale =3D 65535
> > > > period =3D 18446744073018591744
> > > > =

> > > > The problem is that the result of 16711425 * 1000000000L isn't affe=
cted
> > > > by the type of period and so it's promoted to L which isn't big eno=
ugh
> > > > to hold 16711425000000000 where longs are only 32 bit wide.
> > > =

> > > I don't think this is ever going to be hit in the wild, since prescale
> > > comes from the hardware where it is limited to 255 - but preventing t=
he
> > > issue seems trivially done by splitting the multiplication so no reas=
on
> > > not to. Thanks for providing the test program btw :)
> > =

> > Even 255 * 255 * 1000000000 overflows. With a maintainer's hat on, it is
> > very valuable to prevent such issues because your driver might be used
> > as a template for the next driver.
> > =

> > > > > +	state->period =3D DIV64_U64_ROUND_UP(state->period, clk_get_rat=
e(mchp_core_pwm->clk));
> > > > > +
> > > > > +	posedge =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_POS=
EDGE(pwm->hwpwm));
> > > > > +	negedge =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_NEG=
EDGE(pwm->hwpwm));
> > > > > +
> > > > > +	if ((negedge =3D=3D posedge) && state->enabled) {
> > > > =

> > > > Why do you need that state->enabled?
> > > =

> > > Because I was running into conflicts between the reporting here and s=
ome
> > > of the checks that I have added to prevent the PWM being put into an
> > > invalid state. On boot both negedge and posedge will be zero & this w=
as
> > > preventing me from setting the period at all.
> > =

> > I don't understood that.
> =

> On startup, (negedge =3D=3D posedge) is true as both are zero, but the re=
set
> values for prescale and period are actually 0x8. If on reset I try to
> set a small period, say "echo 1000 > period" apply() returns -EINVAL
> because of a check in the pwm core in pwm_apply_state() as I am
> attempting to set the period to lower than the out-of-reset duty cycle.
> =

> I considered zeroing the registers, but if something below Linux had
> been using the PWM I felt that may not be the right thing to do. Can I
> continue to check for the enablement here or would you rather I did
> something different?

Hey Uwe,
Just bumping here ICYMI. Should I leave the behaviour as-was and just
document what the default values out of reset may be? That would leave
the check here making more sense & head off confusion about why apply()
fails?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
