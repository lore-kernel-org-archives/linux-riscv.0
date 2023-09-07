Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F50CEE14D0
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY1acaLoUAsjTh1xmQJpx3cBE/eluAr0/kwj62JwK/o=; b=MyCWcKQJ/o/w27Ah7r5yhyEKMx
	4ji2o9Bsmwzqerz5k27dsXTGHTsIcto8U3jdpQCY/J1NzBF9kdY1ztiTMZJy9i9Dc/6ay8lRsw6VV
	JQ9ZM9u2c9GLjTzM/4lQfhLK3fDq3H2n5xQrsKEQkckzAYsR8AadhaZSJdIAtiaW/9beeP2rlx8QD
	tA2k67DmwJw8CXYiqK5Z5d/NUYoHokCZt+GmB+9EVB6BNQvH5gVNhGjkhzcj7xbltxdPIgFKgKeG4
	jM3S4oW7WmZu6Oi5VwZEDbqW4Mqt0aSIPlES4foI4i0MKFPjj2nspjplMJ1F/jYaR5F+6bzsoHs1i
	cgmLAqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBcQ-00BiKO-0I;
	Thu, 07 Sep 2023 09:48:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBcM-00BiJR-09
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 09:48:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0092BCE10A8;
	Thu,  7 Sep 2023 09:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F35CC433BA;
	Thu,  7 Sep 2023 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694080080;
	bh=ioGfmHzP2GjyiqSrlbgIeRZSwKKtv0WFrj6DT7aSlks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLg+V3E9qaY9ombLvd77WkJ4/u93T3ZxXYPB4JdXuB2oOzxLDlNH9me5cEiN8IEDD
	 hgdcdLXevKfMKThzJM3m0rYD9+Ykd5RhvO6XkbmVQ3PBaJKr+e5VHPHJVgj8FSMtqh
	 seudiFFp8FoptyZa7+75TrW0fR3Kqzi4Ddu8I1Pv3m8x4haMO+ce/alSOsvuWix0vn
	 mlfkBLMWtqfw88o/g6UpO5As/0Hq8PDu2TIysni9GCEfqpMNA7Pz7fB9XBNw3RoHgl
	 6XBIZDE/7Ok4eCoxfG8mDSQELRd/uBlK54ZtotPlOlmfTPFBkJiRSwLAkPjdhKXxBt
	 IpVH2dLHk7Dpg==
Date: Thu, 7 Sep 2023 10:47:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2 3/5] riscv: Vector checksum header
Message-ID: <20230907-c23868a1016a17299a470120@fedora>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_024806_447680_B7636DCC 
X-CRM114-Status: GOOD (  25.63  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5759473281836172362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5759473281836172362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yWEbZ60EvanaedV2"
Content-Disposition: inline


--yWEbZ60EvanaedV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:46:52PM -0700, Charlie Jenkins wrote:
> Vector code is written in assembly rather than using the GCC vector
> instrinsics because they did not provide optimal code. Vector
> instrinsic types are still used so the inline assembly can
> appropriately select vector registers. However, this code cannot be
> merged yet because it is currently not possible to use vector
> instrinsics in the kernel because vector support needs to be directly
> enabled by assembly.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h | 87 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/c=
hecksum.h
> index 3f9d5a202e95..1d6c23cd1221 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -10,6 +10,10 @@
>  #include <linux/in6.h>
>  #include <linux/uaccess.h>
> =20
> +#ifdef CONFIG_RISCV_ISA_V
> +#include <riscv_vector.h>
> +#endif
> +
>  #ifdef CONFIG_32BIT
>  typedef unsigned int csum_t;
>  #else
> @@ -43,6 +47,89 @@ static inline __sum16 csum_fold(__wsum sum)
>   */
>  static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  {
> +#ifdef CONFIG_RISCV_ISA_V
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		/*
> +		 * Vector is likely available when the kernel is compiled with
> +		 * vector support, so nop when vector is available and jump when
> +		 * vector is not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_vector]", "nop", 0,
> +					      RISCV_ISA_EXT_v, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_vector);
> +	} else {
> +		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_v))
> +			goto no_vector;
> +	}

Silly question maybe, but is this complexity required?
If you were to go and do
	if (!has_vector())
		goto no_vector
is there any meaningful difference difference in performance?


> +
> +	vuint64m1_t prev_buffer;
> +	vuint32m1_t curr_buffer;
> +	unsigned int vl;
> +#ifdef CONFIG_32_BIT
> +	csum_t high_result, low_result;
> +
> +	riscv_v_enable();
> +	asm(".option push						\n\
> +	.option arch, +v						\n\
> +	vsetivli x0, 1, e64, ta, ma					\n\
> +	vmv.v.i %[prev_buffer], 0					\n\
> +	1:								\n\
> +	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
> +	vle32.v %[curr_buffer], (%[iph])				\n\
> +	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
> +	sub %[ihl], %[ihl], %[vl]					\n\
> +	slli %[vl], %[vl], 2						\n\

Also, could you please try to align the operands for asm stuff?
It makes quite a difference to readability.

Thanks,
Conor.

> +	add %[iph], %[vl], %[iph]					\n\
> +	# If not all of iph could fit into vector reg, do another sum	\n\
> +	bne %[ihl], zero, 1b						\n\
> +	vsetivli x0, 1, e64, m1, ta, ma					\n\
> +	vmv.x.s %[low_result], %[prev_buffer]				\n\
> +	addi %[vl], x0, 32						\n\
> +	vsrl.vx %[prev_buffer], %[prev_buffer], %[vl]			\n\
> +	vmv.x.s %[high_result], %[prev_buffer]				\n\
> +	.option pop"
> +	: [vl] "=3D&r" (vl), [prev_buffer] "=3D&vd" (prev_buffer),
> +		[curr_buffer] "=3D&vd" (curr_buffer),
> +		[high_result] "=3D&r" (high_result),
> +		[low_result] "=3D&r" (low_result)
> +	: [iph] "r" (iph), [ihl] "r" (ihl));
> +	riscv_v_disable();
> +
> +	high_result +=3D low_result;
> +	high_result +=3D high_result < low_result;
> +#else // !CONFIG_32_BIT
> +	csum_t result;
> +
> +	riscv_v_enable();
> +	asm(".option push						\n\
> +	.option arch, +v						\n\
> +	vsetivli x0, 1, e64, ta, ma					\n\
> +	vmv.v.i %[prev_buffer], 0					\n\
> +	1:								\n\
> +	# Setup 32-bit sum of iph					\n\
> +	vsetvli %[vl], %[ihl], e32, m1, ta, ma				\n\
> +	vle32.v %[curr_buffer], (%[iph])				\n\
> +	# Sum each 32-bit segment of iph that can fit into a vector reg	\n\
> +	vwredsumu.vs %[prev_buffer], %[curr_buffer], %[prev_buffer]     \n\
> +	subw %[ihl], %[ihl], %[vl]					\n\
> +	slli %[vl], %[vl], 2						\n\
> +	addw %[iph], %[vl], %[iph]					\n\
> +	# If not all of iph could fit into vector reg, do another sum	\n\
> +	bne %[ihl], zero, 1b						\n\
> +	vsetvli x0, x0, e64, m1, ta, ma					\n\
> +	vmv.x.s %[result], %[prev_buffer]				\n\
> +	.option pop"
> +	: [vl] "=3D&r" (vl), [prev_buffer] "=3D&vd" (prev_buffer),
> +		[curr_buffer] "=3D&vd" (curr_buffer), [result] "=3D&r" (result)
> +	: [iph] "r" (iph), [ihl] "r" (ihl));
> +	riscv_v_disable();
> +#endif // !CONFIG_32_BIT
> +no_vector:
> +#endif // !CONFIG_RISCV_ISA_V
> +
>  	csum_t csum =3D 0;
>  	int pos =3D 0;
> =20
>=20
> --=20
> 2.42.0
>=20

--yWEbZ60EvanaedV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPmcSwAKCRB4tDGHoIJi
0vRZAP0ZzhCs5vuiNpTlPt5BMdF0YNy9cfs2lZWKaag7QXHn7wEA4ERG47/qqF3a
avJy0xAtqa0LYQnJFnR6V2NQdmXA0gg=
=XGt0
-----END PGP SIGNATURE-----

--yWEbZ60EvanaedV2--


--===============5759473281836172362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5759473281836172362==--

