Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A7C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZL2Fzh/FvhVqGfVhjt1EdsoR5bb5TBQiYfEAvTWArM=; b=2+XUiYLNMwXUr/UEH0WMKWf+cH
	9M5YwCeNgxtmCHY/kYmLc8l1EeOBUG3ezJ4cL9Ki7SolVz+v/K5kGJBrvgxthKhM9AQlEZrxtjEiU
	ZHnkzMxonRv4/uQBEVvtBwnW1NJ9+les3SQdoT0Pntr9Mdi3o+j9sQTsCaqZPRSq/2rymFEYC0+kv
	g57hwdd3Ci3uME+/uIlKKiqlXo93QbkvE07MK9MfUh+My+AC8C3FxYoTS9irBg/akDx2J0uDRR1B9
	40IlGT0DN+8V5twIewKY+20iSqZgFcXyeZBDpNx3KqJE3YxOgQ2AB+ycXVGOBH+eYjOC4w5lx1pzF
	Qy9D0PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUbc-0000000DX6v-2FTU;
	Mon, 29 Jan 2024 16:35:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUba-0000000DX67-1owZ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 16:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BEE79622D7;
	Mon, 29 Jan 2024 16:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF00AC433C7;
	Mon, 29 Jan 2024 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706546099;
	bh=Wu1OKNYbCiYgPJM2i8fejz4JjG575xDKZoC5YQd9GYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSTjNExZ95GXA7MF8Qf06BC+taxVtRXstLf/pOMlFzsSrlrCKGGQ3wWZKvTOXYiTi
	 G2/MzX75J3zo3CU/uGFbipfqdho7oJMAvDlkgXtlM1qrEhAznZeDaJB8nIgSV5CnCw
	 1bIukPbM9um+u4MIAVn1r5grxaETugls45qtHsFCF3baMCYjRUWPG5MoO0F6Xcc74r
	 mKy3aNE14JemgVSKQ/yx74ftaH/rfMwRNbDCbn5Cpg438yvrnc1r1Lpi8n7HjJfm2Y
	 wcsB5e84HNCJsKCr6v9mfLhAWCDlYf6EeSLD0LJXGUcfMsCIVPIyEPK8zZyjvIdot7
	 6GlZMQnQVQqQA==
Date: Mon, 29 Jan 2024 16:34:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	masahiroy@kernel.org, nicolas@fjasle.eu, andy.chiu@sifive.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
Message-ID: <20240129-unripe-pleading-d2753b766e88@spud>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_083530_535573_592B418B 
X-CRM114-Status: GOOD (  17.66  )
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
Content-Type: multipart/mixed; boundary="===============8859492408275804416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8859492408275804416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1q3FkTd2sMJG0Xcz"
Content-Disposition: inline


--1q3FkTd2sMJG0Xcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 10:32:10AM -0700, Nathan Chancellor wrote:
> Hi all,
>=20
> Eric reported that builds of LLVM with [1] (close to tip of tree) have
> CONFIG_AS_HAS_OPTION_ARCH=3Dn because the test for expected failure on
> invalid input has started succeeding.
>=20
> This Kconfig test was added because '.option arch' only causes an
> assembler warning when it is unsupported, rather than a hard error,
> which is what users of as-instr expect when something is unsupported.
>=20
> This can be resolved by turning assembler warnings into errors with
> '-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
> which is what the first patch does. The second patch removes the invalid
> test, as the valid test is good enough with fatal warnings.
>=20
> I have diffed several configurations for the different architectures
> that use as-instr and I have found no issues.
>=20
> I think this could go in through either the kbuild or RISC-V tree with
> sufficient acks but I will let them fight over who takes it :)

I think RISC-V would be good, since building the vector crypto stuff
also needs this fix.

Tested-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1q3FkTd2sMJG0Xcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfTrgAKCRB4tDGHoIJi
0ob+AQDBwkCVj1DkP4muPEw8AsT7KZJY94Op0baq5wXjGDRNTAD/RCCqOlvMAubB
5ztb++AITl6EoOWcpOAJltxBK/wv2AQ=
=cmxz
-----END PGP SIGNATURE-----

--1q3FkTd2sMJG0Xcz--


--===============8859492408275804416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8859492408275804416==--

