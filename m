Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5040EC25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MO1Rnl9uqYf5kthxCWTUsyShI02SUNbktIyVqxhXKs=; b=VIWiJqfVhSSxuSmukqDLq/EuiD
	bj0i9I/GvkYXFcGONwUFmj2XeUBReUTetai3bTmnj4aT2kt7dKL0rm7mZq93tzbISElrsQTE+Bv/1
	QXP2iNQk7+wKWNU95wrQix6zAvcEDNHnf9g31i6repdxAtE7aLYQOj2Dg7xT0oBDFblVq19e+MiCb
	j9r1yoDb0OsaZd7LyLHUnopW1t5KV79SL8D2s5SPkSoaPBT2RzAa4XrHYPQgTCJPUT8LxlmP6qJGm
	bXlSHE2DjmL2kfNp9nlvHEzSFVgdNYdeGag5RjqXjdaJhvbStAIes4dJhO25/SN+H80R3Z0mei0e2
	0yLQvFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv2D-000000076Gm-2b04;
	Wed, 05 Jun 2024 18:06:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv29-000000076Fk-1l8X
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 18:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A59FCE18BE;
	Wed,  5 Jun 2024 18:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8F6C2BD11;
	Wed,  5 Jun 2024 18:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717610806;
	bh=5WLgWmi7391vEDkONzbYlVsXiq5rBsI0l3Wft0d2pmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLjJiy2Ri4l+KMnvg98/r6lSB63VeIuqIbk66sBo6whE1DzQNBHsIsYsJWDgxFLGs
	 JT7LntNOIe98YiQPQrXDmdIMI/BSdjYlu+csdYXmRLjRjjzFCIcPsAGEnm1rgEFFPI
	 goVMzhoB3T6U2YlyZgkevetfl0IzC4SyYK1ma0//MGkpZkt25Ptk/9K8du9BZHH29E
	 RPHRjlgT3WeZo2+VO+f2p0y/yl+3/ExMeImgsPXUXb8w1/5CE3sx7oKIOXJ0bQCAj0
	 yAN4rRhLd2JWa19Rw87TTXl8wJcnn0wqWnrUTlMNM4xxNR/r5E1u4IFakHd2mEIOkK
	 x0dwlIamvULsQ==
Date: Wed, 5 Jun 2024 19:06:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com,
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com,
	beeman@rivosinc.com, brauner@kernel.org, heiko@sntech.de,
	irogers@google.com, mingo@redhat.com, james.clark@arm.com,
	renyu.zj@linux.alibaba.com, jolsa@kernel.org,
	jisheng.teoh@starfivetech.com, palmer@dabbelt.com,
	tech-control-transfer-records@lists.riscv.org, will@kernel.org,
	kaiwenxue1@gmail.com
Subject: Re: [PATCH RFC 3/6] riscv: perf: Add Control Transfer Records
 extension parsing
Message-ID: <20240605-thaw-giant-87eb299c43d0@spud>
References: <20240529185337.182722-1-rkanwal@rivosinc.com>
 <20240529185337.182722-4-rkanwal@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240529185337.182722-4-rkanwal@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110650_011940_31961199 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Type: multipart/mixed; boundary="===============0096508900542001513=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0096508900542001513==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RRX4c9uXLV2+FCJl"
Content-Disposition: inline


--RRX4c9uXLV2+FCJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 07:53:34PM +0100, Rajnesh Kanwal wrote:
> Adding CTR extension in ISA extension map to lookup for extension
> availability.
>=20
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Same comment here about $subject.

You're also missing dt-bindings for the extension.

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h | 4 ++++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b8cc459ee8a4..aff5ef398671 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -86,6 +86,8 @@
>  #define RISCV_ISA_EXT_SSCCFG            77
>  #define RISCV_ISA_EXT_SMCDELEG          78
>  #define RISCV_ISA_EXT_SMCNTRPMF         79
> +#define RISCV_ISA_EXT_SMCTR             80
> +#define RISCV_ISA_EXT_SSCTR             81
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> @@ -95,9 +97,11 @@
>  #ifdef CONFIG_RISCV_M_MODE
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
>  #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
> +#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
>  #else
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
>  #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
> +#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
>  #endif
> =20
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index d1fb6a8c5492..4334d822b2f2 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -298,6 +298,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
> +	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
>  	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
> @@ -305,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
>  	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> +	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> --=20
> 2.34.1
>=20

--RRX4c9uXLV2+FCJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCpMAAKCRB4tDGHoIJi
0kEpAQCsOUjZl8R2wNCVzJXQJV4UjjC09oI/oJy7iOQTgrCXpgD/bslLlxazlWXA
89hLVyp5e76pm/wa8mAGOes1wwKLNgo=
=memG
-----END PGP SIGNATURE-----

--RRX4c9uXLV2+FCJl--


--===============0096508900542001513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0096508900542001513==--

