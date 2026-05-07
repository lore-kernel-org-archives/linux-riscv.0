Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF7BCD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ9ZVeQ5EuDo9CfkFGMV7nCuNu9U7TxPzFBmsuHBzQQ=; b=GTzFWuG0wEiD0qJbBkl2wt40j6
	4Iv6tRseX/P5wzrVJ5Kd0HEsQaZz1uaQxpLt7VNxFY3i94Tr9uXKmAWsLvqTfpz3V3QJD9CaT1eVH
	UTtBWdfbHbIBk4NWxvIMUNYybvC5dcu1cCgwqDYVqW/WTW97C02Ih8D74npdi1pPpwk6RfhvehSbv
	71Vz8RoGDKgoy7aV5L2/zQ0M1uBjYlelRmU5VyZl+bU97iIzthK564trlIHLnzjRJ/qN/RoxTP5nt
	FfYHYG5/luyk50A430kg7I3ypo17fQb1iic06oJOSNDMdgFmN3U+XjDZ1QjAp5ZVL/2nCLlvXFpc8
	GKgQX7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Ei-00000004R9v-44ja;
	Thu, 07 May 2026 17:10:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Eg-00000004R9T-1Ew6
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 17:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E55E741989;
	Thu,  7 May 2026 17:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC4AC2BCB2;
	Thu,  7 May 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778173805;
	bh=+fDDC2gOM2vT37zdm0PRjn+cEpox1iVc6cmHoJwRQCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cyo4OR5A5MyZj9MMxk86nEfGhWcKSueVZGP4x/CxhWKnTTa0/BdwWzRwssDNCFNiN
	 dkqnUmE1y21qSe7oEyAvyiLZAkYaIB8nUjjj4WlVN3hrklJ//F+lbyfuARrt2aAZvJ
	 DSQVHPr0Zl9j+pJ4JP85SOzegE5/xILzm3eYhXN2IIuysrmvEsWyv4UsTEZMbPqXE/
	 OHaLDuR+SWpCiQrNnXwLdLei3AO+HTAMThdUVXxKrLqVNiqgF0kqlirTOHME3VW4Am
	 VQ8vJF9al4xc7yYlbjsXsVerkYAROCg67yV6Ta3o9Rlhq9icBmKV6Jigj/2umsbh1r
	 9Zr850FHZesBQ==
Date: Thu, 7 May 2026 18:09:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260507-marina-cost-dc8e597ccf26@spud>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-5-changhuang.liang@starfivetech.com>
 <20260506-proud-dubbed-9ab8011df899@spud>
 <NT0PR01MB1216090A629C0095441617F6F23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <NT0PR01MB1216090A629C0095441617F6F23C2@NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_101006_356215_1D4995F8 
X-CRM114-Status: GOOD (  12.37  )
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
Content-Type: multipart/mixed; boundary="===============3706992380817889539=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3706992380817889539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XQEiPSEut9rI/7HI"
Content-Disposition: inline


--XQEiPSEut9rI/7HI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 09:05:44AM +0000, Changhuang Liang wrote:
> > On Wed, May 06, 2026 at 01:59:37AM -0700, Changhuang Liang wrote:
> >=20
> > > +	clk_uart: clock-25000000 {
> > > +		compatible =3D "fixed-clock"; /* Initial clock handler for UART */
> >=20
> > What does this comment mean?
>=20
> Here it's just a temporary clock; it will be replaced by the clock driver=
 later.


In that case, it is highly unlikely that I merge this without the clock
driver.

--XQEiPSEut9rI/7HI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzHZgAKCRB4tDGHoIJi
0hgHAQD28JsxpyMgMAdl7P10S7blw9HcLMODqNpWq66EFUqvagEAx2wXe7SCziUl
s/0N0aDh4GCXtJ64mod/tE/f18OrOQg=
=sk7Z
-----END PGP SIGNATURE-----

--XQEiPSEut9rI/7HI--


--===============3706992380817889539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3706992380817889539==--

