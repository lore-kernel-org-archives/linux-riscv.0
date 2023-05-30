Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B72C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbdsjWkeVfOfO1WNtjkffa5RKbM/aE62msghm0TwpK8=; b=d0vu/TJ6lHqiB0+lVKkAOKwSLj
	2RKXqGVgIzqW5MJyFct2bSxlXmVtpCIStr7jMNEQ3rsMdS5/svQ4W40tAjL9o6htMO7F1/vW6zCRn
	/ACeoDtps/7bHZYq1J/34QTkEwKyHRHT33+PPkfhWlI2sX9CifgiqqRAqQEXaKBp2eBYqIngCNT9Z
	zuXptwLT3vST2Doa73V9C369RyGButGtzxKVMl9UU1SR+GWRPFTdd9LxD93Nmp3js6Ltfihoj6aq0
	M4kCT5siiTmC9Jw90jpGgz3gIRo8XFt/GtYwWCXHsBmXvN/ot8tcbJDHsXlUWgxwB2SGPLicD5rby
	geNTPUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3z9b-00E0JY-26;
	Tue, 30 May 2023 13:12:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3z9X-00E0Hr-2x;
	Tue, 30 May 2023 13:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685452364; x=1716988364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rgP8/DkgE67Jn/btWtUmo2sPLJIt6my6BaVAXky+q5g=;
  b=X1wdnoH9D1OhiaBnkVFFKrDyo1Rv8bpA4nmDmCvF9oNfRebfZVirmP4d
   ZJEpHJedGHlRgQmGNq2Uc7otUtv7BvPa2UlTCxyRhbcZ9b/VeQjya8s56
   ErzBLZZV5Gf7Or8kl48vrYXYzd64P4iEsr/mcSsqXYUjxkJ+9TB3rgxri
   +6pqRvw6SHn7E3Lx2z7ixnG3uGDV0zRdJVchw9I5J5y0jGxXeNdG8j5u/
   /ILcwFVwyuNzj4JkNkIlgY7F9/RJ8U/LOSvmkpEnUPVSSaznzyPIs5aUy
   WT5Ht5kbHKCAbb4W6pM+Zaxfdi8HV3mKiQXuQD79JKyE7EGQTNntav+N/
   A==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="asc'?scan'208";a="213720607"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 06:12:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 06:12:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 06:12:30 -0700
Date: Tue, 30 May 2023 14:12:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: <soc@kernel.org>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <olof@lixom.net>, <palmer@dabbelt.com>,
	<robh+dt@kernel.org>, <arnd@arndb.de>
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Message-ID: <20230530-enviable-poise-183119e695bf@wendy>
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <87bki23rbx.fsf@meer.lwn.net>
MIME-Version: 1.0
In-Reply-To: <87bki23rbx.fsf@meer.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_061244_017749_0768DC7B 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: multipart/mixed; boundary="===============7947441642404809252=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7947441642404809252==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vd/KN9AFeCUUrCcz"
Content-Disposition: inline

--Vd/KN9AFeCUUrCcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 07:02:26AM -0600, Jonathan Corbet wrote:
> Conor Dooley <conor.dooley@microchip.com> writes:

> > diff --git a/Documentation/devicetree/bindings/ABI.rst b/Documentation/=
devicetree/bindings/ABI.rst
> > index a885713cf184..93ec82f78ae5 100644
> > --- a/Documentation/devicetree/bindings/ABI.rst
> > +++ b/Documentation/devicetree/bindings/ABI.rst
> > @@ -1,5 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0
> > =20
> > +.. _devicetree-abi:
>=20
> Somehow we've developed this habit of putting labels at the top of each
> file; I really think that they just add clutter and are best left out.
> Without the label, this reference:
>=20
> > +Perhaps one of the most important things to highlight is that dt-bindi=
ngs
> > +document the ABI between the devicetree and the kernel. Please see
> > +:ref:`devicetree-abi` more information on the ABI.
>=20
> ...can just be written as "Please see
> Documentation/devicetree/bindings/ABI.rst".  The cross-reference link
> will be generated as expected, and readers of the plain-text docs don't
> have to go grepping to find the reference.

Sure. As someone who does read these things in their editor that sounds
preferable to me. I didn't know that I could do that, as the whole
"building the docs" thing is new to me ;)
I'll wait a bit before resubmitting for obvious reasons.

Cheers,
Conor.

--Vd/KN9AFeCUUrCcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHX2JwAKCRB4tDGHoIJi
0jE3AP9pDjLP9d6RnL00Efrio6ZoaKZjOG0zDOEg+4VAprMwmwEAjpD8+2LaBcMN
FnbPRUS5wn47utSB1NzZVqP8Ep4rLAE=
=VH3D
-----END PGP SIGNATURE-----

--Vd/KN9AFeCUUrCcz--


--===============7947441642404809252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7947441642404809252==--

