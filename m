Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB50C282CD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5A2KxuTB9Eed7UMEYgK3kTubw88x6G7WaNDAOd7XUI=; b=ogtldqlL47JIvUT1bSCuih0+19
	0DwVi9O1Dl1lL18SNyhG8IPB+EXBaF+T04zLvlQpUmBRbsVoFyq+TEMYHGRmqec5/cY53MUxiXlOK
	mnQLYnQo2PN8XSSsk1XT8E6JebalbPBIQKkKtyEu75qOObarBg3YSsVVhOUghKRacZ3/lp69p44v8
	12MCqY9X1/s4WA0U5wKeZdpEFbOMz10Q9sizSS4TJqtPKbqowQfCbb7OVxgKT97RDZpKStsYszaew
	w44j9OoYInZBRFzhoISlmLZfE+57Ijh2xBVjz/T6PA76egQxEqNYG6L6lxp8iFPM2TciM7/b3+3pN
	H2mJIjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp29W-000000009BZ-23zL;
	Mon, 03 Mar 2025 09:31:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1rT-000000005e2-16Gh
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 09:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740993199; x=1772529199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BtoQelzDR2YH4eJcJiAnN1ShwH9UMlztv91FI3QOKQM=;
  b=RfuBr1o7zfCmdqCvtGKdjEUW66B1XcksF9+QZ4gha7HBbOqX3HwdrKqZ
   mXOT5PUmdUrogRvAMa0FRk3/Md9RmrJZucu/JE0XdF/UmegF/oJSnMiZ+
   6c/zk73RIsnmVi6IhAsPI7SDW+dT8OBnul3P6HNfO1TKvfqcDP9oDqzhL
   DXQklUXqATztOMoOJQjprvwKF2XMR9V7v4x9PuS/y7vDrKPthdnkYxceH
   pJH0ZPVxTxF/WSdro2BpDfOfj5hKKo7rwVwtVPs2ynh6Xowc4ikBxfoZj
   3uUTaOsXqKg/tUuPy1ptsHDe8wpHH7gTB4ygQtYsoSB9i0LJ31x7qDcSC
   w==;
X-CSE-ConnectionGUID: zipm0jdkRfKil1sH3LekQQ==
X-CSE-MsgGUID: HgnAMhUcRYiKVH8wTkC38Q==
X-IronPort-AV: E=Sophos;i="6.13,329,1732604400"; 
   d="asc'?scan'208";a="205866723"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Mar 2025 02:13:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Mar 2025 02:13:01 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Mar 2025 02:12:58 -0700
Date: Mon, 3 Mar 2025 09:12:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: damon <sycamoremoon376@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <sophgo@lists.linux.dev>,
	<chao.wei@sophgo.com>, <xiaoguang.xing@sophgo.com>
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
Message-ID: <20250303-demeanor-snowstorm-d3ca34450099@wendy>
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com>
 <20250228-factual-rage-0e1e1e48b009@spud>
 <CAKyUbwXUPBceR1ArZeLLjs1VNyRW=DngZyLTUCDGPFvT9wKikw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKyUbwXUPBceR1ArZeLLjs1VNyRW=DngZyLTUCDGPFvT9wKikw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_011319_371496_41D27F8B 
X-CRM114-Status: GOOD (  20.97  )
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
Content-Type: multipart/mixed; boundary="===============6622848095360226600=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6622848095360226600==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yvO2V4zUqjO1jyjY"
Content-Disposition: inline

--yvO2V4zUqjO1jyjY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2025 at 09:41:14PM +0800, damon wrote:
> On 25/02/28 06:22PM, Conor Dooley wrote:
> > On Fri, Feb 28, 2025 at 08:40:23PM +0800, Zixian Zeng wrote:

> > > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot=
/dts/sophgo/sg2042.dtsi
> > > index e62ac51ac55abd922b5ef796ba8c2196383850c4..500645147b1f8ed0a08ad=
3cafb38ea79cf57d737 100644
> > > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > > @@ -545,5 +545,33 @@ sd: mmc@704002b000 {
> > >                                   "timer";
> > >                     status =3D "disabled";
> > >             };
> > > +
> > > +           spi0: spi@7040004000 {
> > > +                   compatible =3D "snps,dw-apb-ssi";
> >
> > I thought were were dropping the use of "snps,dw-abp-ssi" in isolation,
> > and starting to require soc-specific compatibles now.
> >
> That=E2=80=99s better, I will do it in next revision.
> BTW, <https://lore.kernel.org/linux-riscv/20240703-garbage-explicit-bd95f=
8deb716@wendy>
> has similar situation,
> those patches only create binding but not implement the compatible
> property of "thead,th1520-spi=E2=80=9D in driver.
> When kernel matching, it will find out there=E2=80=99s no compatible of
> "thead,th1520-spi=E2=80=9D so fallback to "snps,dw-apb-ssi=E2=80=9D

> May I take you a few minutes for reason behind it? My understanding is
> that using soc-specific compatible is better
> for future maintaining, If the device actually comes with some unknown
> quirks not present in the generic IP.

Yup, that's pretty much it. Those quirks could be some sort of bug etc,
or they could be an extra feature. Sometimes the specific compatible is
only used to enforce constraints on what properties are allowed, but
that's more of a thing for the more configurable IPs like the dwmac.

> And all we need to do for fixing is implementing the soc-specific
> compatible property.

Correct. You just need to add a specific compatible to the binding and
to the dts, the driver will work just fine with the "fallback" dw one.

--yvO2V4zUqjO1jyjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8VyawAKCRB4tDGHoIJi
0j1iAQCyO+C9MUu181Bphcy8Tffe1bTfr7IWlfWuccIoHjOBhAD9HxKK0VwJzs9G
QdA5iHSPF66wWVcdBRk99lm7Oi90sAM=
=RlN7
-----END PGP SIGNATURE-----

--yvO2V4zUqjO1jyjY--


--===============6622848095360226600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6622848095360226600==--

