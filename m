Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D549EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzSuhwmQ6k+tmgGL8mUiwRz9OHNttLIuiPQ1G0C0Cvc=; b=4nVhz7jY+8T2TXZ5yZTfimuXBG
	7arWfOUfuaTtg9sBNM5VYLF6Us+tK1ql8P5aFna2Z+/uBMrvdhYUZoo8CT0C3AWcQ9Y2XClKIzShd
	ZPFAewr1XGdJKxcltzLuBna7aFvhie+MvAretb47jdEbT55sCo91qWUe9YZZTHL3Rmui0OaRm3AGN
	welsv03sisJ5dAiwlPADlwohtQGYdzscASt8iBity7IL1Et2x5oKa0TtGzbLfSgJBoK7oW1UKrZln
	GL56KT+1SuAiXm1slywrfsWTG/pkCs+KVXxR5E2nHGgPxiLWeC2guUOOlUjEkCAN/kGHpurNfXatN
	Hqoxk9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9unj-00GAwY-31;
	Thu, 15 Jun 2023 21:46:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9unh-00GAvy-0y
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 21:46:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEFAA61457;
	Thu, 15 Jun 2023 21:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B6FC433C0;
	Thu, 15 Jun 2023 21:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686865600;
	bh=xXSkfXFERZnKNqske+k/AdvxTmRqwqQpRSs6xsjXVDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrzMOuZ3gpUbncz8nzTNvdKmysp1NRykfCJezNwkgVYRHPeDM34hkjkB3BIobNuje
	 kkdyA80V808TLi9m04t7RBrPRJOIFav+8Z075KJTTKhB/xq2VNdOcOC0sfy9FCKqc4
	 aCLrDxPw5q6lCE2KwRs87aK3MJZ3JGLfx5XRORGcZuIVY/8059tMPB1MKbFLmWWCGW
	 R+f6OTwP+52gvGp6TM18H4d+6hb3w2ULfF7WGs3SHn4zyJFROW94xjHPdqbPNuh3m4
	 KF67gSfPay2cONip0Rl09ATrOiDOOcHSFw8zHeimmIlmiBj9sS4Cg9PJTmPHlGgCDZ
	 gIeauNLFd3eNw==
Date: Thu, 15 Jun 2023 22:46:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/6] dt-bindings: riscv: cpus: switch to
 unevaluatedProperties: false
Message-ID: <20230615-dash-synopsis-da1c582baf06@spud>
References: <20230610-snaking-version-81ae5abb7573@spud>
 <20230615174734.GA1240678-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230615174734.GA1240678-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_144641_426282_C2AE16F1 
X-CRM114-Status: GOOD (  21.22  )
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
Content-Type: multipart/mixed; boundary="===============0138819037537540807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0138819037537540807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fG7s579iV3JYZUpt"
Content-Disposition: inline


--fG7s579iV3JYZUpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 11:47:34AM -0600, Rob Herring wrote:
> On Sat, Jun 10, 2023 at 06:24:47PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Do the various bits needed to drop the additionalProperties: true that
> > we currently have in riscv/cpu.yaml, to permit actually enforcing what
> > people put in cpus nodes.
>=20
> Arm needs pretty much all the same properties. I started on adding them=
=20
> to cpu.yaml a while back. Let me finish that up.

Cool, I see you've already updated dt-schema. I'll go update mine & cull
whatever is no longer needed here.

> > CC: Rob Herring <robh+dt@kernel.org>
> > CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > CC: Paul Walmsley <paul.walmsley@sifive.com>
> > CC: Palmer Dabbelt <palmer@dabbelt.com>
> > CC: linux-riscv@lists.infradead.org
> > CC: devicetree@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> >=20
> > Conor Dooley (6):
> >   dt-bindings: riscv: cpus: add a ref the common cpu schema
> >   dt-bindings: riscv: cpus: allow clocks property
>=20
> I just have 'clocks: true', so if you want to keep this setting it to 1=
=20
> clock that's fine. But I imagine that it's just a matter of time until=20
> someone wants more clocks.

Yeah, I said something to that affect in the commit message. I don't
doubt that it'll show up at some point, was just enabling the minimum
that I know of SoCs requiring at the moment. "clocks: true" WFM.

Cheers,
Conor.

> >   dt-bindings: riscv: cpus: add a ref to thermal-cooling-cells
> >   dt-bindings: riscv: cpus: permit operating-points-v2
> >   dt-bindings: riscv: cpus: document cpu-supply
> >   dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
> >=20
> >  .../devicetree/bindings/riscv/cpus.yaml         | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > --=20
> > 2.39.2
> >=20

--fG7s579iV3JYZUpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIuGuwAKCRB4tDGHoIJi
0tc9APwI3Clev2UmhlaKWdIH8qLbQuqSTzJdMHlBPWOydvIw6wEAn9cwAuuB64n8
2qZ2LtMA3NLR2NDSZBq+etrXjcoyMQs=
=9Bxm
-----END PGP SIGNATURE-----

--fG7s579iV3JYZUpt--


--===============0138819037537540807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0138819037537540807==--

