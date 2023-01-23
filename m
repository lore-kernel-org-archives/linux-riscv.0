Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC224C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUd90qLwu2Tsn9041WHlvUTJqMJtFBkkudeyHyyKGhM=; b=oaLiRsPkuPpkq6RrzuL4FZX9Mh
	JJGBJ3VY3nLRtNNNLQGLzhk3B4++xNGX+cLboToF9eXjOfNJ3RymnZBB0Y2tBTzGbsGJPjGWKcWqx
	ktkFv6BfWwV+oThyFUGvyfe46oshO+Y91UOczQfivO+Zevf7dvO4vMdwxpb11chnb35GUhFBFWrmS
	QaKoAujLNOqiBVatrXq8NaG9yykKgOm+x11qqSbxmj7a4M3AxyWPtCpvtrah7RJuIqdGuMBOPZ/VQ
	KMIF3+9ay9MJh2HDC8sFECWXG0QThv6InwDIamLzuAs9YXjd/xW7avAAqv12RNsFnMWGqgHMEGcUS
	61EHD0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvEG-00GzYJ-EG; Mon, 23 Jan 2023 11:43:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvEC-00GzXe-Ty; Mon, 23 Jan 2023 11:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674474188; x=1706010188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w44StEwhk9dtxBy1w0bJyeK/XCVFnvxj58GmT8VNeb0=;
  b=hb3JEEY7F+E6jtNFDeCO2ss8uNh99fv5nfuvHNFcj8e7WDCKQdnM0WRL
   NRN/oARxY1DdfPXnoc350+F/mscyawAystvjRNvl/io8kUu5DXUwWYRrq
   /THvalnU1c7etTmNlUmSjsMvK44ig5G0drbbdHRhcTS8m+78UnbEEcftC
   jD399qDsnyF2xpXiSFUa9sO/Mz3nXzCDRfm2iaFAMDV9CqNtg+C5kGvnP
   RPCLbyHBiltFhTCkJJV7wM2z7B+2i3JNA1Tvmv/qQrpFGcchr1GBKv9Jd
   oa2XGWPfpGS+SKMWlKFrNZCbeGYOQGUtRiexYJKGoN6dO3dkzAzc61pGo
   g==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669100400"; 
   d="asc'?scan'208";a="197715498"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jan 2023 04:43:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 04:43:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 23 Jan 2023 04:43:01 -0700
Date: Mon, 23 Jan 2023 11:42:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>, 'Atish
 Patra ' <atishp@rivosinc.com>, 'Jisheng Zhang ' <jszhang@kernel.org>, 'Palmer
 Dabbelt ' <palmer@dabbelt.com>, 'Albert Ou ' <aou@eecs.berkeley.edu>, 'Paul
 Walmsley ' <paul.walmsley@sifive.com>, 'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 4/6] RISC-V: Use Zicboz in clear_page when available
Message-ID: <Y85yrUz+Ls6JNHaG@wendy>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-5-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230122191328.1193885-5-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_034309_061704_F9AC9A01 
X-CRM114-Status: GOOD (  26.50  )
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
Content-Type: multipart/mixed; boundary="===============3371447738837418503=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3371447738837418503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3z3ecoXKSxCsYRUZ"
Content-Disposition: inline

--3z3ecoXKSxCsYRUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2023 at 08:13:26PM +0100, Andrew Jones wrote:
> Using memset() to zero a 4K page takes 563 total instructions
> where 20 are branches. clear_page() with Zicboz takes 150 total
> instructions where 16 are branches. We could reduce the numbers
> by further unrolling, but, since the cboz block size isn't fixed,
> we'd need a Duff device to ensure we don't execute too many
> unrolled steps. Also, cbo.zero doesn't take an offset, so each
> unrolled step requires it and an add instruction. This increases
> the chance for icache misses if we unroll many times. For these
> reasons we only unroll four times. Unrolling four times should be
> safe as it supports cboz block sizes up to 1K when used with 4K
> pages and it's only 24 to 32 bytes of unrolled instructions.
>=20
> Another note about the Duff device idea is that it would probably
> be best to store the number of steps needed at boot time and then
> load the value in clear_page(). Calculating it in clear_page(),
> particularly without the Zbb extension, would not be efficient.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                | 13 +++++++++++
>  arch/riscv/include/asm/insn-def.h |  4 ++++
>  arch/riscv/include/asm/page.h     |  6 +++++-
>  arch/riscv/lib/Makefile           |  1 +
>  arch/riscv/lib/clear_page.S       | 36 +++++++++++++++++++++++++++++++
>  5 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/lib/clear_page.S
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 33bbdc33cef8..3759a2f6edd5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -432,6 +432,19 @@ config RISCV_ISA_ZICBOM
> =20
>  	   If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_ZICBOZ
> +	bool "Zicboz extension support for faster zeroing of memory"
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> +	   when available.
> +
> +	   The Zicboz extension is used for faster zeroing of memory.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZIHINTPAUSE
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/i=
nsn-def.h
> index e01ab51f50d2..6960beb75f32 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -192,4 +192,8 @@
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(2))
> =20
> +#define CBO_zero(base)						\
> +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> +	       RS1(base), SIMM12(4))
> +

Since most of the patch is the clear page implementation that I have no
comments on:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--3z3ecoXKSxCsYRUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY85yoAAKCRB4tDGHoIJi
0sNyAQCYBCdZNFxsRj8qiHE8x6Pz5UBQXsqTIAFeJvbxIg14iAEA8OsXXnpbmEtC
3G9c84AWF6lBDbH+EM1y/A8//uns/gQ=
=vBz8
-----END PGP SIGNATURE-----

--3z3ecoXKSxCsYRUZ--


--===============3371447738837418503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3371447738837418503==--

