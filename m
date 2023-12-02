Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066D4C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5MADEj40XBT2Z/GiKKoMIRzREgLxH1jsghUwOhYRNM=; b=3ENwajp9efM71u3bZ1PhoF0qjp
	gszhOtOUnugU3icWB2f9z1vexzjWyBdWCXp3P2fZb5HkN1NiYYbMUNKZ0ePqoNTks0sLr0/JDNqXB
	PXKJfsR0w3NYJWvVgfit2dbTmXZU80eao0VTjXhYa3mBC096a/iFOVrFeZcjK4CdBhkDf5rL44Vua
	fO5ZPaVbX1xJzIH/RHzFlmvoR3QGqec8nrgKPavD6eHFH2dVbG/92QzizAxN9MsxI9tWpBXewLX3v
	jI3iCUPawAOHmAPo9X52v0jisZZrKl1FaXQSIW74s2P5vcokJK7k6/Sy7uqBny/5BmBe80BltGXKm
	PvNsbPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9ORX-00FdmA-1x;
	Sat, 02 Dec 2023 11:45:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9ORU-00Fdlh-1x
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 11:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 12676B80B62;
	Sat,  2 Dec 2023 11:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E878C433C9;
	Sat,  2 Dec 2023 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701517548;
	bh=uSCwJobsv7eeFCBU3RQEyIImjUxRbMNqeubbtgPE2UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2aZ+tpYZc1B+VffwLZP5uR8wuY2wfDyB0dgPW19VJ08pMMcJVaJ778Yw9lntR0mG
	 YIIdnB09hIBjnOp6oJGZ5fLAdKO/+ePBmoNjkjsUVxx0nbemTqNisiNhxwfjH05pNZ
	 UUndxqxuMNmJbewMA/talTn+nliBmu6EykAaV8nLdGrUmLni/Z6cvnbz//953qDdYo
	 Z6T1aluqOJ8HWIdIvQR86Cpx1LYoH9gd29h06f7ToxDmGG4P1sVJ5WNYxHfsY6SWHL
	 gtGHw1dliNhYygnX8O4J9ZjX2TwwMztBTfwNeNNds2hFeiN4eC/Ua9V0Vn4NAG+HSy
	 OiEIEp6wU/rTQ==
Date: Sat, 2 Dec 2023 11:45:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Question about BUILTIN_DTB support in RISCV
Message-ID: <20231202-paparazzi-thievish-744c40e351be@spud>
References: <CAK7LNATt_56mO2Le4v4EnPnAfd3gC8S_Sm5-GCsfa=qXy=8Lrg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNATt_56mO2Le4v4EnPnAfd3gC8S_Sm5-GCsfa=qXy=8Lrg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_034552_916774_92A4CB15 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: multipart/mixed; boundary="===============0805424743220516421=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0805424743220516421==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gwwjm7FWxQD2puPb"
Content-Disposition: inline


--Gwwjm7FWxQD2puPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 03:45:00AM +0900, Masahiro Yamada wrote:
> Hi.
>=20
> I have a question about CONFIG_BUILTIN_DTB for riscv.
>=20
> Please see this commit history.
>=20
>=20
> [1]
> 2d2682512f0faf4d09a696184bf3c0bb6838baca
> added built-in DTB support, attempting
> to include multiple DTB into vmlinux
> by using SOC_BUILTIN_DTB_DECLARE() macro.
>=20
>=20
> [2]
> d5805af9fe9ffe4a9d975e9bc39496f57a161076
> pointed out that choosing the correct DTB
> is impossible. It fell back to the single
> built-in DTB support, like other architectures.
>=20
> [3]
> 0ddd7eaffa644baa78e247bbd220ab7195b1eed6
> added BUILTIN_DTB support for sifive and microchip,
> while apparently multiple DTBs are embedded into vmlinux.

The thread for this one is interesting:
https://lore.kernel.org/all/20210604120639.1447869-1-alex@ghiti.fr/

None of the other !canaan platforms actually support this, so it is only
for PolarFire and the SiFive boards that this is enabled. It sounds,
=66rom your comments below, that this does not even work. If it doesn't, I
would be inclined to just delete it.

If XIP is the user, we want to deprecate XIP anyway, so pointing out
that this has not worked properly in a long time for PolarFire and
?ever? for the SiFive unmatched is another nail in the coffin for that.

My vote would be for reverting [3] and removing support for XIP :)

> So, how does it work?
>=20
>=20
> With
> CONFIG_ARCH_MICROCHIP_POLARFIRE=3Dy
> CONFIG_ARCH_SIFIVE=3Dy
> CONFIG_BUILTIN_DTB=3Dy
>=20
> 7 DTB files are embedded in vmlinux.
>=20
>=20
> masahiro@zoe:~/ref/linux(master)$ riscv64-linux-gnu-nm -n vmlinux |
> grep -A15 dtb_start
> ffffffff82112620 D __dtb_start
> ffffffff82115a2c D __dtb_mpfs_icicle_kit_end
> ffffffff82115a40 D __dtb_mpfs_m100pfsevp_begin
> ffffffff82118b3b D __dtb_mpfs_m100pfsevp_end
> ffffffff82118b40 D __dtb_mpfs_polarberry_begin
> ffffffff8211b9c2 D __dtb_mpfs_polarberry_end
> ffffffff8211b9e0 D __dtb_mpfs_sev_kit_begin
> ffffffff8211e7bb D __dtb_mpfs_sev_kit_end
> ffffffff8211e7c0 D __dtb_mpfs_tysom_m_begin
> ffffffff8212162e D __dtb_mpfs_tysom_m_end
> ffffffff82121640 D __dtb_hifive_unleashed_a00_begin
> ffffffff821236af D __dtb_hifive_unleashed_a00_end
> ffffffff821236c0 D __dtb_hifive_unmatched_a00_begin
> ffffffff8212621b D __dtb_hifive_unmatched_a00_end
> ffffffff82126220 D __dtb_end
>=20
>=20
> In my understanding, the first one
> (mpfs-icicle-kit.dtb) is always used.
>=20
> You cannot use the other 6 DTBs.
> Am I missing something?

Alex? I gave a cursory test and it does in fact behave like this.


--Gwwjm7FWxQD2puPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWsY6AAKCRB4tDGHoIJi
0qL1AP42NadeFiz5c/wdHAp3pzYsORuTAsof8ogQqSkVyoDWogEAqwXZrryKGWID
GqGD5DMLBVzIH6oEvhsmFPSmg1sgvAs=
=HWh1
-----END PGP SIGNATURE-----

--Gwwjm7FWxQD2puPb--


--===============0805424743220516421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0805424743220516421==--

