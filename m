Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1DDC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFkVD0O3RQm7ZuqqhjdolhHi/pJrWdDp7KzVBq11jDA=; b=tC4Y2XittWFsxxIMxvkoZe6JkH
	mqMyixhC8N5/+nXPClJN9ny1xl4u7Vprk0n3sBlxWfXefp9by1i8YsNmzOMEFq1iG8PvSJFQxPBrP
	TlKjgj7naKSOu6Q21CqHv12Hi4p2rybHVg2/4TdIheNkzECm7s018a5VZphmEiytwyfn4YVdS4vA6
	nQ+P+D2bzfIkeRkOZ+uV5nWjXHUxehncuQp2GzyrjB9cLJWagEOBR/z8VYkIUPJcwGccrRn/mog2J
	VdNw4Tpxwo5R289KxSwVk8cmE8irLjua8azxipzzBnmym0TuWNLsCz5siuA2tU5sdNv+6GCQRLJy6
	IPkcp+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Za-00000008brQ-3SRK;
	Mon, 04 Mar 2024 10:29:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh51J-00000008VXF-4AIT
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 09:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709546045; x=1741082045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AdFn9XLJWQqe0dLUDaSJYnhDPaicR7vWmLQPaoGeX3w=;
  b=ilD5+4cdQNlPrYreqMy5psqEwgU989HvkthLpApIvEW16qRrs/dAc5JW
   LBXCPVCOL2odGL8l76gLEKszl9paX2+DelAekYXgovads9gsLrJqVV03Z
   tcbjnCcg7IrAYkbA99Vs0G1FO2R6VQS1DdGKGHgEKd/ZomajFGKjKDz7o
   +I/S9GTLN8ESiUhebp7tfqqolTGse5azFzrxFGjf/ECs9dvBUXuKsQUgN
   mYm/HkMMCNY425y1TcumWROYD5ZsXHjZB+QWaEXw4cw/8x/fI1QfIDym8
   YT+5Xcwavhz0raETpUc2sZWIIn9jDWvoXGzhvKo5OtfYmUB3OS/lohGY7
   g==;
X-CSE-ConnectionGUID: ZJsDVXyFTta/H+MNZycEbA==
X-CSE-MsgGUID: 0T2mkppsRHm+zl/8ZK18Og==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; 
   d="asc'?scan'208";a="17149560"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2024 02:53:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:53:37 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 02:53:36 -0700
Date: Mon, 4 Mar 2024 09:52:52 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Dawei Li <dawei.li@shingroup.cn>
CC: <daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: microchip: Fix over-requested allocation size
Message-ID: <20240304-dislike-enchanted-bab883cdd609@wendy>
References: <20240304092532.125751-1-dawei.li@shingroup.cn>
MIME-Version: 1.0
In-Reply-To: <20240304092532.125751-1-dawei.li@shingroup.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_015406_382796_D7BD1DA4 
X-CRM114-Status: GOOD (  16.77  )
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
Content-Type: multipart/mixed; boundary="===============5337962259100797615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5337962259100797615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QfI9bt87W6Fw+2hP"
Content-Disposition: inline

--QfI9bt87W6Fw+2hP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Mar 04, 2024 at 05:25:32PM +0800, Dawei Li wrote:
> cocci warnings: (new ones prefixed by >>)
> >> drivers/firmware/microchip/mpfs-auto-update.c:387:72-78:
>    ERROR: application of sizeof to pointer
>    drivers/firmware/microchip/mpfs-auto-update.c:170:72-78:
>    ERROR: application of sizeof to pointer
>=20
> response_msg is a pointer to u32, so the size of element it points to is
> supposed to be a multiple of sizeof(u32), rather than sizeof(u32 *).
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.CYxoWTXw-lkp@i=
ntel.com/
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> ---
>  drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firm=
ware/microchip/mpfs-auto-update.c
> index 682e417be5a3..7ea3cdb917bc 100644
> --- a/drivers/firmware/microchip/mpfs-auto-update.c
> +++ b/drivers/firmware/microchip/mpfs-auto-update.c
> @@ -384,7 +384,7 @@ static int mpfs_auto_update_available(struct mpfs_aut=
o_update_priv *priv)
>  	u32 *response_msg;
>  	int ret;
> =20
> -	response_msg =3D devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE =
* sizeof(response_msg),
> +	response_msg =3D devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE =
* sizeof(u32),

Why not use `sizeof(*response_msg)`?

Cheers,
Conor.

>  				    GFP_KERNEL);
>  	if (!response_msg)
>  		return -ENOMEM;
> --=20
> 2.27.0
>=20

--QfI9bt87W6Fw+2hP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeWZ8wAKCRB4tDGHoIJi
0gNkAQDrYx1n8zCrpLlvIsxyn7lq+cHSOFFk09yS527hkWOx1QD/XtVUb9uF9ym5
eciZRxHMosB+KXsKQLAG2/26fBdUXQQ=
=uSlh
-----END PGP SIGNATURE-----

--QfI9bt87W6Fw+2hP--


--===============5337962259100797615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5337962259100797615==--

