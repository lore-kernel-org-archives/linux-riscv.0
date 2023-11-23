Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1CAC624B4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udHaUZU4Z3cT+O18JAwkASBa8L4pwSRy5Ioa/RiSYLo=; b=idhBfuQyXoyTfqPwiD/aqbqkX6
	seOHv4ChDP/ATAYE28an3/TXEhJDww7qfSkWOwqeCrCJj9ljwAYCYhLtx1KfyNXeioEFIWYDM6tBF
	OEN6coaFLWn4TaY1rL0FnWtq4zMZIk6P5h6uzf8D16tHt5GBhTuXyHGuhTYpb3OzM4RdFm+QqM5ZC
	zHz1p+rWi56M7nEGhw6C+9U1aUIRO0zFtbW54c29dt69mcG4zdbjVR0mjmnDI8Eof9mP1KE/r2MLQ
	BS1jXdBMNjdO6d0RB0mok4fiH9+FOrWyFNMPa8WGUsLDAz/7iAplIhem8sBjac3fqJk9+SuaPPSC2
	WAJpQCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AN0-004yh9-1q;
	Thu, 23 Nov 2023 14:07:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AMx-004yg8-0k
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 14:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700748471; x=1732284471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c9m6OVf58Xo2DNf9S/Po6djMWe3D3sOi1XkgmKgo8c4=;
  b=R/kScdq7oqPxW0QcTqjqG8AeylXZy8EAHb3mAnJdGiAXuo4fQBe8Sb3g
   PzeVg+0fEwf3ijpccmFy0MqzR163PH1IVSeCdsIfYuB1/4QuNKhYA0Ol6
   MBKIuQsSvyMK6jADUQdD+qq2NTtoHbiUcoCmqbaYb8bK2MCc/v1cisJRp
   ZbNIBvQKWfX2ktx7xkp9uMZBbNYmXML4esZfS/y4aJWBo/IoP56zSgh02
   Ct9b/LoGaym+ka13MX1jZbL4LZUgHC9q1yXN0kLxaQ2jt4RsmINAnXPZF
   k7VoaDB05bNksoNqDC8s5SW/6zgeOMiaZ090ggreXeFyReC0t3KtqWu0o
   Q==;
X-CSE-ConnectionGUID: TCqVcfDDR5mXI/gzk10ZoA==
X-CSE-MsgGUID: qX52RZ4iQcWu/bkmDmP4Eg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12115149"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:07:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:07:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:07:23 -0700
Date: Thu, 23 Nov 2023 14:06:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Greentime Hu
	<greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Masahiro Yamada <masahiroy@kernel.org>, Nam Cao
	<namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sami Tolvanen
	<samitolvanen@google.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Fix SMP when shadow call stacks are enabled
Message-ID: <20231123-vision-nuttiness-b75be703f162@wendy>
References: <20231121211958.3158576-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231121211958.3158576-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_060751_351995_FF02E7C0 
X-CRM114-Status: GOOD (  18.63  )
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
Content-Type: multipart/mixed; boundary="===============0397176466885697294=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0397176466885697294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R6NWfd0pBNwexC3U"
Content-Disposition: inline

--R6NWfd0pBNwexC3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 01:19:29PM -0800, Samuel Holland wrote:
> This fixes two bugs in SCS initialization for secondary CPUs. First,
> the SCS was not initialized at all in the spinwait boot path. Second,
> the code for the SBI HSM path attempted to initialize the SCS before
> enabling the MMU. However, that involves dereferencing the thread
> pointer, which requires the MMU to be enabled.
>=20
> Fix both issues by setting up the SCS in the common secondary entry
> path, after enabling the MMU.

I'm curious, mostly because I do not know much about the implemtnation
of the shadow call stack, but does it actually work correctly when the
kernel is built without mmu support?

>=20
> Fixes: d1584d791a29 ("riscv: Implement Shadow Call Stack")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
>  arch/riscv/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index b77397432403..76ace1e0b46f 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -154,7 +154,6 @@ secondary_start_sbi:
>  	XIP_FIXUP_OFFSET a3
>  	add a3, a3, a1
>  	REG_L sp, (a3)
> -	scs_load_current
> =20
>  .Lsecondary_start_common:
> =20
> @@ -165,6 +164,7 @@ secondary_start_sbi:
>  	call relocate_enable_mmu
>  #endif
>  	call .Lsetup_trap_vector
> +	scs_load_current
>  	tail smp_callin
>  #endif /* CONFIG_SMP */
> =20
> --=20
> 2.42.0
>=20

--R6NWfd0pBNwexC3U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9cfwAKCRB4tDGHoIJi
0gIpAP9ONF1o41LhBrc0ZV8gMLPTLWtw+TTTBzcxqq0oWmjYlAEAjA9Yv8RUu/ZW
4OmzEDkWDyFj8ja5ZmEIAp4h4yfpvAg=
=pHOR
-----END PGP SIGNATURE-----

--R6NWfd0pBNwexC3U--


--===============0397176466885697294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0397176466885697294==--

