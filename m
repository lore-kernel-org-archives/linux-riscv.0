Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0266EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoWCVZaYZnfmnNrXpEBcK7Q3jzBOZhQ3UQhjHrQxWXI=; b=JtvUsffHVDLNTKl9Q8Qj4mFz/n
	sWjgrh/tJlJ6E6erFDEPyhOuXDZa0MmtE+npCfpHC/6LefRxZISn8Uhrk26MxCUle/+lbzEwzkIqB
	b4P/yS0swz+8zVH9aiVOdvmIbc126ypNL8uYg/cd0qykanHdxc6syi1Di5ZknHudIY32Px0gSmKyJ
	PcPh5p7MItM8SV7mPMxbB3HHH8oZDcrue/reOEruLRHihfWWk+mbHRKiRdyCbAQzhL5F9kxnmPbuE
	I+nIpljBqNX4sjL0FCxRyJs9ks1F3kFo9D68tMUexgvj9Mu03fqpZ9FtWBVdAm9zqxv7aDq+5mHen
	5CNyprwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQZv-00888K-31;
	Sun, 25 Jun 2023 14:18:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQZs-00887g-2o
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 14:18:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1967160B6A;
	Sun, 25 Jun 2023 14:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E25C433C0;
	Sun, 25 Jun 2023 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687702735;
	bh=eELfk8BQQe7CSBA1iViJovL7FyC1t3NJ0tuD7vTmyyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNXdu/oCbHxoBS+wFq3/5UImorTTdWG2vHm2+aiAyQ3F+c4thmF5h7y1s0Z/sqCEL
	 r6oCgQWbH9xBIWkZyMUfsKMGV6+7qW7BF6rj4BmUV8bc6IGe0BEqjRMVHPtwz5MGsK
	 4jwICroWdLTP2blCrg9TFA3u4BxmHa/uUlITI7BtPgdFd+N0peZuqpoaJZtz1H2seE
	 CJrBc4t/6mozEt46hA1+veLpWtwABU1dZU2T1WPupvcwvxyq8pae+31n0w1aRs0T5j
	 8MUR0o/yRahFEVBF2ixv+l75TsRm2C3Vy5JBU4b7K46jDmUtC8K9wEVDxnJXEuoWb9
	 TxSZ6WirPDFfw==
Date: Sun, 25 Jun 2023 15:18:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, mpe@ellerman.id.au, arnd@arndb.de,
	rppt@kernel.org, samuel@sholland.org, panqinglin2020@iscas.ac.cn,
	conor.dooley@microchip.com, anup@brainfault.org,
	xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com,
	heiko@sntech.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
Message-ID: <20230625-multiple-diaper-1db88a75314e@spud>
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
 <20230625140931.1266216-2-songshuaishuai@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230625140931.1266216-2-songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071856_985044_AEAEFFB5 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Type: multipart/mixed; boundary="===============4730979491246772864=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4730979491246772864==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5rU6R4tPsIYzsO+l"
Content-Disposition: inline


--5rU6R4tPsIYzsO+l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 10:09:29PM +0800, Song Shuai wrote:
> This reverts commit ed309ce522185583b163bd0c74f0d9f299fe1826.
>=20
> With the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the
> linear mapping") reverted, the MIN_MEMBLOCK_ADDR points the kernel
> load address which was placed at a PMD boundary.

> And firmware always
> correctly mark resident memory, or memory protected with PMP as
> per the devicetree specification and/or the UEFI specification.

But this is not true? The versions of OpenSBI that you mention in your
cover letter do not do this.
Please explain.

> So those regions will not be mapped in the linear mapping and they
> can be safely saved/restored by hibernation.
>=20
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/riscv/Kconfig | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5966ad97c30c..17b5fc7f54d4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -800,11 +800,8 @@ menu "Power management options"
> =20
>  source "kernel/power/Kconfig"
> =20
> -# Hibernation is only possible on systems where the SBI implementation h=
as
> -# marked its reserved memory as not accessible from, or does not run
> -# from the same memory as, Linux
>  config ARCH_HIBERNATION_POSSIBLE
> -	def_bool NONPORTABLE
> +	def_bool y
> =20
>  config ARCH_HIBERNATION_HEADER
>  	def_bool HIBERNATION
> --=20
> 2.20.1
>=20

--5rU6R4tPsIYzsO+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJhMyQAKCRB4tDGHoIJi
0ilaAP4rih3tvcajCwDW0SHvhQ9DqWJq0Zn2Vm8HAQG/CfO9vgEAmBEyl28RPpUW
ZzBaowc8mzQh7JPK2GtFXOBJBQKwxwE=
=/uWn
-----END PGP SIGNATURE-----

--5rU6R4tPsIYzsO+l--


--===============4730979491246772864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4730979491246772864==--

