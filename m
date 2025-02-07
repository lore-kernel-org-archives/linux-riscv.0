Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDACC0219B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 00:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8GABQ0uZfV9HXIavS/HWdQaVcgrYckQSAsvAATCxa0=; b=c5ovBcpT16xcUgCZnGblY4u5ee
	vyx7x2R4tKIC7I+iyLqLiKGz514rxf/aPa1g/P+uIZaMZs8PzwFzFV9rt8gThwY7bjfjqH+klIFx4
	BSqtjewU0PKtcrXEBKTvwYHjlpM15/2xtGO3JLUjHbCSp/PY62CNAZo8cpMtahYVZ7o2DxU8oVdVW
	8Vzn6p8yfUD/1wZn3i5UJUwxQvqD7bZgbMmgCKKcKpmNH7mL2+sRrz88vt5v19x1ZvsFN4cOer8x9
	DYV3gmIJuKKS39psWdaNFFTj0ABDoNLpFFEOx+7kFDgivrqc+571fkHKfsq6AUioIa+01S359eM/A
	dO5XeEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgBsi-00000007qU8-10hG;
	Fri, 07 Feb 2025 00:06:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgBpm-00000007qBD-0YcJ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 00:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0301DA449F0;
	Fri,  7 Feb 2025 00:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BD0C4CEDD;
	Fri,  7 Feb 2025 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738886580;
	bh=jFU7fO5yQm432EwC+/7/qkrCLs+tSpaeUFSBEO2zKYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKGCSTsIwsjMvT03gam8wglLzm/Bd16TS3xWgPWta+891d35c3vLwNOdmspvw3mEM
	 lsgBEBDKgwey6xn8NIrt4b2asYF8rrzKtLtzZXXGgFehKI3+Jo/a54bpo7+IQ3NcX8
	 c+xN718OG5MSzD8liCmbsFhAnB4T/5g3KhNNo1R6VHN57f83gYelUJ9wGnYTNPHFU+
	 NsVWxFDDMm1caVDwHxpNtY290/8EVT5nwHMuYsNdPgokYjRA9/dCAGqlvDtvzVPwQf
	 +vZtcSkmb2M4j+kH1zzf3mZPoWXLflfpwuPkWmr/Yr0eIzRROfLJ80IWQ/DCkUaP9+
	 fwxGeiP3pMRhA==
Date: Fri, 7 Feb 2025 00:02:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20250206-prong-sandfish-417a3bf9de29@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <20250206203249.GC1237@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20250206203249.GC1237@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_160302_243222_B6EAF626 
X-CRM114-Status: GOOD (  13.56  )
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
Content-Type: multipart/mixed; boundary="===============7134397742083758875=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7134397742083758875==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IZJucm0+VF10qkQ0"
Content-Disposition: inline


--IZJucm0+VF10qkQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 12:32:49PM -0800, Eric Biggers wrote:
> On Wed, Feb 05, 2025 at 04:05:08PM +0000, Conor Dooley wrote:
> > The 1.0.0 Vector crypto spec states:
> > 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> > 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> > 	or application ("V") base Vector Extension. All of the other
> > 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> > 	application ("V") base Vector Extension.
>=20
> As previously discussed, the above paragraph incorrectly lists the set of=
 crypto
> extensions that require support for 64-bit elements.  I have fixed this i=
n the
> latest RISC-V ISA manual.  It looks like this patch would still do the sa=
me
> thing either way, since it actually just checks that vector is available =
in some
> form.  But this is not the best version of the manual to quote from.

/sigh, I updated the binding commit message but not the code one. That
one should probably change too, given that's now merged.
That's a stupid oversight, thanks.

--IZJucm0+VF10qkQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6VNsAAKCRB4tDGHoIJi
0hAuAQDNV4s4Ij8PSTwiHujFDprhlcxQkhi3bLa7A2lFvdIJKgD/cAFZR2Jwg3RN
bDVM7Pp/OSKNt+5qMoFzqfkTMPr17Q4=
=/epo
-----END PGP SIGNATURE-----

--IZJucm0+VF10qkQ0--


--===============7134397742083758875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7134397742083758875==--

