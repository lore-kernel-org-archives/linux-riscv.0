Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D10AC47079
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx3prOL1ItCzwj2aolCgQ8ZbUA3QosXdtEqDN16WDCI=; b=iUKV9QqE6JzXUtlWHlohoh2GKa
	8XXshJWKkQ5SxFICarZ3/iEro2O61deSCoKDE69nbDZFBdKbhNp4pyYqxpPHn7/9lCgct0SqR9VJr
	OYJmYVGveWVKDWoxjfMrXLc8octDDotEViKxhbYjk3Vp0lNQeQY+DX9T4TPWyq3mpb6z9+RHgVMd3
	efPKbofe5U48KgVifBzzezN3VFkHnqIwXwTzBvzYBnQsNzB/goCq+0bTlkRa8/4wrkwZCqFxmVdDX
	hiWESaqPqoIZCxBwrn2gAvHO/4bRUkgQbBvWpQlBkGxNoOuDASF6o7CwT94CRLHIrtSmz79B8yB5N
	a1KsTuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFi1-008xvj-2f;
	Tue, 09 Jan 2024 17:16:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFhy-008xuZ-2X
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 17:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C45A0CE1985;
	Tue,  9 Jan 2024 17:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF81C433F1;
	Tue,  9 Jan 2024 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704820562;
	bh=8vHH4TA7YAbmHU9PwkkVzfxY8bEZBUphiHO0pMprnow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iASeUiit0WvZcOUa1bS5XKWgTQQLqrKQdIP+Fl0Uwmma7hSan2dyQOvG6RPeY8O94
	 gcsXiR9Hafm3TDy7AZgDQGiOioEFsx0JIbHtVjWjlhD8+FZscQoz38LVm/B9Xi1DR0
	 ZGIjqdJpa7vgCmz2wqjDailt7hDiA1/3h9+lb3Pf+nU3amxvDNb49nWi61He8WS7kB
	 uXW9LI9cjgROFBnwocWC+sbcFLSk5r2TUkUvL+UpeewafF1nn4oYq/0JFHXLf9afBB
	 r3tEY2SfIlTWQkvzXSAnByrdIxOzDFQBBucG1KX6Gm7pTe/hjD4SYBmVaKxzzOBU/A
	 xx8yx6Uom6vwg==
Date: Tue, 9 Jan 2024 17:15:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 1/4] dt-bindings: pwm: Add bindings for OpenCores PWM
 Controller
Message-ID: <20240109-sleeve-squatted-e0943e659b2e@spud>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-2-william.qiu@starfivetech.com>
 <t3w2p765fs633nanqsx5yqres7taqpk6juwyl4iex5v4jpobo2@rqw6r4myjmv3>
 <p22vjdwk35yc66mb4pkntnst6kjyhhmnv3eb2n25c3dhi5bdeo@bj7amwepprab>
MIME-Version: 1.0
In-Reply-To: <p22vjdwk35yc66mb4pkntnst6kjyhhmnv3eb2n25c3dhi5bdeo@bj7amwepprab>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_091611_051864_BCCCCF00 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Type: multipart/mixed; boundary="===============8168500394379142375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8168500394379142375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l1ROEXz9Iy/Ywcok"
Content-Disposition: inline


--l1ROEXz9Iy/Ywcok
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2024 at 10:03:49PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Conor,
>=20
> On Thu, Jan 04, 2024 at 11:43:13PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Fri, Dec 22, 2023 at 05:45:45PM +0800, William Qiu wrote:
> > > Add bindings for OpenCores PWM Controller.
> > >=20
> > > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Looks fine to me. I'll assume you reiterate the series for patch #2 and
> > so I will mark this patch as deferred in patchwork.
> >=20
> > Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> If you want, pick this patch up that it goes along with the dts changes.
>=20
> To make this formal:
>=20
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Cool. I'll do that after the merge window closes :)

Thanks!

--l1ROEXz9Iy/Ywcok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ1/TQAKCRB4tDGHoIJi
0v7HAQCyHgwcpyb9uqwBTi+Ww/Qblt+7MpgHC270lUcxAYkU4QEA3DWB4bXtpFA1
qblPMvrOJPbChkjkwy2FCF9finMrhAI=
=ZZGb
-----END PGP SIGNATURE-----

--l1ROEXz9Iy/Ywcok--


--===============8168500394379142375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8168500394379142375==--

