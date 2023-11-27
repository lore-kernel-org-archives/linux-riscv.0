Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63FC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2RMsBCHOOyqOrt1dNwdlYYtYG0f8xZ1Szs5HRGF0b8=; b=OPC+2+Ko8w9Qu1YMbyVPGUwK6G
	OH6XYXnuiY8ldhbA5WcMA4aA3fw5SAlAc1Q+LUgwyMCD258EyHaPXBv8kIcZh80UBH//M/PSVljCn
	RPjfjbtmdv625f+czXrPf6T3yID8jBoGgscnUMcFrLYpjpp0pMmnJ6lfrFEwb615i8brXUh48iAjw
	yjFfIM/kNMR47/XlD3Av49Boxyam+NhV0jbOY1m31qIAxLa66XBI8oxPKA4VQh3jhGaKdxyNaVT3Y
	vbKfzafX0Pr+SOe+2dVU0DZqh/v0mnhfR834lmn6IaHY0/UAMmUhyVwL5afudMTTbjwptv4pNJNdm
	rqWQwT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z1y-0027Vu-04;
	Mon, 27 Nov 2023 10:39:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z1u-0027VB-2X
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701081594; x=1732617594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CB+2fZP2xBpokIIQMBo8XFvxl4A+THV4m/A7MXEQi6k=;
  b=nglIdMGqY0+eozZzckfEjDvOw7/Ydl70YYU4tskcELvVtk09CcNhO/M5
   qjpj+LBVh5hcwT/YtVs7XDdbbwtraiav6mKDFubRTOwHQSOetgHwZrT/v
   h86LgVE4MV4TBoYyIVIrDWNM18n+qci959xwQ/psKWXmJtdoU8uAzz9yI
   ZO7veMr5+HPCymdp+ZYOa1HyV2peJEEFRYsYwZmeBLE94SgKg0Z6LMOqQ
   pjpgrqGAZ8COjHU7cx4PJuGQ7zAfsv0uIT0n5UGI/Unkc0mmaLPWJoZDf
   QfAuSs6uuWZVg8I+q1nN0HqmBD/X/TNEj5cuKHlEzRin73W/gtkeAA9Jq
   A==;
X-CSE-ConnectionGUID: ToBQd87lTZW/CiPHi8AqRA==
X-CSE-MsgGUID: OQfIFRUhT/eBCUlo5fisew==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="asc'?scan'208";a="12250684"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 03:39:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 03:39:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 03:39:44 -0700
Date: Mon, 27 Nov 2023 10:39:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Use asm-generic for {read,write}{bwlq} and their
 relaxed variant
Message-ID: <20231127-swell-garnish-3f2104647aa0@wendy>
References: <20231123142003.1759-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231123142003.1759-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_023954_887981_1BE17D1F 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6085858873939558090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6085858873939558090==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X4t7/KZjh6cGf8um"
Content-Disposition: inline

--X4t7/KZjh6cGf8um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 10:20:03PM +0800, Jisheng Zhang wrote:
> The asm-generic implementation is functionally identical to the riscv
> version.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

This fails to build for nommu:
  /tmp/tmp.ojumpiEgOt/arch/riscv/include/asm/timex.h:20:16: error: implicit=
 declaration of function 'readq_relaxed' [-Werror=3Dimplicit-function-decla=
ration]
  /tmp/tmp.ojumpiEgOt/include/asm-generic/io.h:342:23: error: conflicting t=
ypes for 'readq_relaxed'; have 'u64(const volatile void *)' {aka 'long long=
 unsigned int(const volatile void *)'}

  Cheers,
  Conor.

--X4t7/KZjh6cGf8um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWRx1AAKCRB4tDGHoIJi
0irzAP0RCdfnnaJu4CokpQ6Q2/Kpn4q5enQfhf/S5SrCa3QOLQD/U6teAtmdkAp4
TaY6f2exqhWTKIYqlWEjC1tLf0KZMQo=
=v04p
-----END PGP SIGNATURE-----

--X4t7/KZjh6cGf8um--


--===============6085858873939558090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6085858873939558090==--

