Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9F6CA0EFF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 19:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwW61eASVK7Xi61ReLgPlgIHCV5SacNyHTury0nIRiE=; b=RCZtE1LsVo0JvFI+kdU32uLmVp
	KX8qRt5XSs9Ylc+B66f3UIjPAGuo+Z1lSMcfRC+iGS4Q8AwIlWh+7lAHHCtLAjwCUVqmZw9MOW6nT
	GbcAGQQqnH5nmmtMinpwrX/VYp+RZ6wuutVqjlxhfjLaHMjHRjCQbsmg/OYLixQV4cEzRzbtxIisP
	5nOc1Fr6/dsZmeuby6exOgvZCYxBavBIQkTBLcLQO0DHRqb5BNgo5DiUM/ewlGDYIzMhGdzghmMMZ
	tL0zmW7hd9FbBdlcDf3oLUMjnudhypqlCmHlakUVKJVm2HlOh6Tsqr5NQbnHAJiVyEiUoYb9800UX
	1CPyLONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLxl-0000000GdCj-319g;
	Wed, 27 Aug 2025 19:37:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJyb-0000000GJz2-1HgI
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 17:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD0FA43A2F;
	Wed, 27 Aug 2025 17:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63903C4CEEB;
	Wed, 27 Aug 2025 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315824;
	bh=Ldgiz2GuhClXg2UMzhvrhRQZw+hw5GM8cArSw82JF+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0e/LOgJd7QkDQDg3xUk1b/IonFPtKv3Ose5FChrXmLTxjK51M3zyyh58Z8sAsKe4
	 rtS2V9znGQBdhjPkmzmZX7yATlsMN8ckZSv1zfyPdluJnoUCdj4PLDJMC6tWnmZPxf
	 gwz0oDhhYiASTeJ+f1/KtZVGswWr1pQewyaLt4qMWQkPKvTI+YuwDgv4rJmi3jfNXa
	 Cc/QN2y3OnBX7/+bK4hKMCdI8eAz8H4vKpAa68rZpB4ae9K3DNS0VJ+G7k9gFCAt8l
	 DuJpbPyVh+FCGTteDib5L0UI2GMiDSakSb0kply6F0H6u3ijeSgjFMpb3ihjmIQ7oj
	 7WN+FwfS9Dq/w==
Date: Wed, 27 Aug 2025 18:30:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	patches@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 09/12] riscv: Remove ld.lld version checks from many
 TOOLCHAIN_HAS configs
Message-ID: <20250827-unvalued-imprison-3ce3ce4275b4@spud>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-9-635f3294e5f0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-9-635f3294e5f0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_103025_371510_DDEB95FD 
X-CRM114-Status: GOOD (  10.43  )
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
Content-Type: multipart/mixed; boundary="===============1524271989442942267=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1524271989442942267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R5mG8D6tas3Pwbly"
Content-Disposition: inline


--R5mG8D6tas3Pwbly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 02:15:46PM -0700, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, several ld.lld version checks become
> tautological, as they are always true. Replace them with a simple
> CONFIG_LD_IS_LLD check.
>=20
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--R5mG8D6tas3Pwbly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK9ArAAKCRB4tDGHoIJi
0invAPsG/JWS08f2B17slnzm+vAHqLKU1mIw4NastP78Wr2ZoAEA6h2+WO0ujNy5
0Vb5WxYNkKBy6X/GNAseBfozgSuxpAA=
=6SKS
-----END PGP SIGNATURE-----

--R5mG8D6tas3Pwbly--


--===============1524271989442942267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1524271989442942267==--

