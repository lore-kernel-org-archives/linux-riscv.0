Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DE5C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s75v6E2CC6s9ajenRbSDz9ASESWlc2O0z2poNoP/SU=; b=kMaA+NB+d0D4oUEjf9UfOL6Zq+
	0mipK81w3H1mjhAXWfJlK6sA9DTrS3iZ7puoYrc3j7YSENf0tZ2UOl+Op0NU5rnOWHPbiQWgdR/Fo
	WQBYiAfRFwFa+oYl9/8crdqUxQLpVX1WKO4SH37u683b3oH5ZUHi9fSuCHLo0I5Z+H05dOuUBgcm2
	Bi2j81W9at/Gl6VVKbVGtKVJR++Awmv5pEaeuRkP420Nb/Az4HWeuU+Osb997PLKQFw/WIqG32i3Y
	biqoDEJm2XF8HvRp2NL7tPZoEdMbrTA632cTWLDXX/N2LSxjupEuz1af5N1pKOX7Liiw8kBV7563k
	JHAOfsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOWj-003aee-2U;
	Tue, 09 May 2023 14:41:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwOWi-003aco-0x;
	Tue, 09 May 2023 14:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gm0Q/9qtPsdeLQ2EnolU0AxjEnEZwV76+D8xbxq9Dn8=; b=kVf1L+ASbIel2SncQU5KEtDXCb
	ZOoQO+6qVp1U46VESo3ikczncjOZhlxGwpY6Zq8wwNklhE5pew6ZIDfLadG6L+AiTg8Hs69vyWmg0
	xmdyeR5SGxHHiu7eqxx4iTOXTFhC8M67UxTNVRMKgj8fZdn2UbG29XDGmuTWqccfkKJWfUJAzWww/
	3RHbs+PNSWuR8X9SGPz5D9IKrWXPioBmXw75D79p/kZRqOkn8dL8emXRV6t76fKwOGuNagwfKfGc/
	q+rgrfV1EFhv1K6NbW4B6f/iDa44g6D+lus7dxpBamfHlcjgznqUNXrfgqfS6Q/95ZvlPSpk8d6Zh
	0BvQ8vyA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMYe-006890-0B;
	Tue, 09 May 2023 12:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683635709; x=1715171709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IGW4MUyXwLnRAJqCcL3gpIXRjeYwxHcdIWMyXJUWta4=;
  b=X8IoPfC6pIPtCkcnZGxwDVsRHz51CtJ9mHLUNVPHWAmGeUDfhIoNmmM5
   kyx0HFyJacfUDOzBz14FBbEOLUUVLpBr/N3Os4QNoTFsbglb51hlRNbhY
   aQjjQNfqahwCj/oIffmphu3nLFJZUQdGj3yUFgAcWFbkyCUAyDzGoCr5M
   Uy1lbGtIksBV8u7dWHNV3ZbSZ0t33ukPu3e18VDS26wbUsIEK9P/m9aNu
   XFjlYZ0N5BT+8iblU7BkQjEOTZpWAarXkQ40bW7nT6kl1qjq2Kntb51+7
   jxUReaYZ6gVB2asyFfTeuPzrUDOV1fQcHf2amfwPjjg9f+3HAJ8JaMYcw
   g==;
X-IronPort-AV: E=Sophos;i="5.99,262,1677567600"; 
   d="asc'?scan'208";a="213086078"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 May 2023 05:34:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 9 May 2023 05:34:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 9 May 2023 05:34:51 -0700
Date: Tue, 9 May 2023 13:34:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Message-ID: <20230509-resilient-lagoon-265e851e5bf8@wendy>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-24-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230509103033.11285-24-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_133508_688004_6260C781 
X-CRM114-Status: GOOD (  23.69  )
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
Content-Type: multipart/mixed; boundary="===============3239964110036309164=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3239964110036309164==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hmFU81Al1OkqyRgj"
Content-Disposition: inline

--hmFU81Al1OkqyRgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Tue, May 09, 2023 at 10:30:32AM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> This patch adds a config which enables vector feature from the kernel
> space.

This commit message probably needs to change, it's not exactly doing
that anymore!

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>

> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Atish Patra <atishp@atishpatra.org>

And I suspect that these two are also likely inaccurate at this point,
but IDC.

> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog V19:
>  - Add RISCV_V_DISABLE to set compile-time default.
>=20
>  arch/riscv/Kconfig  | 31 +++++++++++++++++++++++++++++++
>  arch/riscv/Makefile |  6 +++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1019b519d590..fa256f2e23c1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -466,6 +466,37 @@ config RISCV_ISA_SVPBMT
> =20
>  	   If you don't know what to do here, say Y.
> =20
> +config TOOLCHAIN_HAS_V
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64iv)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32iv)
> +	depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on TOOLCHAIN_HAS_V
> +	depends on FPU
> +	select DYNAMIC_SIGFRAME
> +	default y
> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
> +config RISCV_V_DISABLE
> +	bool "Disable userspace Vector by default"
> +	depends on RISCV_ISA_V
> +	default n
> +	help
> +	  Say Y here if you want to disable default enablement state of Vector
> +	  in u-mode. This way userspace has to make explicit prctl() call to
> +	  enable Vector, or enable it via sysctl interface.

If we are worried about breaking userspace, why is the default for this
option not y? Or further,

config RISCV_ISA_V_DEFAULT_ENABLE
	bool "Enable userspace Vector by default"
	depends on RISCV_ISA_V
	help
	  Say Y here to allow use of Vector in userspace by default.
	  Otherwise, userspace has to make an explicit prctl() call to
	  enable Vector, or enable it via the sysctl interface.

	  If you don't know what to do here, say N.

Thanks,
Conor.

--hmFU81Al1OkqyRgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFo91wAKCRB4tDGHoIJi
0irBAQDZLK/emZnHozYTMzlCfcn1KDeyYeKp6hc160uDpKl3wAEAp5PAZqH7QZv8
PIFHgeMttfCqIXDkQLNsnWfqqPjqdgw=
=mTan
-----END PGP SIGNATURE-----

--hmFU81Al1OkqyRgj--


--===============3239964110036309164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3239964110036309164==--

