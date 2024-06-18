Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B254FC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ0wQPUZggCvwupze/PblGRR/zyg9dRttZ9EkV7c3SQ=; b=qMhzrZGGGELeOD+Md6wmPwNJGA
	JZbKheR51iIc6SobL6btF2p2Hp8tbryqFAxS+guJG1WHt4O+I8QXY6eWT6hIo0nJZz1x8WoMbxOMS
	uBoP12fLZOkEwIMFvr7tMe3IPa0yZaIMZ/QdLavg1wh8oPikimdU4qRZIWaUOD2lGtyspyZG74A0s
	ElZeCl7MoSB2C6Mx8B4MqFmfCR9fFDlxWGQjqqIjPe81o8CgjydPa1nfxJ02JGvdFQm2yHJPFP6Ca
	qzFmaYrwno/TlMqoPVGV1wo3aHNE3e/X0TJvun0ay0IfMScIsk+OCpRy8GfCCjLolMutl1j1iGqeQ
	bOpAUtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJSoV-0000000Dtdc-22aQ;
	Tue, 18 Jun 2024 06:59:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJSoS-0000000DtcX-0XzA
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 06:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718693968; x=1750229968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3mK4TsHTIPeZapcY9c5aW4prx8bcHLdsxmGHIyRcCK0=;
  b=Ep3qBnGwPoRIRJ598MMMct6h5+ODSQKusDiOh2UsXViWC7p8dMie3ZNg
   xIyv8hRXjx8iIH0Nr1vTEWZRcMPm50O4G9C6E1ELeg2DhAg6kHbieyD7v
   32JCV7gm9AHjBYEDRk1tLOk69xRMrMvcerr0ScS+WwbkLRUF25KMVi2qN
   maX0g1sstduflno0rlaIYEB17ZNSZGJEqu7UQoaYxwV2ps+UPkYLy4JxG
   WVEHe0XUWIwHuzNHj29RIteezwRQJz5O/P6AmwPZ0l053s9yLxNclIBtR
   2lc1Gjo6okHAOFIV3U6JlNudUStjDlNcl5V8Y2MjHc+gMvxEm3UL25Dqx
   g==;
X-CSE-ConnectionGUID: z9K4V9M6RvG3elklgVnlnw==
X-CSE-MsgGUID: /nE/O9yjS8y1iiBhZ+9ZHA==
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="asc'?scan'208";a="258886760"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2024 23:59:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 17 Jun 2024 23:59:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 17 Jun 2024 23:59:07 -0700
Date: Tue, 18 Jun 2024 07:58:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Yixun
 Lan <dlan@gentoo.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, Anup
 Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <20240618-pacifism-defendant-2a042a7fe1b9@wendy>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
 <ZnBEBQjTQtFs-fXt@xhacker>
 <20240617-synapse-carmaker-0a59c7c6edb7@spud>
 <tencent_26E7381EE1F6C5188428359AF3F908CA680A@qq.com>
 <20240617-connected-avoid-82f0bdc05cdf@spud>
 <tencent_53226D39C76ADCAA1883109DC6213E5EC107@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_53226D39C76ADCAA1883109DC6213E5EC107@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_235928_467431_F0481171 
X-CRM114-Status: GOOD (  17.47  )
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
Content-Type: multipart/mixed; boundary="===============1455655632133212392=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1455655632133212392==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YwBUjE9FTTi9maDS"
Content-Disposition: inline

--YwBUjE9FTTi9maDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 01:42:34AM +0800, Yangyu Chen wrote:
>=20
>=20
> > On Jun 18, 2024, at 01:14, Conor Dooley <conor@kernel.org> wrote:
> >=20
> > On Tue, Jun 18, 2024 at 12:39:30AM +0800, Yangyu Chen wrote:
> >>=20
> >> The vendor uses a special intel pxa uart driver, marked deprecated
> >> in the kernel and incompatible with ns16550. If we use ns16550 in
> >> the dt, the behavior of uart is like the uart has no interrupt and
> >> stops working permanently when fifo overruns, making many developers
> >> not know how to start unless they use the SBI HVC console, which
> >> needs to turn on CONFIG_NONPORTABLE.
> >=20
> > This I just do not understand. Why did they use this IP? Is it free?
> > Did they use it before for something else? It's a rather strange design
> > choice to me.
>=20
> I don't know either. However, PXA is a subfamily of XScale. The
> kernel also probed the UART as an XScale. So, using XScale compatible
> string is OK.

Using a fallback to an Xscale compatible is okay, FTFY ;)

--YwBUjE9FTTi9maDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnEwHAAKCRB4tDGHoIJi
0to+AP9w3gnQ362y8MnFZcbfQCKFvkpQBLoqodJyHtdQJpq/GAEA0V0/yvJzPuS8
8hGxhLKG89Dg+3IulVD5SK6iFT5/EAU=
=QSkx
-----END PGP SIGNATURE-----

--YwBUjE9FTTi9maDS--


--===============1455655632133212392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1455655632133212392==--

