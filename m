Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBCCC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcoPMzqo4jD+81Nwse18gen7nk/1+Pkah3+Oq+XXDd0=; b=QBUDslCr5dZDkMall8imnlyG5U
	d5GIfucmjfii8kaYP1wjTnoYwSfHJ38cQW28R8b7LjTnH0NafOZv2/Dpqlo+AzrvusLCY+opeEbHK
	bDMlKpYJn1YP4tB7f4g5dzwsOWjNxuMgOW6qXMt7C5ZAtXoyJHZybFXb5FMbUShjZu7qsOyUQpgyC
	zRcxGDHiEuf0peajM19h7rIdX8wuECCgbIhQiU2E7zBgrKXwk6KLAhFsAcTr0HHQaW9QZapWaWvp/
	F5O+jx/2wn7T3UlHyVwB+EyhUTF7yfvnOpItevzBq0BFcwn8sgxcOk6CpNb9I4SVpxZsDzY8WzhdJ
	swpErE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6c3-004IF0-2R;
	Wed, 02 Aug 2023 07:49:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6c0-004IEI-1a
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 07:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690962580; x=1722498580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYTa7yzuU2WNmYLWDCsrxL5o3sd/RAfjdGyrpN5cwm4=;
  b=nZVV3bgmTnrLoQACol/N4fuEBfWQI6M1cEU3SIaDV/27InAHTr1swbqX
   Ri/GWNHggS7SUVMIKaM6VIwnyCb2cDku/2V2Ns8HqcXTfW0gN6uvWtPUS
   qCo92QFC8IrEhAe0BFI8P2q0l+CSeKgMNkMceMVwPDy4rT1bMY+unJEYP
   np8F0Gf8+hY21AfyKF+3dx/+xrh7LotUg+hMolOyXcAcZlJa4HTI0MD4E
   /wn/gL3cIflgAsc1TPa440/k8qibRlvPZKdAo+bXzT3pyATQTsuUkOc1K
   qmYJipfY+86DEv0Gl0LdryYvzERFavEn8FgmYcBTqZIgAaxyrZQeP78c+
   A==;
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="asc'?scan'208";a="227772213"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 00:49:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 00:49:14 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 00:49:12 -0700
Date: Wed, 2 Aug 2023 08:48:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Dao Lu <daolu@rivosinc.com>, Heiko
 Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Mason Huo
	<mason.huo@starfivetech.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace
 zihintpause
Message-ID: <20230802-seismic-gallstone-fca0f4b17076@wendy>
References: <20230802064215.31111-1-minda.chen@starfivetech.com>
 <20230802-sharpness-spoon-f9b8804fb66f@wendy>
 <d64874cb-8628-a6d2-d2f4-8af4d0ebf8b2@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d64874cb-8628-a6d2-d2f4-8af4d0ebf8b2@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_004940_608547_8C84B60F 
X-CRM114-Status: GOOD (  23.37  )
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
Content-Type: multipart/mixed; boundary="===============3246538200342784760=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3246538200342784760==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JTYctk/RlWnk7XbV"
Content-Disposition: inline

--JTYctk/RlWnk7XbV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 03:32:15PM +0800, Minda Chen wrote:
>=20
>=20
> On 2023/8/2 14:54, Conor Dooley wrote:
> > Hey Minda,
> >=20
> > On Wed, Aug 02, 2023 at 02:42:15PM +0800, Minda Chen wrote:
> >> Actually it is a part of Conor's
> >> commit aae538cd03bc ("riscv: fix detection of toolchain
> >> Zihintpause support").
> >> It is looks like a merge issue.
> >=20
> > Yup, spot on.
> >=20
> >> Samuel's
> >> commit 0b1d60d6dd9e ("riscv: Fix build with
> >> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy") do not base on Conor's commit and
> >> revert to __riscv_zihintpause. So this patch can fix it.
> >>=20
> >> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> >=20
> > Did you actually manage to trigger this, or was this by inspection?
> > clang-15 + binutils 2.35 was, IIRC, how we spotted this because that's
> > what the clang-built-linux CI uses to test the LTS kernels from before
> > LLVM's IAS was supported for RISC-V. Seemingly all that needs to be
> > satisfied there is that zihintpause doesn't appear in -march so this has
> > gone unnoticed.
> >=20
> > Fixes: 3c349eacc559 ("Merge patch "riscv: Fix build with CONFIG_CC_OPTI=
MIZE_FOR_SIZE=3Dy"")
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Thanks,
> > Conor.
> >=20
> Thanks, Conor. I found this just by inspection. I found a issue that vdso=
=2Eso call cpu_relax
> cause application core dump in kernel 6.1.31. I need Samuel'patch to fix =
this. And I search the log
> of processor.h found this issue.

That doesn't look like it is fixed in later stable kernels (we are at
6.1.42-rcN right now I think). It sounds we should ask Greg to backport
0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy")
to 6.1. Does that make sense to you?

--JTYctk/RlWnk7XbV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMoKVAAKCRB4tDGHoIJi
0qGuAP4k6WdiXs2y09Sk66yBTqGCWcA0PLL/uBMrEneon9j7pgEA8KYUThTRSCMA
ZVvVDzsueLWC7z+D9r5SulFqPvZ5ZAo=
=Qq1m
-----END PGP SIGNATURE-----

--JTYctk/RlWnk7XbV--


--===============3246538200342784760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3246538200342784760==--

