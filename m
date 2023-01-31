Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90976C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZzEDpTiGLYBIBACnpED5FdxeTeww75iVDzFWdNsDQg=; b=cJmvU1IEWuZ8Gcjo+hWhCWUZeV
	9OYNc5FKwJzlx7PpGXjq/hLh2RniQqQUkvVWi6Okz+UWRq/cn+RDNV8XyeJY6sY2tTzko1vueOwgp
	lFmWajXVqDmumQ971RKqskL4gpKrV51c8LiPoQ8+ThBsXd0trWrFV5kSL6io9CeLRGQ5rvHjhXjN9
	Zf0mgE0giAgp7QLSEQpmiX0LdmlVbSIFK0xpqhQ1E1tL+fWnLmw9paFL7LBXuz+9Q1fBwa1vPUBoF
	+YKnIDRGQvs8Z8Sn5T+kg0yOZrjZmxnjJp4JM/WGv5h1wWhDdj/ka9Z/m23vkvZ+Fc8ogfRDTRq/3
	J58q8kjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqem-0085rM-Dz; Tue, 31 Jan 2023 13:26:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqdr-0085Oq-S3
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 13:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675171543; x=1706707543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P34nOjVcnNypl+Kk1cS78xdIMrTtiyaiPBMGNb5PAMM=;
  b=od7/cpS8lRiEq13kueU8cPYTRE4nYyfJyEyNT0SGs/0AXU/ks3ukZ6u3
   drJPy/GT7v4JUkgEu7/kFca3kdoVfVqQldIbSLbra3SWaoJowCLyJUCv9
   jUzPEGGiSyf2boXGIxiiZ+pi9QBH7BQ9rXzbdCWkYXW8rthEGELgS838v
   2Q4hAD9x57IG1tVp3EVEqyWPYG4iX/Xjeu5bgRRgNCjObwzMUVEh6koIh
   6S5cAd0xIVKX5+hMVeaNk1aWz5/7PcpnBQ6cA9RtF5dj/VagTdydNkQco
   EfHqQK1Ad4KVqROY9u5e20BwdO0aHwq/TwDoLe3DEGUNWk7Do0U7varL6
   g==;
X-IronPort-AV: E=Sophos;i="5.97,261,1669100400"; 
   d="asc'?scan'208";a="198722076"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jan 2023 06:25:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 06:25:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 31 Jan 2023 06:25:36 -0700
Date: Tue, 31 Jan 2023 13:25:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Hal Feng <hal.feng@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
Message-ID: <Y9kWuMmfvpizkuOG@wendy>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
 <CACRpkdbU=Y_LVBfSctQULzFuo4tB9KxgFbv=JGHPuuok6jC8FQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbU=Y_LVBfSctQULzFuo4tB9KxgFbv=JGHPuuok6jC8FQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052544_020707_F0233364 
X-CRM114-Status: GOOD (  23.86  )
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
Content-Type: multipart/mixed; boundary="===============1349596735278669658=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1349596735278669658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0x/nIgbgGdl/P7v7"
Content-Disposition: inline

--0x/nIgbgGdl/P7v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 02:13:44PM +0100, Linus Walleij wrote:
> On Tue, Dec 20, 2022 at 1:55 AM Hal Feng <hal.feng@starfivetech.com> wrot=
e:
>=20
> > This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> > You can simply get or review the patches at the link [1].
> >
> > [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
> >
> > Changes since v2:
> > - Rebased on tag v6.1.
>=20
> Overall this looks OK, the DT bindings does not have any review from
> the DT people but I think they had enough time to do that and were
> properly CC:ed so not your fault.

FWIW, Rob left comments on patches 2 & 3 of the series:
https://lore.kernel.org/linux-riscv/20221220201920.GA1012864-robh@kernel.or=
g/
https://lore.kernel.org/linux-riscv/20221220202003.GA1018798-robh@kernel.org

Relatively minor, but not ignored by the DT people.

> However when I try to apply this to the pinctrl tree it fails,
> for example it seems to depend on an entry in MAINTAINERS
> which isn't upstream.
>=20
> Can you please rebase the patches that are supposed to be
> applied to the pinctrl tree (for example normally not patch 1, the DTS
> patch) on my "devel" branch:

Yah, the DTS patch needs to be dropped, the file it applies to doesn't
exist in any branch yet.

> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Ddevel
>=20
> If you resend this quickly I can apply it pronto.

It'd be nice to get this stuff into v6.3 if there is still time so that
there is one thing fewer blocking the base platform support!

Thanks Linus,
Conor.


--0x/nIgbgGdl/P7v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9kWqQAKCRB4tDGHoIJi
0jKoAQDwEN/yAutcm2C9S+weVvInq0FrTX/MBj04AH7uKiz68QD/cR8sggDoE9KR
buGAMW+O6YJN3LCNH1kb8IDYRmLo8Ak=
=/HNw
-----END PGP SIGNATURE-----

--0x/nIgbgGdl/P7v7--


--===============1349596735278669658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1349596735278669658==--

