Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F4EC0481
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLLRW5j1185ub1tyeBFNdyvQWpS5cv9x1qwPJHaBGmE=; b=y1FlK4sxdkDeKe35Vw6OPyNbxz
	hQd+0PQhPHleI9xZsmFfeRc8MBpFvBs/IJnhCqunNJtvsKTCz1jjIER46z/DPXYZt/A3+/Asbofe+
	p0faTiR5Fc6wsjzwswX50U3gGoO4fp6Q4kc/Cb4klEfiU0PW71hlGg0OySfPjnW9CwU65U+5+0llm
	Iuj8X/Vt8Icz48wGo3FW86GvZEu7Bz/mAPaEb27dSBIdP559o/fpmblCM2nxHZF+WViMTdkTWVeaC
	RaR0sWm0VohKjR3ub2cHtRHvB4pKGbiWd9jPFfnVNSWab1nUhkEvjeJh+5/Mci04PSg5xzUrIYpvZ
	LmpID3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMGM-0000000EtFn-1RM1;
	Tue, 03 Mar 2026 09:41:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMGJ-0000000EtFN-3dGx
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 09:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C49407ED;
	Tue,  3 Mar 2026 09:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B480DC116C6;
	Tue,  3 Mar 2026 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772530914;
	bh=RBO3R16O0sDAGsLWLLL9G0J//Gc7/3lkaAYridPyYBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C43Bl11Fv1b2oDw9+Am9xI7rkvTPmRbLKcTPeNJ9A0M5b24nahBp/rBy8WyZA9X1Q
	 tPRDlX7ExdkD+CSwgmv15TOy1Xo76IWXqokc91CRUoDEoBuk9CEGBBCD/n/eyXKPjC
	 TrS4tYYKLMj0od/ZkolSjos+a3d1hAlOexoupCnH+VqDHtvTBLQUIBIezH01Qay/Yd
	 dz2Fr6TJ9/VEUT81sDYfUzabH485KwBKH/1XkvatQVJClZijFqe+rZPE+jsRp4OTsh
	 iVZfxqa30CMn64Kno5+nZ48g5PqPajyXRTtJW8QNRqfHebkbF4NO60JIbGqR9pxO+V
	 SKyQJJXCVzvgQ==
Date: Tue, 3 Mar 2026 09:41:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, jonathan.cameron@huawei.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
Message-ID: <20260303-crazy-shrink-ef2c085c99c4@spud>
References: <20260213-stole-economist-d5b0ac711d42@spud>
 <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_014155_924229_D810BE37 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: multipart/mixed; boundary="===============4354303136741003033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4354303136741003033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WGuT6KOIaKQwVd6I"
Content-Disposition: inline


--WGuT6KOIaKQwVd6I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 09:15:14AM +0100, Linus Walleij wrote:
> Hi Conor,
>=20
> On Fri, Feb 13, 2026 at 1:20=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > Conor Dooley (1):
> >       riscv: dts: microchip: add can resets to mpfs
> >
> > Felix Gu (2):
> >       cache: starfive: fix device node leak in starlink_cache_init()
> >       cache: ax45mp: Fix device node reference leak in ax45mp_cache_ini=
t()
> >
> > Zilin Guan (1):
> >       soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_prob=
e()
>=20
> You have DTS fixes mixed up with cache/SoC fixes, this is
> a bit unorthodox, is there some hard dependency or can you send
> the DTS fix separately?

There's no dependency of course, I'll split it out.
Ordinarily I would always split them, but I'd swear I was told at one
point that since fixes were on one branch in the soc tree that it was
okay for me to do the same. In this case I did it on one branch to be
less work to get onto a potential fixes PR that went out before -rc1.

>=20
> I guess we could also split it off manually ... I'm just a bit insecure
> with that.
>=20
> Yours,
> Linus Walleij

--WGuT6KOIaKQwVd6I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaasyAAKCRB4tDGHoIJi
0rKhAQDsHwQDCU1cb9YoTXmjbsk/nlwiWAA9XdCAYXBWmaWzZwEA51dZkTd6WlVD
8SX3PkhsEhUTNejz2QU5fbOBNq83lA8=
=ypO9
-----END PGP SIGNATURE-----

--WGuT6KOIaKQwVd6I--


--===============4354303136741003033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4354303136741003033==--

