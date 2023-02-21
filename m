Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F3DC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86Sh8+fHJKUEbqNzE8CmpGS5dlZ2AaH1CfGLKZTz7Fg=; b=bMddeQX5ydKlA57no5y9v19Jgy
	FAh/+FX3UeRLn2PPKtH11PEAgaCIIBIFjZng0BV310oFB2BYazQNl+iirmdWHazwpKj1LnKVi6pX+
	BluaivO5DyTBWO2TK+Ea70l4t6tOoh/L7coVYfpFcDwqERGka3jbLr4yZltl7sN6gMz/qbfJ4fwhN
	BogDXX4ytwGFRUDQx5Zp5qPdhLrUKD0Xx0VZBzgFBazsy8n4ON5FWhSZL0y/2784VWDt41w08VIfU
	cec4WhKhqxFkmXc4t4nqRtNd65oYhjNLvew6mrWgPuzgipQEj22Mz5Jpy5+NwgnlQ04PQu31yCKeJ
	5cUCSdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOkV-0079S9-7R; Tue, 21 Feb 2023 09:15:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOkR-0079Qf-G1
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 09:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676970943; x=1708506943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e0DmnT+SAfrNeMZkQPPGnVAjaAbuaGmqPifx6ERR0q4=;
  b=IVOrfEfKdCkZT32goL68sYNRjFta3DGe/ugpoYrycYTI+biDWyM1SIlQ
   m0zAhQfACkWwPnjzKpkRV06Lp9JyruNMA/+RUyhPX9/AWafGYs0l9oyBv
   UxTKODjtGR/KYUU721zZlhcX8Odv1TVdEyaFTKx8mUXXS2QjBX+0gAWrr
   S314Er+aT9htaA6kEo6WNtfUOsjq++7uKSwSZjoahrJgZ83yDSEdzMA5V
   JXF8prixXZ8VLUesGRjdYYtw3aaNQYoxXnO6Y7vJIvym0MpY3s88WVIrj
   ipEzO5Nvhe6UfpougGP4cIrxGHwA8n/jLpaeSkZOENAhnYbtKvynM95qw
   w==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="201861307"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 02:15:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 02:15:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 02:15:37 -0700
Date: Tue, 21 Feb 2023 09:15:11 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
CC: <llvm@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>,
	linux-stable <stable@vger.kernel.org>, <lkft-triage@lists.linaro.org>, Nathan
 Chancellor <nathan@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
	<conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: stable-rc: 5.10: riscv: defconfig: clang-nightly: build failed -
 Invalid or unknown z ISA extension: 'zifencei'
Message-ID: <Y/SLn5fto6+9xX0r@wendy>
References: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_011543_619791_7F7A6CD5 
X-CRM114-Status: GOOD (  11.10  )
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
Content-Type: multipart/mixed; boundary="===============8012621397189961033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8012621397189961033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZNjPGu8Cs6BNE/xO"
Content-Disposition: inline

--ZNjPGu8Cs6BNE/xO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 02:30:17PM +0530, Naresh Kamboju wrote:
> The riscv defconfig and tinyconfig builds failed with clang-nightly
> due to below build warnings / errors on latest stable-rc 5.10.
>=20
> Regression on riscv:
>   - build/clang-nightly-tinyconfig - FAILED
>   - build/clang-nightly-defconfig - FAILED

> Build log:
> ----
> make --silent --keep-going --jobs=3D8
> O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Driscv
> CROSS_COMPILE=3Driscv64-linux-gnu- HOSTCC=3Dclang CC=3Dclang LLVM=3D1
> LLVM_IAS=3D1 LD=3Driscv64-linux-gnu-ld
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/version.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/do_mounts.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/noinitramfs.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'
> riscv64-linux-gnu-ld: failed to merge target specific data of file
> init/calibrate.o
> riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0:
> Invalid or unknown z ISA extension: 'zifencei'

> Build details,
> https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build/v5.=
10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly-tin=
yconfig/details/

binutils 2.35 by the looks of things, I **think** that zifencei didn't
land until 2.36. zicsr and zifence get added via cc-option-yn, which,
IIRC, doesn't do anything with the linker. I dunno if anyone in RISC-V
land cares this much about "odd" configurations back in 5.10, but while
a fix is outstanding, you could use a newer binutils?

--ZNjPGu8Cs6BNE/xO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/SLngAKCRB4tDGHoIJi
0olNAP9pkXL0kx8+BxRgZp9LY/qvnZ8Syy0+IoxvNK9MFe7RwwD/cJs7I84iYgZK
0x0D1LlFErcbyUOzYd6ixFsxBUeugwo=
=q8mA
-----END PGP SIGNATURE-----

--ZNjPGu8Cs6BNE/xO--


--===============8012621397189961033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8012621397189961033==--

