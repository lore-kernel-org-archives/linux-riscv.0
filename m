Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E38ACF45CD
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 21:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc2nk5ei7xEMgx6cK6Zpn1wJjYwDeXmflEMeIlt95w8=; b=kAmnXewjLDLs0IsbTfYB+RVvI2
	tcz0FE35fuosBV9WBQJqb+otoPIEsJXYnwi8AAa9H/LBPEagdQOhtHbdBuOswEWaw2pXDLaWahx3B
	1ebyONRZLYCYI+mYKcOKYtPi8JpHFlYXPGn0z+faOlLGi/3N2l6bc/VKygoyqs6qUoDE7XQOXK2Ye
	aMCYt2nf6usxB8Jj2aW6VY7u47uJYNRKuGupiJSfJs8U/jEjObP6nuUzeD0j4nMjebJhLUB6o/KVQ
	ZfEZaU+e0VFWuJYCZ/x7LVafqtQ/jTYA4nX1a6YMyoH01jxMPOaYf/TcNvWL6bkh5jm7c3BH8O2Jv
	nC4E6Dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPjk-00000006EID-3qOA;
	Mon, 12 Jan 2026 21:46:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPjj-00000006EI6-2MWc
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 21:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 70CA56000A;
	Mon, 12 Jan 2026 21:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C9BC116D0;
	Mon, 12 Jan 2026 21:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768254366;
	bh=+A7nQFMk6BRPZjLEa0VYC39l7M4sHP9QSmOHqvMF7xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bX5JX1Grl3nbFcEKpaj45bcdJsFiuhmR3dWVC8VCVXk76K4H9xCRYzRG/Aol6Gs5B
	 OfQK3kb3n+sbGOisprw0w41eHMeCdZ3+XCRHu09e3ixHgoqY5e/KUVibawqQ5SacSi
	 obZbL45Ra+LOhjA4FuI18kyXK/3z713bRnFJeH6+LHfv9vxlD4RKQ01hbHGxw2rAfs
	 1ZJFTcKn+vC/9nkrIIggwswNuGLNCqf6Sb71OLYWMeNOue8TEnvc7LDlq07fAGA7Z5
	 xgiaL1f+4QfLgjNd6oczPE1lq+jinbsqajrOMgciogHocp63w4d8H5AC+5buYug3/6
	 poUA/rY+FHejA==
Date: Mon, 12 Jan 2026 21:45:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Message-ID: <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============5797916435705565992=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5797916435705565992==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eGeDqA2+RAjxIlOp"
Content-Disposition: inline


--eGeDqA2+RAjxIlOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 01:18:12PM +0800, Guodong Xu wrote:

> Hi, Conor
>=20
> For the binding riscv/extensions.ymal, here's what changed in v3 (no
> change in v4):
>=20
>  1. Dropped the patch of adding "supm" into extensions.yaml. At the same
>     time, I will start another patchset which implements the strategy
>     outlined by Conor in Link [2] and by Samuel in Link [3].

Okay, that seems reasonable to separate out.

>=20
>  2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
>     6 others. "sha" implies these extensions, and it should be allowed
>     to be declared independently. Like "a" implies "zaamo" and "zalrsc".
>=20
>  3. Enchanced the dependency check of "ziccamoa" on "a". Specifically,
>      - added the dependency check of "ziccamoa" on "zaamo" or on "a".
>      - added the dependency check of "za64rs" on "zalrsc" or on "a".
>      - added the dependency check of "ziccrse" on "zalrsc" or "a".
>     The commit message of this patch is updated too, to better explain the
>     relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".
>=20
>  4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making t=
he
>     dependency check in both directions, as discussed in [4]. Since "b"
>     was ratified much later than its component extensions (zba/zbb/zbs),
>     existing software and kernels expect these explicit strings. This
>     bidirectional check ensures cores declaring "b" remain compatible
>     with older software that only recognizes zba/zbb/zbs.

This I asked about in the relevant patch, I would like to know what your
plan for adding the "b"s is.

Spacemit folks, I assume you weren't planning on taking the
extensions.yaml stuff via your tree? If you weren't, I'll grab it once
the question about b is answered.

--eGeDqA2+RAjxIlOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWVrlgAKCRB4tDGHoIJi
0st5AQDVaFm0gq6ucDRxlFFW8jqtiLUa1O+EbmMgmTfjYPiaGAEAyjt/iYppXkBk
aori5mGpiMWtHrLZBCiZPe+bPh6TpAY=
=kYkG
-----END PGP SIGNATURE-----

--eGeDqA2+RAjxIlOp--


--===============5797916435705565992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5797916435705565992==--

