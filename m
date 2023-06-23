Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4627EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+le28iDZct+/OV4ZtbfIkankA7eEpiJdAlNmrB3PpI=; b=4SNufkz5qbjTZLPx3IlrZNa+xh
	esTkTJMrpCUOkvRsjsc2HmdVPQ9z0G8TIacCyfcQIRp9wYd/w2FBH7UbUfyZHLWgw8y4C5aa6e19U
	kGtN841JjmoQysWKqAsCbXvxt7N8UexcXDb0od/LgXKDYCGQboErHGH4ZtJyKyZDUyYES6dCBgxLy
	Fdxo0ESvrrGFEXjYjqRD/xHQQViD+xmMQYZdbk3Sg6BT3ipNux9wCFf+OjoxBENgbADbFWtz0z27D
	dbG53Wrbw1HihIZAzzPoCe0ZC4gzT3Gtp+Bn1ibStavtAFYmwW8gYFcSjSwadJMx0ezEad4PF5xx6
	7Wzcl+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCfEB-003SSL-0t;
	Fri, 23 Jun 2023 11:45:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCfE7-003SP8-3D
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 11:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687520719; x=1719056719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5ArTWbF/LdP4e4VJCrc8bszzrQN73ij9SDqo5h2rA4=;
  b=oxYoYpIE6LLNMgjctihyk8A8aIgwPVisFngmcEzVkTuq3wQWxtEtCyaX
   zIBK8XFe1MfP7Ltso/HzbDLGiGMS0gNlfPJeXbIjihJ7da31ampcnw7yK
   5+euEn3ep/ijZPom/6HS+FPKXOSrsjGvTJ/z9k/ceTz0sGiuw3bmSibwZ
   f3DMWT0LhgXOSkSEVpgrCzyzVI89hJvsvQXf8jG58Ravk+sXJrGhXk2TU
   heZJL8HBVAFGD9DcL2ehQ4j7ia0wNafk+ZvRMBWncfRAPYKjeV5/NnvM3
   wprxIlrIl2qSs9ogGt6qXHeLzSpy0rXFQkucwbw+n9qimWVVwsS501FP0
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="asc'?scan'208";a="221619829"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 04:45:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 04:44:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 23 Jun 2023 04:44:38 -0700
Date: Fri, 23 Jun 2023 12:44:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
CC: <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<linux-riscv@lists.infradead.org>, <samuel@sholland.org>,
	<guoren@kernel.org>, <christoph.muellner@vrull.eu>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
Message-ID: <20230623-divisive-java-3cbb7172b8d8@wendy>
References: <20230622231305.631331-1-heiko@sntech.de>
 <20230622231305.631331-4-heiko@sntech.de>
 <20230623-excluding-sprint-aea9cca0cb02@wendy>
 <1908808.taCxCBeP46@diego>
MIME-Version: 1.0
In-Reply-To: <1908808.taCxCBeP46@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_044520_192962_9AB2AB6A 
X-CRM114-Status: GOOD (  23.54  )
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
Content-Type: multipart/mixed; boundary="===============4912843439502924075=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4912843439502924075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r3osZw/jhAPvPKj5"
Content-Disposition: inline

--r3osZw/jhAPvPKj5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 12:40:43PM +0200, Heiko St=FCbner wrote:
> Am Freitag, 23. Juni 2023, 11:49:41 CEST schrieb Conor Dooley:
> > On Fri, Jun 23, 2023 at 01:13:05AM +0200, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>

> > I'm also _really_ unconvinced that turning on extensions that were not
> > indicated in the DT or via ACPI is something we should be doing. Have I
> > missed something here that'd make that assessment inaccurate?
>=20
> Hmm, DT (and ACPI) is a (static) hardware-description, not a configuration
> space (sermon of DT maintainers for years), so the ISA string in DT will
> simply describe _all_ extensions the hardware supports. So there _should_
> never be a case of "I want to disable vectors and will remove the letter
> from the ISA string".

I think I pointed it out previously, on the thread about using the isa
string in hwcap that you proposed, but it was things like hypervisors
that modify the DT that they pass to guests that I was talking about
here, rather than an end-user. Obviously this doesn't apply to things
that do not have hypervisor support, but if/when those do exist you'd be
relying on them not having the empty arch/impl ids.

> We're also turning on the t-head equivalent of svpbmt and zicbom with
> probably the same reasoning.

I'd argue that we should describe these things in whatever a non isa
string DT property ends up looking like, even if we missed the boat on
putting them in riscv,isa.

Maybe this is a self-serving interpretation, but I see the svpbmt and
zicbom equivalents somewhat differently. They're done under the hood,
ostensibly to make the thing spec compliant (it still claims to be
rv64gc). This one is "turn on a new, user-visible, feature", rather
than "we implement a standard thing, but it is broken, so silently fix
it up". I would probably feel differently about this aspect of things if
there was no intention to actually communicate the presence of the
extension to userspace.

> For T-Head we _know_ from vendor-id and friends that the core supports
> this special brand of vectors.

If we _know_ on Foobar SoC that it supports xyz extension based on
vendor_id etc, should we add detection for that that too, using those
as a basis? I really don't want to have a precedent for T-Head getting
to use this method (will the same logic apply to their bitmanip stuff?),
that is not going to be applied to other vendors.

Hopefully that better explains where I am coming from, lmk if I am
overlooking something that should be obvious.

Cheers,
Conor.


--r3osZw/jhAPvPKj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJWFiwAKCRB4tDGHoIJi
0hWkAQDKMA8vp5aOMDByG6HvdeXGrVCOYG/SzdOGbN8mRpy+MwEA43fAmtj8A2mU
05gSaz2c5N8OcML/ICEuo7FNehS5dAo=
=L4ZW
-----END PGP SIGNATURE-----

--r3osZw/jhAPvPKj5--


--===============4912843439502924075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4912843439502924075==--

