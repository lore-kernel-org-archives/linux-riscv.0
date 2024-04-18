Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD56C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flF+7Qn7ZbBSRJyPqAncHtNXhp2M80HJ4enu7IgNbj4=; b=qweLCt0n+ABj/6hmM/IRzanl7U
	46YxqFUJLnP3w4Vq3O5pljf1837aD97KCDwwoB/P+uupaL/xFgHyaXOTQGCnQAeVi4xec0lszRx/b
	HXLlzmZbZ0sDFldQ5AJpS96DnN2pD3U5VgwWVS81SFQOoy3kLta0KG8WOVHZc24nUCn1YUQKLrpqH
	337/7Wjk2uPjc8N1Gh27rISjnVukzpGzxElJh2KATNZDOzyp0w2sW4KuO9bXOBylp93FTGz9aDYnJ
	kvFD59towZHmEWX37E79i4PN1iTscsZOCtN/qZfo5WKy/hKdwyy0ebUAmOl5xFy4kai9uWA2ckLgL
	CTv51/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOsi-00000001luO-0UZZ;
	Thu, 18 Apr 2024 10:20:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOsf-00000001lsw-31Sa
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 10:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713435638; x=1744971638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WeZBsDuQNwuqcLLzHGYml04J8M2UBghlloEStXX5BnI=;
  b=lBfJr998QU6G49TtDoYms07MqTLjXbStrvi+L8TZZT/S+S/HYrJ0QiY+
   Xi7UIxD7CeLWzTztRAoAnktT20RcTlERkBj92oTZATI8EhYr5QP5mDTS4
   6SsdbgXFlKIdZCFbL+/55Qf5gQZWEtx4HQ5ByFbhq0X2IbZI/Hq9yyo0M
   AZvAQaBrAiqkIc0WRfBPwNY1EPaNRRYdojtd1SslvsA8vq8EjmyiOigRS
   bUb/tNWBn2fAqdqb1OhAD1+WUHN4sbWaix2jP180/mt6tPy4Z/tKkcQ2k
   zdLmtObft514/T4fuV6lq+j0xEnK48cGrqjJPAQf8r/XUsZb55BGEJOsn
   g==;
X-CSE-ConnectionGUID: Uj/C6BjUSJ27K3aZQSHGBQ==
X-CSE-MsgGUID: XKQFOuaVQ5mdX7qWs3qYiA==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; 
   d="asc'?scan'208";a="21586426"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2024 03:20:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 03:20:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 03:20:10 -0700
Date: Thu, 18 Apr 2024 11:19:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	<heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Evan
 Green <evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 4/9] riscv: cpufeature: add zve32[xf] and zve64[xfd]
 isa detection
Message-ID: <20240418-legged-catfish-8358cbe836de@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-4-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240412-zve-detection-v4-4-e0c45bb6b253@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_032037_893355_42A0C0AC 
X-CRM114-Status: GOOD (  18.94  )
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
Content-Type: multipart/mixed; boundary="===============7928755907895441046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7928755907895441046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/qVfv2QvWwihzlW8"
Content-Disposition: inline

--/qVfv2QvWwihzlW8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:49:00PM +0800, Andy Chiu wrote:
> Multiple Vector subextensions are added. Also, the patch takes care of
> the dependencies of Vector subextensions by macro expansions. So, if
> some "embedded" platform only reports "zve64f" on the ISA string, the
> parser is able to expand it to zve32x zve32f zve64x and zve64f.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v3:
>  - renumber RISCV_ISA_EXT_ZVE* to rebase on top of 6.9
>  - alphabetically sort added extensions (Cl=E9ment)
> Changelog v2:
>  - remove the extension itself from its isa_exts[] list (Cl=E9ment)
>  - use riscv_zve64d_exts for v's extension list (Samuel)
> ---
>  arch/riscv/include/asm/hwcap.h |  5 +++++
>  arch/riscv/kernel/cpufeature.c | 36 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e17d0078a651..f64d4e98e67c 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,11 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_ZVE32X		75
> +#define RISCV_ISA_EXT_ZVE32F		76
> +#define RISCV_ISA_EXT_ZVE64X		77
> +#define RISCV_ISA_EXT_ZVE64F		78
> +#define RISCV_ISA_EXT_ZVE64D		79
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index f6f3ece60d69..38d09de518b1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -188,6 +188,35 @@ static const unsigned int riscv_zvbb_exts[] =3D {
>  	RISCV_ISA_EXT_ZVKB
>  };
> =20
> +#define RISCV_ISA_EXT_ZVE32F_IMPLY_LIST	\
> +	RISCV_ISA_EXT_ZVE32X,

Not really a reason to have a list here, there's only one thing implied.
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--/qVfv2QvWwihzlW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiDzywAKCRB4tDGHoIJi
0snJAP9A1H3tdsAfC7x0n4uxmjKhN/QLFEqxtSbHh0TO3ExpQAD/eEqf5L56+de7
S/eSP6FR8y3aqB7ZO3o55fQW/xkj4A8=
=38Nm
-----END PGP SIGNATURE-----

--/qVfv2QvWwihzlW8--


--===============7928755907895441046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7928755907895441046==--

