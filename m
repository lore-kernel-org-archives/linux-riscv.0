Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1875C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk38/rQ7agQXVamU5/meN63JaY2YLhj/zHJvHxw2LHU=; b=zzLSKhm/HtfLwDZ9QoWu6Zql5A
	jQm7WvVQbFNfeMYafTx80y80F5F66P7kYFK3uCCw6wMcr7nSjxzWSB8ott+nYPoP4kcc28AhlIP9k
	TuYY87J/cTS/Gr+Aazs2FvWVJPPHpjU8OytsNPHd3mynwunboRc8xTk+3ISYT7QvnnHF1Ms3ebeIo
	WniAS8hGBzaqKW+5wMienxXPRjxiK/EaRft08yq6ls0EEfw1+yKybumsZGLf8MtwqS6vPzsJ75pFY
	RBJDM10qTXtXbzvhomjt8LebaCznCi0BAqVNfj8JzwZNTOoujac2HQzO3gaE4JNo9oB+/fUSnTv5S
	iQ5A5/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cO8-00AD1t-1S;
	Thu, 30 Nov 2023 08:27:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cO5-00AD1Y-2V
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 08:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 57E1EB841F6;
	Thu, 30 Nov 2023 08:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496A1C433C7;
	Thu, 30 Nov 2023 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701332827;
	bh=AVPr5QEXIbplSm1/AOQkNsZ7+EYuGbAVBfNp5Jit/NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqeemkyzYxzUb4DFNt2IWN1M7NTo6NHpsb6fmEMKF5RNEs0zSQcWF0XuIsKeh8rBN
	 uX2c9fmeIj8te8eqWuWR87eu1mui3sw39O8gOFlPJjRNSfEbJE3ySBHYB9CoYRgwtj
	 dDe8W3JSB/jjeceJ3IrgsKqG3zEwdcgM+7T1bGSr+5Jz5BZh9AvqS7p5P8PmK2dYIF
	 kOK8KVyqmFHSfHN8AmqlLEWbTCZQHBKNgVT/FMwbRut6xPw2cvS3M3chktTgBgGII+
	 nBte7sYXta9WJo/pI8UpDWysdPpiMiTXDN5wuVdbp/YAzJFH55HzFwYAq0bYThrUDW
	 GS9CbVx35kW+w==
Date: Thu, 30 Nov 2023 08:27:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, arnd@arndb.de
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231130-pellet-parted-4c3854bda573@spud>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20231130004224.GE2513828@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_002709_966277_AA7A7AA7 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Type: multipart/mixed; boundary="===============1965947298756475655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1965947298756475655==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="skPAiwM3XKXsb30B"
Content-Disposition: inline


--skPAiwM3XKXsb30B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 05:42:24PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> > On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> > > RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> > > architectures. Enabling hardware FP requires overriding the ISA string
> > > for the relevant compilation units.
> >=20
> > Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> > ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_=
32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than]
>=20
> :(
>=20
> > Nathan, have you given up on these being sorted out?
>=20
> Does your configuration have KASAN (I don't think RISC-V supports
> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
> or KCSAN in dml2")?

It's from allmodconfig, so yes, I think so.


--skPAiwM3XKXsb30B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWhHVQAKCRB4tDGHoIJi
0ktTAP4zJtbMBMKEDeq0u/9g0c5SQ8z5cOnNzWWYN7sZHhwFyAEA8RLHzYprTbaE
YZSEx6U8yszQOIViwBKWPBZ/OyRTWAo=
=98lz
-----END PGP SIGNATURE-----

--skPAiwM3XKXsb30B--


--===============1965947298756475655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1965947298756475655==--

