Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02116C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z7RoTJY5C+3rMm3zn9fR1J/7tz/htM2OCWXQseNrro=; b=HMBKUyvoBv7OKMvz6gBeRt/cJz
	H8vumWApt2WP3+DhNqJltfHYNC8Ku2FU0ab2QRAVYvEatMpcSAMm26F+DmkwLpIsB9JxWjUOWw9TJ
	vWtfa22668cP7EdPt3XG8zpl2I9GK8NDL3SbU5QhNVYJ7DoSgjRIRd0S2QyZH6FM98cV0sKSrRaEb
	UOfSkby/DWFIx/mA5wcoAUHOZ9Otsr4o6zZqrkfw4Nd3cUi6rDAE9v/pMbUAQ+YgqDx4D48P3qgc2
	K2ceFf3KD/Apek1Nf90OWKwPja1HWr8iLZrGppA6IVPjNDIRy6x8WpmjD9tlvGWJWIGvnTkaIj+qW
	QpwpFK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pryQd-0065YH-0I;
	Thu, 27 Apr 2023 10:00:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pryQZ-0065X9-1b
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 10:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682589639; x=1714125639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtiAvihgzjHl3CGGZqSE5VqXArzx6rcWqXav7rpAM7o=;
  b=ogAvuQAsiJccai29qOCLPhnVcbQuLu7avgCkqf3QVFJia+i0YyBQ+OvW
   wOBqOS+dKWk5zSQyZ8NbN6p0uRaxoNXTP3iCbqONUtdz9qAcqb+/Yey8l
   r1bKrfqTZDIozx41ESyE4HGIFHKwyTIiMTyZNNbOGjAuXRNl+PYtBQSzC
   JA+FRwP5Hm4R/S2o0GKWQssPXWf2Kq2oFlgprM/cxB2RqmP7SclI7mySE
   nuIeeo+ImmIvH3xFm/jpEOJOVEUTMcr0c1AxtvhaM4CNQ+76BKba4+vKz
   /5jFt8YulDWhTdZjwYs9AXU+Q9ViT8WNJ78UrjrfvNkzWKU9xRkqSDI0Z
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
   d="asc'?scan'208";a="210940020"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Apr 2023 03:00:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 03:00:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 03:00:34 -0700
Date: Thu, 27 Apr 2023 11:00:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <ajones@ventanamicro.com>, <aou@eecs.berkeley.edu>, <conor@kernel.org>,
	<i@zenithal.me>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <soha@lohu.info>, <twd2.me@gmail.com>
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <20230427-related-generic-7573069edc67@wendy>
References: <20230427-unveiling-kiwi-631e966f77cc@wendy>
 <tencent_D9A598A810BDC656BE2BC15A6D0FC76C5C07@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_D9A598A810BDC656BE2BC15A6D0FC76C5C07@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_030039_548054_025F6F10 
X-CRM114-Status: GOOD (  23.35  )
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
Content-Type: multipart/mixed; boundary="===============7097678042857422739=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7097678042857422739==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kuwsqOfIl6S7aHip"
Content-Disposition: inline

--kuwsqOfIl6S7aHip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 05:36:25PM +0800, Yangyu Chen wrote:
> Hi, Conor

>=20
> On Thu, 27 Apr 2023 10:04:34 +0100, Conor Dooley wrote:
> > Preventing the input of absolute rubbish is dt-validate's job & if the =
dtb
> > itself has been corrupted somehow I suspect that we have bigger problems
> > than checking for "rv" will solve.
>=20
> > > also do a strlen(isa) >=3D 4 check first, though. of_property_read_st=
ring()
> > > will succeed even when the string is "".
>=20
> > I don't think that checking that there are at least 4 characters isn't
> > even sufficient. Either we should confirm that this is a valid riscv,isa
> > to run on (so rv##ima w/ ## matching the kernel) or not bother at all.
>=20
> What will happen if we have a bootloader in the future which allows
> overriding isa string in the DT or ACPI table, the memory corruption could
> happen if we didn't check it first.

You can do this right now, no?
You can also overwrite the memory nodes and all sorts of other things
that'll cause your system to crash too. The isa string is nothing
special in that regard ;)

> Although the kernel will not boot in this case, anything about the user
> input string should be parse carefuly that you never know what the future
> code will be but leave a checker here will remind someone who will change
> the parse in the future to check the length carefully.

of_property_read_string() will always return something that is null
terminated on success, so we can just call strncmp() to make sure that
the hart supports something usable, no?

> I have a different opinion about whether the isa string length should be
> checked.

> So I agree with drew, we should do check strlen before check the first
> two characters.

In case it was lost in translation, I was never disputing checking that
there is a string before accessing it like this, but rather questioning
why we do such a limited check here at all.

Cheers,
Conor.

--kuwsqOfIl6S7aHip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEpHsAAKCRB4tDGHoIJi
0tVOAP9yB9QiDDkjzXlfN9sch23r/K4ll1odi/MQ+szxdGmt/gEA+VVbVqUJXUeS
mN+uJOVX0fufcXgSRjLlyNP/H4luEQA=
=O1Zd
-----END PGP SIGNATURE-----

--kuwsqOfIl6S7aHip--


--===============7097678042857422739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7097678042857422739==--

