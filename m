Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110CC30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNo7u0eDn8IGrIhutSTCDfeyWgDlSgIKyoyTCyJQlr4=; b=4aTasX0IZOENO9VE8DagO9ciws
	lTYljKW7kq9nD0VlsondgWmGR4owkbk4Ejhu+8UXa+KucDIbGhBY5E2D1yk5ayi4AqJNJhrEXcism
	VbxDR7BRc2yV0u7+oYN7TjblYNvWGyXVA55IAkv8MRYVrRd8wwjzPo/B2A/mAIjs9V4apiWUntm5j
	etBvi8GBolI/clqZ0BUBIygG/sQ2WOFN7aBZrDk9ALJG4sv1l01AJukZVld4DcdMf4rk2mEzhtAve
	21bTlwT9VM4Qdol9Aa+xejim2EKY6rtQQvPVoJFS1ImwmLOd/J3hAQyfDbrHP6X/wgsWzPlMfEbhG
	SAX6paew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPclJ-0000000F5Mb-13ME;
	Fri, 05 Jul 2024 06:49:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPclG-0000000F5ME-3CH3
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 06:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720162178; x=1751698178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5PyhqhLLX0wY9s7qI2dwXKTDneBYJuRYip+3dnCjjqA=;
  b=MUdzhteYWBFhg0bbL2QxNbHJWeOnIklwuqmt6+olNOT0s3MrSN7wl4cL
   QVHpJP9VVUt/tjyR8pNNf9qE1C1vaRFfoEz9abXKWObwhbSKxO4yFyJJq
   wziR4t1kvAfBoN8NKDp8Ux26X3nzIejiepLA7E2Jd8OIBk8qYTza728/N
   vH8SmUaq0nef24rUYoizWS4KC2qH8gBNkKieyOU+6ScNh9e6fijj9S3db
   X5JyoXKpaxnEYTsIfGw1pNeirf+ZgQIa+oxYDKXG/qV9ARRCx6sOPBMtU
   jvLpjr9JGiLDfB/5I6E8z9GiaEE15lOnHblzLL6JJIwIol31OQqikg78I
   w==;
X-CSE-ConnectionGUID: geSbLjp2RTeT/aBbLF2vsw==
X-CSE-MsgGUID: ZSqQLlDlROqmZcfdj7LjFQ==
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="asc'?scan'208";a="28846050"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jul 2024 23:49:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jul 2024 23:49:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Jul 2024 23:49:29 -0700
Date: Fri, 5 Jul 2024 07:49:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Drew Fustini <drew@pdp7.com>
CC: <soc@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] MAINTAINERS: thead: add git tree
Message-ID: <20240705-hemlock-bonding-7f02a02f380b@wendy>
References: <20240704180913.2516959-1-drew@pdp7.com>
MIME-Version: 1.0
In-Reply-To: <20240704180913.2516959-1-drew@pdp7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_234938_887599_0DA5CE52 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5354629133263115524=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5354629133263115524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4yo7tzps98V/bKxn"
Content-Disposition: inline

--4yo7tzps98V/bKxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Arnd,

On Thu, Jul 04, 2024 at 11:09:17AM -0700, Drew Fustini wrote:
> Add git tree for T-Head device tree files and, in the future, drivers for
> the T-Head TH1520 SoC.
>=20
> Signed-off-by: Drew Fustini <drew@pdp7.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Could you pull this directly into the soc tree, I have no "fixes" in my
queue and this is based on the PR I sent you the other week.

Thanks,
Conor.


--4yo7tzps98V/bKxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoeXZAAKCRB4tDGHoIJi
0lOVAQDwsOAuPQYZg3E9go7gmLT88tBInToF6zXJWQPOoGJ/fwEA1ivkPGP1Yhmx
FcujkoGDw+Uqb3ll2DmKTWPS+7u/Ygk=
=l4cb
-----END PGP SIGNATURE-----

--4yo7tzps98V/bKxn--


--===============5354629133263115524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5354629133263115524==--

