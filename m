Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E7EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaNytvUPOQKEXj92cbNbymozzc17azjtyexf1DVohfU=; b=TYcI2KSFjzcYMbwUDQHXzhwnMk
	lKrsLMAwo0NmW6TCqgCNnUQ+WjHM35woQ5/kqjeUxSdZmLdp0g3ACXOBTBXaLy9YXjjCiLNfsG9e/
	iiPN6TsFKw0ryTCGxSP0F2PL3+K/f0UhEEV8fWKasZdrHHgOHdfVP2Mkwqn49EZL4vnf8+fh21zH7
	zWLN7TMn0bXAFCZZoNqrvFLvjsA1Ka1liPrhIVeQP+zAwlROgqmPM9IJc4aWEnR+F3zFOnfpe43lG
	kOJ10g+73RjpaNjUQ+NQqdbt2i4OR0OTvpDOF2ZSr08gW6yMfbpal5at7TIiWnWyzoENvJmjHt8gc
	X73ACgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwGs-00EQXf-1s;
	Wed, 21 Jun 2023 11:45:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwGp-00EQWU-2l;
	Wed, 21 Jun 2023 11:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687347908; x=1718883908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqCF3GfDpG27kGoS0tVLvifXd0cUJHAq0oMXHt6Pows=;
  b=GhOagcHEPqyER/44npHe/XfBoSpXlcCJvQnB1hsjZUIwS/SJQ6Xx5D7l
   bHu+W31qZqbZmQTJYzQowOQsj8YrDl4W6bo/Kr/7cFIh0JocnMr5qEIF8
   d177MA4GQVMzjg7uzh1MphoetNyRqNfOqmJEnVveJSXrd5awWuFH6q9yy
   o1/ruatmUeH4T4bMmIr7TllHMikpkxdrDszIMfCE1DjiPGm5We/n1Vc9D
   CmRlsZKLbV3J4Fn7ItJJqHIw0ikqbc89mNPGO/hP0eAZTLadxCOAuhG6Z
   Dc8xu+17QFGNl85zRcxzOwxEc922sYzsOVMgX/r9t+Zpr6PGGkaVmPNq4
   w==;
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="asc'?scan'208";a="216987650"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 04:45:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 04:44:34 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 21 Jun 2023 04:44:31 -0700
Date: Wed, 21 Jun 2023 12:44:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: kernel test robot <lkp@intel.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Roger
 Quadros <rogerq@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
Message-ID: <20230621-duckbill-scarf-fa79744cd42d@wendy>
References: <20230619094759.21013-5-minda.chen@starfivetech.com>
 <202306192215.TvQco9m6-lkp@intel.com>
 <d4824941-85dd-d378-be5b-072907b1169d@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d4824941-85dd-d378-be5b-072907b1169d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_044507_960501_F4BCEEFC 
X-CRM114-Status: GOOD (  20.68  )
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
Content-Type: multipart/mixed; boundary="===============4523323478601731258=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4523323478601731258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tRw/601YCUT+ci1y"
Content-Disposition: inline

--tRw/601YCUT+ci1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jun 21, 2023 at 05:29:34PM +0800, Minda Chen wrote:
> On 2023/6/19 22:45, kernel test robot wrote:
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on robh/for-next]
> > [also build test ERROR on linus/master v6.4-rc7 next-20230619]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Minda-Chen/dt-bi=
ndings-phy-Add-StarFive-JH7110-PCIe-PHY/20230619-184756
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git =
for-next
> > patch link:    https://lore.kernel.org/r/20230619094759.21013-5-minda.c=
hen%40starfivetech.com
> > patch subject: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY dr=
iver
> > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/2023=
0619/202306192215.TvQco9m6-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230619/2023061922=
15.TvQco9m6-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306192215.TvQco9m6-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >=20
> >>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/phy/starfiv=
e/phy-jh7110-pcie.ko] undefined!

> I can not find this error. devm_platform_ioremap_resource is an exported =
symbol

I asked Arnd about this since the error confused me too. Arnd pointed
out that this "allmodconfig" isn't really allmodconfig as PCI is
disabled. On s390, CONFIG_HAS_IOMEM depends on PCI and thus none of
this devres stuff is usable without it. He suggested that you make the
driver depend on USB_SUPPORT, which in turn depends on HAS_IOMEM.

Cheers,
Conor.

> > ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] unde=
fined!
> > ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.=
ko] undefined!
> > ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko=
] undefined!
> > ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefi=
ned!
> > ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefi=
ned!
> > ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus=
/xillybus_of.ko] undefined!
> > ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
> > ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
> > ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undef=
ined!
> > WARNING: modpost: suppressed 19 unresolved symbol warnings because ther=
e were too many)
> >> Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for USB_PHY
> >    Depends on [n]: USB_SUPPORT [=3Dn]
> >    Selected by [m]:
> >    - PHY_STARFIVE_JH7110_PCIE [=3Dm]
> >=20
> I will fix it.

--tRw/601YCUT+ci1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJLihAAKCRB4tDGHoIJi
0vj8AP9kJjPUKKeK5Ikb1Vd6nWoEl8ogTNFNE5HjZqKwMcYd4wD+MdHtCtk1hVIG
mTwN9gzq2iJiK6QVTmkspy3bwM3HLgQ=
=7ieo
-----END PGP SIGNATURE-----

--tRw/601YCUT+ci1y--


--===============4523323478601731258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4523323478601731258==--

