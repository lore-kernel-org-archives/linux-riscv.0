Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD5BCA0EF3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC7MLm5RLNmdomDeCBiSwIBrHT5FzpTcihw0WBWsHAQ=; b=XJXuHxPJXl5bx2aCOADwsH2DlY
	POrfhutXZqXkxUGkeh6WpEUXDCf10Y9B3InuStiJJJh3bBKyv+C/TPpJeYjldYA/gsMliZaF13XtQ
	xyU1G+hMmyS3Y+qKtVEt8R0G4344bzFcQCS0SgLCRb10cfPjRahZRoLmZBJOkAsPbucG3zkBZZOkp
	MdWxYZr1vWQeITXmiyV8wIOoIddvUviVr9d8PDC7Jdx64b8eoF/LveQou+4ws8wIcFZhkmBc68yAD
	Q5k82D5bd8YA6Z+OnJHz/3fPl8/ZkfPAVY+/Ylv49fTSVVhfKkMgVCCYa+XPg660Pr2yDGVi4qA0j
	NpxgEbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgln1-008NGz-0B;
	Thu, 14 Sep 2023 12:49:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglmy-008NG7-0S
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 12:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694695784; x=1726231784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LRfBpQwUTjGaQOOdiF6bBmCasixiCE0wp/+lqjUvX04=;
  b=Oidszhe3LOzkbXJsDlDdjnjq2aGQFiy8DwT6KvMdhu0kvNRytC5evH3e
   BP6zL9e2N1xNTw4jBpyb4PJ2znb/n/IRHZ+6rR0Hm4U/qrLGuq4QpXk8U
   nY+OiSpaVJJtMKYcd2B5TqT9CC1uN6IfPJd8PYZSogruVx+2dyl5u48WE
   mhAqIOPCtTobmqFMJl5wOfj+BmCEE+8OuK9RcARpMyqmHV9UmVsnki7jX
   m7oHbpIAbfodM5pAWB+UGHXHirOlqD3efShnZ8MHreBDV9+OoJ+q68pTa
   1Ty+vhm/pFfyR2liHrvmwZNmKVL+z8njKv8arivBXIUsQ68pvixTMqvdI
   A==;
X-CSE-ConnectionGUID: 7fr+3FzBQc6WGlJNPeDc1g==
X-CSE-MsgGUID: ZKQIl3KrR2SbqKioEFS7OQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="asc'?scan'208";a="4641672"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 05:49:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 05:49:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 05:49:30 -0700
Date: Thu, 14 Sep 2023 13:49:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, "Jason A . Donenfeld"
	<Jason@zx2c4.com>, Samuel Neves <sneves@dei.uc.pt>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Heiko Stuebner
	<heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, "David S.
 Miller" <davem@davemloft.net>, <linux-crypto@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/6] RISC-V BLAKE2s Vector implementation
Message-ID: <20230914-roaming-plunging-948c78d9831c@wendy>
References: <20230912115728.172982-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230912115728.172982-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_054944_242495_047E45DE 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Type: multipart/mixed; boundary="===============4087883397551939478=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4087883397551939478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="byxUR448N23jzR+h"
Content-Disposition: inline

--byxUR448N23jzR+h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 01:57:22PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> Hi,
>=20
> This is Andy's kernel mode vector V2 series [1], with my BLAKE2s
> AVX-512-to-RISC-V translation patch appended.
>=20
> I've tagged it as RFC, since Andy's series is still not in-tree yet.
>=20
> It's a first step towards a Vector aided Wireguard! ;-)

This has the same problems as Andy's stuff & doesn't build properly for the
automation. What is the plan between yourself and Andy for submitting a
version of the in-kernel vector support that passes build testing?

Cheers,
Conor.

>=20
>=20
> Cheers,
> Bj=F6rn
>=20
> [1] https://lore.kernel.org/linux-riscv/20230721112855.1006-1-andy.chiu@s=
ifive.com/
>=20
> Andy Chiu (3):
>   riscv: sched: defer restoring Vector context for user
>   riscv: vector: do not pass task_struct into
>     riscv_v_vstate_{save,restore}()
>   riscv: vector: allow kernel-mode Vector with preemption
>=20
> Bj=F6rn T=F6pel (1):
>   riscv: Add BLAKE2s V implementation
>=20
> Greentime Hu (2):
>   riscv: Add support for kernel mode vector
>   riscv: Add vector extension XOR implementation
>=20
>  arch/riscv/Kbuild                      |   2 +-
>  arch/riscv/Kconfig                     |  10 ++
>  arch/riscv/crypto/Kconfig              |  16 +++
>  arch/riscv/crypto/Makefile             |   6 +
>  arch/riscv/crypto/blake2s-glue.c       |  39 ++++++
>  arch/riscv/crypto/blake2s-v.S          | 164 +++++++++++++++++++++++++
>  arch/riscv/include/asm/entry-common.h  |  13 ++
>  arch/riscv/include/asm/processor.h     |   2 +
>  arch/riscv/include/asm/simd.h          |  52 ++++++++
>  arch/riscv/include/asm/thread_info.h   |   6 +
>  arch/riscv/include/asm/vector.h        |  50 ++++++--
>  arch/riscv/include/asm/xor.h           |  82 +++++++++++++
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/asm-offsets.c        |   2 +
>  arch/riscv/kernel/entry.S              |  45 +++++++
>  arch/riscv/kernel/kernel_mode_vector.c | 146 ++++++++++++++++++++++
>  arch/riscv/kernel/process.c            |  10 +-
>  arch/riscv/kernel/ptrace.c             |   2 +-
>  arch/riscv/kernel/signal.c             |   4 +-
>  arch/riscv/kernel/vector.c             |   5 +-
>  arch/riscv/lib/Makefile                |   1 +
>  arch/riscv/lib/xor.S                   |  81 ++++++++++++
>  crypto/Kconfig                         |   3 +
>  drivers/net/Kconfig                    |   1 +
>  24 files changed, 725 insertions(+), 18 deletions(-)
>  create mode 100644 arch/riscv/crypto/Kconfig
>  create mode 100644 arch/riscv/crypto/Makefile
>  create mode 100644 arch/riscv/crypto/blake2s-glue.c
>  create mode 100644 arch/riscv/crypto/blake2s-v.S
>  create mode 100644 arch/riscv/include/asm/simd.h
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>  create mode 100644 arch/riscv/lib/xor.S
>=20
>=20
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> --=20
> 2.39.2
>=20

--byxUR448N23jzR+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQMBSgAKCRB4tDGHoIJi
0mgtAP9tLS4u6b4Irsx6NBLrW89j/8YmAa4iusUmxfsYju7AUwD+M8RdN9euI6/d
KRezKxNx3it8mEaHXr5KwfCfOYRbNg0=
=Gekc
-----END PGP SIGNATURE-----

--byxUR448N23jzR+h--


--===============4087883397551939478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4087883397551939478==--

