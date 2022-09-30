Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF37C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZOi6bC5mZutmnRCR5IRCNBHrZLa3ay0xKB/O1KfWfY=; b=EvUfzOwpe5JuRA
	vLjuL/zUvwnBX7VAuK+sTYM952BnKiiA8iAngPnenFRSY1O4z5vd0826pNg8qbjx13iJU5fAc9Y96
	pkA4Vod20yPsZ5Fv8BQQUm+VxArVZmng22QFTGpxfh19jwFKFEEVJVsC/jPU4PvPZ1Up8z8se7zdM
	MqCVAKnCQYJ/Mo7F27+xeYsuTSks9eEGSm28LSg3iX5rIgemgaFfJaO3pN5qmnH8DUm6Sberlzh5N
	p8fFBtayNMk8qlF5FWBRYAAtu4t9a2rB0POg6vSjh6xKzum36SHDLCt804Hgg6bcnsKenVJBAE7y1
	mhQ1wRKBDBO7RfTlbxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeCbK-008PW3-9h; Fri, 30 Sep 2022 09:46:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeCbG-008PVC-Mn
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 09:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664531190; x=1696067190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/9hzbJtvcmCDwMsTwmaZ+u2TLuGLLihxFJfWTDLRCkA=;
  b=ItfGNtrwt5Ac7kT5IArrUwjNYbB9NOb/TVcgsWBtK1OJd+GN5dJL47it
   9zyDNpN4qcQpZ32jtcEm6fNsglKuuRVMF/QcxX02yVJPUY8Bni4UvV/of
   jy1u9/j7uaBoQjCripxf/YEs6E7xva1xYZ0EYawBa5Si0YrC30p1We4m1
   8AJTCbma+d1OCfhqVXgcBDO5SbduBmQNwt2eij/RKClS8p47NjdOVK+G1
   6RFLfYQ1zOl36j1g5DcL/0fYgd2enLgq1Y0gFUOJJWoEmWhDCmo80Z5ng
   +LfMlIY2IVu7Cf+CrVvMWonMHQgq44e2j7wKz7KSMXRp1/oxUaOYBp+AU
   w==;
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="116219231"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Sep 2022 02:46:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 30 Sep 2022 02:46:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 30 Sep 2022 02:46:20 -0700
Date: Fri, 30 Sep 2022 10:45:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <Yza61MO9hbuFytmM@wendy>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
 <YyhmZBmfJvJ9/vBg@wendy>
 <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
 <Yyh8v+MtHuc0LLf0@wendy>
 <20220930091316.kdkf4oeu6uvxzqa6@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930091316.kdkf4oeu6uvxzqa6@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_024630_865301_E405BE05 
X-CRM114-Status: GOOD (  27.53  )
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

On Fri, Sep 30, 2022 at 11:13:16AM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Sep 19, 2022 at 03:29:19PM +0100, Conor Dooley wrote:
> > Hey Uwe,
> > =

> > On Mon, Sep 19, 2022 at 03:50:08PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Mon, Sep 19, 2022 at 01:53:56PM +0100, Conor Dooley wrote:
> > > > Because I was running into conflicts between the reporting here and=
 some
> > > > of the checks that I have added to prevent the PWM being put into an
> > > > invalid state. On boot both negedge and posedge will be zero & this=
 was
> > > > preventing me from setting the period at all.
> > > =

> > > I don't understood that.
> > =

> > On startup, (negedge =3D=3D posedge) is true as both are zero, but the =
reset
> > values for prescale and period are actually 0x8. If on reset I try to
> > set a small period, say "echo 1000 > period" apply() returns -EINVAL
> > because of a check in the pwm core in pwm_apply_state() as I am
> > attempting to set the period to lower than the out-of-reset duty cycle.
> =

> You're supposed to keep the period for pwm#1 untouched while configuring
> pwm#0 only if pwm#1 already has a consumer. So if pwm#1 isn't requested,
> you can change the period for pwm#0.

I must have done a bad job of explaining here, as I don't think this is
an answer to my question.

On reset, the prescale and period_steps registers are set to 0x8. If I
attempt to set the period to do "echo 1000 > period", I get -EINVAL back
from pwm_apply_state() (in next-20220928 it's @ L562 in pwm/core.c) as
the duty cycle is computed as twice the period as, on reset, we have
posedge =3D negedge =3D 0x0. The check of state->duty_cycle > state->period
fails in pwm_apply_state() as a result.

This failure to assign a value is unrelated to having multiple PWMs, I
think I may have horribly worded my statement when I originally replied
to you with:
> Because I was running into conflicts between the reporting here and some
> of the checks that I have added to prevent the PWM being put into an
> invalid state.

"reporting here" from that quote being the period/duty cycle
calculations in the drivers get_state(). By "the checks" I meant making
sure that a period where posedge =3D negedge is not set by the driver. I
think I also may have mistakenly assumed the -EINVAL came from my code
and not from the core - but I cannot be sure as it has been a few weeks.

The check in the core looks to be things "working as intended", and it
looks like I am working around it here. Should I just note what the
values are on reset in the "limitations" comment and the top & it is up
to applications that control the PWMs to first "fix" the duty cycle
before changing the period?

Hopefully I've done a better job at explaning this time,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
