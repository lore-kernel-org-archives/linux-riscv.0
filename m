Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7394C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ0Ze5eCdqBmltwJp6K05B/R+oDovbW37cBJ3/6mV3I=; b=XIbcMCWbEoVouP/3zakHAQzgpi
	STtjFRislCLv8EEXDkq8lqI3mrlIcrnSHRQgcsFeWNJRG20fbub9BgC7ncVyWB0dw1oRzvEcHI8sq
	aQVkjZ3eWnMc3ku0fb+h4IiEVt2WTe+St3S6wPqJzaReJCXM4Pk5y/rTb1pb+IwOqpl3JRFMeBnvh
	IREYqeWsDE8P5Xz6fKTgXWWpo6BOShELlOAQthSC94Hs1W3b9XsdSng7U1ikS8uXHqPed8dtUKGP+
	cpGZqdUlVXO7You2gPZGaJBfoHxpC8RDUELc02g8l0TSGzRnyggH5RmOm2vHX9DgxwLp+UKg/dbn1
	fyAHbukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkirP-009jo7-2L;
	Fri, 07 Apr 2023 09:58:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkirJ-009jmr-0d
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 09:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680861497; x=1712397497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OMm49nZx3reFlxHU+RGccvmujRLFyp4/7YbOx3zlUNA=;
  b=BqBTfFTW1Ef077x92b9cGZXkjlEqejrjXeTdZ8pY+YlmzTHX9ZjAOngI
   4FbA9GRZuH4T2Mefw56SPin6PdUAVZ/6GN4TzFHdEq2l/d11zpDiU95Wp
   Hjm45ORK66fxL7Lt4XEwQiUvnbv9doCMUW/zTmmSPGzJjV6y8GJbKMYoJ
   x+9AKDe6feZdcjRdb3yW09MvYhZhPmR+CTEgxJS8GKtMh+NU8ic2pNwhJ
   hvf9Xwelz7Ddq89nt7RdEmAtjtnpUVY2zKmVSDJ82gL7lDqVvHACuIe6T
   Sq/1n89lRehKO89DIe56INyHqPKWFP6RlM8L1bOWGr0ieVKYuFKgOGduf
   w==;
X-IronPort-AV: E=Sophos;i="5.98,326,1673938800"; 
   d="asc'?scan'208";a="145992168"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Apr 2023 02:58:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 02:58:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 7 Apr 2023 02:58:10 -0700
Date: Fri, 7 Apr 2023 10:57:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, <daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 0/3] Add JH7110 PCIe driver support
Message-ID: <20230407-splatter-greyhound-edc706148337@wendy>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406-quench-unharmed-2c11b2617e9f@wendy>
 <20230406-coming-stuffed-26f89610959c@wendy>
 <d9dde509-8923-a930-4c82-4bc8bd78ed0d@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d9dde509-8923-a930-4c82-4bc8bd78ed0d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_025817_326938_826EC760 
X-CRM114-Status: GOOD (  29.86  )
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
Content-Type: multipart/mixed; boundary="===============2313383645122658644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2313383645122658644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jlip8xfO52SkZiZp"
Content-Disposition: inline

--Jlip8xfO52SkZiZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Minda,

On Fri, Apr 07, 2023 at 10:32:51AM +0800, Minda Chen wrote:
> On 2023/4/6 19:54, Conor Dooley wrote:
> > On Thu, Apr 06, 2023 at 12:47:41PM +0100, Conor Dooley wrote:
> >> On Thu, Apr 06, 2023 at 07:11:39PM +0800, Minda Chen wrote:
> >> > This patchset adds PCIe driver for the StarFive JH7110 SoC.
> >> > The patch has been tested on the VisionFive 2 board. The test
> >> > devices include M.2 NVMe SSD and Realtek 8169 Ethernet adapter.
> >>=20
> >> I was talking with Daire last week about some changes he's working on
> >> for the microchip driver, and we seemed to recall an off-list email
> >> sent to Daire & Bjorn about extracting the common PLDA bits from the
> >> pcie-microchip-host driver to be used with an (at that point)
> >> unreleased SoC. Perhaps Bjorn has this in his mailbox somewhere still,
> >> our corporate mail policy scrubs things from over a year ago & I could
> >> not find it.
> >>
> >> I realised that that may actually have been StarFive, and the driver on
> >> your GitHub [1] certainly felt very familiar to Daire (he said it was
> >> very similar to his earlier revisions of his driver).
> >>=20
> >> I've not looked at a diff between this and the version you ship on
> >> GitHub, but first a quick inspection it mostly just looks like you
> >> did s/plda/sifive/ on the file.
> >>=20
> >> I'm obviously not a PCI maintainer, but if there are common bits betwe=
en
> >> the two drivers, extracting common bits seems like a good idea to me...

> Thanks. It is pleasure to using same common codes. Does common bits chang=
es
> will upstream soon?

I don't quite get what you mean. We've got some changes that are in
progress here:
https://lore.kernel.org/linux-pci/20230111125323.1911373-1-daire.mcnamara@m=
icrochip.com/
We've been quiet there for a while, but Daire's back looking into Robin's
comments in there about the range parsing/window setup at the moment.

I'm not sure if that's what you mean though, since you said "common
bits" & Daire was doing that work in a world where there was no jh7110
driver in the mix.
Extracting common bits would be part of the process of adding a new
driver, as I don't think there's any real reason to do so without
another in-tree user.

> And I see there are many difference between pcie-microchip-host and our c=
odes.

Right. I'd expect there to be a fair difference between our integrations
of the IP, and therefore there'll be a bunch of non-shareable bits.

You need the stg,syscon & phy bits, and the clock/reset handling is
clearly different too.

> >> https://github.com/starfive-tech/linux/blob/JH7110_VisionFive2_devel/d=
rivers/pci/controller/pcie-plda.c

I had a bit of a read through this again today with Daire to check what
the differences actually are and it *looked* like the main,
non-implementation related, differences were the extra "event" domain
that was created to simplify the driver & the bottom half interrupt
handling.
That all came out of the review process, so it's likely that some of the
same requests would be made of you by the PCI maintainers anyway.

As an aside, you should probably run checkpatch --strict on this
submission, there's a rake of coding style "issues" in the new code
you've added.

Cheers,
Conor.

--Jlip8xfO52SkZiZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC/pFwAKCRB4tDGHoIJi
0vDrAQCzfjkmLgmto/G84NJvLmBRLa1PWCSIuMVxr3sAxUVWcQD9GoHqqTaYnFzv
/J7frufpjB6/uXpEKzEcprsEZSWfPQc=
=NyKG
-----END PGP SIGNATURE-----

--Jlip8xfO52SkZiZp--


--===============2313383645122658644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2313383645122658644==--

