Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5776C54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNWD13RZ8KsFp099icGfl94dhdWA0qETiks2LyRbvqU=; b=ODIenMC2cU5BNKTbMWoJMqVOMN
	TRuZOjj/27Og+rVnjKC9wVnExwPMRTIMs9+A6ZY7FF6iQGFsDSbYxVa/bUwB4K5fanqi+rig3xCt2
	jEHc9190KnfIEdNEG4OUVk5kCZpj6KMRu4QiMWLEmnvnIDLzydv7wE74IjbUqH1LQuzHDWPiCozkl
	meFssEqMyAv38Rvljb8gdBGW50/gT5XpEtS/J2QIrqItEfel7AEW3jhJGNW0eMzXFFMZL3y/fr/cX
	Y+6eLAqhHSEQnI/53dFQsy1SALFdiX3zoAPlFGHHATxb7kbSKOxIm6oKmS/TR5v01tWUebILxr4pJ
	0maKyOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL9jq-00CbRx-8o; Thu, 26 Jan 2023 21:24:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL9jn-00CbRM-6I; Thu, 26 Jan 2023 21:24:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0EEFB81F21;
	Thu, 26 Jan 2023 21:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB51C433EF;
	Thu, 26 Jan 2023 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674768285;
	bh=luqlVhEbetEToBmyzWO92pNHVb5a7EEXGPmVX+vqcR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGouwijeXy1umKpYKvOLV3pT2AQ9hvUg5np+iOd58CdrGiQi9ive25w5fAqJwVEdX
	 S3LfXa03CaSaHZSjTQgmsxPuv9vJKKtnuGuMdE21rECcRyWgXZ61DZYB5pdbtn3hVI
	 byOt3Mx5+wlu6eDLFaRM669ND8rPBR2EvUG1P2H58G7qJztdrJO3/kZjqIfgB0/luw
	 lCsglhidkfLbkxOHTTUopMyKCT8rRBUsc9f64htXhxB2cM6nSjgQGlM+83rHBahth8
	 wb+VTZjFIPV5yfDcI/i+iN8J4RFMu/hq5IB7xPWPdDP1wOktNu2mQu4TR7WDpS3KsU
	 zPDK/eyUVJa8Q==
Date: Thu, 26 Jan 2023 21:24:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH -next v13 07/19] riscv: Introduce riscv_vsize to record
 size of Vector context
Message-ID: <Y9LvltKhEIa5q3Ji@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-8-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-8-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_132451_562377_994A073B 
X-CRM114-Status: GOOD (  25.05  )
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
Content-Type: multipart/mixed; boundary="===============7772208141725612791=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7772208141725612791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yVxqZRNVlMvgnfvG"
Content-Disposition: inline


--yVxqZRNVlMvgnfvG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey again Andy!

On Wed, Jan 25, 2023 at 02:20:44PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch is used to detect the size of CPU vector registers and use
> riscv_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system.
>=20
> [guoren@linux.alibaba.com: add has_vector checking]
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/vector.h |  3 +++
>  arch/riscv/kernel/cpufeature.c  | 12 +++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 0fda0faf5277..16cb4a1c1230 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -13,6 +13,8 @@
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
> =20
> +extern unsigned long riscv_vsize;

Hmm, naming this with a riscv_v_ prefix too would be good I think.

> +
>  static __always_inline bool has_vector(void)
>  {
>  	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTO=
R]);
> @@ -31,6 +33,7 @@ static __always_inline void rvv_disable(void)
>  #else /* ! CONFIG_RISCV_ISA_V  */
> =20
>  static __always_inline bool has_vector(void) { return false; }
> +#define riscv_vsize (0)
> =20
>  #endif /* CONFIG_RISCV_ISA_V */
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index c433899542ff..3aaae4e0b963 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -21,6 +21,7 @@
>  #include <asm/processor.h>
>  #include <asm/smp.h>
>  #include <asm/switch_to.h>
> +#include <asm/vector.h>
> =20
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> =20
> @@ -31,6 +32,10 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __=
read_mostly;
> =20
>  DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>  EXPORT_SYMBOL(riscv_isa_ext_keys);
> +#ifdef CONFIG_RISCV_ISA_V
> +unsigned long riscv_vsize __read_mostly;
> +EXPORT_SYMBOL_GPL(riscv_vsize);
> +#endif

I really don't think that this should be in here at all. IMO, this
should be moved out to vector.c or something along those lines and...

> =20
>  /**
>   * riscv_isa_extension_base() - Get base extension word
> @@ -258,7 +263,12 @@ void __init riscv_fill_hwcap(void)
>  	}
> =20
>  	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> -#ifndef CONFIG_RISCV_ISA_V
> +#ifdef CONFIG_RISCV_ISA_V
> +		/* There are 32 vector registers with vlenb length. */
> +		rvv_enable();
> +		riscv_vsize =3D csr_read(CSR_VLENB) * 32;
> +		rvv_disable();
> +#else

=2E..so should all of this code, especially the csr_read(). vector.c
would then provide the actual implementation, and vector.h would provide
an implementation with an empty function body.
The code here could the, following my previous suggestion of
IS_ENABLED() look along the lines of:
	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
		if (IS_ENABLED(CONFIG_RISCV_ISA_V))
			riscv_v_setup_vsize();
		else
			elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
	}

Having the csr_read() in particular looks rather out of place to me in
this file. Better off keeping the vector stuff together & having
unneeded ifdefs is my pet peeve ;)

Thanks,
Conor.

--yVxqZRNVlMvgnfvG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LvlgAKCRB4tDGHoIJi
0s8wAQCQ95n8aRO64+ZGQZL9lgfLa7RuurhJvSSBuZswO824LwEA+J9kNto4P/yw
gTSF+6o+sq1iEg1iD8vvY70J1uwN+wo=
=h6ks
-----END PGP SIGNATURE-----

--yVxqZRNVlMvgnfvG--


--===============7772208141725612791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7772208141725612791==--

