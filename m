Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E4BC48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UEFO8OG+U++4lgI5a/cF9t4GmPEcD8RA6cf08DjE00=; b=XvA14ZlZG4axZffSYG/QpwiVol
	txwyLzQn7rRdFpcNSb8dB2+76Hdo6MuQiUppYfQynEYTNeYsWqcNlgEu/NRf6ejSDqniWwoUQeNyT
	TWmJk/InuMyp7UIJNQnPleVhptWaJXHzk2A1gyVhY7txn5qxOWZw0HHzkNH179WrLW4gBuxtVZp+j
	+xkME7PexSnnOlhfsH5T7TIv4yd+57GJp9AZX7IkiHibp6qxwc9eykzlzJMS5vrO5U5SWUZxgsUCn
	285e0x7CZci5CVl4MXYUdQM23sSPd8P0EUnEFY3KVW1jr4AtaUVkzDgh+9qChh7Xxer7WtP4/Zwt/
	R/IGpc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbgcj-00000007jcC-0tJN;
	Sun, 18 Feb 2024 12:50:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbgcf-00000007jb9-1lMm;
	Sun, 18 Feb 2024 12:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F149CE0BA9;
	Sun, 18 Feb 2024 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FFAC433F1;
	Sun, 18 Feb 2024 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708260616;
	bh=ZOuHC5/gemoLsv0gAHH7UQAs52/xaQ/OjKNR4b7C5iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSRhxkunjvuVg+kQQrNev5yXaSd763FyHTmF8BVOi3oTkf5Yz8WIvE/LNareLfcxr
	 GB9AZQ25nviU4M8kNbK1Dpg454Eli1ortScnmzbw7i20Ji3RYdJkpkqh9qDyFeXYfz
	 Xf0yGZkd6whMp2e8tr8Ay0mtu1J/d9AaY8P03GQsC+8xKQM2Bm4j/RCIZbTg9cWKKA
	 bCZ/TwBhym8gTzbH/oWsYVkoVdPHeCB8VRQxdj1QkPcti/61YXZ17jD0pzJPkYa+U0
	 LwOEGuHNJX8SoWikhUPsGQusnIFa0aXaswxiHjizlSzfw7ifaj/nU9NzNMuV1ikYnD
	 7PB3+V1R9PTJQ==
Date: Sun, 18 Feb 2024 12:50:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	devicetree@vger.kernel.org, Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>, Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com, Yang Jihong <yangjihong1@huawei.com>
Subject: Re: [PATCH RFC 09/20] RISC-V: Add Smcntrpmf extension parsing
Message-ID: <20240218-contort-profile-53593ed8d391@spud>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
 <20240217005738.3744121-10-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240217005738.3744121-10-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_045021_828923_7181DD52 
X-CRM114-Status: GOOD (  17.22  )
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
Content-Type: multipart/mixed; boundary="===============4702519436331203709=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4702519436331203709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jbzKRUs6kj78gPRQ"
Content-Disposition: inline


--jbzKRUs6kj78gPRQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 04:57:27PM -0800, Atish Patra wrote:
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> only available only in Ssccfg only Smcntrpmf is present.

There's some typos in this opening paragraph that makes it hard to
follow.

>=20
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 5f4401e221ee..b82a8d7a9b3b 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -84,6 +84,7 @@
>  #define RISCV_ISA_EXT_SMCSRIND		75
>  #define RISCV_ISA_EXT_SSCCFG            76
>  #define RISCV_ISA_EXT_SMCDELEG          77
> +#define RISCV_ISA_EXT_SMCNTRPMF         78
> =20
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 77cc5dbd73bf..c30be2c924e7 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -302,6 +302,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
>  	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
> --=20
> 2.34.1
>=20

--jbzKRUs6kj78gPRQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdH8/gAKCRB4tDGHoIJi
0isjAP4q6xpgI0SAprv3/kjAyM2CkWmD6mwTd7LPsrl/J8GTIwEAn19T671J/0t4
0ezPoULwYy8T4LILe16iToWJlXnvhAk=
=28GE
-----END PGP SIGNATURE-----

--jbzKRUs6kj78gPRQ--


--===============4702519436331203709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4702519436331203709==--

