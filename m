Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D3FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGoDkPS9KmABgogCgFkOEkWMaHiI/se5y6ildtvU/2Q=; b=IbFsjIz95XL3WrN2fWxKqKKGnc
	aN5NAxEUp32IDZEt9WvoD2jEn0CM/66/0er+/g4wnF+T9oO3b6k28hiKfLcyafVRbEMBAxyqdJzyz
	bCfmDe0ifEsTTGcSKVVOgvaIZm0nV5CgJy3IYTpzJqcB35R0leCXdwFtMIPLPHMaEEe/4fmG61S5c
	UEzbHXEhwuteu2UZ1T3uJWIgsWRNgIYguUVLbJADMs761kd76J4qGnRMPQH6FOdAoKIH/CauPBreH
	K7GGFF1n8InV1CvmCN8ZbgmWGWReK6A8kupnD/EKWRC91IWIrBw2WyHb1qq8csFVRIFOzFq9Z5RKM
	zAtpVUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxP2Z-00000001oOO-0llL;
	Thu, 18 Apr 2024 10:30:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxP2V-00000001oNf-1h77
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 10:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713436247; x=1744972247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kx/O3NbYmmye71xw/73E2GXjtvhWZUZ9V2RPXla/lMw=;
  b=UTww3gEu5BZ+dsRCVlSJ2KiRGiLTTKSSRz/szRReccg4gjHdD1WHkE0s
   MgomBYvsclYtc9yvd2wLA4PI0sgQWP6jHksORsz4tqodKX8Vwo3Ew9G2I
   yxPkrjx8CdsZfSBJa6vKGxLHIVHsboZA+UM4C7R5Lcm52fWbGaciEEiPE
   T2LQfocFp+sVsrmsqGy3k+jArMfFiz6PS8hRQeTTyj9+Xf1QqDcPy7Its
   DCLmqy+NL4wwHrDySrnzd3SYLzG2HXcIn3V71ngi3zU5IR9XWmG2YaGwG
   PTcKadEssCRmNqNFPbkZew+DMF78jYkTZIhx2sa2Ta/LEWHDkhgnA+PdH
   w==;
X-CSE-ConnectionGUID: IwiwC4InSEmNg7Dv2twxMA==
X-CSE-MsgGUID: noxMaoaySkiucyrpesccLQ==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; 
   d="asc'?scan'208";a="21540872"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2024 03:30:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 03:30:18 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 03:30:14 -0700
Date: Thu, 18 Apr 2024 11:29:59 +0100
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
Subject: Re: [PATCH v4 3/9] riscv: cpufeature: call match_isa_ext() for
 single-letter extensions
Message-ID: <20240418-twirl-aground-a581d6e45854@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-3-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240412-zve-detection-v4-3-e0c45bb6b253@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_033047_539083_53AB5B4B 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: multipart/mixed; boundary="===============3160204117200467767=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3160204117200467767==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+kb/Lbwm7h/0iKfQ"
Content-Disposition: inline

--+kb/Lbwm7h/0iKfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:48:59PM +0800, Andy Chiu wrote:
> Single-letter extensions may also imply multiple subextensions. For
> example, Vector extension implies zve64d, and zve64d implies zve64f.
>=20
> Extension parsing for "riscv,isa-extensions" has the ability to resolve
> the dependency by calling match_isa_ext(). This patch makes deprecated
> parser call the same function for single letter extensions.

Sure, why not..

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--+kb/Lbwm7h/0iKfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiD2JwAKCRB4tDGHoIJi
0lSLAP9etZ2WCMHmao3TIOEA8ZgOo2OTJ3ipe9slmFEM10nxuwD/Zi2J1xel+G8Q
uSuqYeiY5lSCD4TaQEPHlc1Aa2nRgwQ=
=7adE
-----END PGP SIGNATURE-----

--+kb/Lbwm7h/0iKfQ--


--===============3160204117200467767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3160204117200467767==--

