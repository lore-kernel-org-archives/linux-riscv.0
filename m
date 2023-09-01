Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8ECA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0+Ov0VTcKrykeiRywafmIxieNedrCOza3K1OBf9Dyc=; b=ZMYaZ7fApj2meFUZoKlWF6GOD1
	Jcvay+Llzt3ObiotzbdOOwv6oAXJfD4w1GEiZG1VOgYSVqlKet8uj3stvRc0nZC6IOKgGRiTrfRK+
	7JhOWUuxIf8TTWnJn4/NPPcobk2qIuXtLffcKJ1EycBH4Vmsra4Fh9CgPOF7IAlxulcqxZNxv9Ju/
	yZuf1a75Fzc1iniw9PYUQhLwUtfOM4rTnSJyCUehmMG1vtdZgG0bjohaR0bTRKjUzF+KFvs3uY4tG
	3qAvODurgffPCzzkpIY526Kwnv3vN6/LLyV2Pos6ClQpuloUWVMR6vbytWZTCUW8kTvDHfvmLaReJ
	wrZQDaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6IT-0006mc-3D;
	Fri, 01 Sep 2023 15:42:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6IQ-0006mI-1U
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 15:42:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C009861A94;
	Fri,  1 Sep 2023 15:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C978C433C8;
	Fri,  1 Sep 2023 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693582973;
	bh=Aec0t6krFCEGf5U3ptUC6kwjD2IAlaWgVN7rht2AvZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsT62ZoHWt5x0aCRPsHutsG+4ryQ4Ewb1L7t+icTEW4pIECRDYYxVH9UhxS4Wwq+h
	 9+HQLKh5uU1TC8U/o3WUj242ae6d98D2XnM34kAHfW+nTzpLF57X/err1iGrD5GNzE
	 7KgMGe69qoCTqNQkFb9KA3LvwnHQVz6YrOXxRrMSzMGScusjrstm3e6NwUpFF9Q8Ks
	 8mL5GNM7hzTGF/fimd9nsjhpw3OsqmPAnHT0kWjnVnPsPZo9GGHwM5G2znW4e9FQ25
	 VZZ0aeTCaIyxuB6zpFes93NsCjKT/v6WUdQEPhABP8iCmQ7XIYoyvPoJL6IBdgHQQK
	 /Qm4eVkrBSSyg==
Date: Fri, 1 Sep 2023 16:42:47 +0100
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Message-ID: <20230901-remold-sublease-a1ddb1fc6348@spud>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_084254_588881_88E11D38 
X-CRM114-Status: GOOD (  27.97  )
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
Content-Type: multipart/mixed; boundary="===============2128969869201210683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2128969869201210683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pLuG68yt4VHhXP8C"
Content-Disposition: inline


--pLuG68yt4VHhXP8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 10:33:13AM +0800, William Qiu wrote:
>=20
>=20
> On 2023/8/30 16:34, Conor Dooley wrote:
> > On Wed, Aug 30, 2023 at 09:29:20AM +0200, Krzysztof Kozlowski wrote:
> >> On 30/08/2023 08:50, Conor Dooley wrote:
> >> > On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
> >> >> Due to the change of tuning implementation, it's no longer necessar=
y to
> >> >> use the "starfive,sysreg" property in dts, so drop the relevant
> >> >> description in dt-bindings here.
> >> >=20
> >> > How does changing your software implantation invalidate a descriptio=
n of
> >> > the hardware?
> >> >=20
> >>=20
> >> Which is kind of proof that this syscon was just to substitute
> >> incomplete hardware description (e.g. missing clocks and phys). We
> >> should have rejected it. Just like we should reject them in the future.
> >=20
> > :s I dunno what to do with this... I'm inclined to say not to remove it
> > from the binding or dts at all & only change the software.
> >=20
> >> There are just few cases where syscon is reasonable. All others is just
> >> laziness. It's not only starfivetech, of course. Several other
> >> contributors do the same.
> >=20
> > I'm not sure if laziness is fair, lack of understanding is usually more
> > likely.
>=20
> For this, I tend to keep it in binding, but remove it from required. Beca=
use
> we only modify the tuning implementation, it doesn't mean that this prope=
rty
> need to be removed, it's just no longer be the required one.

Please only remove it from required if the current driver doesn't break
if the regmap is removed.

--pLuG68yt4VHhXP8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPIGdwAKCRB4tDGHoIJi
0s3uAQCCUsv/FqKDOGNlzYbIkcuD89HVaHQ7QYCJNSwvBPh3/gD9Gmy1suT2VgbM
R6+a6rUuyrNXFDz0Y9tRIQt3NPZZ9w4=
=dgfB
-----END PGP SIGNATURE-----

--pLuG68yt4VHhXP8C--


--===============2128969869201210683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2128969869201210683==--

