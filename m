Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD1C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3UUIHLgVJGxmVFHUYZhbhJoJ50isn6J1SNk8Gn/kbE=; b=jMfp5Hb0T0NtO4FgrST3r6z9Lo
	T8XqUshku85Wff0BIrSytwoEVC4vEsL5/S+q6eX2oNmZnKGbt2OArGruPb8UEBdfMdhR3c+EP67Di
	YfNCooj/dTd8U4/4qUsrOPwGrVxymAmX8ZPh74InPnIDMWUaZQDj2iRxYuqDRhWDG8kAtkB1Bqwvp
	wVtc79WW5BhUoT+KMKIjohx8F2AHLoaAvI1K1B9lLy4YTNAWLTCsv3H779oeHLkp9riuni7Vh6nCj
	MbLDnRTbaP3s+oLdmjSLnQXncFg5vLP05hV3kg64JiHoQ+rGDb6YSt+4YFrdquHExBGjVzTKVvBwv
	0/ok7H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxaL-00D5Dh-2s;
	Mon, 22 Jan 2024 16:55:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxaF-00D5Bb-2y
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 16:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67113CE2A9F;
	Mon, 22 Jan 2024 16:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2ECC433C7;
	Mon, 22 Jan 2024 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705942535;
	bh=8T0ucgjfyXJd5NvhWFta/df8Q6IEWrQ3KgZIzNuukxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+t36IAEXRN0EzeicIjVOqkYYa8UkpBLp6d4LHyP7PIL/KyxtPlv6rg0f9eyVU3UY
	 7emrR1fDVXXhERnUfVNKiKo61V6I3tH7tIxbfssm8b/6zuhuQ3xifa2STUgrV1oXX0
	 zaMq78qpDVbS5XpQTWhPzojQal6XA4yBS7SqchbC7vVzFGfkaym0gYc+RzBI806Hex
	 VdW7NBmQQSJJgjkoa1SP73Q/Yf/4+I2rpRxG0TQWtJ43tYG6vUuF54bTHwqxpHRupC
	 /n10Cd+pskxQZnA/HwIxtP4KSe+4q+OfXYNYUf/RBH4dsLRbo4OecYuL9SZXLP1Vi1
	 qKo+cTrdKPCcA==
Date: Mon, 22 Jan 2024 16:55:28 +0000
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	William Qiu <william.qiu@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?utf-8?q?Emil_Renner_Berthing_=3Ckernel=40esmil=2Edk=3E=2C_Rob_Herring_?=@spud,
	=?utf-8?q?=3Crobh+dt=40kernel=2Eorg=3E=2C_Thierry_Reding_=3Cthierry=2Eredin?=@spud,
	=?utf-8?q?g=40gmail=2Ecom=3E=2C_Philipp_Zabel_=3Cp=2Ezabel=40pengutronix=2E?=@spud,
	=?utf-8?q?de=3E=2C_Krzysztof_Kozlowski_=3Ckrzysztof=2Ekozlowski+dt=40linaro?=@spud,
	=?utf-8?q?=2Eorg=3E=2C_Conor_Dooley_=3Cconor+dt=40kernel=2Eorg=3E=2C_Uwe_Kl?=@spud,
	=?utf-8?q?eine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E=2C_Hal?=@spud,
	=?utf-8?q?_Feng_=3Chal=2Efeng=40starfivetech=2Ecom=3E=2C_Paul_Walmsley_=3Cp?=@spud,
	=?utf-8?q?aul=2Ewalmsley=40sifive=2Ecom=3E=2C_Palmer_Dabbelt_=3Cpalmer=40da?=@spud,
	=?utf-8?q?bbelt=2Ecom=3E=2C_Albert_Ou_=3Caou=40eecs=2Eberkeley=2Eedu=3E?=@spud
Subject: Re: (subset) [PATCH v10 0/4] StarFive's Pulse Width Modulation
 driver support
Message-ID: <20240122-palm-maximize-75522ae88b8a@spud>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20240122-twitter-scroll-75416c5bbd27@spud>
MIME-Version: 1.0
In-Reply-To: <20240122-twitter-scroll-75416c5bbd27@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_085540_295479_ECDF34DC 
X-CRM114-Status: GOOD (  15.81  )
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
Content-Type: multipart/mixed; boundary="===============5805850202085715014=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5805850202085715014==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S+zxDKzeEYPgrYkE"
Content-Disposition: inline


--S+zxDKzeEYPgrYkE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 04:50:25PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> On Fri, 22 Dec 2023 17:45:44 +0800, William Qiu wrote:
> > This patchset adds initial rudimentary support for the StarFive
> > Pulse Width Modulation controller driver. And this driver will
> > be used in StarFive's VisionFive 2 board.The first patch add
> > Documentations for the device and Patch 2 adds device probe for
> > the module.
> >=20
> > Changes v9->v10:
> > - Rebased to v6.7rc6.
> > - Dropped unuseful dependency.
> > - Added error handling.
> >=20
> > [...]
>=20
> Applied to riscv-dt-for-next, thanks!
>=20
> [1/4] dt-bindings: pwm: Add bindings for OpenCores PWM Controller
>       https://git.kernel.org/conor/c/2529085831b0
> [3/4] riscv: dts: starfive: jh7100: Add PWM node and pins configuration
>       https://git.kernel.org/conor/c/26c3112c10f8
> [4/4] riscv: dts: starfive: jh7110: Add PWM node and pins configuration
>       https://git.kernel.org/conor/c/92df97487208

Something went super wrong here with the CC list that b4 generated for
me, there was a bunch of utf8 encoding crap in the middle of it. Perhaps
I should update the version of b4 that I have been running...

--S+zxDKzeEYPgrYkE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6eAAAKCRB4tDGHoIJi
0vanAP9sqv+lnua3IrSO2oAtWeacHEw1X3F2Zdr6Ewh5/RTWVgEAsNs/8NwnyYis
DM3sjdeahWoQWza4LobW7lTD7M2vyAk=
=TxP9
-----END PGP SIGNATURE-----

--S+zxDKzeEYPgrYkE--


--===============5805850202085715014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5805850202085715014==--

