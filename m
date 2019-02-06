Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2377CC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 11:07:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CD62184E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 11:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rus/tiB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CD62184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENX80mO3EX8uhkkFTlFdJRYz/06dkBeJh1uVnrzZ3DM=; b=Rus/tiB9nC8xmP
	euX6ZujE6JI/zH1uU+cqchajHJTT7Nkpek5ehmO/sxoi0Cn7caeF4ql85Z3J2XF9cCjhXUEOQBEkd
	lEyLMCQQEW+hNdr4RNf6G2t4FhZ+1VVcHuLS77FBNP7AQduFiH8+LD7S8elm9L5EuBPyjJs6wk1e5
	zG4rMzqqCWmosrW2nWaSvWyW8f1IV+tCMCbAvgccErMSX6xz4tuVNjwN7wrPiBj+3jkU0Y+iINDFO
	YiTghZgUdqb5F4lned4imsmxTJmqDcD9rRLtV/b1bbP4aJ7yRci13N3fOH5ypGV33TZ7r4XNZRDnH
	oy4PmsFYC4k5QgO5hWyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grL3I-00059e-1S; Wed, 06 Feb 2019 11:07:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grL3E-00059I-RW
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 11:07:34 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1grL3C-00036l-VY; Wed, 06 Feb 2019 12:07:30 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1grL3C-00085P-5U; Wed, 06 Feb 2019 12:07:30 +0100
Date: Wed, 6 Feb 2019 12:07:30 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v5 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190206110730.ogqxncrnblyazgjw@pengutronix.de>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-2-git-send-email-yash.shah@sifive.com>
 <20190130081411.5rva7cpwoy2l5qjd@pengutronix.de>
 <CAJ2_jOHiJ3X5VYZMCNk2bpvUdDOsrqHJna3HPvtdNQpJB9fxjg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2_jOHiJ3X5VYZMCNk2bpvUdDOsrqHJna3HPvtdNQpJB9fxjg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_030733_041231_CAE5E2C2 
X-CRM114-Status: GOOD (  22.22  )
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
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 06, 2019 at 04:18:47PM +0530, Yash Shah wrote:
> On Wed, Jan 30, 2019 at 1:44 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > On Tue, Jan 29, 2019 at 05:13:18PM +0530, Yash Shah wrote:
> > > DT documentation for PWM controller added.
> > >
> > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > [Atish: Compatible string update]
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > ---
> > >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++++++++++=
++++++++++
> > >  1 file changed, 33 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.=
txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/D=
ocumentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > new file mode 100644
> > > index 0000000..8dcb40d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > @@ -0,0 +1,33 @@
> > > +SiFive PWM controller
> > > +
> > > +Unlike most other PWM controllers, the SiFive PWM controller current=
ly only
> > > +supports one period for all channels in the PWM. This is set globall=
y in DTS.
> >
> > You can simply drop this if the first user can set this using the usual
> > interface. Don't you like this suggestion that I already made a few
> > times now?
> >
> > Did you consider to make the driver support only a single output with a
> > more flexible period setting?
> =

> We cannot consider supporting only single output since we have boards that
> use the additional PWM channels to control individual LED brightness
> of a tri-color LED.
> If we go down to one channel, then we can't control the brightness of
> the individual LEDs.
> It will break the use case.

OK.

> I am considering the below approach, let me know if it's fine by you.
> =

> - Drop the global period property and allow the only first user to change=
 period
> using the usual interface.
> - A note in the binding that all PWMs need to run at the same
> period. If the driver already refuses to apply incompatible periods,
> the users are going to notice that they've got the DT wrong.
> - In driver code, count the users using the .request and .free callbacks.
> Based on this, allow changes to period iff the user count is one.

Not sure you need to point this limitation in the binding doc. Other
than that this is fine.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
