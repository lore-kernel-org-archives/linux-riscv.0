Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AFBC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxexSBFwB1nhvu6VKgTByYuOGdtDhDMaSSlLoeyAoIg=; b=qCHXdWTRl104S/OX5R5VyeOk2q
	QCLfHBxuS6WaArH4W7ZKqh1/aF/8LKtSzEbbbRUQxHL9b0upeAWhQgMB8Mfnzq6wPG9A/FVdcKphe
	WUMHKxn/Rd4qzh7GHTLz/hXE/q51zud1bnx5hNC7vdtN/cqlrNVX6B9gFsPnBqlrpTMxS/phmXATe
	ASXy+/OxEGaeD15sMjhanqkk9UXUZKHl5TnRX1s+WqTONbzpqHjBS1mCY1l9SQihrcNgjBTQG1RS7
	O4+5c8kT7uu3pl7hazsZFL5QgfwUOlHOkvknc77AIpmWjMAs0Kms/xbQqsAsYDJl3DN5Iusz1DLyB
	thXadgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqmz-0051Bm-1e;
	Tue, 16 May 2023 09:16:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqmv-00519o-0A;
	Tue, 16 May 2023 09:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684228568; x=1715764568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kb56PZ4c03l2GhNe6a5xbJY4KvpJ9NK+1Yzfq2wlekI=;
  b=w37jfAZKC2EdO+JcRaM87fmWNYoF1U9pgkcVNMQ0jYiyiFDH+MzuBrw0
   T+fPH2Wo/9oXa1d1XKfpzvWJkyAflaoz3cNH2mNIDecY+h8iH2vQj2Cc8
   MG/Q1XTc+9wxpYSbmRv7+LxcYDHkLHPzZ/Lhc/LjrE+k88cQ4JPp87WDg
   LlHLe5KHJ80NIHSuZkP/APhX7J3YinAbWRyaH4kpKV6nBr89tQrgtmflU
   OSJONfqNxexc1wrwWG2HFltr5PT7gKYMPUCqjkCINP4pbCu3cgYf3o9mr
   4EIlBltzB0tVZOFVCsHD8sDX58HwWGABA6KU2FQPkuCyYxfC6FsicjVir
   A==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677567600"; 
   d="asc'?scan'208";a="215627684"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 May 2023 02:16:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 02:16:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 16 May 2023 02:16:01 -0700
Date: Tue, 16 May 2023 10:15:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Conor Dooley <conor@kernel.org>, <soc@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Olof Johansson <olof@lixom.net>, Palmer
 Dabbelt <palmer@dabbelt.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
Message-ID: <20230516-tactical-handcraft-d245a095faa4@wendy>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud>
 <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>
 <20230516-grader-dejected-df65cdc584b3@wendy>
 <cca446b3-9b92-3191-ae0d-1bd7e552c90f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cca446b3-9b92-3191-ae0d-1bd7e552c90f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_021609_151338_19A9959C 
X-CRM114-Status: GOOD (  22.75  )
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
Content-Type: multipart/mixed; boundary="===============5529827602331755102=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5529827602331755102==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PtBfR+i2mj9pXUBf"
Content-Disposition: inline

--PtBfR+i2mj9pXUBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 11:06:41AM +0200, Krzysztof Kozlowski wrote:
> On 16/05/2023 10:57, Conor Dooley wrote:
> > On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
> >> On 15/05/2023 21:20, Conor Dooley wrote:

> >>> + - Defer the devicetree changes to a release after the binding and d=
river have
> >>> +   already been merged
> >>> +
> >>> + - Change the bindings in a shared immutable branch that is used as =
the base for
> >>> +   both the driver change and the devicetree changes
> >>
> >> The policy told to me some time ago was that no merges from driver
> >> branch or tree are allowed towards DTS branch, even if they come only
> >> with binding header change. There are exceptions for this, e.g. [1], b=
ut
> >> that would mean we need to express here rules for cross-tree merges.
> >=20
> > I've got away with having an immutable branch for dt-binding headers!
>=20
> Of course, all is in an immutable branch, but in which tree?

For example:
- dt-bindings & header with the clock defines in the base/immutable branch
  on top of -rc1
- driver patches on top of the immutable branch, in a PR to Stephen
- dts patches on top of the immutable branch, PR to Arnd

So, clock tree doesn't get the dts, soc tree doesn't get the driver.
Hopefully that clarifies what I meant.

> I talk about a case when driver tree, e.g. different clock maintainer,
> takes the binding.

If the other tree just "takes the binding", without some coordination,
then you're SOOL and have to wait a release.

> > That said, Arnd did actually have a look at this (and suggested some
> > changes) before I sent it & did not cry fowl about this section. IIRC,
> > this is actually his wording, not mine.

Probably worth Arnd chiming in & just telling us what he is okay with
taking.

Cheers,
Conor.

--PtBfR+i2mj9pXUBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGNJvAAKCRB4tDGHoIJi
0q0lAP4yeb7Qv9khm4px8qzetAw8FByjxe7F7Hb5Iu38DARrsQEAhy8q7y1R1tmp
IJ/kRF2k57AInRDcYTR/PChtZvzF/AA=
=20NK
-----END PGP SIGNATURE-----

--PtBfR+i2mj9pXUBf--


--===============5529827602331755102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5529827602331755102==--

