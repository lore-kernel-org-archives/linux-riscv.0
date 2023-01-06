Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146B4C61DB3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAxio6ShbTefk32gVGTjXGGEwiAU70hhSCiCkC5eitI=; b=i8zfVhhqunAm4ZHNff6xVkdiac
	pmg0oQ/P8O+f412uJmV2FIG2r5bTGNtgevwRqxFvg8jpj2gBiuYN9u+I0dm0k3iuO4CYC57NDRuBg
	uhopy3jKhzmXZeqMBVmxDzUELffpUJFJAF+o8+QXyirja9P/5xS2yxydGqgF5IHCcU29DlAeBydRU
	dArJNlU3iBf/RBRD5PtVcPivrdmSjYDo7HjPcv4qH8gp0Y/6CvZar1TRqe6a4tXcd138i4njLzFgq
	ugFbhFiA7p7o8hHKCNbKRgjt60/m0KtO61mt6rZPjOMzlo9Zj3TWMHfEqB1hk3+qptv9Lpbgkko7r
	8G1TbMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrY6-00EO9F-9U; Fri, 06 Jan 2023 18:34:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrY3-00EO8N-Mc
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:34:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6C3661EE8;
	Fri,  6 Jan 2023 18:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DDDC433EF;
	Fri,  6 Jan 2023 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673030074;
	bh=xUK6wFT5FrlRcYni9bL/QHrma1cq3ZCJnoLrZkFOSEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HOlC/44C5Wfsj9Ch/Lfipm3DaGgzoLjVjlOXApkWBpHFtdNdzO5eJ7TG/SI5pyOa+
	 lZhvZVXZ6gBiuMGZ4hMMJJ1pqUp1wl7PBeeKahDiFkCuHObn7TZSc9Qts1MAfbKdsl
	 mzjPJ0LwRNaZIYhZgnPlKfkGaC0OyJWzQGbd00eMrwET6Dx8uKvVX5pFh7T+5j/4YX
	 67CP+QIymgJkVLlTUbLHHhQqyEmMQPSVgH4EBcMeEgD/IgH7PbiEHjEnLk0FfI0nxU
	 HnVbf3LPMOPZhPgb0OGbqKR4iJAg9FDMuIoJprZRwABSCIkMudJ+6adPBgpO5Rx/7/
	 1uvmZRJ0SJtgg==
Date: Fri, 6 Jan 2023 18:34:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, jrtc27@jrtc27.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	heiko@sntech.de, ajones@ventanamicro.com, guoren@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv,isa fixups
Message-ID: <Y7hptVmrXBFvJhpU@spud>
References: <20221205174459.60195-1-conor@kernel.org>
 <mhng-e3f1a8a9-2d89-4331-bb8a-b798af0cb277@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-e3f1a8a9-2d89-4331-bb8a-b798af0cb277@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_103435_858964_1521155D 
X-CRM114-Status: GOOD (  24.73  )
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
Content-Type: multipart/mixed; boundary="===============1190152732424841005=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1190152732424841005==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HpGX6SdyBnCEs+UY"
Content-Disposition: inline


--HpGX6SdyBnCEs+UY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 10:27:48AM -0800, Palmer Dabbelt wrote:
> On Mon, 05 Dec 2022 09:44:58 PST (-0800), Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > I noticed ~today~ while looking at the isa manual that I had not
> > accounted for another couple of edge cases with my regex. As before, I
> > think attempting to validate the canonical order for multiletter stuff
> > makes no sense - but we should totally try to avoid false-positives for
> > combinations that are known to be valid.
> >=20
> > All I've changed for v2 was collecting tags & adding in the missing
> > commit reference that Heiko pointed out.
> >=20
> > v3 fixes an issue Jess spotted - it's *any* multi-letter extension that
> > can come immediately after the single-letter ones, not just ones
> > starting with Z.
> >=20
> > @Palmer, either you can take this once the DT folks have ACKed it if you
> > like, or I will take onto some v6.2-rcN fixes branch. I don't think that
> > there is any urgency :)
>=20
> Sorry I missed these.
>=20
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> We can just do a shared tag if you have stuff that depends on them?  That=
'll
> let me keep fixes clean, as I'm running the DT stuff too now.  Though may=
be
> it doesn't matter so much because I'm not really taking any DT stuff.

Nah, shared tag is not needed.
Noone's got a DT with multiletter stuff that needs to be merged yet.
Feel free to take on on fixes or for-next.

Thanks,
Conor.


--HpGX6SdyBnCEs+UY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7hptQAKCRB4tDGHoIJi
0lFIAP4lpEDhJ5iqVhHMmhiuWGm87Fbm0XcS70lDrNpJaRzFRAD/apKxgkNHopV+
VQm2J89Mck/lUSzvelR/XOc0N1B5sg0=
=ewER
-----END PGP SIGNATURE-----

--HpGX6SdyBnCEs+UY--


--===============1190152732424841005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1190152732424841005==--

