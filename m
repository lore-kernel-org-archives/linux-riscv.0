Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D24EC001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVpn4WYFalgqmGcoFfGx0C4b9ijWggFJKtPs+ekS6qs=; b=k+66ZnKwbHfSrAjSloJaia32NF
	hDk/fDePmkprP0OLUeglY0rvLt3SyT1aFrS6HqEjkhNI1fl2A0b4+Pr6OU9x0npKJfjSORM7ZNG57
	KiomJ5zmOXVflgy2UsYvH+pI5bxIElDuY5IssKFtxpLGkIgEoV9qchYRGayxn0n88CUa0q0oLe2b9
	xswYiUMIivRIhU0U+7RC1oh5VPCFGURSrIKvKDkuOW/WIs0aSfpiViIMagSkzdebwjK7njr0y6njE
	dza+gtGi8kX4FYK40Mlg9CWvm4TPC74b4Q5iLx3fwE1ZbG1wW1hRzGQq6dFDFeItbiD3yM/VuvDtX
	3zqF5irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQje-00AVpT-0e;
	Fri, 11 Aug 2023 11:55:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQjc-00AVoQ-02
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 11:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691754915; x=1723290915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wkQiXD5lhHC4BlkyLDnM817+Xs35EEJIrj//vDXJ1+E=;
  b=GrU4/oRGDbjBqCRamMeIUG3kscN1UkS14y8ZpcdixE9Te18+PTCZY3Pu
   uAbELMXfSkp2y2lBCDRQhPTY3n0w7HgQRAxx9eyneV/jlBZiqjFu9Cp6X
   QH5uF7QBg8NTpBWDF7MGC6AZdF7ZvRhqFl9H+micYKLrcGyDkGHy12aXd
   TbyB1QyICSMSQbU9sMMvKVtJxrdkn3uCtwDIYX5xfpkq3uw/Vl5+l6INP
   /6ltXvq1C7dFGgpi+h/q6Pv05+x9LJNYq9b85ARcQGn5ez+Qx+rIOtofh
   XjcGjIrnI8iMqvtT6mOsjoonPkAa2avbyxHBZoY1dpLmbPgNIpqIkFx2E
   g==;
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="asc'?scan'208";a="241105573"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2023 04:55:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 11 Aug 2023 04:55:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 11 Aug 2023 04:55:04 -0700
Date: Fri, 11 Aug 2023 12:54:26 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Bo YU
	<tsu.yubo@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH -fixes] riscv: uaccess: Return the number of bytes
 effectively copied
Message-ID: <20230811-overture-catnip-2b004303cbc5@wendy>
References: <20230811110304.1613032-1-alexghiti@rivosinc.com>
 <dff5c443-bebf-9bd9-af1c-85ebfb7c2aec@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <dff5c443-bebf-9bd9-af1c-85ebfb7c2aec@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_045516_129389_001BEE54 
X-CRM114-Status: GOOD (  15.98  )
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
Content-Type: multipart/mixed; boundary="===============0204464501471917595=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0204464501471917595==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="utvI2jTqZvG5HlnU"
Content-Disposition: inline

--utvI2jTqZvG5HlnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 01:39:16PM +0200, Alexandre Ghiti wrote:
> On 11/08/2023 13:03, Alexandre Ghiti wrote:
> > It was reported that the riscv kernel hangs while executing the test
> > in [1].
> >=20
> > Indeed, the test hangs when trying to write a buffer to a file. The
> > problem is that the riscv implementation of raw_copy_from_user() does n=
ot
> > return the number of bytes written when an exception happens and is fix=
ed
> > up.
>=20
>=20
> I'll respin another version as the changelog and the title are incorrect:
> the uaccess routines should not return the number of bytes copied but
> actually the number of bytes not copied (this is what this patch
> implements).
>=20
> I'll wait for feedbacks before doing so!

While you're editing te changelog, can you make the link a regular Link:
tag? You can do `Link: <foo> [1]`.

--utvI2jTqZvG5HlnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNYhcgAKCRB4tDGHoIJi
0hKBAQCQBCxeWgLbOKa053boEyjUTJSr9hF6K1Lz9DQbnvSa9AD/Tow8dsW2O5Nh
xIRwuL7H4GhlsBa32V3l2JqT/gkP7Q8=
=Dq+D
-----END PGP SIGNATURE-----

--utvI2jTqZvG5HlnU--


--===============0204464501471917595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0204464501471917595==--

