Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0406AC7112F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 11:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C96DD20861
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 11:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hXblIvko";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyHbwJoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C96DD20861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gk00Vc0v5fVO9iEziVoxhPkO6n/VHOtpz1t9zGnYvro=; b=hXblIvkoWbsr3UtAGydF2sjUv
	SekN3y2cO1krtV3u4wSdcu2rKktNRjZRMnfY36YV+wr3lV2dQTs+6wQpMcSrScfjn42ehi9OH2m/j
	eoYv7m+FpQhsQ5QFOrTIB9E352lt8np/jnuAdXoSczO5ijJRN7KcrzrqgtkzW2jRoHCoHJ35aNv+G
	LG5ORy/1LEfu+rN9JsEP59Tjwo9adsm7k53mMpX5Vf5ZXiK97WEBsPBrt7bP7OvJiSi8DMAVTduB0
	s33EUWngPlQhKG/yRs5Fk4wF6rKQc6twS5t55uao3Vz8jVQD5bhV741aBMq7XLQfw+gIJ37I81oR1
	FQZxNpfNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glXd4-0000md-Qp; Mon, 21 Jan 2019 11:20:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glXd1-0000mH-Tx
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 11:20:33 +0000
Received: by mail-wm1-x344.google.com with SMTP id p6so10344359wmc.1
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 03:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O0Y1XJ+0xnuvSlAHla8rWWZZRIYWEJRmnWlUlMTmyI4=;
 b=WyHbwJoZVxO6pDTUxINZ6UHzAOONrXs1mhjvBlQST4yb4YhWsUHlasUe52dxf/VSFb
 OdoSHhWj4B3u3TstYfTIFALayk9OTt7/0f2EQAlAIUgYHUrrwFnAMIU3aCZ2b4nFZ64M
 uv1gtJw3XuIu1t3XlutSZcKpO6L1I0sAZIWvmGpmWlUx7WUAHRB6d1Sm2+qtv/chT0sj
 GYrYKkbRsqEQC490ef4gC1CSZRM1oJ9Xlf2+HxWbctJG5YsXBA8yRsGmkzlUYLynf/O3
 02RTFXt6HKBASPI/nhFYaWkmbsYlZ52ecbqKSHt0nZFtT9v6h22KdJu5HECBla7tqLTm
 jWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O0Y1XJ+0xnuvSlAHla8rWWZZRIYWEJRmnWlUlMTmyI4=;
 b=feWqMwnVw7pLXJB+avPjsShcpGF91PqNgwoldriJt1VspZjUuOZnPXws9u07uW6hK+
 j6X/swfLN5r7cOOTEakxS/44Jgg9egfoDe6BTOg4tiqMcvrTr9XS64RzN8dMhwbNDnAR
 n+W6+lQzs/W0ROHPQ4xrVPf+qW9a38lX77+Xvp4fEdyCHreRqM/WBaky2BaVsSe7aWa1
 1Hfw5Ac1n+o1YNw8FYQOkAkAZuQjqGr6VNQVSIx4Dtl4PnGN9WZeg1gDtepg/U3NVa2T
 AqLlnbnyeNTdO5S9X7Vu/4Cky9f6i/6XiC38BKUrGUy5/6b2zTO6Hr7Mt6Fw7EG/jGXU
 gkUg==
X-Gm-Message-State: AJcUukeehsD59SrpKjzqfNaRgWLlNikK+/zxbkeEoT8LMD/gi/VJoan+
 Qhx2bvSfipQlXgB3ach/k+0=
X-Google-Smtp-Source: ALg8bN4sPiue9kGGFEkEIJRmMcE+sT/aAECrKBjZOmV9VvI+j9RBigmTIoREZfQM85EyxoY0RGbaIQ==
X-Received: by 2002:a1c:1902:: with SMTP id 2mr8529880wmz.150.1548069629901;
 Mon, 21 Jan 2019 03:20:29 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
 by smtp.gmail.com with ESMTPSA id u204sm79202993wmu.30.2019.01.21.03.20.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 03:20:28 -0800 (PST)
Date: Mon, 21 Jan 2019 12:20:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190121112027.GH16756@ulmo>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-2-git-send-email-yash.shah@sifive.com>
 <20190115201149.ghddnf27s5kqephc@pengutronix.de>
 <CAJ2_jOGPpwsn=+OU3QcHtGYJ3MFYh9azdALSeWz3-WPXL9vHnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ2_jOGPpwsn=+OU3QcHtGYJ3MFYh9azdALSeWz3-WPXL9vHnw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_032031_989163_54C5CC05 
X-CRM114-Status: GOOD (  23.47  )
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
 Paul Walmsley <paul.walmsley@sifive.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6677595939922862396=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6677595939922862396==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Content-Disposition: inline


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2019 at 02:51:31PM +0530, Yash Shah wrote:
> On Wed, Jan 16, 2019 at 1:41 AM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > this is v3, right? It is helpful to point this out to ease reviewing.
>=20
> Yes, it is v3. Will take care of this in v4.
>=20
> >
> > On Fri, Jan 11, 2019 at 01:52:43PM +0530, Yash Shah wrote:
> > > DT documentation for PWM controller added with updated compatible
> > > string.
> >
> > Not sure what was updated here. But assuming this is compared to v2 this
> > is not a helpful info in the commit log.
>=20
> Ok, will remove the 'updated compatible string' part.
>=20
> >
> > > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > > [Atish: Compatible string update]
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > ---
> > >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 37 ++++++++++++=
++++++++++
> > >  1 file changed, 37 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.=
txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/D=
ocumentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > new file mode 100644
> > > index 0000000..e0fc22a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > > @@ -0,0 +1,37 @@
> > > +SiFive PWM controller
> > > +
> > > +Unlike most other PWM controllers, the SiFive PWM controller current=
ly only
> > > +supports one period for all channels in the PWM. This is set globall=
y in DTS.
> > > +The period also has significant restrictions on the values it can ac=
hieve,
> > > +which the driver rounds to the nearest achievable frequency.
> > > +
> > > +Required properties:
> > > +- compatible: Please refer to sifive-blocks-ip-versioning.txt
> >
> > While the description was too verbose in v2, this is too short. You
> > should at least mention something like "sifive,pwmX" and
> > "sifive,$cpuname-pwm" (or how ever that scheme works).
>=20
> Will mention the above.
>=20
> >
> > > +- reg: physical base address and length of the controller's registers
> > > +- clocks: Should contain a clock identifier for the PWM's parent clo=
ck.
> > > +- #pwm-cells: Should be 2.
> > > +  The first cell is the PWM channel number
> > > +  The second cell is the PWM polarity
> >
> > I'd drop these two lines and refer to bindings/pwm/pwm.txt instead.
>=20
> Will be done.

I don't think you can do that. You're omitting the second cell
representing the period, so this is different from the standard binding
and therefore needs to be explicit.

That said, given the rest of the discussion in the other threads, maybe
it no longer makes sense to set the period on the whole block, but
rather just note in the binding that all PWMs need to run at the same
period. If the driver already refuses to apply incompatible periods,
your users are going to notice that they've got the DT wrong.

This would have the advantage that you can use the standard bindings.

Thierry

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxFqvgACgkQ3SOs138+
s6HkDw/9G/+2aipEoQrz+7s6f9UOqF7LrWscQSYjZU3i8G/nYxfxiTDpwarQYIZt
Ceycjf6nt8x4bCAN76myAY8O/399OfKy/4s6EfFoIg77g5FVuhxWi0teEkn8cwo/
SvzQypcgPO40uwU7sD5gYzKv8BL2DbV/v8gHq1MZYsw6F5P6hnpk3y1dRn9udrUw
nL4qI1NR75zXBm6t+e5n3CBc6A/fBRo5juU1a4zJlxZIqbWz8Hw2MpeHZ/i22N7m
MaepSUgGGS/Bk4qa3Jy4Qg82sHjSf1GYMBQnPTlSdA+Araw7xtpxGtFRJA92q4xk
I8UEVbB7vfxqyKbcYcExzQIxnSNniRK64VQqiKq80NMVY3O/QA3gRa9aK/tQDSrG
eJvpydF29+oGW2lncgxLZPT2mwTdtW10QyvjLnXqqlA8jlzhbsKUs5e8gVF65i94
buG1R3zI9ngJ3LkkAUHFHiYZU9B0AxuZoz6X3IQlGcbInTC+lc3hB6jeNapMw5yL
4pl6vUvxKQCauM7h5XpGlOVyZfBMV/4R6wRW1dEGhRusog1zIQTbQahwix1J06Kp
N0ZbLtJ/4NJ+XSBNrFzLpM0JVKmJZdRBadJ2da6wbDmCRuULwC3rTS96rG9hEwQK
kEV573LtxIY4rXw/zsD4wTrT02eM+TOl9NtC4EQVYl7ImIn9JhI=
=ysK7
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--


--===============6677595939922862396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6677595939922862396==--

