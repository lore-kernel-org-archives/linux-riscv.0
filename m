Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB3BC3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QltSgPao9y6FNXTKcCjOTbU1swV7yDVgyu+gR4tqIsE=; b=fguh14VfNaRZHhmqNfxW1H3Upr
	F1fP/BvsauAxa635kze6SWXF7yUX+/iqHAgXgZh0IBCsxxEbMZy+aCXEA3zlD+bfqNeMdkFJ7IvJj
	meJ5LI48vpdG6ZNA1zUlzrOl8v6ODlO4bcWvpEkwMnGkB3KKlowr9GvKmWqg0qHSyfCS+tb9GwqOg
	hziSRTSnxNPqmZoA4/fN6H98ZHfwjDUQKrTm6pBD3hdxyv+vhRCTF6F+D+FUYot+CGE4KNYtwwgFr
	5slcYA1JieykpEuGavRlQGHpacwU05/c/KdwWd9k1bnss1xM1oloiOhrBD/AP1YDCwc5AXbKseEZS
	j+zY5BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYFc-0000000AoSQ-3OkP;
	Wed, 10 Jul 2024 14:24:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYFa-0000000AoQa-08ww
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 14:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD22CCE16CF;
	Wed, 10 Jul 2024 14:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D842C32781;
	Wed, 10 Jul 2024 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720621437;
	bh=7YzqRCYnt7MuRGKtu80TloyRA0Nph6JUjkvK5cC5ud8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWaCs5LUsTpKJj42IbfEAwUsNLAWqYFKeFrXCk3URlSPK6zaYnls3Oq16pN1OlB7J
	 oGfzI7n7RBIZa3f+94nTLNN/LgCSjSb0CwitQxM8kIw7hjfwtZ9pOoUfqSo2QJFMSe
	 DzFGTqODIJn33YbOUmgnlGUzGVsSmxnaiyOT2O5Hmi81z7QmZxNEDuREx3W+hS2/VV
	 3LYsp4YiMZPDteQciLofyO4O6apxU8/x9km1ZLQn6KyDzF2aZ9zvGeoWjZDvT4cpry
	 K+CGflRVXCNzWaTMoeWF5usQM3pIKgkpDUTCMwSbIJuAZ/U84rg4NSPQ40q7RO30Jz
	 x44kwur+s3THA==
Date: Wed, 10 Jul 2024 15:23:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v4 4/4] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240710-stroller-serve-3ab5d6d8d5a1@spud>
References: <20240709173937.510084-1-jesse@rivosinc.com>
 <20240709173937.510084-5-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240709173937.510084-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_072454_259026_B4610736 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: multipart/mixed; boundary="===============2619709462749607615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2619709462749607615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7zh9yYUyOTKyeTN/"
Content-Disposition: inline


--7zh9yYUyOTKyeTN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 01:39:37PM -0400, Jesse Taube wrote:
> Parse the device tree for Zkr in the isa string.
> If Zkr is present, use it to seed the kernel base address.
>=20
> On an ACPI system, as of this commit, there is no easy way to check if
> Zkr is present. Blindly running the instruction isn't an option as;
> we have to be able to trust the firmware.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Zong Li <zong.li@sifive.com>

My heads a bit addled from being sick still, but I think you've dealt
with the things I had send on the previous version and I didn't spot any
obvious problems with the parsing.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--7zh9yYUyOTKyeTN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZo6ZdgAKCRB4tDGHoIJi
0pyWAQC29yv8Hh+seQ8rlWltrhX7hdTycKox6W76tesnacZjZgEA89qbqP3Fetxj
ie+EVMpvY5yVfOsu3tnzj8YF1fnwGw4=
=WyJk
-----END PGP SIGNATURE-----

--7zh9yYUyOTKyeTN/--


--===============2619709462749607615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2619709462749607615==--

