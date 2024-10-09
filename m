Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377D0CEE35E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 22:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKNjx94tKScolx+uW2GWLdUW7+W44Z0YJswZPaZX3YY=; b=Wkq+yN12KeXqgZ3glQ0aksgImJ
	93yKV9QiIdIcECnd1zFaSxpckcGg1qAJDHjdVxDi/N2vZl3Z4N9pY7PywUqHK0eYai+vrZMdYfSVl
	NngcI0Lq9R3DccxW0dB0wp96F2aUCgqQ0+K7Gh+OPUHNADbGLAn0rVjkTEniaW89EZVuQOTchq8xu
	eq7pRKst84MKfDT25bqT2So4J4lprRkhzZbNv5lrhKiYIo/58sGC1F2clT1vCLmjAc1C1uu4eUZIR
	bI1UfgMG66fwwdMKPfOBsUMLyjgB3pxDd2LpcsLl1rdyc2hlKH/JjbCVBQ5FfHnZHeR59LEHaLTdR
	WKIWxOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syfXl-0000000Ayg1-1rlv;
	Wed, 09 Oct 2024 22:52:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syfXi-0000000AyfY-3G3O
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 22:52:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98C645C555C;
	Wed,  9 Oct 2024 22:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B556C4CEC3;
	Wed,  9 Oct 2024 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728514349;
	bh=2DpsgIC2xB71M9j4e8NiR2ZDb0cZVWPP969bZsamMWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oE314xCcsktTLph2aDLrxjDWtbYCtywhl6o9feGp2GnNJaagXf6V0osJD/EgorZWr
	 MOe69SILnOZIaJCk/xuX9Ncw6n0yUK1TxKZueDdN5DlD5vBnIUiEsHi5jNzS4VJGkF
	 8cLH9yeNPgdgOoqyBvOC587WUrJ2wQiIXK5PLnmi0l5r9zzUo0i6y0BD9URZ4ZexGQ
	 cCS94Wh5UXOXiOV/W8TjqbeJxSsfGhc87Zk6q4E1DCvjRejTjulnvoySGXb4Wxpjlr
	 gQwxYB09kC+0+dQCKQOEAvKk75Idne0opaa+15E3eCaCmqHWdJbiGNivhIlRHicY/V
	 FWLpEPYGkb8QA==
Date: Wed, 9 Oct 2024 23:52:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>, Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2044 ACLINT SSWI
Message-ID: <20241009-retool-decorated-f6f7b61119ab@spud>
References: <20241009224410.53188-1-inochiama@gmail.com>
 <20241009224410.53188-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241009224410.53188-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_155230_880615_734DAA76 
X-CRM114-Status: GOOD (  11.88  )
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
Content-Type: multipart/mixed; boundary="===============6357833122131623635=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6357833122131623635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mORKp+RCsc5th9HZ"
Content-Disposition: inline


--mORKp+RCsc5th9HZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 06:44:07AM +0800, Inochi Amaoto wrote:
> Sophgo SG2044 has a new version of T-HEAD C920, which implement
> a fully featured ACLINT device. This ACLINT has an extra SSWI
> field to support fast S-mode IPI.
>=20
> Add necessary compatible string for the T-HEAD ACLINT sswi device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

This is not a complaint about speed of reposting, but I do have
outstanding thoughts on the previous version of the patch. I've just
been really busy with work this week and not yet had a chance to get
back to you on it. I'll, hopefully, get there tomorrow.

--mORKp+RCsc5th9HZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZwcJJgAKCRB4tDGHoIJi
0leXAQDu/yK6OUIRAlXZ9jiK2OQUR90cLjuSBNWMpu5QDGZr+AEAyqf4vq9FHoNV
FdDEIVwNZH0JxVX3zAAZ9TjJiaveUAo=
=wYUM
-----END PGP SIGNATURE-----

--mORKp+RCsc5th9HZ--


--===============6357833122131623635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6357833122131623635==--

