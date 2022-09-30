Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFB4C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgPhR0Kiwv/OBFiK6vC6yL+BYdLVUZahOoFSi5aRi8U=; b=2DT3R4cpgd2Gms
	HYP+wLtCQAACwgj/elnN5X9XoYNmu5k/SG6qmeexXql3GEDgqLgZ6g7Hte/T1276OJoyM+Sqp/zhw
	bK+xPqpBi6dBFQOpVfwRT060xdYQ8+Z6ZnkeYD8M8b6z7v1gruCephZFKNs2RuX453RarnmkHCRoW
	296yACq+nEUzDmNAKBvDFe4yJBr0Z5SFoNWT6JEg0mnGY3lHRVSVSLU+pf7G3+645asvhpVzivoj3
	KWfH8qzmc1qNtENFrFvVMRq06lbWK2NgiURSrxiftqtCraGcLhrRJvsCt7ekJRVRwlfcQ9ulSIrFl
	KqAAK6jX30Bdry4OyAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeGOm-009U0X-DK; Fri, 30 Sep 2022 13:49:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeGOj-009Tz6-A0
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 13:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664545789; x=1696081789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=n9ebYPlj7qybcpG08KXmsqxmGM43O0sG2jH9VygklZk=;
  b=XXhz7gJ2RNpV0AVGSfbMS2rh2WaFa2yvORh04F1LpWyqE8o5Uh85sRQH
   CLYv/7zKsrvJtkTVPHgyOvKZD4musCJjuwx8KvWC6677RyEwA3dzS5wEA
   QCvO10qrtGZqWMLpsQjaY0RWMjWY26V4JaUvlooMj1SgsFkfDcNokLTzJ
   TuuhaIafMkIvqkZEmJn6HBooQOi6PROzYC1kBqyuQKfzQ9iXfOoBNztdS
   opdocckN4UNbJRdPIpbZgZ/rCn4ENj08LOCVu4Fs3BOv9VeuFRKCUnCcI
   T2cxRvIi9Xxsb2JYboa0Gt10h67IwBmHJBRUZRoqboAp7qPewGukybD/Y
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="179788492"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Sep 2022 06:49:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 30 Sep 2022 06:49:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 30 Sep 2022 06:49:33 -0700
Date: Fri, 30 Sep 2022 14:49:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <Yzbz2N28RJ8Yyg2v@wendy>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
 <YyhmZBmfJvJ9/vBg@wendy>
 <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
 <Yyh8v+MtHuc0LLf0@wendy>
 <20220930091316.kdkf4oeu6uvxzqa6@pengutronix.de>
 <Yza61MO9hbuFytmM@wendy>
 <20220930133933.br5kanbh3clvahvr@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930133933.br5kanbh3clvahvr@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_064949_473625_4821D379 
X-CRM114-Status: GOOD (  29.32  )
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

On Fri, Sep 30, 2022 at 03:39:33PM +0200, Uwe Kleine-K=F6nig wrote:
> On Fri, Sep 30, 2022 at 10:45:56AM +0100, Conor Dooley wrote:
> > On Fri, Sep 30, 2022 at 11:13:16AM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Mon, Sep 19, 2022 at 03:29:19PM +0100, Conor Dooley wrote:
> > > > Hey Uwe,
> > > > =

> > > > On Mon, Sep 19, 2022 at 03:50:08PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > > On Mon, Sep 19, 2022 at 01:53:56PM +0100, Conor Dooley wrote:
> > > > > > Because I was running into conflicts between the reporting here=
 and some
> > > > > > of the checks that I have added to prevent the PWM being put in=
to an
> > > > > > invalid state. On boot both negedge and posedge will be zero & =
this was
> > > > > > preventing me from setting the period at all.
> > > > > =

> > > > > I don't understood that.
> > > > =

> > > > On startup, (negedge =3D=3D posedge) is true as both are zero, but =
the reset
> > > > values for prescale and period are actually 0x8. If on reset I try =
to
> > > > set a small period, say "echo 1000 > period" apply() returns -EINVAL
> > > > because of a check in the pwm core in pwm_apply_state() as I am
> > > > attempting to set the period to lower than the out-of-reset duty cy=
cle.
> > > =

> > > You're supposed to keep the period for pwm#1 untouched while configur=
ing
> > > pwm#0 only if pwm#1 already has a consumer. So if pwm#1 isn't request=
ed,
> > > you can change the period for pwm#0.
> > =

> > I must have done a bad job of explaining here, as I don't think this is
> > an answer to my question.
> > =

> > On reset, the prescale and period_steps registers are set to 0x8. If I
> > attempt to set the period to do "echo 1000 > period", I get -EINVAL back
> > from pwm_apply_state() (in next-20220928 it's @ L562 in pwm/core.c) as
> > the duty cycle is computed as twice the period as, on reset, we have
> > posedge =3D negedge =3D 0x0. The check of state->duty_cycle > state->pe=
riod
> > fails in pwm_apply_state() as a result.
> =

> So set duty_cycle to 0 first?
> =

> A problem of the sysfs interface is that you can only set one parameter
> after the other. So there you have to find a sequence of valid
> pwm_states that only differ in a single parameter between the initial
> and the desired state.
> =

> That's nothing a "normal" pwm consumer would be affected by. (IMHO we
> should have a userspace API that benefits from the properties of
> pwm_apply().)

Right, so I guess I will drop the check so. That's good to know, thanks.

Would you rather I waited until after the mw to send v11?

Thanks,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
