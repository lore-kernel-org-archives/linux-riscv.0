Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5122C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fzq9peAcVwPUucYrjwwpLcGw1Eyeay/+bi5S8gZjNk=; b=NNg/qOJICWp1nKk2q6H7NnlRLN
	bHFS3jHU6guAzP6b3ph+olg6HHRbDP/luTIg2vDu2YYXjG32pTHFQ+d3BtkZeliqKdNrCcnh5gYjW
	TeURIqCWxaMuSeP6G+O70cOPffRnumKbLDJWC1SesJSuO9M1uIwCdmxtu+UXScurQF9/2AO2I43am
	5w53lFil92sskyPlozDsbhE9vY5bP9GzongOyskg/zvQigQr5HsSw9Eh3NWDqQyFpYBSRjF6j4YZE
	hHH+3NoFBsCz1Y+p9rh9eBg5brL/9vLq9Quk5IHbky3VYbcMG70K1ePzGuxsUW8FXFwYeQGl7aFL8
	1c+hnEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2F2N-007DfA-LG; Mon, 05 Dec 2022 17:13:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2F2K-007DeJ-TP
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 17:13:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64295B81184;
	Mon,  5 Dec 2022 17:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44BAC433D6;
	Mon,  5 Dec 2022 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670260426;
	bh=nfwijOP+YknJ/BJyL3BCk2K9XJLKuE3s+gxi7Re4mMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jn4RfWrItXV350OYscEJW9mDXwxsFr18oiqh0LZwV2EY89iy+sPQwEVvVqWti+uud
	 C+szYcTcXri5/HOlO/YEI2qMgLQxT1yrClDCRyjHUhcT6PT5M7LIvOpP1ksPj062mb
	 eP5R7R6zwdgdXjRxQCnwUQYNzA1tLVjQsYXBGablczconecKiKuylW70yDgeIikGbc
	 vo7Z/ZdMMTIMGn4JnhixjgS74gDhYJmqpFdnvqnBC9h8jiErXe+2U1KJugdPtQohDk
	 wqEmvHFQ/6de4PjkFy4d47k8t2/VIXqbqlNM0NbKO+6c5AQPYqD5QOzyLF4TAO26pE
	 8YN4ciFAZXu9A==
Date: Mon, 5 Dec 2022 17:13:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <Y44mxp9Wr/aEdaxE@spud>
References: <20221110093512.333881-2-conor.dooley@microchip.com>
 <20221117164950.cssukd63fywzuwua@pengutronix.de>
 <Y3Zxkt3OSPQc46Q2@spud>
 <20221117210433.n5j7upqqksld42mu@pengutronix.de>
 <Y3avobkvYK3ydKTS@spud>
 <Y3uZY5mt/ZIWk3sS@wendy>
 <Y4coL74qQX80TNaT@wendy>
 <20221130103755.lhil2jaw3oufr2sf@pengutronix.de>
 <Y44Mk2nGu1Zeq7QQ@wendy>
 <20221205160328.wn4rcs6uxuuaxftd@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20221205160328.wn4rcs6uxuuaxftd@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_091349_264558_283E26B9 
X-CRM114-Status: GOOD (  34.99  )
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
Content-Type: multipart/mixed; boundary="===============0743824802536633226=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0743824802536633226==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XYWjmEvx4GFEt7/b"
Content-Disposition: inline


--XYWjmEvx4GFEt7/b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 05:03:28PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Conor,
>=20
> On Mon, Dec 05, 2022 at 03:21:55PM +0000, Conor Dooley wrote:
> > I came into work today thinking that I could just rebase on top of your
> > patchset and send out a v13, but that was unfortunately not the case :/
> >=20
> > So uh, it turns out that I was wrong about the behaviour of the
> > sync_update register's bit.
> > It turns out that that bit holds it's value until the IP block is reset,
> > and /does not/ get cleared at the start of the next period.
> > I'm really not sure how it worked when I tested the other week [0], so I
> > spent the first half of the day trying to figure out what on earth had
> > happened to my FPGA image. I must've picked the wrong image when I went
> > to test it the other week that had the wrong configuration somehow.
> >=20
> > As a result, I've gone and hacked up another way of transferring the
> > burden of waiting - setting a timer for the period, backed by a
> > completion. get_state() and apply() now both check for the completion
> > and time out otherwise. I'm half tempted to tack RFC back onto the
> > series as I have not really messed with timers at all before and may
> > have done something off the wall.
> >=20
> > I pushed it out (see [1] in case you'd like to look) so that the bots
> > can have a play with it, since it'll be a few weeks before I'll have a
> > chance to properly test that I've broken nothing with this.
>=20
> I didn't look, but I'm convinced you don't need a timer. Something like
> the following should work, shouldn't it?:

Yeah & I did think of something along these lines. I was torn between
something that seemed heavy handed (timers) and calculating if enough
time had elapsed, which seemed a bit hacky.

Figured I was better off doing something quickly & asking rather than
polishing only to find out it was disliked ;)

>=20
>  - in .apply() check the current time, add the current period and store
>    the result to ddata->updatetimestamp
>  - in .get_state do:
>      if (current_time >=3D ddata->updatetimestamp)
>        process fine
>      else:
>        timeout (or wait until ddata->updatetimestamp?)
>=20
> Actually I'd prefer to wait instead of -ETIMEOUT.

Prefer to wait in get_state() or in both it & apply()?
Depending on how far away updatetimestamp is, would we still not want to
time out if it is going to be a long time, no?

Thanks again Uwe,
Conor.

--XYWjmEvx4GFEt7/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY44mswAKCRB4tDGHoIJi
0hYNAPwNShBFmDyuWg7PaIUavpTz8+mejzOVXbkpobCNkxtsTgD6AyEygndAq/lE
o20KrHrwDw/UrorhjSX/v2kzwcZjdA4=
=589v
-----END PGP SIGNATURE-----

--XYWjmEvx4GFEt7/b--


--===============0743824802536633226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0743824802536633226==--

