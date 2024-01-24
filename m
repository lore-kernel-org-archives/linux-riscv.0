Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED2AC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbDTWK3PTJFvvb8btyL39gyMXRJeyVE1Z6hNK6XPlJ0=; b=nQbgmkTO6tQyq0ueq2ZgLWDSLj
	F1wIJ3yT5ilKtiebuQ7+/yYptx4tnWzCthF1S5gkdKHcz+Hq6MrxASTBNkvy0EhkuVQN6aVyFaPt9
	9e2Z1/SLKIXgboAhCvWUJ9Yx/Lz9LXyvIjzxDRuyKN48Zv4Fq8lJh2zr5gPK8Pm0Dc2GdeA9Nnxom
	9HWstFrgMinUMoNBbW5MyPeCBO8ptaE6CkoBdq2AcS4FueVNGLH7qbo7oCQXuRBgpfSYsJmVtY5D8
	Il60yrXc+H2Mf7PJTh3wgb56keZRZtx2lxns6jo4LO88eGAMDgmKgWWDnStyogLb4nGXxAB4UaGoe
	CVvBRKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSd49-003QRN-2k;
	Wed, 24 Jan 2024 13:13:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSd47-003QQu-0q
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 13:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C059E61D2D;
	Wed, 24 Jan 2024 13:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0589C433F1;
	Wed, 24 Jan 2024 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706101994;
	bh=KGeZvlAqiPq+tIJnrTOUt/sJCpygyPMHbqd2idZAwa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Byu477HZlSIFcbqSozjxnoNGiIStzdaoUwlqBIPvBghMziwQ3To0TtuU5PDPu47Qe
	 cGgvlRrYwDNvmPNGkeKdrgf452ysWpKfyl+XUtfv7mUcmP7T8X896SIY2yHGXPr2/1
	 ZwatBMeO2MEgp6b79QkvSUqbVYBYNenfGvGVVnAwL6aAyTNIWKqeTERPAb7gWONcqU
	 xd5wgPey5RVQVbgM8DiOaaiuNcOtPxLt4eZztMvvqGTgsUVFM7ipJJI1Ty5FVVUxnt
	 s4hGv6zcQlgkUk2pYjM7Xe7pHjXy30CNIt6FAhue6XKWyiQlYWAyeuz4RC/CWWU4WG
	 Fkd3OBZvXtFUg==
Date: Wed, 24 Jan 2024 13:13:10 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: qemu-devel@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org,
	LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: qemu riscv, thead c906, Linux boot regression
Message-ID: <20240124-sliceable-atom-c87a10922d4b@spud>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_051315_343119_8EBFE86A 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Type: multipart/mixed; boundary="===============8679116086881796517=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8679116086881796517==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="50gCHqVI7AApEjFm"
Content-Disposition: inline


--50gCHqVI7AApEjFm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 01:49:51PM +0100, Bj=F6rn T=F6pel wrote:
> Hi!
>=20
> I bumped the RISC-V Linux kernel CI to use qemu 8.2.0, and realized that
> thead c906 didn't boot anymore. Bisection points to commit d6a427e2c0b2
> ("target/riscv/cpu.c: restrict 'marchid' value")
>=20
> Reverting that commit, or the hack below solves the boot issue:
>=20
> --8<--
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8cbfc7e781ad..e18596c8a55a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -505,6 +505,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      cpu->cfg.ext_xtheadsync =3D true;
> =20
>      cpu->cfg.mvendorid =3D THEAD_VENDOR_ID;
> +    cpu->cfg.marchid =3D ((QEMU_VERSION_MAJOR << 16) |
> +                        (QEMU_VERSION_MINOR << 8)  |
> +                        (QEMU_VERSION_MICRO));
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_SV39);
>  #endif
> --8<--
>=20
> I'm unsure what the correct qemu way of adding a default value is,
> or if c906 should have a proper marchid.

The "correct" marchid/mimpid values for the c906 are zero.

I haven't looked into the code at all, so I am "assuming" that it is
being zero intialised at present. Linux applies the errata fixups for
the c906 when archid and impid are both zero - so your patch will avoid
these fixups being applied.
Do you think that perhaps the emulation in QEMU does not support what
the kernel uses once then errata fixups are enabled?

>=20
> Maybe Christoph or Zhiwei can answer?
>=20
> qemu command-line:
> qemu-system-riscv64 -nodefaults -nographic -machine virt,acpi=3Doff \
>    -cpu thead-c906 ...
>=20
>=20
> Thanks,
> Bj=F6rn
>=20

--50gCHqVI7AApEjFm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbEM5gAKCRB4tDGHoIJi
0pdeAQDubx/QpNR/H7YLx9BAU3JO3EpMscsk9nuvi9pbRDm0IAEA0HpPoxl00Yh8
+8Jk59KPWEYS/6r5QgUGDUnNUM5I+QE=
=oxK+
-----END PGP SIGNATURE-----

--50gCHqVI7AApEjFm--


--===============8679116086881796517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8679116086881796517==--

