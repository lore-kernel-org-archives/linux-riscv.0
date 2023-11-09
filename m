Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D85C4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBmLloa/JXKaQ+w+VLwUxbNB0Z/2i7zFc2kkB/0eEh4=; b=mujjnx9r7DobJrVzfoKadR0gNn
	K48QXbEbFmwcGghVfJefUnSvU54eNXeR/B1t3JAIpTXiqUZ+3jfZ1dKC5qVKuYxRC25/IbbL3nSlQ
	P7bZAt6CchikDJHpeVk4UQPClOqA8hnKDTQZ2n4PUs5UuBKBZGj42+hZow5hipE3jYMZQzFmGOssp
	hlXykKFfHvEjS5ZG2VKpZrdsFZZGZG7jjIcvX3Cn5M5wNJPkggvuekr8G5wB7/TsT8VPkz+/fERhg
	7LTwgsuTZ5wvVowa6UAQhjI5oo4WQ28rywHFIxjw327ntmHV+NWgCEe3lkzt0antY/SZ+kDUKLd+l
	tufexIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zsJ-005Y55-1t;
	Thu, 09 Nov 2023 07:54:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zsG-005Y3f-22
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 07:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699516488; x=1731052488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pPfBmiUINhRoPJo2eY11blRCwfArWzDBp253sWlEgM=;
  b=Msi3vmVxl1siX5raOHb27mfSP/YW1tTLX4f+IpeYKxuOzh30KcgJx1/8
   g5D2p7cGwFCCxF2pK6hFlsav5OZsM5/EJDVVWpl33vcZ2mbUgG8Af6v5C
   NtPTLNnIC/E1PtsWn/KLKlMJt1pO5BfFw4fEHNeDxV7btwRPv7yRPw6BL
   lCBLBRLZCfwWDan5HUdSDtWKfqOFZTIq576TT2Si52vvJMdiGZEqp1loG
   55muj+ik4yz1fNlJXjukVMMtXo+2W69vCKULDGzqnTiTzNOwZ1Msx5Pd8
   mYp0PVlsYNkOIon2s+1p3ka+YrVqWTSMBApBv79G5200AZLVlvU1tPUWw
   Q==;
X-CSE-ConnectionGUID: se6pjHG5SuelUARNIWzFMg==
X-CSE-MsgGUID: vlGbOKuDThK6JpzYW9mFPQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="asc'?scan'208";a="12060742"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 00:54:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Nov 2023 00:54:35 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 9 Nov 2023 00:54:32 -0700
Date: Thu, 9 Nov 2023 07:54:07 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jerry Shih <jerry.shih@sifive.com>
CC: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>, Samuel Ortiz
	<sameo@rivosinc.com>
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
Message-ID: <20231109-prevalent-serrated-d40eb5f71236@wendy>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
 <20231109-revolver-heat-9f4788c51bbf@wendy>
MIME-Version: 1.0
In-Reply-To: <20231109-revolver-heat-9f4788c51bbf@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_235448_671677_D0BF6F43 
X-CRM114-Status: GOOD (  14.21  )
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
Content-Type: multipart/mixed; boundary="===============8899465520248980463=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8899465520248980463==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LUyl317BBN37OabN"
Content-Disposition: inline

--LUyl317BBN37OabN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 07:44:46AM +0000, Conor Dooley wrote:
> On Thu, Nov 09, 2023 at 10:58:41AM +0800, Jerry Shih wrote:
> > On Nov 7, 2023, at 18:55, Cl=E9ment L=E9ger <cleger@rivosinc.com> wrote:
> > > +static const unsigned int riscv_zvknhb_exts[] =3D {
> > > +	RISCV_ISA_EXT_ZVKNHA
> > > +};
> > > +
> >=20
> > > +	__RISCV_ISA_EXT_SUPERSET(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_zvknhb=
_exts),
> > > +	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
> >=20
> > The Zvknha and Zvknhb are exclusive. It's not the superset relationship.
> >=20
> > Please check:
> > https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096
>=20
> You got a response to this on the previous version, but didn't engage
> with it:
> https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc=
=2Ecom/#t

Ahh, I now see what that happened. Your mailer is broken and puts the
message-id of what you are replying to in the In-Reply-To and Reply-To
headers. The former is correct, the latter is bogus & means you don't even
get delivered the response.

--LUyl317BBN37OabN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUyQHwAKCRB4tDGHoIJi
0nowAP0W6kYqZfjp8aXoOoQXmmbdkMNZc5Iz55LCZY1/uNSHywD9EzrcQKDZ70d+
CQXwkQCx/EhZ3XtYSRbz+3Q65lor3gQ=
=zJio
-----END PGP SIGNATURE-----

--LUyl317BBN37OabN--


--===============8899465520248980463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8899465520248980463==--

