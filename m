Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935F6C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuvfOHJo6Kf8QqQeZIxwmCQi//hpuQ3ZVqbxCUEYiOc=; b=k23B7w/ns0o3yoLPNCpxXHHIOE
	mgZwVtsblx6mnUh7uDaMrT69T/GrAtYDqNg0DjNqRUYa5dllxxpHVhLmV3y3XU5bmAdQwj8z8bgFf
	gSUdWAk7mV/pDbTu7nUnFro+AVnRP3Nn7orxsGIwV6IdA1WSZ21PjRbyq/QMDTRjxF+x7KDvcnteW
	iq+tkELxr4G5g/LwVgdjRrvdZQKQSg1ITARGd76vXnWQE1dRN0mbeFVidDNDBR+K6INbP6pmMsoYp
	zVuSPOVZAnvclZlvA/uMqOLOdttyGyZbtNQYtkoQYthHjPH2GT424qffXiOwSuS6OvCZE2I0mdLgk
	DfVtBesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXv7-00HCPI-1p;
	Mon, 14 Aug 2023 13:47:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXv5-00HCP0-13
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692020863; x=1723556863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I02MFdP2EH60g+sAjAom1+1UNiLnROO40sCnV1D1e8I=;
  b=F8a5i9qPbpFcZQYDKoVNUKd0dQ1ml0MBssyG4uNbCOwlymZ+Hp70+Cvl
   KQFd+HKMughQYgIQk0/LApPuhCH20ue2BGA6xYf9sZRPSs9q6y1rN3vvA
   PJIgGXMsIVcrQCJEWfKes5IG6RrgnWvojYKPCyICYQ/1tnZ7kAD7RsYs6
   sBDUsq7NKLZ7GUlL5ExWq2orHnWkMZWzykIst+HYkHLEbfkh8rutadEWx
   2j65wI0X85b/9yMh9qoK2EuSkxCfvEZSkTKc7nOqc7YeS7qrWaju5ZACP
   yS3fCFK5QoAuexVTtxgUOcaTmRdq0LUJA4hgDd9qby4NThPHLRQ4Keodc
   A==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="229671417"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:47:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:47:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:47:38 -0700
Date: Mon, 14 Aug 2023 14:46:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v3 05/11] PCI: plda: Move the common functions to
 pcie-plda-host.c
Message-ID: <20230814-overbuilt-aviation-0183663c4c43@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-6-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_064743_448610_5245810B 
X-CRM114-Status: UNSURE (   7.99  )
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
Content-Type: multipart/mixed; boundary="===============4738172380686621080=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4738172380686621080==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ujGK0k4EqtrWOJIP"
Content-Disposition: inline

--ujGK0k4EqtrWOJIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:10PM +0800, Minda Chen wrote:
> Move MSI IRQ, INTx IRQ and setup functions to common
> pcie-plda-host.c.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ujGK0k4EqtrWOJIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNowUwAKCRB4tDGHoIJi
0qrxAP9iG7XUR9d8mGL7J9IrkVNA0w5RpL0vJHPNLfH7Msn1mwEAuFm1065RNQGj
CBzcSO2nN0XbJhSwOJeCnPxrfCN2cA0=
=BQpB
-----END PGP SIGNATURE-----

--ujGK0k4EqtrWOJIP--


--===============4738172380686621080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4738172380686621080==--

