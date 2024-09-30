Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9919CE8357
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V92Y4Jel9xmHQ4T1VH8KXtNirqI3wch7T8Y1v8tZC3c=; b=VLHvZjdYcpdofY6NHYFaznG41O
	g5KIhos+/Si0h4nuscFGXNHanZUSLlVTzHaJ/kl+92/fJE8KO5JMBOrLFzLFWHX4dP/rRWzpBuK7s
	EB0mr2+PDttRH+MrMshTRnhYomM/mxgDYHZyRN5OA7fg1nAjlTmZP4ge1+LMVYAg8BC4/Pv0PEz2W
	JrUE1Z5GeXZ2zIzCMgoIWWx2G4aiudJm4I2zMrU1pv3R5c1Uthx5aJvcwCy0jsToebRNLRWUF9hQd
	ZnrD35k/SoH3Ofdh2CPmf+/uQlEjpjsXJbYJac3NN4Fuu5OsFN+rpezDUvKQDoHeH8BR+YdqDnb/Q
	erUIS6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHo4-0000000Ha0z-18EA;
	Mon, 30 Sep 2024 14:55:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svHmR-0000000HZc1-1yXB
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Sep 2024 14:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H5EV1RRodrsbm5ea8UJTy16lJkA2S9iZk7mZhOSIW6c=; b=mfeSd3x5UKiWnoeLM7FSRTxmGC
	EMAfHsbw9PnLONXR29y010vJYWhefoViK5RB7s2i9MDhQKZjRPGlIXsw82Mz95k5eWPk4LYx425h/
	546uJdXdpyy2sNm1vZ1fxiPoheYlik0SRp6RLgkoieJ5F1Lz/fg2f1GdITOpGnuaF++h6BZ8Aviiz
	4ubk6O0jk3b0qYIgtRvZwXSAiiSDaAhb0rVdmOyU5Q4fOZkYKqZi4pw++KMmEIoWv1D/wFj4LDzv/
	nkR+eyis8RW7gbsZhXYGqFkUgTtyk9UbgctQ1tLrh+YDZjok5g7rxIMRPgL91VxtXYcztcXiSFUbh
	d9WTJ09A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svHmO-00000002qhf-0Pbn
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 14:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DE725C4D60;
	Mon, 30 Sep 2024 14:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6125DC4CEC7;
	Mon, 30 Sep 2024 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727708016;
	bh=H5EV1RRodrsbm5ea8UJTy16lJkA2S9iZk7mZhOSIW6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYrk5QmYKX+nqa2DOTziaQLHU1l3FYbC+Gm6UhuDJc2L/qbKfCagYtQCo1nvqnCIW
	 HYb7iCyDTwGSHQlhehyoUClmn4xYvkFVQvWndELKO8Qq+DLn5g0cKGD0SbVvnzDNdH
	 zjhjFHhty2JNVl5PXDQnSX5QjB4PxjjJ3fuJtB0Evn7njpZfEYX1TqJizIpR2cp8dX
	 6gwkYuV1bn84Rg7RgiSBibektX8xbfWyAfSN0J5n7hjvkRpJ1sN/4rgmVSA5dpcwYk
	 bUmFeDjHugx51UhhkxPdGo+h5/NC5h/t8v5OBef7ABGcLad9vS5AJHiibwBsphpZdp
	 fnrah/znakWnw==
Date: Mon, 30 Sep 2024 15:53:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Aoba K <nExp_0x17@outlook.com>
Cc: "charlie@rivosinc.com" <charlie@rivosinc.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"evan@rivosinc.com" <evan@rivosinc.com>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"jrtc27@jrtc27.com" <jrtc27@jrtc27.com>,
	"jszhang@kernel.org" <jszhang@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"samuel@sholland.org" <samuel@sholland.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"wens@csie.org" <wens@csie.org>
Subject: Re: [PATCH v10 00/14] riscv: Add support for xtheadvector
Message-ID: <20240930-reenact-stratus-9d42d7439df4@spud>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <a1f41f92-6bd0-48b6-a931-e7ad7aba18cc@outlook.com>
MIME-Version: 1.0
In-Reply-To: <a1f41f92-6bd0-48b6-a931-e7ad7aba18cc@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_155340_524506_AD5D5F0B 
X-CRM114-Status: GOOD (  22.61  )
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
Content-Type: multipart/mixed; boundary="===============1273187136867358211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1273187136867358211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hamb1NyozR0uOSVn"
Content-Disposition: inline


--Hamb1NyozR0uOSVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 12:44:07PM +0000, Aoba K wrote:
> Hello Charlie,
>=20
> I've been working on bringing up the Sipeed Lichee RV Dock
> (which also uses the D1 SoC) with the kernel patches you provided.
> The patches applied cleanly to Palmer's for-next branch,
> but I've encountered a couple of issues:
>=20
> 1. Skiffos Compilation Error during the compilation process of `cgo`:
> `unknown relocation type 17; compiled without -fpic?`
> Unfortunately, I closed the terminal before saving the full log,
> so I don't have the complete details, but the result should be reproducib=
le.
> While this should be a SkiffOS issue, mention it in case SkiffOS is the m=
ethod
> that you mentioned for bringing up the device.
>=20
> 2. Image Building with sehraf/riscv-arch-image-builder:
> After building the image, the device failed to start at an early stage.
> I suspect this may be related to incorrect RAM size detection,
> as the board only has 512MB of RAM.
> Interestingly, the vendor image reports 1GB, and the Sipeed website also =
states
> that the Dock has 1GB, despite there being no extra memory bank present.
>=20
> You can find the boot log here: https://fars.ee/bdYk.log
>=20
> Any help would be appreciated, and big thanks to your work
> to make the efficient part of this board to work (again)!

The log you posted at https://fars.ee/XFzR appears to be using the
devicetree of a Nezha not the Lichee RV Dock. Why are you doing that,
when the Lichee RV Dock is supported in the kernel already?

Cheers,
Conor.

--Hamb1NyozR0uOSVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvq7aQAKCRB4tDGHoIJi
0iYzAP42CtXDZpcWhRrFXf/pP66arAHe2Q5uoLqijR0QtCN9HQEApur4oRSzITjL
SgCrOuckDuHJRCTBo9J9wNnIVrJC/AQ=
=iwxp
-----END PGP SIGNATURE-----

--Hamb1NyozR0uOSVn--


--===============1273187136867358211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1273187136867358211==--

