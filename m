Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811A6C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+h0JWSh8tHJThTwsvpzI0ibLdXI6tpKRGMHxdX9D08=; b=iMGYmZKavnMvMmbNAZp+QWTiOX
	9kLKbBKcZrXGKSoOX4+bWAPN+AmlCL4G3x68ptYvL3XGfWal1yKhCwZBpXYWXmweYM2/pKjsBFy4O
	Ly5ZecMjU9X5BILleQ8CCIXNzrpOd7mpH6g7C6gxLHTJcTBvOvZDcYULsIDhnoNwg8gDF5QoVYASM
	Bjn0jFYdK9kdDW5jm0re9mU1OwBxVVbzXmSM2bwhap6YEf/08NVg98gGDUmt/1+6nt9NOlWM066Qm
	ZD6su3eBJW+2ziP4j2Tca4mwHmk2NglS0ZSjkgsoJRNRNezXOhANMFXUI0uBYAVJA3t52/jux0lV1
	MPFYtIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsdB-003eQ5-3C;
	Mon, 24 Jul 2023 10:17:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsd8-003eNa-38
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690193851; x=1721729851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9j/ubjb14KYeVTqGuXmeyX8gTse+DRrHNcAXBsXH/M=;
  b=KF2fi03RJ2hC1H2PnFkIWFWmdDIzjFC17UP0mxhNdeU/jjIq7W3TRufS
   EMDCz/FOus+2lp3AYdMRqEtinUYLMLdP9noaJvS0PQ+My5Ts2UsjmrdBM
   nhTYo30sZufuSIa0cVgDKG+dyQ4qq1OZEhBva2lxsVw+rk1xnyVVyofOL
   8aWDgcI+WlVd8oNfCI1aKhsiZmsZ9BmVbyT8okxV4A0+stkQ4WLi0GG+s
   /BNT1agjhwh4/l50E4Y8C2fSDJJU1hoPe5dkCYa6iSCU4yOMIhHxwVLKF
   1fvUdwCzUgL44n4qaSETOrdFxE+FLkw7utqDVhECKM2mut6hAxvf75PVt
   w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="221852815"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 03:17:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 03:17:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 03:17:25 -0700
Date: Mon, 24 Jul 2023 11:16:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt
	<palmer@dabbelt.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v1] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT
 resets support
Message-ID: <20230724-junkman-dominion-5a0ccfa0ba11@wendy>
References: <20230724055440.100947-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230724055440.100947-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_031731_088648_7D039951 
X-CRM114-Status: GOOD (  12.23  )
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
Content-Type: multipart/mixed; boundary="===============5936956226275873816=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5936956226275873816==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8I5cd4AYGkoQ6umA"
Content-Disposition: inline

--8I5cd4AYGkoQ6umA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 01:54:40PM +0800, Xingyu Wu wrote:
> Add new struct members and auxiliary_device_id of resets to support
> System-Top-Group, Image-Signal-Process and Video-Output on the StarFive
> JH7110 SoC.
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>=20
> Hi Stephen,
>=20
> I found that the PR sent by Conor was missing this STG/ISP/VOUT
> resets patch:
> https://lore.kernel.org/all/20230719-trough-frisk-40b92acb485a@spud/
>=20
> I resend this patch to make the CRG drivers completed.

The context here being that I did not realise that the reset patch also
depended on the dt-binding headers & thought it could go separately.

--8I5cd4AYGkoQ6umA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5PkwAKCRB4tDGHoIJi
0uG7AP4idzqiMp3mx7axRB5CH1pm7aQqGrsKI1ov2Rtr/2eW/AD+LiCS9ZYRQ81r
9m/rPkMhd7Jtl8YQ2z+Ifo63IZdjTgM=
=2j3k
-----END PGP SIGNATURE-----

--8I5cd4AYGkoQ6umA--


--===============5936956226275873816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5936956226275873816==--

