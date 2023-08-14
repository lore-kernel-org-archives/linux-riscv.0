Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6069FC001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbuVqmeZQDmODdtQQVMlxYskNtKOmwsPhv47I20xC6c=; b=aO42QbtAp0wg8TsZVKT3Wv8yfD
	MJliXwFdCzBFkhkOyZDoV8pAMgrOoOvGWczI1eRHGNTZljHBOpU0R21MMmB0pzkTWai1oYVNz0fz8
	KG5pkA8TrNIIIBKlUqUg18jDsIJqhnxVVTN4OHOErINIG1FTm4KsmRIm6y3Kn7Jzfz4bia6Hpj5b0
	uDK8doNEFxmV+lKzdpSMOjsga8osTMxcOGD7Y2s70AzEF/f0/9mhnftLFMEnUlHHk4xagSLXr84sB
	bbW+yijRjrIg27ivDIEz9PzgfK02g0Jwig6bq/RSbjErAZ43ataqFnI1qAMrCqyDfRUwyvFGjky+N
	dKTOE9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXhn-00HAcQ-22;
	Mon, 14 Aug 2023 13:33:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXhk-00HAb3-2E
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692020036; x=1723556036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIMp+ZZfE39NoCAF9Svzx2/G3vPfQ0zl1WOS3daH1Ec=;
  b=sHOOYNpQa64FZisOBFPZn3GdXFiSHeZOKybyL6Ye0z4qYLxVqRxOU3/w
   K9rGalZuiy0GiYFjZW/xewW/GcViWCsy5BRSMfJtAOB3UXD5BiIh15v6I
   gde2A2TaIIF/zQincArTA2IWDa8MMtewgq8nbIesZdTn4YmlhDZh3kW02
   MvcZK0vvJ6EksoaT+DCCEdlLUhUpsVe+4LJonCH3l8DZK+YCp5cNuEfHY
   tieNkyYcgsrG4pd+InccRJkUBFy8u7CJh671QphotC9tvrNM+HnK71QSR
   JIcO1TxR6n6WdA4GV1qhUyNETOy1Bdi0k8601DdYq0AjkXeNUVLWyMStU
   g==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="225309921"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:33:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:33:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:33:47 -0700
Date: Mon, 14 Aug 2023 14:33:08 +0100
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
Subject: Re: [PATCH v3 02/11] PCI: microchip: Move pcie-microchip-host.c to
 plda directory
Message-ID: <20230814-cytoplast-appliance-05c53cd612e7@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-3-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-3-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_063356_793502_7F52D770 
X-CRM114-Status: UNSURE (   7.83  )
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
Content-Type: multipart/mixed; boundary="===============4796616144629618398=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4796616144629618398==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qb2FqRletKnkxHF6"
Content-Disposition: inline

--Qb2FqRletKnkxHF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:20:07PM +0800, Minda Chen wrote:
> For Microchip Polarfire PCIe host is PLDA XpressRich IP,
> move to plda directory. Prepare for refactor the codes.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Qb2FqRletKnkxHF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNotFAAKCRB4tDGHoIJi
0ocNAQCtStJgaZKQR6TWeuB8t1Tqmw7kv40909tqPHtcIosgBAD/cPslhEpUXgI/
MEr0ZSstM04GiNSgOOPaFIBo3mNU7A8=
=NbEH
-----END PGP SIGNATURE-----

--Qb2FqRletKnkxHF6--


--===============4796616144629618398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4796616144629618398==--

