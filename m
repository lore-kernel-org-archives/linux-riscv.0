Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81806CA0EF6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhUAR1YfVU3PlOxymKAtDcGfWpkiTXX4uLdFCwKMQ50=; b=Xs3QtAQOcmS9I7zPZmK40ttPbT
	rgMkT2BYSKmuLAhx50xjfKWcpx7fityR33iMnfb4W+qTtGfFrC4XCThDH9t8N2Z22ObM5zH0YuJc5
	P/Tg8fEpF91c5uAVS5ZNnK+V88MU6ar53zYd9O20P7gSJClVwqrfNo47zeZAghATLReancj3SWmIi
	ki3CSasQQu/7zEhVsc0088Lb9udv2cqSQPPe35m4gYJ7gk6K6ypdYMJgqCSmHBDNynFkOvG58V3Le
	IagbFVlmY79ttD8i5G0oyfXv0gHum/ogsgb6QpmN/mAlyFuWBIVRjIx/7hIRWPXqjRXKaLk8nFYa5
	EwyLMEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglq5-008Ne0-1T;
	Thu, 14 Sep 2023 12:52:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglq2-008NdU-2x
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 12:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694695975; x=1726231975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8s25WatzmU94RNlxbxB/Hw41unguyib9JCdA3p+ARYY=;
  b=e+QCkK0qasxmqpjuJlJLYTFVn8vQR7avDpJEQXyNio3yFjScgWuAkZ8D
   2opy748y7qW+jiN1RWUL2N9Nt1V74/DaifA3f6FH/Utzv+23nDwR5vKGJ
   UktKsYQL5VpEgigaZ0HdUoZJQeH1IWVCnWxfh/fhsutnpj8Ylhs5kGECE
   L8W+oqszHlKugjHI6ckoNvc8hgWrRjvUuaFzRREGs+Qofy8Nq8s8fhFoY
   iB0WW0pz/LvuUZOPYVFr45tvJVleTIQx8Uw6yPZI8zKOS2kYtz7L8bNN3
   RNuRKMzdK5wqPX+W/I7vCODjd00kkWPCfkrXx1fMeczFNVBS2FZnoWyaY
   w==;
X-CSE-ConnectionGUID: MHhbKamLRwmqzRdOP1rdaw==
X-CSE-MsgGUID: xoGOVLF1RpqFYHafGCOX1A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="asc'?scan'208";a="4660688"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 05:52:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 05:52:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 05:52:50 -0700
Date: Thu, 14 Sep 2023 13:52:34 +0100
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
Subject: Re: [RFC PATCH 6/6] riscv: Add BLAKE2s V implementation
Message-ID: <20230914-charting-detector-3d2b615393b9@wendy>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230912115728.172982-7-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230912115728.172982-7-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_055254_958468_2CD1CE34 
X-CRM114-Status: GOOD (  13.45  )
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
Content-Type: multipart/mixed; boundary="===============2419628399699755660=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2419628399699755660==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lx6ML45DQfnbK0fy"
Content-Disposition: inline

--Lx6ML45DQfnbK0fy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 01:57:28PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> BLAKE2s is used in various places, most notably in Wireguard, and as
> of v5.17 in drivers/char/random.
>=20
> Add a BLAKE2s implementation using the V-extension. This is a
> translation of the x86-64 AVX512 variant
> (arch/x86/crypto/blake2s-core.S) to the RISC-V V-extension.
>=20
> The AVX512 variant requires registers >=3D 256b (ymm*), and hence this
> implementation requires a VLEN of >=3D256.
>=20
> The implementation passes the kernel BLAKE2s selftest, and has been
> tested on spike and qemu.
>=20
> Instruction-wise, the V-variant uses 60% less instructions than the
> generic, C-based, implementation.
>=20
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

>  arch/riscv/crypto/blake2s-v.S    | 164 +++++++++++++++++++++++++++++++


This file is currently being built for !RISCV_ISA_V, leading to build errors
for obvious reasons. Eg:
=2E./arch/riscv/crypto/blake2s-v.S:62:2: error: instruction requires the fo=
llowing: 'V' (Vector Extension for Application Processors), 'Zve32x' or 'Zv=
e64x' (Vector Extensions for Embedded Processors)


--Lx6ML45DQfnbK0fy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQMCEgAKCRB4tDGHoIJi
0u8xAQCEJlgd/xtyR113nnnStiJaDMwGGembL9EYTsSNHf1FFAD/VsDT0C1/NjgQ
ECaj3824nVo5YO0goL1J6DWPwxWnKgE=
=zWgG
-----END PGP SIGNATURE-----

--Lx6ML45DQfnbK0fy--


--===============2419628399699755660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2419628399699755660==--

