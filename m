Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039CEC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIqiCaHr4oCF60ink1QN2yeKwJ+6so2hRbQAzO9neV0=; b=r6EDbvV1QhZoH5zyr3fMRIFqY+
	wU17Vqji6csdW5kjUINirVPUKVXJ0CGcQdqKnZxHL2fLNIxFnhlmgEIn+Ub309tswICf0QWnPJjiY
	LOqqfR3fTrjrDS1qOPC1j5pmE6Lje/xAA7IO28DMP4oe71Ucei5F2GgOjxRkTXdy2DJDGLyg98iK2
	eEbXrVXm3mUSYSnbKNqIS9Eo8GEt6a353Sy1cq8jLakG0Zsrw2chm9ilKYU1MZLfHJO9SwX94G9uF
	gXXQV3ye78HcOAZBda2havXlr0ppj4zaSTjBPMhoe8HLo93cHQ4Xl/EBMAGqm57QY8MsHwtsCUvAU
	tpYkkz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2qr-000eyb-JD; Thu, 09 Feb 2023 09:04:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2qo-000exm-Su
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675933458; x=1707469458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B22J8C980OM1Kvqfd4PEL6BBxLh6LNsp47XsaCW9fb4=;
  b=hIRQJJGDUfw9/NreacGx+h/dayyQKhxiGt29GqjlcrANcFKDAwWSpDJ/
   uGqIt93/tY9inztrr/lGlofKPi56pK0AWzVl0tS+2odg3fNN7uLYsP4L3
   cBkIM7n4oa0I/nVp81pvs0X5IaxcP4Qso8mIu3Ps1g5gt3CWyGr1pg6RR
   eYkcM4EK0soBbfTvnl7nilwv/iwVNNjARnxcj2hQ6JvkKGTMsbq4ckfdR
   Oixka0MDKhLDda/GOVJFXze/ix1/43/84O4QAWF7WmdW2SBbr7o7NxFdW
   qoPs1+VjmyQ684NhsIvTnbaXJbLLGC+SH/5bzKHgBHzSlbGhMEcdkKdhm
   g==;
X-IronPort-AV: E=Sophos;i="5.97,283,1669100400"; 
   d="asc'?scan'208";a="211236035"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 02:04:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 02:04:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Feb 2023 02:04:15 -0700
Date: Thu, 9 Feb 2023 09:03:50 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<palmer@rivosinc.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <christoph.muellner@vrull.eu>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/2] RISC-V: fix ordering of Zbb extension
Message-ID: <Y+S29qPN6jmMwvi3@wendy>
References: <20230208225328.1636017-1-heiko@sntech.de>
 <20230208225328.1636017-2-heiko@sntech.de>
 <C32D5495-F772-4887-9CAD-66206ECCFC3F@kernel.org>
 <20230209082520.solukez3jrshv3qo@orel>
MIME-Version: 1.0
In-Reply-To: <20230209082520.solukez3jrshv3qo@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_010418_961176_2B305AA7 
X-CRM114-Status: GOOD (  12.95  )
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
Content-Type: multipart/mixed; boundary="===============1114798012237876844=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1114798012237876844==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hNr57WA66Fc7v39A"
Content-Disposition: inline

--hNr57WA66Fc7v39A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 09:25:20AM +0100, Andrew Jones wrote:
> On Wed, Feb 08, 2023 at 11:20:10PM +0000, Conor Dooley wrote:
> > Hey Heiko,
> >=20
> > On 8 February 2023 22:53:27 GMT, Heiko Stuebner <heiko@sntech.de> wrote:
> > >From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > >
> > >As Andrew reported,
> > >    Zb* comes after Zi* according 27.11 "Subset Naming Convention"
> > >so fix the ordering accordingly.
> > >
> > >Reported-by: Andrew Jones <ajones@ventanamicro.com>
> > >Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >=20
> > The whole "getting it wrong immediately after fixing it up" ;)
>=20
> Hi Conor,
>=20
> Do you know any patchwork savvy people that could whip up a check
> for this array? :-)

Maybe that is more of a checkpatch type thing?

Either way, I'll put it on the todo list I suppose!

--hNr57WA66Fc7v39A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+S29gAKCRB4tDGHoIJi
0g7fAP9oVUIeufGJdmfpCNWTvatLD+qZqM6xhguUpuIizocYtQEAlN4fj4zu3jTO
ex8o2+z+i3+9g/A71DmaXbiPPOIrGQA=
=581v
-----END PGP SIGNATURE-----

--hNr57WA66Fc7v39A--


--===============1114798012237876844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1114798012237876844==--

