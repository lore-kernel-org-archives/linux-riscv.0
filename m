Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB288C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zF7utI+JfaG0moB3V3PNcETnW3yiDd4ov5Qiky4oqQ=; b=Rbvc44zd4cvCogaXxHWZa7A09O
	m3hlfcQAthRTRBKdNpYYt03qV2B+w3AAo8GYdWLjzJAK+HGRI0dsen64X4BMJGbTVCpxvW7F6F2Vo
	GfkoaZ49uegw2QVNzrYK09LTunWEh4qEWDfVJ6yZCLSA0RgfQwRmIV/aSOoduxFMo4y2uWt2IJ+ZL
	YCn2M3gEwkA8leyXGXsEnDkQvi5XSI2zgtlEpcMJp62tFWqxT1atXtA8CZ5EYzG/EXoBK1Qt+gH8s
	EiJzlHvkp97lmGpl7mYTbvuRq1PqN2zk9iKK5zTOS2zdGdLcuMvcII7HSAi0a9fP5fsAwbN/sL27E
	WNsajLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0FZ-00449W-1I;
	Thu, 13 Jul 2023 17:37:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0FX-00448f-0K
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 17:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2825261B0B;
	Thu, 13 Jul 2023 17:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE56C433C7;
	Thu, 13 Jul 2023 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689269820;
	bh=+ZTSwjFDpcvtcfC0ww9R7B1QyZ3beSIH6AzyqiR/uUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fq8BUSLDvCZdiysUzAhBZ55tjChLKFe7qi3G3DnHAlbod+TJ5ld/hQ/BqVBSOFngC
	 hRqoMwx+XizfwlKmqTQm9VFiQyExaCxyOgPlWnvHsBAoHWr/2mjud7V6uCMcLL2JxQ
	 DGAnDspQda0LDPcv/ufwqWIZXfqe3eLpu1KbbYXXQSYQ6ylCTCxt85MPBfp/Ton39i
	 7mH3VMzdqeQwV2DVIh8xvO4VIokOiK2+wcth5DNLCbc3D2gTOvbZ2opnz95G/t7You
	 UE0mBYa7yadKmvZd+iRBQoEsqrjIMNpo3uRLDGz/cyZ9lWfFG8yDJyh0zNZhnWptT1
	 TOvmjSq/01wBw==
Date: Thu, 13 Jul 2023 18:36:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, guoren@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230713-mushiness-runt-0797dbb761e8@spud>
References: <ZLAoIWX+qqWvucWz@xhacker>
 <mhng-40ca9d23-1074-4f5b-8ccd-e7e919f68928@palmer-ri-x1c9a>
 <20230713-chive-undesired-269a54eb53db@spud>
 <ZLAwgLNyTiK7jbwM@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZLAwgLNyTiK7jbwM@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_103707_218807_CAC043C1 
X-CRM114-Status: GOOD (  33.64  )
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
Content-Type: multipart/mixed; boundary="===============4406230147689824839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4406230147689824839==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O+6fOMe6GHvdwfXm"
Content-Disposition: inline


--O+6fOMe6GHvdwfXm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 01:12:32AM +0800, Jisheng Zhang wrote:
> On Thu, Jul 13, 2023 at 06:04:22PM +0100, Conor Dooley wrote:
> > Jumping on top of Palmer's reply cos I had already started replying...
> > On Thu, Jul 13, 2023 at 09:56:34AM -0700, Palmer Dabbelt wrote:
> > > On Thu, 13 Jul 2023 09:36:49 PDT (-0700), jszhang@kernel.org wrote:
> > > > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:

> > > > FWICT, new T-HEAD's riscv cores such as C908 support standard RVV-1=
=2E0,
> > > > this patch looks like a big hammer for T-HEAD. I do understand why
> > >=20
> > > Ya, it's a big hammer.  There's no extant systems with the C908, thou=
gh, and
> > > given that the C906 and C910 alias marchid/mimplid it's kind of hard =
to
> > > trust any of those values for T-Head systems.  We could check for the=
 0s and
> > > hope T-Head starts setting something else, but I'm not sure that's a =
net win
> > > (we've also got the C920 in the Sophgo chip, which IIUC is V-0.7.1 to=
o).
> >=20
> > (In reply to Jisheng mostly)
> > It is most definitely a big hammer. And yes, we did talk about the c908
> > & its standard implementation of vector before submitting this. Unless
> > Guo can confirm that the c908 (and later CPU cores) will start setting
> > mimpid & mvendorid, I don't really see what the alternatives are? *
>=20
> In mainline kernel, three SoCs which powered by T-HEAD cpu are
> supported: D1, D1s and TH1520, they don't contain the "v" in riscv,isa
> dt property.

Yup, and they will stay that way ;)

> > Whacking in a list of DT compatibles to blacklist? That doesn't seem
> > like something that would scale.
> > Open to ideas on that front for sure, smaller hammers are always better!
> >=20
> > @Palmer, from what I am told, the c920 does put zeros in those CSRs,
> > so we are okay on that front.
> >=20
> > * If they do do something other than 0s, the errata handling will need
> >   an update anyway, so the big hammer could be revised in tandem...
> >=20
> > > > this patch is provided, but can we mitigate the situation by carefu=
lly
> > > > review the DTs? Per my understanding, dts is also part of linux ker=
nel.
> > >=20
> > > That would break compatibility with existing firmware.  It's certainly
> > > something that has happened before, but we try to avoid it where poss=
ible.
> >=20
> > (Mostly in reply to Jisheng again)
> > Sure, some devicetrees are part of the kernel, but not all are - they m=
ay
> > be passed up from U-Boot or OpenSBI etc & contain "v" in riscv,isa.
>=20
> If so this looks like a bug of u-boot and opensbi.
>=20
> PS: does u-boot/opensbi modify "riscv,isa" property dynamically? Or
> there's below usage case:
> mainline linux kernel + dtb which is built from u-boot/opensbi source
> code rather than linux kernel.

Its the latter I am thinking of. If someone wants to go and double check
that there are no vendors shipping T-Head cores with firmware that
behaves that way, then the patch could I suppose be dropped.


--O+6fOMe6GHvdwfXm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLA2OAAKCRB4tDGHoIJi
0nAyAQC4HJoJQEdfYsYOc6A5GfqICxWG49yvdnRqImpbdixXlwD8C3Ndh261zqDi
oqoHd3BQFBV+m88dLulZ9PEaAjlsMgE=
=D0Hq
-----END PGP SIGNATURE-----

--O+6fOMe6GHvdwfXm--


--===============4406230147689824839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4406230147689824839==--

