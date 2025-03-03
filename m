Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186B2C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3JTdnam03fc4OiJJiZNXORC8MmSrTOYuYjMhBSNT2A=; b=Jn4IfPL4qIWi9bFhoKx4PsIJJM
	gxIH5B2E0jau2ZNaamxxO0BiE5NvnnozF3X2CCDMeGULTu66/Fp4Pt97yvyXBvqCWnsxv53WWd9l3
	YMZViDLg1FMvm6tksWdbGNKPgSrNqDSSqhqzKwdyF0QDsOyrS+fC4BVbZFnD+yKlixWKyUD71Do1m
	UVX0Zd7JTw6XQnISEUb+Vdb18JdPtho/C7Yq/kFMKmdChctqXT+xvZt2sdaPoVW2EMZJBScRpo0+k
	IyJOwZTkDRErlTm9jfYs5qHG0lIYQQKaQAdoSBNvpnIIFn5hnECnPBjk/h00NNGU/PyfaiseyJXfR
	++O1Cbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp29V-000000009B9-0BBu;
	Mon, 03 Mar 2025 09:31:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1nd-000000004aK-47Wv
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 09:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740992962; x=1772528962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eLPVTYCLr/v+z3Rpfjq9386InLTsMCaOhJxCahwa3fE=;
  b=WCyqykGqj1dt5xQWiDtVAFRm+E1PlkaJ19NHvfdM5xTijLQRYpHcDUnl
   zCvMa1y87zO8y+pLp25OlxXjronmaPUYiXgk8u1E5Ih0kpZbxVXaPrFxf
   7Bjjh+aB2czIUMz+si4olIwTlEEpLw6jvoU+zTASNRl0sdYkPCACLoCl4
   CrhFD8cRDUgvfcvk8MLGBBMh+U3bd+PX9+Vl8y9fKasmczFPtReP62bGC
   GQNMIsFME8gez5eZf+JhQzve48H5+hU9+RkQELCZ1O7deuk5+JtMcQDRW
   zAyc0sXUaZwLc7AX/q98obnET4qbtknGvsff4FzA2dDNU/wKDqomlLjW1
   g==;
X-CSE-ConnectionGUID: vdV2+gEUTw2O2FxCKkKLiw==
X-CSE-MsgGUID: bSWdOAdmQv+RmLfY7KSCNA==
X-IronPort-AV: E=Sophos;i="6.13,329,1732604400"; 
   d="asc'?scan'208";a="38764365"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Mar 2025 02:09:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Mar 2025 02:09:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Mar 2025 02:09:11 -0700
Date: Mon, 3 Mar 2025 09:08:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Conor Dooley <conor@kernel.org>, Zixian Zeng <sycamoremoon376@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <sophgo@lists.linux.dev>,
	<chao.wei@sophgo.com>, <xiaoguang.xing@sophgo.com>
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <20250303-recital-crunchy-6f7806987da0@wendy>
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
 <20250228-factual-rage-0e1e1e48b009@spud>
 <PN0PR01MB103937D1C23820E0FC43BEA33FECF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <PN0PR01MB103937D1C23820E0FC43BEA33FECF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_010922_304164_2CE28281 
X-CRM114-Status: GOOD (  18.08  )
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
Content-Type: multipart/mixed; boundary="===============3408215123008761229=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3408215123008761229==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ow63fKL/6QkVXSRs"
Content-Disposition: inline

--Ow63fKL/6QkVXSRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2025 at 09:58:24AM +0800, Chen Wang wrote:
>=20
> On 2025/3/1 2:22, Conor Dooley wrote:
> [......]
> > > +
> > > +		spi0: spi@7040004000 {
> > > +			compatible =3D "snps,dw-apb-ssi";
> > I thought were were dropping the use of "snps,dw-abp-ssi" in isolation,
> > and starting to require soc-specific compatibles now.
> >=20
> > Rob, Krzysztof?
> I'm also very interested to know why we can't just use "snps,dw-abp-ssi",
> maybe I missed some discussion ...

Ordinarily you're not allowed to use generic compatibles at all, the
dw stuff has kinda been an ?unofficial? exception for a while and not
just for spi. I think that "exception" has been withdrawn though, and
dw stuff is being brought in line with everything else, but cannot
remember where that started.

> I googled examples of soc-specific defined in the code, and it doesn't se=
em
> to be much, only arch/mips/boot/dts/mscc/ocelot.dtsi and
> arch/riscv/boot/dts/thead/th1520.dtsi.

> Specially, I looked at the commits for th1520 and saw this https://lore.k=
ernel.org/linux-riscv/20240703-garbage-explicit-bd95f8deb716@wendy/.
> It tells if the fallback works identically, then the specific compatible =
is
> not needed.

This link is talking about the driver, not the dts/binding. Adding the
device-specific compatible to the driver is only needed if the specific
one has some extra features above and beyond the compatible used as the
fallback.

Cheers,
Conor.

--Ow63fKL/6QkVXSRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8VxcwAKCRB4tDGHoIJi
0lX/AQDJBY3641IPRBtubqSLaUcbCrjzlLFp3F9Lw+Wi6rDPSAEA8dXwvoY2dJWS
Vy+cEBykB0x0CsyGnioS7rl+yMdBqwk=
=upyW
-----END PGP SIGNATURE-----

--Ow63fKL/6QkVXSRs--


--===============3408215123008761229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3408215123008761229==--

