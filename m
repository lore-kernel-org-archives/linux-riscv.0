Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD10C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFx04zBIIKvxwJgCMD9cgznMf23si9ArXxfiZLZLfVA=; b=1inII7LS5Hp/cdql4HW7vbQwKg
	K41D+kNkpR2mrpBqD2iMx/LUsmCQaIq4oUh+lyYpU6y59r7qc6llyoU/L6eGhB/0X6S5MzBvFFsrZ
	rwMDIiQJ4olZBATITMKs1/Oek0vSO+KIQz76OxXUxVhl0hnm9sQ+Q+jNvUqsdLt22F4WAnyopANf+
	5iAVNnChsqWLzwYRis+9Qx68F1Hma6hpK99TIku862Vr3itDBtdkkBHN/WyGIq7Rma1W2pxHsJWn5
	PIa70OVk+PQLm9WTk7yHk51Opu0YkftcsLvgsWnTHshmE8L+0vNlaYyvdF7pf6kwxYFChdWvNUmrG
	UEaM31tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxBq-009v8i-W3; Thu, 26 Jan 2023 08:00:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxBn-009v72-TF; Thu, 26 Jan 2023 08:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674720055; x=1706256055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GBE/VjADrLDKieC7b5itKGUOfGov2KepyoUCPJ4/mf0=;
  b=t121eBNOx3yowucnY26evvtB+PIyJokWO1fddpnW+/XeTWz0PKOZTj5z
   LIW2cnC7cvkFjj3spey8pD3lCHXHJhIWxoKKDZ5hHmK1fkUKJzo+580NK
   0llniDVly20eo/R9Akdm9gxMF6rHCG5U1Y8XuLy86qWfxvwj3KZoRwAKG
   ocgsWG5dRkpXlYwUbOhNReuz/SB/VOfT8kDjOUJq4zXsMn1MrgQWoHmEU
   z6SYKV+H/32UMhSLbImYnp+OWL2ZlaM148WDOgWuwtwHZtYxVRf3AZkYG
   F286+ZDqrVHijHCtjeCcmx0WzeTVL8fUMgMB7sW0+4K3ZavukvGF0ST2Y
   w==;
X-IronPort-AV: E=Sophos;i="5.97,247,1669100400"; 
   d="asc'?scan'208";a="197475984"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jan 2023 01:00:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 01:00:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 26 Jan 2023 01:00:40 -0700
Date: Thu, 26 Jan 2023 08:00:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>, Heiko
 Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
	<conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, Rob
 Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 00/11] riscv: Allwinner D1/D1s platform support
Message-ID: <Y9IzELYtub1DmGB5@wendy>
References: <20230126045738.47903-1-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_000056_041159_EDD2BDE0 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Type: multipart/mixed; boundary="===============0265169230415887391=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0265169230415887391==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fj2Wr4MQdoooWJdA"
Content-Disposition: inline

--fj2Wr4MQdoooWJdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 10:57:27PM -0600, Samuel Holland wrote:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
>=20
> This version drops all boards/nodes with missing YAML bindings, so at
> least some support can get merged for v6.3.

That'd be great! Pity the LDO stuff isn't ready yet, but definitely
better to have this stuff in rather than out. In case it helps:
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--fj2Wr4MQdoooWJdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9IzDAAKCRB4tDGHoIJi
0jEzAPwL157GoMnwml3kupueIMZ1KSMy5IfVKW2YSqP7GD6KxQD7BKmIo2ITQ2fu
ftVmGqWDLJvwGoS4PdqMF78cCMPU6gc=
=hIJW
-----END PGP SIGNATURE-----

--fj2Wr4MQdoooWJdA--


--===============0265169230415887391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0265169230415887391==--

