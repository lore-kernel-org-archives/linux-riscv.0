Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00524C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPT0lw85bmsZ2nuy12Ke6Ym+v6Hwgw5xWl7OpYIIkK8=; b=Bz5DnKfNQcZufjKvWYQfsrM86z
	Xa0HbBjYaktoCdHpXkH0qy6tkSbHMIOLmwGcAZIF92QryEQKQrc+R097an0nk3ZYCn/GaeZ/BtMtf
	xehbRuqJlhKQ3N+/SvmikEfsAvzOSYWJezppu7aKC7XOXKuqBWYYx5RylKycBB3BQpk6K4jLZfNfY
	B3UeY0ezPASSCHjoz06kglaJWIclrldwMLO1EUzapv8PGXbk7xlzxWK66dA9RvfF2LR0ll7GdrmNn
	jbPovgz3SxxnTrg3CG/f0nAVG0soMuBfB/kscS1FIGicj1sJbtrFegIBqMYipNwJrBDGJqvq7icVg
	5AdMhS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWOi-00AL3x-Bv; Wed, 11 Jan 2023 08:23:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWOd-00AL1f-OL
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 08:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673425423; x=1704961423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w4O7ndmzpHw/kjEMbtcNZFRozineigpKfwiXuwQUbrA=;
  b=jlju+PMmQIRAUtzSUZVZ/TecNAnekT0HqSXGAki+ezUcEVuhF1NJDeg8
   P/OT9N2c8i3ae8onSAkpo/NSgFv5zmmI54EuVC+WyGFlYhuxT3oX53G7a
   YG0ejkGmn3Je/n2zqIK/3UguXXiclBjYWqTW+9D+s4YwlcU1GIRPkzlVU
   M11TgDjGyZxxKcriJFlXPvm2N165P+W5bPn5zn/9/edXRlFYKx84iI9VJ
   IpT5ePz5QXNg473az8BhXBsXMY24AOCnL7t2NXBSWz9rUILyc0QxLQzaL
   qQIrOssc98sk3KEDMTENBQB7dfqBJWfy819g+0abUZjUeDqINzEGmbVXw
   w==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="asc'?scan'208";a="131795939"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 01:23:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 01:23:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 01:23:34 -0700
Date: Wed, 11 Jan 2023 08:23:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Kconfig: Remove trailing whitespace
Message-ID: <Y75x8ArUXAkWugHc@wendy>
References: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_002343_874881_C90780D6 
X-CRM114-Status: GOOD (  16.58  )
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
Content-Type: multipart/mixed; boundary="===============0755852567680835200=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0755852567680835200==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ixhILM/+13yPKIsr"
Content-Disposition: inline

--ixhILM/+13yPKIsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 09:15:33AM +0100, Geert Uytterhoeven wrote:
> Remove trailing whitespace that hurts my eyes.

Yeah, that hurts mine too.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> FWIW
> Fixes: 444c3dbdabd46819 ("RISC-V: introduce ARCH_FOO kconfig aliases for =
SOC_FOO symbols")
>=20
>  arch/riscv/Kconfig.socs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 945c00d20fe19304..37d8ad51d1adbd90 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -35,7 +35,7 @@ config SOC_STARFIVE
> =20
>  config ARCH_VIRT
>  	def_bool SOC_VIRT
> -=09
> +
>  config SOC_VIRT
>  	bool "QEMU Virt Machine"
>  	select CLINT_TIMER if RISCV_M_MODE
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ixhILM/+13yPKIsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY75x8AAKCRB4tDGHoIJi
0q8vAQC9D0W3xZjVic43zhg1RaE9LVMtnROQHwWDazfM0ePY3gD/XwwuJ/B5cnka
ANCYS7VBLA0pvwxgDGXMOESoZ1wd3wY=
=+zaj
-----END PGP SIGNATURE-----

--ixhILM/+13yPKIsr--


--===============0755852567680835200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0755852567680835200==--

