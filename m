Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701E4C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgIV7V58nO601LIw1P4SX0/rAiv54H5aoTymaASN0yE=; b=SrsZD9OaJ9rnjFVzL0k6MjRMJc
	Uv3vHQQ30OyKy12UaOT2U7SyoH7Qp6OqlruXAMxq/idKpnbEp5Nj77G81XHxLZYak0atJ7I/GyoXC
	75+juoepWhvO40Z5a3C9aoT0pJAOBTIs8A/M4LWxBYJ76tLrMCSYHpJqK7NUD/mAtqtwHubgBVCBa
	3z0tRZmEf52VNs4NtmIRSeQ0PEXj3hHJIQx8yFS1GpNFzXch1/oVAGdfFNhROlUbVf5tTXh4oyLMH
	/O4iCz+voS9/+PB/OhNFO7kH2/9mPV+zqffmffbM3ZXE1DQuNw9Nt5+6zkK+VFY3k+k+3DlsZv5Dr
	tzmRdJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVY5Z-00HDQv-0p;
	Mon, 14 Aug 2023 13:58:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVY5X-00HDQb-0K
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692021511; x=1723557511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o+n2K2lC/+6MXVMwXpoXEhb4M3Ri9lMX3WQ4SO/crcU=;
  b=BE9JS9AVqFuNwGgnOIH+hxb/BWLzddtQPGuhS+4zrRX1pDJsM62Ew3Ew
   5YFxqxDkFIxUbfda2ui8nrO6MrX7L4oE++JHZNw7kIo2uFaRYnaivHktw
   UvHV1RzyfLOmzI1nitCJiyA0Ozx+QLS2XGS6FhJiQxjLebjY4Ss1fqzW0
   RxzeSytsyoMsUqxPJpDu1/qCD7J+Pcqj8qPbfU/ABrKcGnldzP94Gw9ip
   jlomULgcDJf5+0SyHRqCuS5eqe1opIfaZRxF4wJYFnB11/HdtBAD+MdL3
   KeOodk6SYHJvbxw+FaklSj4lO0hQ2Im9cDBlPBJ+BAbOHpKNbZyGFNEx6
   g==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="229722854"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 06:58:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 06:58:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 06:58:25 -0700
Date: Mon, 14 Aug 2023 14:57:47 +0100
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
Subject: Re: [PATCH v3 08/11] PCI: microchip: Move IRQ init functions to
 pcie-plda-host.c
Message-ID: <20230814-everglade-nibble-af545e75b635@wendy>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-9-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230814082016.104181-9-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_065831_146855_9EAA9D49 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: multipart/mixed; boundary="===============2020917445785564077=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2020917445785564077==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BpOtXVbM9MWEU9jw"
Content-Disposition: inline

--BpOtXVbM9MWEU9jw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 04:20:13PM +0800, Minda Chen wrote:
> Move IRQ init functions to pcie-plda-host.c. mc_handle_event
> merge to plda_handle_event, Add get_events functions,
> PolarFire PCIe uses get_events function pointer to get
> their events num.

Just a nit, could you add the () when referring to functions in
changelogs please?
Other than the comment I left on the last patch, this looks fine to me,
but I'd definitely like Daire to take a look at these patches that
modify the interrupt handling.

--BpOtXVbM9MWEU9jw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNoy2wAKCRB4tDGHoIJi
0jyDAQC5T3NF7Lvf05u2gvpA5+0rWtaf3TGtB9uxGExJKF1mdAD/YgTff81PDmTT
8maYzHqwuLvlZxtbTEJunHGOgcs66Qo=
=otyL
-----END PGP SIGNATURE-----

--BpOtXVbM9MWEU9jw--


--===============2020917445785564077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2020917445785564077==--

