Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8E5C71153
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 01:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxfnHfWRW5bcoaomjOIdHTLx/Yw5YE8WPtpvaeI088A=; b=al6LWdjWe3N5llOa9uEcSPzG2I
	LW4rnIocIFe0XyBSyJKklIlyCumgC2V1SW/899xYaKthqmh9xMnwHDbun1rnSV4xA8vyQGm6iUbQz
	UFURRQTd65msvhV9n9/c3/KOQDMmZKloLEHIX2/et48E6meAyNre273hssEJX57/x5gq7zQMvUqvo
	rKEISApiFnr04e0AuN1+JL1NvPD/CvwKkvghowbQgju2VOZ8ilIgYsCEvJWNaeajNUgaz8a/lwihB
	vrFnNqnaILJPynuNXN8i/dh+KpQHaqckWNsF0KNu4zj10Gobq0RKCQH9bosCe8bNVdrwkHyKEJxRD
	ZvfAfJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4ni-007NXU-05;
	Sun, 27 Aug 2023 01:42:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4nf-007NWy-16
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 01:42:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01FF660C6B;
	Sun, 27 Aug 2023 01:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEDDC433C8;
	Sun, 27 Aug 2023 01:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693100565;
	bh=N1Tp3URo53WXHDUa7LANqGVyvrY+vDBSLIvHpEQgAKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVS3BLuCLtx9xwEvHYcMVRtpLW9QAg6cPC03h6lX0u5HXjs5tyIe29T+SIeB4squB
	 D3ObRqDXGMErt9KbV9vnY3ZVyDbgfUSLH07NZs2IlcojqYrZ3qSQqrDe7ud4KLUbOu
	 9zcILYLLusN0RraqxwBCcfDUI1DjcWuYt4HprrH6AYuWteDPewvqiQxFDWqDBygQ7L
	 VOCqyIQlVwYNK5l7uat7j9Bjizz3e8B00kTGX/9vKcC9YrYnueQWizfXn9TEBH3xiV
	 mHN9GeCYtG7hoVPDwYJr25FgSUARwXzPb/+ISZFp13kweOKn8A3Foh2cz47FDM3Tkx
	 81NTrB7TOYF8A==
Date: Sun, 27 Aug 2023 02:42:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 1/5] riscv: Checksum header
Message-ID: <20230827-turf-parched-b965bc697882@spud>
References: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
 <20230826-optimize_checksum-v1-1-937501b4522a@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230826-optimize_checksum-v1-1-937501b4522a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_184247_490307_4E9746C3 
X-CRM114-Status: GOOD (  22.64  )
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
Content-Type: multipart/mixed; boundary="===============9000753367831562125=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9000753367831562125==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9cGvEmoU1B0QAhNd"
Content-Disposition: inline


--9cGvEmoU1B0QAhNd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
>=20
> Add configuration for Zba extension and add march for Zba and Zbb.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig                | 23 +++++++++++
>  arch/riscv/Makefile               |  2 +
>  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 111 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..8d7e475ca28d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config TOOLCHAIN_HAS_ZBA
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zba)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zba)
> +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZBA
> +	bool "Zba extension support for bit manipulation instructions"
> +	depends on TOOLCHAIN_HAS_ZBA
> +	depends on MMU
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZBA
> +	   extension (basic bit manipulation) and enable its usage.
> +
> +	   The Zba extension provides instructions to accelerate a number
> +	   of bit-specific address creation operations.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6ec6d52a4180..51fa3f67fc9a 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
>  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
>  riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:=3D $(riscv-march-y)_zba
> +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:=3D $(riscv-march-y)_zbb

AFAICT, this is going to break immediately on any system that enables
RISCV_ISA_ZBA (which will happen by default) but does not support the
extension. You made the option depend on RISCV_ALTERNATIVE, but I do
not see any use of alternatives in the code to actually perform the
dynamic detection of Zba.
Note that for fd & v, we add it to riscv-march-y, but then immediately
remove it again before passing to the compiler, only allow them in
AFLAGS:
	# Remove F,D,V from isa string for all. Keep extensions between "fd" and "=
v" by
	# matching non-v and non-multi-letter extensions out with the filter ([^v_=
]*)
	KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(rv3=
2ima|rv64ima)fd([^v_]*)v?/\1\2/')

What am I missing?

Thanks,
Conor.

--9cGvEmoU1B0QAhNd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOqqEQAKCRB4tDGHoIJi
0n2OAQCuR4clvG/HNCrTOW90C5/ale2ryxd/UzGWGb64agc0KAEAqPeucVmG/JQQ
10As7RzkwjzlPEqWUCNH3o+aWLbmLQc=
=uOaG
-----END PGP SIGNATURE-----

--9cGvEmoU1B0QAhNd--


--===============9000753367831562125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9000753367831562125==--

