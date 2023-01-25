Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C099AC54EED
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqRpkfJpiCzCuKZY3iVOhRSsc5AAqcP29/HdJTuIVo4=; b=epTTpFXRQ6EseaYZLF0KSe0JgS
	JhRwhTCKdR27oMwwAOet83YBqWM0RWoh70d0ZocfFY1Sk56d59NXQS4+1NliIbAYTEdlY+IMFFyhE
	eyU8BoE4uz30VBl2/bM9LRFCsa5OrTleKOVP6QNN9Nri05UKmqLcEVLulHA/H6plEkvHpSYjo+N+o
	VPjAlC4Y9c/u2+52o6ml25xvmqSFKVNeQDj9n7UAYPxX6PWEbS95B/4Qxd1ou31dGm0KHartyxAZH
	zAwwYyN3F2p5Elu48Vx9BAwdvCdjFt2nBwTjVi6BJbyCp/QApW4IsppANQxxX5n0jAlrF4xeZTeZr
	VYPqjekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnif-008v0D-RZ; Wed, 25 Jan 2023 21:54:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnic-008uyu-TR; Wed, 25 Jan 2023 21:54:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 689B161637;
	Wed, 25 Jan 2023 21:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F26C433EF;
	Wed, 25 Jan 2023 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674683649;
	bh=ZN1uW23vOmhcaFY+mNFCJHfLFOBnYP+iaRziojbCcPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcvdHMggvX0H1zSapjMQFMNDQkuqHeHY+dFA8VYvbhjA4tmzSmNfeXznC5+ECr3T4
	 LDZAeXz60xABhlXpoZ8S5qRSGhxRzkejKpY//kw0NU5MPfzDl2ZwZvaiK407lN1Kl2
	 D46xbzqoCWE+wOWGAKwyhe9G/Kw/1/OvSwx3nuYpwK/whHP/y9NDXP86B2T1C1Ty4I
	 5Zf/F2DJ/unSZEPVulAmm8QTVlBYB5dK9mzIyxJiaCn7PHjY5qlZSWq1SDrVU+gHQb
	 PqM8cy5DuOydazxHlPxKzBX/JLU/CZpkA4V9Yc44O6YCh1p2Q4Arvj4kyFn/4u6sPz
	 xn93rZFQ6oPDA==
Date: Wed, 25 Jan 2023 21:54:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH -next v13 04/19] riscv: Clear vector regfile on bootup
Message-ID: <Y9Gk/FCFBbWC/Pyi@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-5-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_135411_041934_2B52E99D 
X-CRM114-Status: GOOD (  19.44  )
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
Content-Type: multipart/mixed; boundary="===============3706195508274702401=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3706195508274702401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QkQd2AdTGvM4bKJV"
Content-Disposition: inline


--QkQd2AdTGvM4bKJV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:41PM +0000, Andy Chiu wrote:
> clear vector registers on boot if kernel supports V.
>=20
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: broke this out to a seperate patch]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

But this patch didn't carry over the long list of contributors from it's
source? Seems a bit odd, that's all.
There was also an Rb from Palmer that got dropped too. Was that
intentional?
https://lore.kernel.org/linux-riscv/20220921214439.1491510-6-stillson@rivos=
inc.com/

Thanks,
Conor.

> ---
>  arch/riscv/kernel/head.S | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index b865046e4dbb..ea803c96eeff 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -431,6 +431,29 @@ ENTRY(reset_regs)
>  	csrw	fcsr, 0
>  	/* note that the caller must clear SR_FS */
>  #endif /* CONFIG_FPU */
> +
> +#ifdef CONFIG_RISCV_ISA_V
> +	csrr	t0, CSR_MISA
> +	li	t1, COMPAT_HWCAP_ISA_V
> +	and	t0, t0, t1
> +	beqz	t0, .Lreset_regs_done
> +
> +	/*
> +	 * Clear vector registers and reset vcsr
> +	 * VLMAX has a defined value, VLEN is a constant,
> +	 * and this form of vsetvli is defined to set vl to VLMAX.
> +	 */
> +	li	t1, SR_VS
> +	csrs	CSR_STATUS, t1
> +	csrs	CSR_VCSR, x0
> +	vsetvli t1, x0, e8, m8, ta, ma
> +	vmv.v.i v0, 0
> +	vmv.v.i v8, 0
> +	vmv.v.i v16, 0
> +	vmv.v.i v24, 0
> +	/* note that the caller must clear SR_VS */
> +#endif /* CONFIG_RISCV_ISA_V */
> +
>  .Lreset_regs_done:
>  	ret
>  END(reset_regs)
> --=20
> 2.17.1
>=20

--QkQd2AdTGvM4bKJV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9Gk/AAKCRB4tDGHoIJi
0rg7AQDBkFQa3C0x2AvR7Zwiq+OLiMQanh8SjizKjJSc5xZCEQD9EPpHQR7bMN94
zDloGjv3VwUaOSGmqFOplaI2vx4d1QM=
=6ee2
-----END PGP SIGNATURE-----

--QkQd2AdTGvM4bKJV--


--===============3706195508274702401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3706195508274702401==--

