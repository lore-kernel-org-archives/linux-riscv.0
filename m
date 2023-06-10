Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9403C7EE2F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0/Zlw4ZOMGi/0dK1HHvr3qgCg0F5H304f/C2paE1l8=; b=1SzkgWiHoHiRCMKXEKo7UYYn0E
	5Qatz+AjQqlxzYMt1IG8sT3D0t1YAmoprmkM7lLeSwC6pWZyGG1fA5nF0y5F1Kp/lSdh8SHZuzSWh
	sESRJqSXqTySKUFxGUK9y8bkb+buyxf1THau5U2XGSRzUlgMiAkQmQ2L+800skg/IQYArt6QfOgCW
	3Ty1tm4/bHl+EJBjgvuTA4DGzHkaSnmc1FCboLHI8EsMJW3q87OxI3KSIPh/PwvQAR+YlQgzZLdKF
	6dfx7HJ1mJjJctUjvtswer4aiZTe26inQe0qbhB8uDkguMQSjO3f+XOfb5OPoAQ4TA5dwC0/x/xT/
	ZvyIrrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q80uY-00GV2C-2w;
	Sat, 10 Jun 2023 15:53:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q80uU-00GUtZ-35;
	Sat, 10 Jun 2023 15:53:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EF2760DBC;
	Sat, 10 Jun 2023 15:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A802CC433EF;
	Sat, 10 Jun 2023 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686412428;
	bh=IhgOXeo1UTPs8IPcRp/3yASKBSMXDc/s0h5LEbplYc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqG++C7PoL0c8E42zT/+kVcOGFynEcmEndUiATsFOAqEjzkjlccaSTX1d33epcJ+7
	 Tna4Ts2j/2/RQcsaLTNZlUVCEEGX62ZWQ4Kl6KMXjA/oKGhZvC8zbhTkaFcL/l6HXb
	 MmjBXdgAbmOFXT/VTuaB+TjvYWWRigCFPBVCvRSnp6o9m/87kaKobnA0YzRdJJmuyx
	 7Fw06g3INnFb+dz2k/ydGHnRcrR7lH2uYYnLcYs8FOu/dP4HsZK0c75l6M+UFnCLLe
	 5+Npb2A4OEDEY7NUJbQQw8+HKaJDeXVAdrleAGrEk1RCFaM7hwbypw5EnCcYQLfcik
	 fuOeSKrpmd9Yg==
Date: Sat, 10 Jun 2023 16:53:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiaEn Wu <chiaen_wu@richtek.com>, Haibo Chen <haibo.chen@nxp.com>,
	Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Message-ID: <20230610-enchanted-late-e545ab2d74a0@spud>
References: <20230610122934.953106-1-bigunclemax@gmail.com>
 <20230610122934.953106-3-bigunclemax@gmail.com>
 <20230610-ranged-outboard-2aaa0cc36cbd@spud>
 <CALHCpMhHxAdDMGmpD9i2Kt93XqyrW_ABzr7FZSE-0+54LwgzPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALHCpMhHxAdDMGmpD9i2Kt93XqyrW_ABzr7FZSE-0+54LwgzPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_085351_112620_D4C6FBE5 
X-CRM114-Status: GOOD (  15.05  )
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
Content-Type: multipart/mixed; boundary="===============6629514900655087196=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6629514900655087196==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BQqgqeoH41kLrN6E"
Content-Disposition: inline


--BQqgqeoH41kLrN6E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 06:48:08PM +0300, Maxim Kiselev wrote:
> Hey,
>=20
> =D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 18:06, C=
onor Dooley <conor@kernel.org>:
>=20
> ...
>=20
> > >+
> > >+    required:
> > >+      - reg
> > >+
> > >+    additionalProperties: false

[1]

> > >+
> > >+required:
> > >+  - "#io-channel-cells"
> > >+  - clocks
> > >+  - compatible
> > >+  - interrupts
> > >+  - reg
> > >+  - resets
> > >+
> > >+unevaluatedProperties: false
> >
> > How come this one changed to unevaluatedProperties: false?
> > Wasn't it for the ADC that we previously discussed whether
> > additionalProperties: false was correct or not?
>=20
> Hmm, I changed it to `unevaluatedProperties: false` as you suggested
> in this message
> https://lore.kernel.org/lkml/20230604-afternoon-frighten-42222010557b@spu=
d/

That was about the adc child nodes [1], not at the top level, no?

Cheers,
Conor.


--BQqgqeoH41kLrN6E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZISchAAKCRB4tDGHoIJi
0mEaAP45yFOjQMm3h53OCYtvZmgDd7G/FQBoTT0+7iQfNGYIsAEAtNGWfr9M2Nnc
OvWozJGXFOgv7N1ELZFatVS8lA09HAI=
=Lu6U
-----END PGP SIGNATURE-----

--BQqgqeoH41kLrN6E--


--===============6629514900655087196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6629514900655087196==--

