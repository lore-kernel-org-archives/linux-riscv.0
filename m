Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C24C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o1DKy8G+o5ZZq2DgP+9UwlzralPeccTPdka9EYg+qw=; b=Yyhu9aGe/DMOw9Ygr/o8w/UtSy
	JBDHE2+Pls2ehkgOxqybk/b1IGMvBvzPEi6YuDrMMqW4wtyjrOXQqng3Hh6+rogLf5P5v+GlyB0Ym
	2jy5B+20nbniZtdFlhrqYCDn+0z7jgqVu9Ietsb8Xf/O/EsmyZ6JP7smoUsEhSjL4/tRShhevpZd5
	tedIHd+QD2MBLvlSdxPfPCrJ4oQQTs+AMlL//4XhFDrfWUowp0miTMyhZyfhbzws4Lbum4pXvY21m
	pl78+65Pn3rYIXEeHxN6YWYruHNafd4QNGefXiLATw+3xLMNuHJX+v72oV2/xFVjC30oaYw3g/rzV
	ngMkGzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSGx-00000006pqi-0otX;
	Wed, 26 Jun 2024 13:01:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSGt-00000006ppt-38Va
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7DDACE188E;
	Wed, 26 Jun 2024 13:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D1FC2BD10;
	Wed, 26 Jun 2024 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719406868;
	bh=LHeTQI/EG08BqcLmj/c6DAyrQ+SL5WbhoXdoBVZAOQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFS5hd3CD8DZ7yeuONQZpeaDwCO4Upy5tjkEZ4FxeP2eIgY753Z5E/Cb+tnmUztN5
	 Ox43HBMMZmxi0NozVQuAkcaCsRzBEfql9mxqtiMy8VRnkWBcMvPDKgJOMbVlXfPACT
	 +6cQQz3LarWWjHU+9lpBExowXyizZ5MF3EWPjoZt6rVVB9/f4sWEF4MX0y4GlYc9FB
	 ruZjAC8Db6D5D+dq8OQEMNHJ/Reqp/Uf/VMFsAMe27dufQovIMS9ECREc/X/1Pmigv
	 ZKbT74kXIs5BlQUFe42BmG+1RUTllnkFc+A/5P693GAqiSD3Oqi16fPMbAqticO/IH
	 wZ+TnOyV4QJfg==
Date: Wed, 26 Jun 2024 14:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: jesse@rivosinc.com, jrtc27@jrtc27.com, corbet@lwn.net,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	cleger@rivosinc.com, evan@rivosinc.com, conor.dooley@microchip.com,
	costa.shul@redhat.com, andy.chiu@sifive.com,
	samitolvanen@google.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3] RISC-V: Provide the frequency of time CSR via hwprobe
Message-ID: <20240626-prolonged-overlap-91fec0188fc7@spud>
References: <20240622025514.66537-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240622025514.66537-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060112_164034_D3645B47 
X-CRM114-Status: GOOD (  20.14  )
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
Content-Type: multipart/mixed; boundary="===============4565139412831354405=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4565139412831354405==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5K1t+tDRpgMuz99f"
Content-Disposition: inline


--5K1t+tDRpgMuz99f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 10:55:14AM +0800, Yunhui Cui wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> A handful of user-visible behavior is based on the frequency of the
> time CSR.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---

What changed between this version and the previous one? You need to
include changelogs under the --- for this purpose.

Thanks,
Conor.

>  Documentation/arch/riscv/hwprobe.rst  | 2 ++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>  4 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index df5045103e73..ec3c99474ed7 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -233,3 +233,5 @@ The following keys are defined:
> =20
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time=
 CSR`.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 150a9877b0af..ef01c182af2b 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
> =20
>  #include <uapi/asm/hwprobe.h>
> =20
> -#define RISCV_HWPROBE_MAX_KEY 7
> +#define RISCV_HWPROBE_MAX_KEY 8
> =20
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 2fb8a8185e7a..5053a9b18710 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -74,6 +74,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
> +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> =20
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index e4ec9166339f..3d47edc04a3f 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -8,6 +8,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
> +#include <asm/delay.h>
>  #include <asm/sbi.h>
>  #include <asm/switch_to.h>
>  #include <asm/uaccess.h>
> @@ -227,6 +228,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>  			pair->value =3D riscv_cboz_block_size;
>  		break;
> =20
> +	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> +		pair->value =3D riscv_timebase;
> +		break;
> +
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
>  	 * call, but get their element key set to -1 and value set to 0
> --=20
> 2.20.1
>=20
>=20

--5K1t+tDRpgMuz99f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwRDgAKCRB4tDGHoIJi
0nTbAQCNyBtB3Liky8HfdaZbV+GDO5qG2b5gf2wYff8cvHMUxAEAroBQnv/vxmEF
db83NiP6oferELS+7/FG8X8juV26oQ0=
=LRlJ
-----END PGP SIGNATURE-----

--5K1t+tDRpgMuz99f--


--===============4565139412831354405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4565139412831354405==--

