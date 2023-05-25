Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE7C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldZTK1uIJGebJLjFrC3+YLIR7wfXOEA4KRvPEkVLlbQ=; b=VCxvEJA7/9e95OuEdrfFg0s9X0
	HFNpHShJ54UekTJ9pAr3AjGlElrg5KEmeZniPCAI3tw+T40AqAYjnGPT3KEu5xJrmu9n845HNXotY
	OakZsgLxXR95gkcigDT+S3D1+NG9XIhrXYGm0DbqpsRnKNYCrISGyj1f81QuTQ/KV5bNyFimhsr8w
	J52TXUbUjYxTYYlpOe/ROyqTRWf4T+BwfpcuGi63Y84D/TqMflDMiQp4BrzPhOiPq508cc08CA+Dw
	Hu7srIRup0v7/asb/C9lKcd00oY92HjuN/YXjVqFht4FKa52m/KEGA8h0FaJ+AUZFb2k0a/Atn2a6
	qfsGhOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BXh-00GnLO-0a;
	Thu, 25 May 2023 14:02:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BXe-00GnKA-2p
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 14:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685023330; x=1716559330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FLtz5z2b4ufY5t0xgFsw0GaGtQUkElO5inKmr9KYp8g=;
  b=TF3pVrKGUduzKem+LyWlnQTcjKFH8SZ/qGINkbSQcIze4GjRZQsgIO9V
   PWwTZeEdsoAmghWPHOlXs9iM0V37Toqy1Yr2D9qasquTvpeI+3yc3zxcp
   ShTZyHO4s36nDJOe8115U9sTRo33JAbaVlgPpWPYDNnnWRDIuE4HQD+Mz
   +j+p7nRv+wia+zfR2HXNS0X0L9IMI22AINBRx+DyGAjh09SW7aT9WfGr/
   DqdnHBrAw6hge4lSzTEGkXCqARFpVDtwUB8eCje7CugcBxhcXCsqRSVcs
   9Q8uQsX6Zpsr7ferxulvgUV6AQemryQ0rEm4tBysAC5FWKYafXXTuoRLq
   w==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="153916143"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 07:02:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 07:02:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 07:01:59 -0700
Date: Thu, 25 May 2023 15:01:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] riscv: move options to keep entries sorted
Message-ID: <20230525-helpless-rundown-47939298e75f@wendy>
References: <20230523165502.2592-1-jszhang@kernel.org>
 <20230523165502.2592-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230523165502.2592-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_070211_018892_89978EFB 
X-CRM114-Status: UNSURE (   8.03  )
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
Content-Type: multipart/mixed; boundary="===============3302691027382044675=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3302691027382044675==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0SxiKJNDT1DzhBlm"
Content-Disposition: inline

--0SxiKJNDT1DzhBlm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 12:54:59AM +0800, Jisheng Zhang wrote:
> Recently, some commits break the entries order. Properly move their
> locations to keep entries sorted.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--0SxiKJNDT1DzhBlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9qQQAKCRB4tDGHoIJi
0m+fAQDhxk9pYPQ9CMmp4SnJa1pOHiM29+sqXxmtN1nOODe35gEA261Bp8FpQngP
XAxfBzQVFHzicU96pieUwmGOnyFNNAI=
=wtvX
-----END PGP SIGNATURE-----

--0SxiKJNDT1DzhBlm--


--===============3302691027382044675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3302691027382044675==--

