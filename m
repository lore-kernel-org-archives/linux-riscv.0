Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4CFC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 16:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650272186A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 16:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="seyfqcU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650272186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vWg8JiHuBDwZDJHcMwIfPr99QtCQIgb1lYgIp0dkp8=; b=seyfqcU9vWhwob
	h48D6/LRIH9JP5zbAH5CxY439m52HguEYnd/FeaKq6CrrGxsUs07kihaQQkDH/BbQsYG4XE7NDf50
	QkQVTg5xLqqSGnAB59qsdFIbwi5j+EnUaTKcWAYfkSqMY+Um0qUmBPnr1zrHyVJXRo2DFpP153py/
	efOPg74R2pw32QOX94er5/K4VsPc0wSWyBE12ySZp7KFz2TH5zTzTqJgVbKcZ1P5HR6oeTsKtRHE5
	QqwQrE7yJRMuU6RwTW53Sw2CkZvZFICkAuX+HYYPleznoz1/h7he3WBpWXyy4Gv966rdA6KqFIT7o
	xMYlakBhhXJY38x/a24g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grQAw-0002bx-DC; Wed, 06 Feb 2019 16:35:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grQAs-0002bR-Uo
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 16:35:48 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1grQAr-00058p-3Z; Wed, 06 Feb 2019 17:35:45 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1grQAq-0001bv-B4; Wed, 06 Feb 2019 17:35:44 +0100
Date: Wed, 6 Feb 2019 17:35:44 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190206163544.rwzinr75cw262njv@pengutronix.de>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-2-git-send-email-yash.shah@sifive.com>
 <20190130081411.5rva7cpwoy2l5qjd@pengutronix.de>
 <CAJ2_jOHiJ3X5VYZMCNk2bpvUdDOsrqHJna3HPvtdNQpJB9fxjg@mail.gmail.com>
 <20190206110730.ogqxncrnblyazgjw@pengutronix.de>
 <20190206124055.GF21676@ulmo>
 <20190206153854.52bqbwf2ty2j7rvj@pengutronix.de>
 <20190206161634.GB23805@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190206161634.GB23805@ulmo>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_083547_147887_FB576BCD 
X-CRM114-Status: GOOD (  32.73  )
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
 Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 06, 2019 at 05:16:34PM +0100, Thierry Reding wrote:
> On Wed, Feb 06, 2019 at 04:38:54PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Feb 06, 2019 at 01:40:55PM +0100, Thierry Reding wrote:
> > > On Wed, Feb 06, 2019 at 12:07:30PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > On Wed, Feb 06, 2019 at 04:18:47PM +0530, Yash Shah wrote:
> > > > > On Wed, Jan 30, 2019 at 1:44 PM Uwe Kleine-K=F6nig
> > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > >
> > > > > > On Tue, Jan 29, 2019 at 05:13:18PM +0530, Yash Shah wrote:
> > > > > > > DT documentation for PWM controller added.
> > > > > > >
> > > > > > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > > > > > [Atish: Compatible string update]
> > > > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++=
++++++++++++++++++
> > > > > > >  1 file changed, 33 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm=
-sifive.txt
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive=
.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > > > > > new file mode 100644
> > > > > > > index 0000000..8dcb40d
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > > > > > @@ -0,0 +1,33 @@
> > > > > > > +SiFive PWM controller
> > > > > > > +
> > > > > > > +Unlike most other PWM controllers, the SiFive PWM controller=
 currently only
> > > > > > > +supports one period for all channels in the PWM. This is set=
 globally in DTS.
> > > > > >
> > > > > > You can simply drop this if the first user can set this using t=
he usual
> > > > > > interface. Don't you like this suggestion that I already made a=
 few
> > > > > > times now?
> > > > > >
> > > > > > Did you consider to make the driver support only a single outpu=
t with a
> > > > > > more flexible period setting?
> > > > > =

> > > > > We cannot consider supporting only single output since we have bo=
ards that
> > > > > use the additional PWM channels to control individual LED brightn=
ess
> > > > > of a tri-color LED.
> > > > > If we go down to one channel, then we can't control the brightnes=
s of
> > > > > the individual LEDs.
> > > > > It will break the use case.
> > > > =

> > > > OK.
> > > > =

> > > > > I am considering the below approach, let me know if it's fine by =
you.
> > > > > =

> > > > > - Drop the global period property and allow the only first user t=
o change period
> > > > > using the usual interface.
> > > > > - A note in the binding that all PWMs need to run at the same
> > > > > period. If the driver already refuses to apply incompatible perio=
ds,
> > > > > the users are going to notice that they've got the DT wrong.
> > > > > - In driver code, count the users using the .request and .free ca=
llbacks.
> > > > > Based on this, allow changes to period iff the user count is one.
> > > > =

> > > > Not sure you need to point this limitation in the binding doc. Other
> > > > than that this is fine.
> > > =

> > > I think it's useful to point this out in the binding documentation si=
nce
> > > it's something that device tree writers will want to know.
> > =

> > OK, we're talking about an FPGA implementation but I still think if the
> > dt-author is the first to know about this limitation this is too late.
> > The hardware designer must know about that, and they don't look into the
> > bindind documentation. The binding documentation should IMHO only
> > describe the binding and functional limitiations of the device are out
> > of scope.
> > =

> > The binding for the Freescale network interface doesn't describe that it
> > only supports 480 MBit/s in its GHz mode, and that's good. The binding
> > for i2c devices doesn't describe that a reboot in the middle of a
> > transfer might block the bus.
> > =

> > The target for the binding documentation is to document how a given
> > device is described in a device tree. It's not there to duplicate
> > information that belongs in the reference manual.
> =

> But the device tree bindings for PWM devices describe where and how to
> describe the period for each PWM that you reference. That's entirely
> different from the examples that you give above.

Ah right, I had not on my radar that the binding also gives a suggestion
for the period. Then yes, I agree that pointing out that all pwms
belonging to the same provider should have matching periods is a good
idea.

Is using this "typical" approach to specify the period in a pwm-list a
bad idea for this device type for this reason? On the other hand
diverting from the typical approach has its own cost. Not sure ...

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
