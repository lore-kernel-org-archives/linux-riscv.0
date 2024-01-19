Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A30C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fE0yTfdixtDOZw1s0io7ghqz76Cu2mcNeyKstSdpnDY=; b=wagqPyuks7G1xsDtNLevO5m+LM
	QCV0tdIJ0Ph6SiSv7UAzEzCWROCtwfLwVFjrenZw2FgFWDcYePlP7P8IanuIJ5uykGDXdgEkpTZpP
	VmnzT38y5fzWXy+ZPtwnWLpHl56n7TsgZESGr4cn54ZVnhBQbpDRIl7xX37nKfBADtspcvwiZDJ7p
	ZMQfTsRTMKq+M2Y6cYv0w43b4g4zHoao9EAABeCHp59/plHCxc6q2oIgJNXklzGSks6uXyEFlkR75
	iQi/fOk5Rl77q4dMgtNvWliMND9nIrxEoC6kKPRR4h2RZHq/uU2KS8tLAfvxkA/bVYuvLAvoQjoQ5
	AIxRoypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpOy-005mKC-1H;
	Fri, 19 Jan 2024 13:59:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpOu-005mJI-3D
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 13:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705672756; x=1737208756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/40/RTB9UjKxi9Od0nRasdxiGZ7GyKTbdCW/49cFRw=;
  b=0aM8aAUL4KtAQazIB9BqqJ5TLxqc0vlIr0yFAQmRzCth7d2KxxIgLDsd
   2QXUOv72OFM3qeb2+QNgkcStcH8hVESYzq/MnDwZNB0Y0R8OhehUFKwrn
   uoN6UFl7oW0QIFMMHBWuZXynrJJtUT8fXRYrCcHAHjDyKjFjJ6/eWu1ka
   LkGvEX7NNUbiPgar82CJBaEtHEHl22+xLUmynjZ1tZQr9rltrAEiTpYC7
   KwK4PlLRFZJ10I1GUBMolcxPIUjAzuMgGuOOC9c6UbVMxdNOvBIPB/6tD
   kcTm4LVK1+Q7D/kle/EFtVTUByN3Q++JiBP/+inzhLJptpCt0BdqcHLEj
   A==;
X-CSE-ConnectionGUID: s9DSPa5yT/2lOC1K8aydzA==
X-CSE-MsgGUID: 5xml2/pvTuq3Y5CpQ8hwdw==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; 
   d="asc'?scan'208";a="16217918"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2024 06:59:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 06:59:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 19 Jan 2024 06:58:57 -0700
Date: Fri, 19 Jan 2024 13:58:21 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjEgMS8y?=
 =?utf-8?Q?=5D_dt-bindings?= =?utf-8?Q?=3A?= media: starfive: Match driver
 and yaml property names
Message-ID: <20240119-preamble-calm-7724e17fcebc@wendy>
References: <20240119100639.84029-1-changhuang.liang@starfivetech.com>
 <20240119100639.84029-2-changhuang.liang@starfivetech.com>
 <20240119-despair-festival-59ab2d4d896b@wendy>
 <SHXPR01MB0671E2150D9A2707F12E0901F270A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB0671E2150D9A2707F12E0901F270A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_055917_182951_43AC25EC 
X-CRM114-Status: GOOD (  16.75  )
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
Content-Type: multipart/mixed; boundary="===============9180595629411681523=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9180595629411681523==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FEb8PAW5xTtdkNzj"
Content-Disposition: inline

--FEb8PAW5xTtdkNzj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 12:57:22PM +0000, Changhuang Liang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e content is safe
>=20
> Hi , Conor
>=20
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v1 1/2] dt-bindings: media: starfive: Ma=
tch driver and yaml
> > property names
> >
> > On Fri, Jan 19, 2024 at 02:06:38AM -0800, Changhuang Liang wrote:
> > > Drop some unused properties for clocks, resets and interrupts for
> > > StarFive JH7110 camera subsystem.
> >
> > What do you mean "unused"?
> >
> > Do these clocks etc exist but are not used by the driver?
> >
> > Or do they not exist at all?
> >
> > The two are very different!

> These clocks etc exist but are not used by the driver.

That's not an acceptable reason for removing them from the binding. If
they exist, they should be documented, regardless of whether the driver
makes use of them. NAK.

Also, your mail didn't end up on LKML, so there's something wrong with
your setup.

Thanks,
Conor.

--FEb8PAW5xTtdkNzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZap//AAKCRB4tDGHoIJi
0jW2AP9Bp7EjUTpBTrdQLP7B4nOmzqnt6gXBTDDnZd6H416uMgEApGygc1Eeq1gd
yDqYrR/umDrmC2JDspWdkwzShFgVXgQ=
=HLIX
-----END PGP SIGNATURE-----

--FEb8PAW5xTtdkNzj--


--===============9180595629411681523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9180595629411681523==--

