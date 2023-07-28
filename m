Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E5C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K512xXHW1pvHhBqaCnTHz1f7YvY6NJZm+njl2QtV/EM=; b=fX9Vo3yF2I2H9UPa5KY4KVc5PW
	jZPHVruahcpzOS934caxxziABmWjaissI/ipQzEpYNPyxU2+wgfdItgnIalTfKMcBqjnICLb321fz
	tjakhQT7/866Apb0xVhssQFFnIBmcx9ial6AlKSae9pfem+mENwMOre60E8z+X26SZr+3zM9/QGGN
	sSTlHPauvA52a8GoFJiN5v7jnhlhLL/jc35Q2w+Dnj+bTR1uKYGrP/l8jrSgi/2YYradTAlpJZJis
	5pkiVug8luprjaWt6i2IRZL2nqHov7gqZzCl7ee0vPjoNaFSNwQWMXZYmuGKGFjzbFTq0VxWMe5xB
	FYXdv1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ5x-002RTW-25;
	Fri, 28 Jul 2023 08:45:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ5u-002RSX-36
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690533906; x=1722069906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=39HzfctpthLPLIzHxtcjcYgYWJjzdq8qsoNHjvGlKks=;
  b=DZmBL/qNtRQRaJI03r/o7ulvf7H5Fk/A6AtmhC8Xl6dNtcMRZwfq7Tnx
   IPGRAp0ly34PlIWKrbU2sQdjn4cJDuZHDjNxbORV/r5sUgzxD3ICpSqnJ
   vJK8Tg27bW3E4qhu+ZcDM2zKh4ASop8LCzY6aeuqTS3+tz57o/JtI/pKB
   EmwbH7zBby18vWmGXZNsKAAipUWFfwcPctxtj2lYMpjJQ3bCTRa1c2l90
   h8uSGp9jn2GopRDfI6pVIP2vgNkKNXsMp040sIqvwEN/VZhwsBLWuq/5P
   2uLVNGNm0yE+XPVYz6PJ5K0XS3hyTJJOFsnhRQQ3nclcY751YUsz7NvIA
   g==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="238389076"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 01:45:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 01:45:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 01:45:04 -0700
Date: Fri, 28 Jul 2023 09:44:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Jiahao <chenjiahao16@huawei.com>
CC: <daire.mcnamara@microchip.com>, <andi.shyti@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH -next] i2c: microchip-corei2c: clean up redundant
 dev_err_probe()
Message-ID: <20230728-serotonin-anointer-1771952f3baf@wendy>
References: <20230728083137.3528303-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230728083137.3528303-1-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_014507_006736_5047D960 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Type: multipart/mixed; boundary="===============6670810403826787774=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6670810403826787774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2bWGLkERN8vWtbMQ"
Content-Disposition: inline

--2bWGLkERN8vWtbMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 04:31:37PM +0800, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked, error message also been printed via
> dev_err_probe() if ret < 0. Calling dev_err_probe() one more time
> outside platform_get_irq() is obviously redundant.
>=20
> Furthermore, platform_get_irq() will never return irq equals 0,
> removing spi->irq =3D=3D 0 checking to clean it up.
>=20
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--2bWGLkERN8vWtbMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMN/7gAKCRB4tDGHoIJi
0hYsAQDTXZST9uaj9WrULRYu1kxr3aMKII3mUkIzSBf2ukqZ2QD5AQvD8C2/m0oz
MQLAc8wM/frBZFpmAtD8NEr1TosIlwM=
=M4pK
-----END PGP SIGNATURE-----

--2bWGLkERN8vWtbMQ--


--===============6670810403826787774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6670810403826787774==--

