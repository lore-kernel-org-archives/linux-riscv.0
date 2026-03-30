Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A94310D14AD
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1j2YvRYiM++fH2YwqkrqbttQ5VOVvL1njhiRUfE/d0=; b=juysrrolIC+nTUG4RNgCcs54wX
	ab5rYSm4KPNgsSpoGGiJUmYSuJdHs4llDNfoA/auanLGuXib5pFfaWov60M6JK+16qio77iHF5OKC
	vVjiKzCBc1y9b2qHAGjenmkYdv7vZvqKUdcX8cv0S1v/dAMPrGZAi8OO2hTg3hlHX1IBnreF45EzM
	G0i4+7xJKmp4yGJaIG2UVNpNknd9BsHTymOQyJu6q7aoIugl7sXPcKzfFYuNCjK7+3x2ed1xEHuH3
	co/1axaE6uZ6iAFz3c8etEU2NSfuksR/yOUTnmrrJiEoIelCP30KIXm28COG4zEIpq/sRETnNYyU2
	4LO7gkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CD6-0000000BIlT-077l;
	Mon, 30 Mar 2026 12:59:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CD4-0000000BIlK-3Lzz
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 12:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EDFB600AE;
	Mon, 30 Mar 2026 12:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08037C4CEF7;
	Mon, 30 Mar 2026 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774875553;
	bh=2nMZ/t93heba7Ewg6MwnlysL3ltrvhPtua6z1ntkAXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cV84wDS9qjq2QosI85WvoM+eX6kEAZLrkGtKGJmESZT9PCbZXAOpqkw0zbhXstKR/
	 2aSfUQ+T3N0eZIiQ/ECNEeOCnhB3v4Q8/OAQNM89ehi0rQ3BjYDfmx6+z+jqP7rqMx
	 AUCbivu0IScofz8qFq+zIAPE8fafAc+1001PpgFeOTUqWYoK6FBCldtuAv6k7u4gPL
	 TQuQXIYlFAeozuLBFcHc0nM0ybk0IEr6wb91X9XnLVzDMgNqZ3zqPHmH0GeALQg47Q
	 5BRknXvT2RDwRmemFOEiyoRzImWAGtQpU2T9nZPRcBAiNKzCQr+KdYKM7zx/5S/xNZ
	 GxJt4743eppuA==
Date: Mon, 30 Mar 2026 13:59:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Songsong Zhang <U2FsdGVkX1@gmail.com>
Subject: Re: [PATCH] riscv: misaligned: Make enabling delegation depend on
 BROKEN
Message-ID: <20260330-sensation-pronounce-98f8b14836ed@spud>
References: <20260330-riscv-misaligned-dont-delegate-v1-1-68b089b306c3@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260330-riscv-misaligned-dont-delegate-v1-1-68b089b306c3@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============0102044147951254132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0102044147951254132==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWQWbSmWWiEp/KUt"
Content-Disposition: inline


--iWQWbSmWWiEp/KUt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 02:47:15PM +0800, Vivian Wang wrote:
> The unaligned access emulation code in Linux has various deficiencies.
> For example, it doesn't emulate vector instructions [1], and doesn't
> emulate KVM guest accesses. Therefore, requesting misaligned exception
> delegation with SBI FWFT actually regresses userspace and KVM guest
> behavior. Until Linux can handle it properly, guard these sbi_fwft_set()
> calls behind RISCV_SBI_FWFT_DELEGATE_MISALIGNED, which in turn depends
> on BROKEN.
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
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Cl=E9ment: Sorry to call what you did broken, but it really is breaking
> on real hardware out there. I think this is the right way for now.
> ---
>  arch/riscv/Kconfig                   | 14 ++++++++++++++
>  arch/riscv/kernel/traps_misaligned.c |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 90c531e6abf5..8ad1f13c170e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -941,6 +941,20 @@ config RISCV_VECTOR_MISALIGNED
>  	help
>  	  Enable detecting support for vector misaligned loads and stores.
> =20
> +config RISCV_SBI_FWFT_DELEGATE_MISALIGNED
> +	bool "Request firmware delegation of unaligned access exceptions"
> +	depends on RISCV_SBI
> +	depends on BROKEN

Making it hard to enable I think makes a lot of sense, given the issues
you're reporting but I tacking on BROKEN will remove effectively all
build coverage of it* and will definitely stop almost anyone using it.
Should it be just made NONPORTABLE with the text about being incomplete
expanded a wee bit to say what is broken so that people can make a
decision?

Cheers,
Conor.

*it's like 10 lines, probably an irrelevant concern.


> +	help
> +	  Use SBI FWFT to request delegation of load address misaligned and
> +	  store address misaligned exceptions, if possible, and prefer Linux
> +	  kernel emulation of these accesses to firmware emulation.
> +
> +	  Since the Linux kernel's emulation is incomplete, enabling this may
> +	  cause unexpected userspace and KVM guest crashes.
> +
> +	  If you don't know what to do here, say N.
> +
>  choice
>  	prompt "Unaligned Accesses Support"
>  	default RISCV_PROBE_UNALIGNED_ACCESS
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index 2a27d3ff4ac6..81b7682e6c6d 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -584,7 +584,7 @@ static int cpu_online_check_unaligned_access_emulated=
(unsigned int cpu)
> =20
>  static bool misaligned_traps_delegated;
> =20
> -#ifdef CONFIG_RISCV_SBI
> +#if defined(CONFIG_RISCV_SBI_FWFT_DELEGATE_MISALIGNED)
> =20
>  static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
>  {
>=20
> ---
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
> change-id: 20260330-riscv-misaligned-dont-delegate-3cf98c76ee08
>=20
> Best regards,
> --=20
> Vivian "dramforever" Wang
>=20

--iWQWbSmWWiEp/KUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacpznQAKCRB4tDGHoIJi
0hkBAQDLloJ2fsCkxVn1n0lWLGYSOeBvS86X8gtY70GiztI0rAD8CbWMLIRmoLSw
E2fmbtPFRc4u5kgT7YeYGqXCoGiiBAE=
=aHnI
-----END PGP SIGNATURE-----

--iWQWbSmWWiEp/KUt--


--===============0102044147951254132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0102044147951254132==--

