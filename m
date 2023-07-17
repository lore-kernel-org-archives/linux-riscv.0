Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED2CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1TA5bWOFKYfdEfUI0WeKw2lhOH+h8GT77Aoowc7PX8=; b=xnCRpDeaeUzST0zevqWituyCAd
	JWYteoQH4NiFxf586hMubGSLAJC/3gjyD2NN5NogcxEGzopPMwqMzFJNasjBJYNF8WU0QwGh3vXfR
	VZ3duJYV/b9N8Iyl4FkebVsLYGbbp6rnfJTenBryAdlz67vd3RsKHFCTT5RmjtdSVMobAl1zURp6B
	mrjFKjoGnQGnU/nlsG3DB69emufKLDjL4beKTakCk5yuURKR/rCvS7vQrroQRXJ24GZ44JPAgHRJO
	O6OAXX8lC6lxoBryDWIx9IbmxSM3Hp524lUWUff37kgaxh8uuoHGNFdg8KSivL0NaOWL7jfqCu8iH
	FTxHqIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLKgk-003enG-2X;
	Mon, 17 Jul 2023 09:38:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLKgd-003elp-23
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 09:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689586716; x=1721122716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/OGMPDGjs8Zw3x/lDUpUkFz2EB68DZA9pWcN1NGl/kU=;
  b=Yw0ve9MnNbjAsTpkrWOKW8IMBQGGXJrhWLxrnLSazmPC6457ylva9AMN
   8Qi45fV8Cp6NMtE1HPk8waKnENRr5io+8rPgClhKCER76c0T92nfT714L
   kDD86mSxHaVEBp7mSGKkM2mYy1UdZz86qGkPuYwXZ5/i5p3uQxzopvEw2
   866rz4vuzIFTAJa/A6PxTaitwyhLqFdhi/sXT45HQrXUHy7gv/WurRCKT
   WPmU3ZMKR671YAgIYGTMBAxOUVIayJAK7i6Ac1lZscQ6jljF53i0Ipa/I
   udGSaTJ7P84UOMwUsW+fjnZ677SN7b6Yq5rx4oH2Avz1D7kJqxLl3MtrZ
   w==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="224169711"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 02:38:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 02:38:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 02:38:29 -0700
Date: Mon, 17 Jul 2023 10:37:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/1] pci: add return value check to
 devm_add_action_or_reset
Message-ID: <20230717-hankering-pardon-f652898bc424@wendy>
References: <20230716124835.5909-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
In-Reply-To: <20230716124835.5909-1-ruc_gongyuanjun@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_023835_910965_DC9AA4A6 
X-CRM114-Status: GOOD (  18.27  )
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
Content-Type: multipart/mixed; boundary="===============5211232731818485619=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5211232731818485619==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="706bu/MLmH2w83aq"
Content-Disposition: inline

--706bu/MLmH2w83aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

> $subject: pci: add return value check to devm_add_action_or_reset

Typically patches for this driver have used the prefix "PCI:
microchip:". Also, please put the () at the end of functions in commit
messages.

On Sun, Jul 16, 2023 at 08:48:35PM +0800, Yuanjun Gong wrote:
> devm_add_action_or_reset() may fail, therefore, a check to the
> return value of devm_add_action_or_reset() is added before return.
>=20
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 5e710e485464..8c77284fdc84 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -863,8 +863,10 @@ static inline struct clk *mc_pcie_init_clk(struct de=
vice *dev, const char *id)
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
> +	ret =3D devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_un=
prepare,
>  				 clk);

Did checkpatch not complain about the alignment here?

With those fixed,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +	if (ret)
> +		return ERR_PTR(ret);
> =20
>  	return clk;
>  }
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--706bu/MLmH2w83aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUL9QAKCRB4tDGHoIJi
0gmEAP4xO8BLOSOsZlmWVNcKd7CoUIM7XuY7H3i+3mNnFyv8gQD+MsgvarIuA/bG
HI8MHfA5hvdIpdCQ5EMNMQKxhdhGuQ4=
=JYoA
-----END PGP SIGNATURE-----

--706bu/MLmH2w83aq--


--===============5211232731818485619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5211232731818485619==--

