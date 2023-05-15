Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DB9C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqpEttlVQVmFgAuv+mW8UuPSaWqKHS7A50EJ9AA3gaY=; b=oUMOdIxrrAqqWF1sHudXVlaSbt
	sWIOK6e6sJw2LT/8nVunuVSe4oogxmlWq2i0WkigcM7iRvSHUT++fKDveGFEnIG3ePUlKfbxi0LrT
	HZ1uKrNvwY+3PoFMmkFxksTos6KkVhr3+npHT6lMjBBbb68B63eQ9BoTD5juna+LpbQ+bKxwXAIU5
	J4jFv1zYo3K0BFEEhMlryBoV5efFx96ZTguRPZ4IbUcQBBflGqeA8b4GpDM2en71EB12AKBVMLYT9
	0Z3r9LlG2GQ+TYE/sCouEvfqY5tdjEwWuiqR4HdjiOp+BA08Zkw3ICHkZDF0SYPrCLUpZmpSPo0iG
	30jgvubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyT10-001K2f-2e;
	Mon, 15 May 2023 07:53:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyT0t-001K15-33
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 07:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684137179; x=1715673179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RoI2Djn6VKieYMJ7o6/nHJ9x4pvl2Gd8CtxidZmFCHo=;
  b=nC8pXjS6BzUlCEFaRjVEe/sy9bEHW7Xg3pO5lWON+K9Z8dPHi3/8D58S
   +Jqbd8GJL8rIu8yiaJHHqmkzFS0F9z7ATMV3C5QXW4+DOnrLbFtGGq7Py
   bVqPPk+3o81c8txeOSw9DJOvAE+ZrIt9IS4nkstv7MeoFkPYD02gXmKo4
   kxm9wVuU/pvwQuuMrl+9yGFe6xV/rde0VIM9dOydrN+Dm40xSjgBNAyt6
   GNLJo2SK1WoPitVyMoVeNTBfphqRLRlNoENmwquEOE6pxTeKKZrBCpIfU
   MN7P1Wv/IYfOfNTmbSX8oFuGxamteSJh26w/NLjeVtV00kxe6BtjDzL7P
   w==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677567600"; 
   d="asc'?scan'208";a="152051915"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2023 00:52:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 00:52:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 15 May 2023 00:52:51 -0700
Date: Mon, 15 May 2023 08:52:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, <atishp@atishpatra.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<conor+dt@kernel.org>, <heiko@sntech.de>, <cyy@cyyself.name>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, <ajones@ventanamicro.com>, Krste Asanovic
	<krste@sifive.com>, Andrew Waterman <andrew@sifive.com>, Greg Favor
	<gfavor@ventanamicro.com>, Mark Himelstein <markhimelstein@riscv.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230515-unblock-mammogram-5c099bca83a6@wendy>
References: <20230511-occupancy-cleat-06e532e3ea11@spud>
 <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud>
 <20230512-exhume-unfold-f104dd4c4cbf@spud>
 <CAK9=C2XJDDYKN_HO8Q2OShQs=crQUhx4aUi5Xx4=YiAA9OYSqQ@mail.gmail.com>
 <ZGG3S3FgmHy/XGBx@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <ZGG3S3FgmHy/XGBx@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_005302_977659_AC0DBE9E 
X-CRM114-Status: GOOD (  13.83  )
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
Content-Type: multipart/mixed; boundary="===============5486064309717083210=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5486064309717083210==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+BsUbwUyCPabQyLi"
Content-Disposition: inline

--+BsUbwUyCPabQyLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 10:08:35AM +0530, Sunil V L wrote:
> On Sat, May 13, 2023 at 01:17:03PM +0530, Anup Patel wrote:

> > ISA string parsed for both DT and ACPI.
> >=20
> > For ACPI, moving to a per-extension bit in a bitmap and defining
> > a new bit with every ISA extension will be very very inconvenient
> > for updating the ACPI specs. We should continue the ISA string
> > parsing at least for ACPI.
> >=20
> > For DT, users can either use "riscv,isa" DT property or use boolean
> > DT properties.
> >=20
> From ACPI perspective, the format better be backed by unpriv (or any
> other) spec from RVI considering it is a standard across OSs and to
> avoid any maintenance issues.

DT is also used across multiple OSes, I am not sure what your point is
here.
The problem, for DT in particular, is defining __which__ version of the
unpriv spec meaning is derived from, not whether to use definitions from
the specifications.

--+BsUbwUyCPabQyLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGHksgAKCRB4tDGHoIJi
0r2kAQDaLZSBxfYMWHSqI9r2pyACzTc+FWLE4ybW31tnVDCi9QEAmR+ZWv8Iumrv
cxfV85604cTLA4qibrkK4C4FxXAgDA0=
=5zWc
-----END PGP SIGNATURE-----

--+BsUbwUyCPabQyLi--


--===============5486064309717083210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5486064309717083210==--

