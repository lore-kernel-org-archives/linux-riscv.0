Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722E3C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYgIrvtMcIXOsbypW+psOqs0dQC7iH5JhjQRekbCatk=; b=dbiJWmg0vYXSEtpuZZfz8G1hnJ
	ei2I2sVNlfLHeMKLkgyHDS6nz0AcLhOy5Ocdkozf3rRABjE86a6qcb6MIUPgI8U7wymHCAxGqQQMe
	wnUJNQ7Qxh++UpQp25v3UTqjL6KmowbOAso/zym6XFrOZZBXtYlkY3hvJZInYYLXPofVKfMJIsBUQ
	chehY9eAT+asHKCAECRychfQenlHuMsAcjbpBBcxRDkuk4quxbhXpmkTnyyZ0r+opsEOVrjI2jPAa
	g5dJq28PGWwAsPGRE8FZ9xfGOSaTFqlMosJh0d9XZJhQNQSF40SIdbQeVubAChsIiEwA88u2L17dN
	yvwEp4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1kp-00000005r2S-225D;
	Tue, 12 Mar 2024 13:01:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1km-00000005r1k-1Dtv
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 13:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12C20CE16D8;
	Tue, 12 Mar 2024 13:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83815C433F1;
	Tue, 12 Mar 2024 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710248469;
	bh=E/HSGAUwUXQLIIpKX9P71u5Y1wMIeE/MJWzcsejsY4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mn2bZ93QdA6PiIhU7lYa9hZnO+c1bNGXLqo/8gWZu5C2F7yLgQp7BRmiLjWT3D7Jn
	 AhyrXeFAVa1dMqUbjdexMlJAuySe/mN+M2MggPb4TujnMGB4yqyy8qiqxJ10bBPCPg
	 L0mqDUu9YvllSJJE5ICTmAdhdtcug59+NfwtiZ1DFvL1WSvmkY/8qGl+mPGpi+x8cB
	 K65Ve7xt7vywwjWV/FAbYhslSmRGz0/uh80epUbvPhMls+4GYEf9uXEwyqt+6vqXDP
	 Y+ZzHE3GqtxOgN3TjvPzFjYgZXIdgcDUEDmGBocEsL3h7C9pnMltl8lAuPKxZlm2aa
	 xM2ZllfvhnFpQ==
Date: Tue, 12 Mar 2024 13:01:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [v1, 1/6] riscv: vector: add a comment when calling
 riscv_setup_vsize()
Message-ID: <20240312-unissued-triangle-76c41bc592c8@spud>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-2-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240312123627.9285-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_060112_532390_86D4F82E 
X-CRM114-Status: GOOD (  21.29  )
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
Content-Type: multipart/mixed; boundary="===============4511956900124263791=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4511956900124263791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1DRAktlrY+IFBbc1"
Content-Disposition: inline


--1DRAktlrY+IFBbc1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 08:36:22PM +0800, Andy Chiu wrote:
> The function would fail when it detects the calling hart's vlen doesn't
> match the first one's. The boot hart is the first hart calling this
> function during riscv_fill_hwcap, so it is impossible to fail here. Add
> a comment about this behavior.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 89920f84d0a3..1b21f1e568e1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -671,6 +671,10 @@ void __init riscv_fill_hwcap(void)
>  	}
> =20
>  	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +		/*
> +		 * This callsite can't fail here. This is the first time we
> +		 * call during boot,

> so riscv_v_vsize must be zero.

The last part of this comment does not make sense, just say that it
cannot fail when called on the boot hart and leave it at that.

> +		 */
>  		riscv_v_setup_vsize();
>  		/*
>  		 * ISA string in device tree might have 'v' flag, but
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--1DRAktlrY+IFBbc1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBSEAAKCRB4tDGHoIJi
0s36AP9zAoFgpoZx6YoXOIOGPGg+XfeRtSNgan5Xf8tmQPCN3wD/dBgH59Jc1twr
5bWbQiiXxtWkjJzHuiy8A0PsCoGSKQs=
=yd87
-----END PGP SIGNATURE-----

--1DRAktlrY+IFBbc1--


--===============4511956900124263791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4511956900124263791==--

