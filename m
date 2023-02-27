Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1EEC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnxXTIgTMATsgswoiNRGlFkiYnYXMtySFASA/cY5KfI=; b=cK77+t9c0AFSD1nUejuWDr+uvc
	J7RzVBwbo/WAcunxvuinimTXkuZG99xlT0McGpqeZmt/s98NRSpO6XGahZt7CRzHGQ73w231Jn5Av
	aBMGPHZEFMOmgELpmdW51a1H9wQ3c6zEVTdH9pYlQ14bFIFlu54DpHXHdvf6sWCFNPEa9U9hMLmEF
	h/Ws1+wLnHCoJjRNjYZ7bdcd7LvMvVC6PAmD22wutY8On2I5y5IYqlDRgmtRFqf1+sDuJI86aP7Gx
	wrIkMtvYyKej/PYm6f6wnfke9ZBCLRKotqtuKWJ6aXzW/iQJ6E2KixbPeAGhKMkwoY6Pz8yoLBX+4
	7suYYbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWabB-009CLG-8X; Mon, 27 Feb 2023 10:19:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWab5-009CJr-JN; Mon, 27 Feb 2023 10:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677493147; x=1709029147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sojdSkzgAlSHlPcxfvTgJuh5oLl0x4fCBeR1P4DYod0=;
  b=x8hA8L1J8QbapdYze1OyU317PJPtm4JJVaTsWjGyTxM2U7V7jOkqKLUe
   IA8NVmaG3st3QVcQP/YS0YW/vRLbaI5WZxrXQ4Rsd7AWzCFxGo7VkOyPV
   +/TOMmTDEo0SeTDtk2O5bPxZ2S5BElRh81/XB3hZ+EDqKBrcMkZ7SOtVU
   EruabOGtJMzi2TzXRUY1AaKcBkb46mxPwSRnu5KG6Jf9SvncYGJq7eyel
   1wCe5ElALV57hrVlqTRv4oKsSRvK0mh3QdwAZwIo/xodwwTGt/9YcUoUV
   tzWmuFHs0bt537KVTewd0GaKMKilp5rkpERSp81UYr/9SYA7Ctw2StHpt
   w==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669100400"; 
   d="asc'?scan'208";a="139211448"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 03:19:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 03:19:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 03:19:01 -0700
Date: Mon, 27 Feb 2023 10:18:34 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Message-ID: <Y/yDeurep0ZBnLdR@wendy>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-20-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_021907_747341_13E61C77 
X-CRM114-Status: GOOD (  21.08  )
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
Content-Type: multipart/mixed; boundary="===============3681283474104186478=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3681283474104186478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1gdVvARvsfu9C4N3"
Content-Disposition: inline

--1gdVvARvsfu9C4N3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Fri, Feb 24, 2023 at 05:01:18PM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> This patch adds a config which enables vector feature from the kernel
> space.
>=20
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

At this point, you've basically re-written this patch and should be
listed as a co-author at the very least!

> ---
>  arch/riscv/Kconfig  | 18 ++++++++++++++++++
>  arch/riscv/Makefile |  3 ++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81eb031887d2..19deeb3bb36b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -418,6 +418,24 @@ config RISCV_ISA_SVPBMT
> =20
>  	   If you don't know what to do here, say Y.
> =20
> +config TOOLCHAIN_HAS_V
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64iv)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32iv)
> +	depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
> +
> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on TOOLCHAIN_HAS_V
> +	select DYNAMIC_SIGFRAME

So, nothing here makes V depend on CONFIG_FPU...

> +	default y
> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 76989561566b..375a048b11cb 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
>  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd

=2E..but march only contains fd if CONFIG_FPU is enabled...

>  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> =20
>  # Newer binutils versions default to ISA spec version 20191213 which mov=
es some
>  # instructions from the I extension to the Zicsr and Zifencei extensions.
> @@ -65,7 +66,7 @@ riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $(ris=
cv-march-y)_zicsr_zifencei
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y)_zi=
hintpause
> =20
> -KBUILD_CFLAGS +=3D -march=3D$(subst fd,,$(riscv-march-y))
> +KBUILD_CFLAGS +=3D -march=3D$(subst fdv,,$(riscv-march-y))

=2E..so I think this will not work if !CONFIG_FPU && RISCV_ISA_V.
IIRC, vector uses some floating point opcodes, but does it (or Linux's
implementation) actually depend on having floating point support in the
kernel?
If not, this cannot be done in a oneliner. Otherwise, CONFIG_RISCV_ISA_V
should explicitly depend on CONFIG_FPU.

>  KBUILD_AFLAGS +=3D -march=3D$(riscv-march-y)
> =20
>  KBUILD_CFLAGS +=3D -mno-save-restore
> --=20
> 2.17.1
>=20
>=20

--1gdVvARvsfu9C4N3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yDegAKCRB4tDGHoIJi
0i4IAP41YdSGjTqH1QRgMkRLPFQfD7HiWOHOEkYVUdbXjzsq9wEAmGW2shtjgjDR
YeMqZLkAuUwj0SL5IEQRz1gI0B4f0Qk=
=BDSG
-----END PGP SIGNATURE-----

--1gdVvARvsfu9C4N3--


--===============3681283474104186478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3681283474104186478==--

