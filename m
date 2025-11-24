Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4587CFD317
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=r8TxNV2GIpPyXyo4oVvJtaqv/dnXGYf8N1sNO1PQzE0=; b=qRo
	ip0Fwjji0xo1ohmhe2Z6bBtxbkBrMJjJC7xcNFNHcUh53EDmh0XGwBUCK0Xqo7nKyMRwKxxsaSSJK
	JhauNYqOHciGMJnt15MwtuqNl7E1DiiLabNIm3bUig6DVRCs8JxPhGTDiqc7c79UJ4yhJa008ZBcd
	TuxxHe5rUrZqTDq/xMyTilZUgkzsausxxzninCIU9Rehn/UzJ/T4xN0LCBiU4kI6iJKEs4L1j61ku
	skUIupeNovJsOZ9ZkAkZujhvBtmpUdmwjfy6jYKJkqNxnQPre9je1RsF9/SI04y9f/hx4KPlPmI+P
	GWpDwnJ+j0DTLVjFsTFWGi+3XjLpIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVcQ-0000000BeFw-2OEt;
	Mon, 24 Nov 2025 12:24:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVcK-0000000BeEq-06Uf
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 12:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4466843DA2;
	Mon, 24 Nov 2025 12:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BD1C4CEF1;
	Mon, 24 Nov 2025 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763987067;
	bh=XZ7WMDoI/XoXRQeV29Io8NxMCxmeA+N4VPHXU22i06E=;
	h=Date:From:To:Cc:Subject:From;
	b=EBGz/+9SNTfl1EbYGbUiL2yBVDqHDsYjRVuROyy91QH5TU/LxZkPEM1hKG+myowYN
	 Nip7leC5W++6h9KUQBgM6JUjokcyQc6OMq4l0MwN5XCk+zGpRvkdKKY7jiekA+flNU
	 q2qOqwcjORp2ilU0Kuiuqn5YcjP22CWvPwyH44V47/Ysi9NmC19WIYyM98kijOrcxj
	 SZwg/pJx1AyP3hsIv0E/kB048inucR6zj7lOHic9cdLEsAwFyqePK7gqvZr50TlsjO
	 wuGK9aPVrmwk6wpc8N9K0XnLwnKduRTVKw5VwKyJYT7pk1vKDbF5Y2F7ljzaffA9Cu
	 9p98vxtRX0tPw==
Date: Mon, 24 Nov 2025 12:24:23 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org, palmer@dabbelt.com, Andy Chiu <andybnac@gmail.com>
Subject: [Bug 220795] riscv_hwprobe and AT_HWCAP diverge after
 PR_RISCV_V_VSTATE_CTRL_OFF
Message-ID: <20251124-yam-whoever-7f1c635f94c8@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_042429_852362_76437CCC 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: multipart/mixed; boundary="===============0782835468453051069=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0782835468453051069==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SuwoVLJJx4e2oI/T"
Content-Disposition: inline


--SuwoVLJJx4e2oI/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo

I got added to some bugzilla thing last week about the vector prctl and
how it interacts with hwprobe. I have no idea why I alone was chosen,
since I didn't write this stuff, so I'm linking the issue here so that
someone that does understand it can reply:
https://bugzilla.kernel.org/show_bug.cgi?id=3D220795

The content of that is:
| Overview:
|=20
| On RISC-V systems with Vector support, invoking
|=20
| prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF)
|=20
|=20
| disables execution of V instructions for subsequently executed ELF progra=
ms, as expected.
|=20
| However, after this call:
|=20
| AT_HWCAP no longer reports the V bit, indicating that Vector execution is=
 not allowed for new programs, while
|=20
| riscv_hwprobe() continues to report RISCV_HWPROBE_IMA_V as present.
|=20
| At the same time, multiple downstream user-space components (such as libg=
cc [1]) already treat riscv_hwprobe as the authoritative source of ISA capa=
bility information, since AT_HWCAP has historically been polluted by incons=
istent vendor reporting for RVV and cannot represent multi-letter extension=
s (V, Zve*, Zvfh*, etc.).
|=20
| As a result, downstream runtimes may select RVV-enabled code paths even w=
hen V has been disabled for the program by system policy.
|=20
| To proceed with downstream libc RVV multiversioning work, we would like t=
o confirm whether this divergence between AT_HWCAP and riscv_hwprobe() afte=
r PR_RISCV_V_VSTATE_CTRL_OFF is intended (by design), or if it should be co=
nsidered an unintended semantic inconsistency.
|=20
| Additional Context:
|=20
| This concern has been raised before in prior discussions [2], noting that=
 hwprobe reports capability while AT_HWCAP reflects availability, creating =
ambiguity about which interface user space should rely on.
|=20
| Reproduce Log:
| [init] ./rvv_check
| AT_HWCAP =3D 0x000000000020112d
| V via HWCAP:   yes
| hwprobe KEY_IMA_EXT_0 =3D 0x038d2bf1200000ff
| V via hwprobe: yes
| [init] ./rvv_off rvv_check
| PR_RISCV_V_GET_CONTROL =3D 0x16
| AT_HWCAP =3D 0x000000000000112d
| V via HWCAP:   no
| hwprobe KEY_IMA_EXT_0 =3D 0x038d2bf1200000ff
| V via hwprobe: yes
| [init] poweroff
| [    1.880906] reboot: Power down
|=20
| References:
| [1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dlibgcc/config/riscv=
/feature_bits.c;h=3D157bcdcad69a939037f6faca3a90c2598dd61f89;hb=3DHEAD
| [2] https://lists.infradead.org/pipermail/kvm-riscv/2023-June/003915.html

Cheers,
Conor.

--SuwoVLJJx4e2oI/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSROdwAKCRB4tDGHoIJi
0uneAP9WlXOie/phlinThm6vJQV08PP+wsW+UBaNphpemvyiXwEAzaNJ1NnDmONT
qqKrsxw4idniTOrkcy9cEavZ1Wkenwg=
=EXOc
-----END PGP SIGNATURE-----

--SuwoVLJJx4e2oI/T--


--===============0782835468453051069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0782835468453051069==--

