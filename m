Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FC3C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2qSG0RSrGb9r4UTNISQXCDdcGVIH9IKfy8syWmYPv0=; b=Hw8TRwsMFQwG3xTEaAK8+r+kO3
	FGS82Wjg54zxNVgAlHZ18mozZvG4TGyrfZpH0YGCwNUgEBiwY/rVqI/MpgUcHGeGFsQOqvLODuer0
	Y7ohHYWsQdZ6gY3x7pM29J4w5g0h7jCJOjsXZD2DM+BgUolYk0Hg893gYRVw8x4Mc2Y9nES+m1K76
	tXTTOMzMxvMbOZDvPAG+0B4jj6LMGmi3oS03gyd5Ylo7h4niVPvJls/LFLLf0WYIcfmxHeR6yaB5f
	OVpG1yq8VC2DLSiVaPNbtkKtOV+zhMtu2vJb9SQudrv329zFl0oRThvdSWcSuuFSUX7e+A6PmdX8j
	jBeoMLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU2JX-0071IF-1G;
	Thu, 10 Aug 2023 09:50:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU2JU-0071Hg-03
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 09:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691661040; x=1723197040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=di55ns9cF9wgmcQav9fXDZG2fIjfdm2NyhNG7eT753k=;
  b=JMNg2AXswahiDt5wLRuXJqXqhfqwwTUQTg9SJa3KLS833pauE9MqQwB5
   eh8IcY9Th8aJEOiSGfsqYJhT23iMMDTMjSiw3PPnGL3yCF9OaoOFnpfrW
   wtvZf53qGF0FsKWCHqTWkm5UjEx3r4Fo7M+0gB9nBQLBJvYkKCHctan1l
   ncchfYYG+aK6o1NcX35qBwEZ/Hw09WacbGJ0KSbz5RedNV2gfCuQx6dDo
   Mu0wBWY/XSZQqk/oLBp66ak8kKTon/Ixo6Bf6gg0rZ7/nI2cwYlTwynYv
   zuYk9ysQZDKsCbATtO62nWUtLBXIGypXZpFozc+ry961AxC8dhOgOlCpN
   g==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="229079501"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 02:50:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 02:50:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 02:50:36 -0700
Date: Thu, 10 Aug 2023 10:49:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <evan@rivosinc.com>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH 3/6] RISC-V: hwprobe: Expose Zicboz extension and its
 block size
Message-ID: <20230810-revolver-krypton-ab1883b361a1@wendy>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-11-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230809115516.214537-11-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_025040_089897_4952BDF3 
X-CRM114-Status: GOOD (  24.87  )
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
Content-Type: multipart/mixed; boundary="===============6934141894594790619=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6934141894594790619==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q+gbNq1LjX4RX+Aj"
Content-Disposition: inline

--q+gbNq1LjX4RX+Aj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 01:55:20PM +0200, Andrew Jones wrote:
> Expose Zicboz through hwprobe and also provide a key to extract its
> respective block size. Opportunistically add a macro and apply it to
> current extensions in order to avoid duplicating code.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/riscv/hwprobe.rst       |  6 ++++
>  arch/riscv/include/asm/hwprobe.h      |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
>  arch/riscv/kernel/sys_riscv.c         | 41 ++++++++++++++++++---------
>  4 files changed, 36 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 933c715065d6..6a17c2872660 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -77,6 +77,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as=
 defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
> =20
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is support=
ed, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-C=
MOs.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perfor=
mance
>    information about the selected set of processors.
> =20
> @@ -97,3 +100,6 @@ The following keys are defined:
> =20
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses=
 are
>      not supported at all and will generate a misaligned address fault.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicboz block in bytes.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 78936f4ff513..39df8604fea1 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,6 +8,6 @@
> =20
>  #include <uapi/asm/hwprobe.h>
> =20
> -#define RISCV_HWPROBE_MAX_KEY 5
> +#define RISCV_HWPROBE_MAX_KEY 6
> =20
>  #endif
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 006bfb48343d..86d08a0e617b 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -29,6 +29,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
>  #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
>  #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> +#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -36,6 +37,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
> +#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> =20
>  #endif
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 26ef5526bfb4..7d970358597b 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -145,26 +145,33 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>  	for_each_cpu(cpu, cpus) {
>  		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> =20
> -		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBA;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBB))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBB;
> -
> -		if (riscv_isa_extension_available(isainfo->isa, ZBS))
> -			pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> -		else
> -			missing |=3D RISCV_HWPROBE_EXT_ZBS;
> +#define EXT_KEY(ext)									\
> +	do {										\
> +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext)=
)	\
> +			pair->value |=3D RISCV_HWPROBE_EXT_##ext;				\
> +		else									\
> +			missing |=3D RISCV_HWPROBE_EXT_##ext;				\
> +	} while (false)

Would you mind adding a comment here that using this macro is only
permitted for extensions that can be used by userspace regardless of kernel
config options?

> +		EXT_KEY(ZBA);
> +		EXT_KEY(ZBB);
> +		EXT_KEY(ZBS);
> +		EXT_KEY(ZICBOZ);
> +#undef EXT_KEY
>  	}
> =20
>  	/* Now turn off reporting features if any CPU is missing it. */
>  	pair->value &=3D ~missing;
>  }

--q+gbNq1LjX4RX+Aj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNSyxgAKCRB4tDGHoIJi
0lMGAP9SgMP7asWg13/49WhUg7pQEW6Bj4rCV5sOIvZ3DkEeLQD/blV/y0Mb29Bu
s00uJNf89Sg/AeV8a94AEFJK3qB9QQs=
=4Ffp
-----END PGP SIGNATURE-----

--q+gbNq1LjX4RX+Aj--


--===============6934141894594790619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6934141894594790619==--

