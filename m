Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12662D35151
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnAulew6ntrOXPE1UjxsEuP0Y7fnJmhBBB7qsdC2r/o=; b=GxpSd8nw2IU4c7LxQpX6ozqVIH
	4yB3ns4VpXapy6pP629fFvZFfL4NXd2pNSgfrVP3dcca1zfkSZkA+O+cpCvfHTPXvN2OONZHyGPMZ
	hQxqhCbJ2+ugGPRvLWGhleO1bxmA3Diid7UpufvJFWZwjazWL8vg5TMACCQSDNIfjDMvT4Rp55MPb
	0nMD7bNJ3/jFicDzKMpsLMyUTJhHnzdcHVAmByWmaXqYf5R0hqbjQUap3j5/NzCMNrzmKB8pGaqn+
	J+hnnU36LdY1M/axNLYhmBxp1ViAlVDRZ0ksTcH07YxoBnOo7dj2bF97nP3w2IHguZ9JpMWAB8QMm
	bERsFPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rNz-0000000EM5f-2AEf;
	Wed, 01 Apr 2026 08:57:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rNx-0000000EM5O-3ocQ
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 08:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13E37600AD;
	Wed,  1 Apr 2026 08:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB02FC4CEF7;
	Wed,  1 Apr 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775033832;
	bh=HFqB/PAbyCZ2H+Qy8HsiLXNyTHciRpm9ySdIFFZdpmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPv/Y1YCdRdUKsMmJ3Ro3bep/bA2BXJF0llJRD5hF0nQSfrmOgPeBNTNAGzZ53oAW
	 nApSkhw+kqpaxACBfNT5j376+9TyLpkcJdM1Q0w6K7ij0d4Q4ZsRNsP0l6iOIaXX62
	 zLEhV16DrwazjfGUCqESQ9Hvkzz73NSs62pInOFWZjT9DjY+BEffQeFjj8KwR7GidZ
	 MN7V22ZuYwgj17jSpThMz1eHyaiF+HRuN+/rtX+MvWZiDIFKlXs3jV1PAI8QFGmeVg
	 fifdBhphQ5bC9FAdzE+dlvM87fm7LMWfoAvuE+piLPZ+zX4o5w++C1b4QMfA3fGzRl
	 feJMqkLAcNyvg==
Date: Wed, 1 Apr 2026 09:57:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Songsong Zhang <U2FsdGVkX1@gmail.com>
Subject: Re: [PATCH v2] riscv: misaligned: Make enabling delegation depend on
 NONPORTABLE
Message-ID: <20260401-revocable-tropical-2f52d14e787d@spud>
References: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============8207052614338834213=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8207052614338834213==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hpiXizl6p0EYn3K4"
Content-Disposition: inline


--hpiXizl6p0EYn3K4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 09:53:17AM +0800, Vivian Wang wrote:
> The unaligned access emulation code in Linux has various deficiencies.
> For example, it doesn't emulate vector instructions [1] [2], and doesn't
> emulate KVM guest accesses. Therefore, requesting misaligned exception
> delegation with SBI FWFT actually regresses vector instructions' and KVM
> guests' behavior.
>=20
> Until Linux can handle it properly, guard these sbi_fwft_set() calls
> behind RISCV_SBI_FWFT_DELEGATE_MISALIGNED, which in turn depends on
> NONPORTABLE. Those who are sure that this wouldn't be a problem can
> enable this option, perhaps getting better performance.
>=20
> The rest of the existing code proceeds as before, except as if
> SBI_FWFT_MISALIGNED_EXC_DELEG is not available, to handle any remaining
> address misaligned exceptions on a best-effort basis. The KVM SBI FWFT
> implementation is also not touched, but it is disabled if the firmware
> emulates unaligned accesses.
>=20
> Cc: stable@vger.kernel.org
> Fixes: cf5a8abc6560 ("riscv: misaligned: request misaligned exception fro=
m SBI")
> Reported-by: Songsong Zhang <U2FsdGVkX1@gmail.com> # KVM
> Link: https://lore.kernel.org/linux-riscv/38ce44c1-08cf-4e3f-8ade-20da224=
f529c@iscas.ac.cn/ [1]
> Link: https://lore.kernel.org/linux-riscv/b3cfcdac-0337-4db0-a611-258f286=
8855f@iscas.ac.cn/ [2]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--hpiXizl6p0EYn3K4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaczd5AAKCRB4tDGHoIJi
0gJNAQD9puXaqMoYlOgb9l0qTA1VVkfJWqp34EhIpn/V/x3TNwEArFjrRZBufhrk
HNKCnm8VYHwn6OpEBmTjirdSrRQeAAA=
=gCbu
-----END PGP SIGNATURE-----

--hpiXizl6p0EYn3K4--


--===============8207052614338834213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8207052614338834213==--

