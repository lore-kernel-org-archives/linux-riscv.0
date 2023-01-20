Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC83FC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n23LntKbpeE74dMrN46CkML1p6IlH+w1q37qw9LKaLg=; b=r0LQNfKfpTNDcySJtJ8USLFAOi
	5n6dbK42c2CVa3SsZaD4E9fK+HjtX7UxiHU3o2cknsjUhsOrks7obfdE4MQkvzrc0MXPr3BI/kv94
	8Yg191CzuBXDLmR9n4HpBTJYNoEHgpi4JThzug+NS8U608IS3rekOe488+AGi8jJkyW595a05hAZj
	lUZvvXncRbrD3bcABhu+Fsf8c5Pt/pZm6GkfBL99Sxkj7ctdVtEHJrxdNRz16eUZtnYuYZMycqRBX
	qUQRfTdGYbQysVOHqmf9ufuWBZ244tm0QoVw6+zZAwZVdGQmJ1wc0dYv0FPXmD7jVq6J1Vse21poS
	aoOUVl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsCx-00AepZ-N1; Fri, 20 Jan 2023 14:17:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsCm-00Ael0-LS
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674224240; x=1705760240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8wOj9+QwCLtyXBCLcRQBXGg6eCl/vXY57DMzFXi9tbY=;
  b=zP3Vu3hvKU5PRNjdkaKa8a+dmtA187ZpD1cgWKqq8f6WYxBL5qW57cfC
   ss7ThWzHJ2FVnnghWiO+Ouar9w6Tc46HNsKdPRP0z1bQ1S4Co72y6IycD
   algbg5O42RCA1b8HUnkjROoyucxTY17+wYTOIyT1+yg1PX3v+CVAR8AIo
   i87RR0E9qQ9sNLkZBKqFqBNsgRHSGPirSd4CNqcprr+pB3gmyCLd8O1rW
   he7ZauDh4aCDNdGB/RsHcMOD2ZrIpPuHgUpf2z7tdWNP5AF5Yg5T8rzVs
   ZJWkFXiw1g3c1PC+Vb2oaCJgyyF9LxGFvcF4BW158vutvmu9DWm39t2sW
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="asc'?scan'208";a="196710524"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:17:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:17:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:17:11 -0700
Date: Fri, 20 Jan 2023 14:16:48 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 2/3] RISC-V: resort all extensions in consistent orders
Message-ID: <Y8qiUCH6ERYmAdgg@wendy>
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
 <20221205144525.2148448-3-conor.dooley@microchip.com>
 <20230120135632.vb7ncvoapnaixluu@orel>
MIME-Version: 1.0
In-Reply-To: <20230120135632.vb7ncvoapnaixluu@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_061722_194161_B5CFA6A2 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: multipart/mixed; boundary="===============3940156586252947978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3940156586252947978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8B9vR+0VfvRQQXio"
Content-Disposition: inline

--8B9vR+0VfvRQQXio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 02:56:32PM +0100, Andrew Jones wrote:
> Hi Conor,
>=20
> I'm digging this back up because I'm basing Zicboz on it.
>=20
> If we take "riscv: improve boot time isa extensions handling", then this
> becomes a bunch of manually enumerated defines
>=20
>  #define RISCV_ISA_EXT_SSCOFPMF         26
>  #define RISCV_ISA_EXT_SVPBMT           27
>  #define RISCV_ISA_EXT_ZICBOM           28
>  #define RISCV_ISA_EXT_ZIHINTPAUSE      29
>  #define RISCV_ISA_EXT_SSTC             30
>  #define RISCV_ISA_EXT_SVINVAL          31
>=20
> Keeping those in alphabetical order would either require manually
> reenumerating them or to allow the numbers to be out of order as
> we add more extensions. I think I'd prefer we just add new
> extensions at the bottom and keep the numbers in order.

Yes. I mentioned that on one of the earlier versions of Jisheng's
patchset - initially I blindly said "alphabetical please".
I quickly realised that that was a really stupid idea as it is would
just be an _invitiation_ for bugs if we did, since names are far more
easily searchable than figuring out the max in the manual enumeration.

Since Jisheng's patchset just deleted what I had resorted, I left this
change as-was. Just need to make sure any comment about ordering also
gets removed when the enum goes away.
I'll keep an eye on for-next to make sure that it does.

TL;DR I agree!

Thanks,
Conor.


--8B9vR+0VfvRQQXio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8qiUAAKCRB4tDGHoIJi
0oSKAP9zqiy1G7Sw0cg7bsoy8fmPLJPzS1bNJZ4BX4E8lRk5wAD9Enm99HDzo50d
wtYphmEGxPoxpyWwxNwDASSWnlStzQk=
=C1Iw
-----END PGP SIGNATURE-----

--8B9vR+0VfvRQQXio--


--===============3940156586252947978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3940156586252947978==--

