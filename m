Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2540CC0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 06:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7BcckeA5KX3HRPvY0qpJM4qJegeZXts/ykn+OVQGZ8=; b=ISbcw2S3tqkwMLH/lZzUsCCBf0
	2sE/vjQQp0klusF8UfgtNkk1ynTBhcbJdlDmtdJxcRxNq1+2lUgvdhsES2w6WoWK0hD/kGU7nkILG
	+m5NaDWE+hELg81WZaYnVGBeFXo8so2ERhE4oQ4YXeVCm/fxKKkyT/C4rALCXAxltzVvyOkhau3Vx
	TPUr6BdRSCBWxLlSekG0h9roMb3H988Ma4OMJadvy19UN76WUgjz33hMl4+P/vreQtefkg6tUkRxV
	jqGV7dwMODSp8UqX10T9/bWUY0SUcESFogV4hu6xWt8oCmc86P+E/Pa6LdNpo7pSCp5bXjUBCjFsi
	0PzjuP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRnR-006lsr-06;
	Thu, 03 Aug 2023 06:26:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRnN-006lrf-1w
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 06:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691044009; x=1722580009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ZwfAoSWG3OILQCx5AkENs63AOVTeG0AjJEGkSSi5Sc=;
  b=2h0Uexn34tBcFIgfHq0xi3YbOK60jNvvRL04KcQVABoYY+DBl8bko2Wy
   h0+88W1k2OTcePWb34orSeOkMdoDM1Nr0Xhoz8cNyoKkZQvak0L9y5kZt
   YMVWq/qJg6R5fzyqgo2+Jg/BenS+OsjTrSWu/lZF1QTdzjvNUFsfdcNDa
   pfpALPmficj0akZIKQIa9Zn1vK9568oklhKDzTsFwh5kIj3pOnFJKHE9N
   RTWBlolUNtXWqcQzJGnhAiZ5Gju2U8VVcF/EtwjRGxQx1nbgVAs4Hqbo+
   HNvstkf85YCxyNOEkYoW2J0AmdddbYs+UwetCMb9Su64PENehgx5tXCW8
   g==;
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="asc'?scan'208";a="239517011"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 23:26:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 23:26:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 23:26:44 -0700
Date: Thu, 3 Aug 2023 07:26:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] riscv: Fix CPU feature detection with SMP disabled
Message-ID: <20230803-bash-spree-4c02a339a6d5@wendy>
References: <20230803012608.3540081-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230803012608.3540081-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_232649_843398_07AD97C4 
X-CRM114-Status: GOOD (  16.51  )
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
Content-Type: multipart/mixed; boundary="===============7984507467011517587=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7984507467011517587==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IWqUTP8P5wUkOjNk"
Content-Disposition: inline

--IWqUTP8P5wUkOjNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 06:26:06PM -0700, Samuel Holland wrote:
> commit 914d6f44fc50 ("RISC-V: only iterate over possible CPUs in ISA
> string parser") changed riscv_fill_hwcap() from iterating over CPU DT
> nodes to iterating over logical CPU IDs. Since this function runs long
> before cpu_dev_init() creates CPU devices, it hits the fallback path in
> of_cpu_device_node_get(), which itself iterates over the DT nodes,
> searching for a node with the requested CPU ID.

> (Incidentally, this
> makes riscv_fill_hwcap() now take quadratic time.)

Ouch, that I did not realise. Should we revert that portion of the
changes? Starting to sound like we should..

> riscv_fill_hwcap() passes a logical CPU ID to of_cpu_device_node_get(),
> which uses the arch_match_cpu_phys_id() hook to translate the logical ID
> to a physical ID as found in the DT.
>=20
> arch_match_cpu_phys_id() has a generic weak definition, and RISC-V
> provides a strong definition using cpuid_to_hartid_map(). However, the
> RISC-V specific implementation is located in arch/riscv/kernel/smp.c,
> and that file is only compiled when SMP is enabled.
>=20
> As a result, when SMP is disabled, the generic definition is used, and
> riscv_isa gets initialized based on the ISA string of hart 0, not the
> boot hart. On FU740, this means has_fpu() returns false, and userspace
> crashes when trying to use floating-point instructions.
>=20
> Fix this by moving arch_match_cpu_phys_id() to a file which is always
> compiled.
>=20
> Fixes: 70114560b285 ("RISC-V: Add RISC-V specific arch_match_cpu_phys_id")
> Fixes: 914d6f44fc50 ("RISC-V: only iterate over possible CPUs in ISA stri=
ng parser")
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for fixing this Samuel.

--IWqUTP8P5wUkOjNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMtIfAAKCRB4tDGHoIJi
0vT9AP9Lu6eMzcV6VTEm4k72Es6D5W5Ni4kxzCx/NDrEq5FgTAD+OZ0n6fMavKzX
j2GbejIGfNlZJLsxERdo3/aJ5THhcQw=
=xp9a
-----END PGP SIGNATURE-----

--IWqUTP8P5wUkOjNk--


--===============7984507467011517587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7984507467011517587==--

