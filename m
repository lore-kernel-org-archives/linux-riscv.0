Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFFAC77B6F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypf4uZAwGyz56Bzt3GSNnrL0+SIteh+fpCa+7MODEj0=; b=i3/8KuCICf6zNdO03zFXiUuCA3
	uPF3n/V38kUSqu8SXh7Mxtaxmxp7JXqZODcVCLKFJyU/EGUoy6IOnXBxf61mFa1tmmE0rqdfki5jj
	uZmdWfKL6L66C20ZLDGOpjmEL2jfj7VygLa2eUvP+giF5ALTyvFzgV1sntvGW7AOPtlePAVN+I5LO
	EN9qurkDkTBoDGb75TlPbBLWcL/EgB9renNvxmziHGUPaF0gXUxcjJ9Wutq0edO02ID2onPtCYrV1
	O0+iU0xzA3Nc1g8ZEKCVmC7mNkNFtW/6h1nMRPU8RCAPK4MKQafmdRX7TOxGzowzFl9yCdt4Evraw
	AWLHwJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmCXf-00HTsp-2c;
	Tue, 11 Apr 2023 11:52:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmCXb-00HTqv-0p
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 11:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681213924; x=1712749924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDNwN+L7zB55OJP9jBjVVnbHvsXbaSOmUpcPGO60Xi0=;
  b=q2bBj2e+uWNRUDvDmrcNkQuxPWUX3vSH9N4cjxTJj2BFHHhxD2V1mZxj
   5bGRXk2QQ5j4SV1euZ25alv2E4mbcYjWkwiJsZY5ZvYlkWOInzwO9UNbU
   NIy+LbVay8S8lUxjOG7U+176cjRCZQnIwPgZdT+gvfl43hj+WK4MPwk4u
   SZw111VWeXsnnHZsYWvTVy+MKkK7+5H0mmepWFzjzCCyHywGFAi2EevLi
   RYDEQBX2srlYF357VvzNecPJ9SF1I/BOkkgvcIBVNqOLHQ7Oi7rfvT1DK
   rRy/m1XDVSHz9bU+0czJDVLxW1AsmbZpIl6mpdcwMkBY9KNTAV5yZRl+a
   A==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="asc'?scan'208";a="205928204"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 04:51:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 04:51:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 04:51:49 -0700
Date: Tue, 11 Apr 2023 12:51:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xu Yilun <yilun.xu@intel.com>
CC: <linux-fpga@vger.kernel.org>, <conor@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] fpga: add PolarFire SoC Auto Update support
Message-ID: <20230411-tinsmith-matchless-af5c7c41d23b@wendy>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
 <20230331071823.956087-7-conor.dooley@microchip.com>
 <ZClfjuLa/pRATwCp@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
In-Reply-To: <ZClfjuLa/pRATwCp@yilunxu-OptiPlex-7050>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_045203_358978_C71ED5E5 
X-CRM114-Status: GOOD (  27.83  )
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
Content-Type: multipart/mixed; boundary="===============8780220917748202738=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8780220917748202738==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dLzJ91lPjUUfUd6j"
Content-Disposition: inline

--dLzJ91lPjUUfUd6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2023 at 06:57:18PM +0800, Xu Yilun wrote:
> On 2023-03-31 at 08:18:22 +0100, Conor Dooley wrote:
> > Add support for Auto Update reprogramming of the FPGA fabric on
> > PolarFire SoC, using the fw_upload mechanism a la the
> > intel-m10-bmc-sec-update driver.
>=20
> I'm not an expert of MTD and have several concerns about the mtd
> writing part:
>=20
> - This seems a generic case that writing a file content into the
>   driver restricted offset on mtd.

Right, writing at an offset is pretty generic.

> - Seems the firmware update interface could be created for mtd device,
>   like the nvmem interface?

I'm not entirely sure what you mean by this one.
Are you saying that there should be a generic way to do "firmware"
uploads to mtd devices, based on some sort of structure defined in
devicetree etc?
And perhaps then, this driver would register as a consumer of that
interface, pushing all of the direct mtd stuff out to that interface?

> - I assume the purpose of the fw upload interface is to protect
>   unexpected writing from user. So how to protect the mtd be
>   written by other user interfaces like mtdchar/block or nvmem?

I'm not very good with the security knobs so I don't have an answer for
you here (yet). But your assumption about the rationale here is correct
and I would like to block access.

> For other parts:
>=20
> - directory block check, fw upload don't touch this block, so why check
>   it in fw upload process.

I don't know what you mean. The mtd device could be empty and the
directory would need to be populated with the image address etc.
Or, it could previously have been used for something else, and then it
would be required to reconfigure it correctly for Auto Upgrade.

Maybe I am misunderstanding you?

>=20
> - image verification, no matter pass or fail, fw upload is actually done,
>   the flash is written and no way to rollback. So may remove from fw
>   upload process.

The FPGA is flash based, so writing to the mtd device is not going to
actually program the FPGA with this content. The original image/bitstream
in the mtd device is either going to be a) equivalent to what is already
programmed in the FPGA, b) not an upgrade over what is current in the
FPGA, c) something that was uploaded since the last time the device was
restarted.
I don't think that overwriting any of those is problematic, as if the
verification fails, the original bitstream will continue being used
until an image that does actually pass is provided.

Without doing the verification though, there's no way to tell for certain
if the FPGA is actually going to perform an upgrade to this new bitstream
once it is restarted, so I think there is value in keeping this.

If you're still very sceptical about whether this belongs in
drivers/fpga, I can always dump it in drivers/soc instead I guess.

Cheers,
Conor.


--dLzJ91lPjUUfUd6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDVJxgAKCRB4tDGHoIJi
0pQSAP97BT4XTrsoYV/lQtiljkj5kbrxBzArbNkTmg8edtrX3AD/YwdgiW+cA4vP
ZYY9qhOwvbAJtvjq6hlGsI6hYBRkIg4=
=9y6K
-----END PGP SIGNATURE-----

--dLzJ91lPjUUfUd6j--


--===============8780220917748202738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8780220917748202738==--

