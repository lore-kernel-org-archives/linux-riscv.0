Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D13C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HN5nCB2dLKmE3lQUKNVG5kqqsng3+FpMI46cMShwHLc=; b=WWmkad5lSYapuiCmwWlhSyr1FW
	l2CG0kWzVrYtb+Bu1L8Z2lQZ4LpOY0t+2asCuWNaUsfVw9+UDdwbYWcKA145XykRQcOExIq5cM4TI
	DKtBsP9M8dNFOTubMgctFrqN7NjohAD+lishXrMJhzB4Xmu5wIA/9fEPeZUBWagidP5d2EEFoyVFC
	QcbK0kI99Q+kooHhJ2Kged+TcZ3DCmwZH/PKtgjASyShI39jal8CkC6xziOX3Yi4KgzN3vp79wyDI
	diJ3RPJZmubR+eMWM49FXzNuFzxhJo12lM5UsI5h56mV0JStwxQkDw04Qn0pqulURAEcDHv+4o/Xq
	dbS+CIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEqr-009VmX-2C;
	Wed, 17 May 2023 10:57:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEqn-009Vlb-0y
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684321065; x=1715857065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r2C53q37nasETW8R0y62vJQzUer3lCIfLyK7Hf9/7k8=;
  b=HWoGso7ccYB1gu9QtvByyWT5sJKWlpXkYy2W7SQ7bS4fIT+e2dZ6cG+k
   B2q0h1jmkeexFvUM8DGXJMY8oV/CDxEjPyxem4kCngIY7IpcYCd1rMGRC
   bHCw0yF2UtiY68Z9bN74d+qi9cCRYAesLSrIDPqvgbZb0vl/UNXUjRyiu
   2KA+oH6Yo2PnA5I04ypXCKy8FoeCxmZLFZ5eEOE0RPpLk5ogrM5469whv
   W4fAUbPy04Xsz/ZL6OZhk1dCBaXLNohmceSzYrnrstRjUsPzXphB1kqrw
   MtC+G2CjFcskjJ0gvJ476wk9wbs6ACWcfGp3TrUT7MENfrknKqbRPHChr
   g==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="asc'?scan'208";a="215862137"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 03:57:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 03:57:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 17 May 2023 03:57:35 -0700
Date: Wed, 17 May 2023 11:57:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v17 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230517-sinner-remember-a5f6b86194ab@wendy>
References: <20230421-neurology-trapezoid-b4fa29923a23@wendy>
 <20230421-sleek-bottom-88b867f56609@wendy>
 <20230517102030.b4nyo2dmpfl7v7fk@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230517102030.b4nyo2dmpfl7v7fk@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035745_535041_A8A3A3C2 
X-CRM114-Status: GOOD (  15.33  )
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
Content-Type: multipart/mixed; boundary="===============7560661535831849777=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7560661535831849777==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wz8/6k7ZC8Bn65VB"
Content-Disposition: inline

--wz8/6k7ZC8Bn65VB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 12:20:30PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Conor,
>=20
> I found one remaining issue:
>=20
> On Fri, Apr 21, 2023 at 10:27:09AM +0100, Conor Dooley wrote:
> > +static u64 mchp_core_pwm_calc_duty(const struct pwm_state *state, u64 =
clk_rate,
> > +				   u8 prescale, u8 period_steps)
> > +{
> > +	u64 duty_steps, tmp;
> > +
> > +	/*
> > +	 * Calculate the duty cycle in multiples of the prescaled period:
> > +	 * duty_steps =3D duty_in_ns / step_in_ns
> > +	 * step_in_ns =3D (prescale * NSEC_PER_SEC) / clk_rate
> > +	 * The code below is rearranged slightly to only divide once.
> > +	 */
> > +	tmp =3D (prescale + 1) * NSEC_PER_SEC;
>=20
> If prescale > 4 this overflows on 32bit archs, doesn't it?

Ooh, I think you are right.

> (I think prescale + 1 is promoted to unsigned int, then the
> multiplication is done and only then the range is extended to u64.

I'll respin with an explicit cast.

Thanks,
Conor.

--wz8/6k7ZC8Bn65VB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGSzCgAKCRB4tDGHoIJi
0hR/AQCX5o1i7KOyi7nlg0yPqhSWIWjpqh9ysAtfM1Ro3HafgwD4+ygsDH16bb3k
qDc8pgBDgXVyZ+OhNF7rK7RJvQMNDA==
=7JAi
-----END PGP SIGNATURE-----

--wz8/6k7ZC8Bn65VB--


--===============7560661535831849777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7560661535831849777==--

