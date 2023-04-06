Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678E0C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwRrtE+WwasFMp8TqcUxPkuvdva6OmTt/KCFEGaZiYI=; b=LS8LMfymt9gjEnfb07MqqTSPp4
	tbik7J01iHor03u1ldPvtLUp1H0sSePoLyKv6P99eGTA/ZadkJvJelKygnjbUAaFb1VmeugOvmqK3
	i9uXamV4k+S9ZYOb046xpNhn/OZBdSlB9DfMJEUDSp53DGwFM2jGNWvGbO64gLlGZu0Ff2bNfSiXK
	FM174TA6dwj4RNycDm1BsRnIUSZfRd1yfdgd5L02ZPTxCHQU43MUaus2OJ5QnXYMadiTSYmUEVn0/
	X/Z0NctSdHyiLo+JNTIWiTiLJCRZ+zunxJfq5OpULKaNwpBNkRluAJk+kTJuk0cN+1Ed2RONwJAPS
	96a5Q3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPvK-007Rck-26;
	Thu, 06 Apr 2023 13:45:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPvG-007RaJ-1P
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 13:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680788707; x=1712324707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=66uzbHnTeg9KP22hFc1pTAbx1P429+J0tDm9ryOLR9k=;
  b=SO1lC0k8d4sDTZFPqursaCLsfw7cybyjMcwQ83v7TbxlNL3cBtoZS+zl
   WGjthwMENU4gkLice/eYqYSaMTDccyDvEAQHv2Xf7SU4Pl8d7vQVoqCJY
   9hyxzw11XllBIEq4JNdoAOz9OOylhKTDKpWVekyrXvNsPJWa9rTtuRNMQ
   5MyD93xWUGqbTTdHevKt3ptyXFdn+7fdVs9bTxXYkoh8udV50TY8GaSCK
   rKiGnAKDyCe7u9uuYafLxT1vLODfZOT57u+kiuqPtcJBFq8zNhy8PaLGb
   u2p1VJi/5Erx83hWn+TsM612vLQ7HVCTzomW9ljrro4cZWJFTZJUnW2uE
   g==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673938800"; 
   d="asc'?scan'208";a="208461384"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Apr 2023 06:45:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 06:45:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Apr 2023 06:44:59 -0700
Date: Thu, 6 Apr 2023 14:44:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v15 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230406-ducktail-reflex-4840315459f8@wendy>
References: <20230330071203.286972-1-conor.dooley@microchip.com>
 <20230330071203.286972-2-conor.dooley@microchip.com>
 <0b91dee7-6c1d-4a33-8235-8fd5d58b200e@spud>
 <ZC7GeXJbB9PAF0lb@orome>
MIME-Version: 1.0
In-Reply-To: <ZC7GeXJbB9PAF0lb@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_064506_526471_CC907754 
X-CRM114-Status: GOOD (  27.87  )
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
Content-Type: multipart/mixed; boundary="===============5728175229402836288=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5728175229402836288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P2ywBvzo9kT8+ANN"
Content-Disposition: inline

--P2ywBvzo9kT8+ANN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 03:17:45PM +0200, Thierry Reding wrote:
> On Sat, Apr 01, 2023 at 09:50:47PM +0100, Conor Dooley wrote:
> > On Thu, Mar 30, 2023 at 08:12:03AM +0100, Conor Dooley wrote:
> >=20
> > > +	/*
> > > +	 * Because 0xff is not a permitted value some error will seep into =
the
> > > +	 * calculation of prescale as prescale grows. Specifically, this er=
ror
> > > +	 * occurs where the remainder of the prescale calculation is less t=
han
> > > +	 * prescale.
> > > +	 * For small values of prescale, only a handful of values will need
> > > +	 * correction, but overall this applies to almost half of the valid
> > > +	 * values for tmp.
> > > +	 *
> > > +	 * To keep the algorithm's decision making consistent, this case is
> > > +	 * checked for and the simple solution is to, in these cases,
> > > +	 * decrement prescale and check that the resulting value of period_=
steps
> > > +	 * is valid.
> > > +	 *
> > > +	 * period_steps can be computed from prescale:
> > > +	 *                      period * clk_rate
> > > +	 * period_steps =3D ----------------------------- - 1
> > > +	 *                NSEC_PER_SEC * (prescale + 1)
> > > +	 *
> > > +	 */
> > > +	if (tmp % (MCHPCOREPWM_PERIOD_STEPS_MAX + 1) < *prescale) {
> >=20
> > Hmm, looks like 32-bit doesn't like this modulus.
> > I pushed things out for LKP to test before sending as I felt I'd not be
> > allowed to do that operation, but got a build success email from it.
> > I'm not sure why the mail wasn't sent as a reply to this, but
> > <202304020410.A86IBNES-lkp@intel.com> complains:
> > pwm-microchip-core.c:(.text+0x20a): undefined reference to `__aeabi_uld=
ivmod'
> >=20
> > I know that tmp < 65536 at this point, so if the general approach is
> > fine, I can always cast it to a non 64-bit type without losing any
> > information.
>=20
> Since you already use some of the helpers from linux/math64.h, perhaps
> you can use something like div_u64_rem() here?

I had actually initially tried to do that, before I added changed the
calculation of prescale to use DIV64_U64_ROUND_UP():
| *prescale =3D DIV64_U64_ROUND_UP(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX + 1) -=
 1;

I could I suppose add an additional:
| div_u64_rem(tmp, MCHPCOREPWM_PERIOD_STEPS_MAX + 1, &remainder);

and then just use the value of remainder in the if statement.
Not the prettiest thing in the world I suppose, but should be 32-bit
safe...

Thanks for the suggestion, I'm just surprised that LKP didn't complain
when it built my tree...

--P2ywBvzo9kT8+ANN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC7MzAAKCRB4tDGHoIJi
0jooAP4mP43vuXbOMOXs2Y2/DPqSEe5azoc/PfplOVKQMqj2mgD/f19yx3/S/PIL
eL2ROUgUxGJ7Zm+dMCmMXk23o3v8RwA=
=MkqJ
-----END PGP SIGNATURE-----

--P2ywBvzo9kT8+ANN--


--===============5728175229402836288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5728175229402836288==--

