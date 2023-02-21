Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD85C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9pcsuA/i7Os/alDKF0crjMGtHtfqW9yydIYrQz4DdA=; b=ohXmnCfwZivkJ8MzOETY3zzKER
	9Nc7ZTmrmtZsGujrewWYNbnm9MqIa8WRGLehNC88W//q9DtAxZn97LUj/gQUP890OjZrSmTSbSq9U
	HFpdzsHrts38Mc8jREjXIEU9+pMAiAHsSVTMOH7wVcsN4jp+jNEEBojbH9z5jcUB+7UmKn05AwLeF
	BwLiPsA/SuIWtauIZc36niDkG7tGF73iaU0f4SIHExx69/huHiW+citlChXiD2wFDWxQcfdj3OVB9
	VwflQIpoT1kca6RhEtIYcvCyETmJBSS1q+Pzaf8SONkTr37cHTj5C99eDR+yvwlJyjCYlC88lpFQA
	A+clWR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUbtc-00A6dB-Ro; Tue, 21 Feb 2023 23:18:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUbta-00A6cW-1o
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 23:18:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DCE4611EB;
	Tue, 21 Feb 2023 23:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C12C433EF;
	Tue, 21 Feb 2023 23:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677021480;
	bh=Mh//mLUoyP5yIuIIjymXpRAj8FV23s77Ahtu7KJhh4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qo4sH0rGPaRwtE/jWl91YCy9BGsPsoFN12cToQolh/EGEFCjn515f0fEsN0phuWZZ
	 5v1SZyRZZ3qkfgBH33r1tZVX9KD3pO+zPtGIYBJmgtGebZFgG4Ya6PEP56o6Hz+6vF
	 QIxRfosAqo5LoMF7nxnrpaUMoFWcYn3YRkXyaDGtsUa3TTbKnI+U1Gw4HB0Gk4llpX
	 xso+KKkh4iCcXo5Dohdk8pvjGohJp/LTpo8iENgwZEv8F+1KiZ3JHQ5+N6srGMCGOJ
	 iWTIeiahOSnScylPBbh2vi7RiwqF8wKCsvsVzC7SgyFIDEbpb/cB+iCPRh9eQPt0+a
	 lRzfIxbJfUbig==
Date: Tue, 21 Feb 2023 23:17:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: stable-rc: 5.10: riscv: defconfig: clang-nightly: build failed -
 Invalid or unknown z ISA extension: 'zifencei'
Message-ID: <Y/VRJF0QKKqkFN6g@spud>
References: <CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com>
 <Y/SLn5fto6+9xX0r@wendy>
 <Y/VGu9IOJEKi6VwS@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <Y/VGu9IOJEKi6VwS@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_151802_193215_87E483C7 
X-CRM114-Status: GOOD (  27.08  )
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
Content-Type: multipart/mixed; boundary="===============2220575507039080679=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2220575507039080679==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="whT7Q92xxSfANgK+"
Content-Disposition: inline


--whT7Q92xxSfANgK+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 03:33:31PM -0700, Nathan Chancellor wrote:
> On Tue, Feb 21, 2023 at 09:15:11AM +0000, Conor Dooley wrote:
> > On Tue, Feb 21, 2023 at 02:30:17PM +0530, Naresh Kamboju wrote:
> > > The riscv defconfig and tinyconfig builds failed with clang-nightly
> > > due to below build warnings / errors on latest stable-rc 5.10.
> > >=20
> > > Regression on riscv:
> > >   - build/clang-nightly-tinyconfig - FAILED
> > >   - build/clang-nightly-defconfig - FAILED
> >=20
> > > Build log:
> > > ----
> > > make --silent --keep-going --jobs=3D8
> > > O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=3Driscv
> > > CROSS_COMPILE=3Driscv64-linux-gnu- HOSTCC=3Dclang CC=3Dclang LLVM=3D1
> > > LLVM_IAS=3D1 LD=3Driscv64-linux-gnu-ld
> > > riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p=
0:
> > > Invalid or unknown z ISA extension: 'zifencei'
> > > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > > init/version.o
> > > riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p=
0:
> > > Invalid or unknown z ISA extension: 'zifencei'
> > > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > > init/do_mounts.o
> > > riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p=
0:
> > > Invalid or unknown z ISA extension: 'zifencei'
> > > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > > init/noinitramfs.o
> > > riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p=
0:
> > > Invalid or unknown z ISA extension: 'zifencei'
> > > riscv64-linux-gnu-ld: failed to merge target specific data of file
> > > init/calibrate.o
> > > riscv64-linux-gnu-ld: -march=3Drv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p=
0:
> > > Invalid or unknown z ISA extension: 'zifencei'
> >=20
> > > Build details,
> > > https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.10.y/build=
/v5.10.168-58-g7d11e4c4fc56/testrun/14869376/suite/build/test/clang-nightly=
-tinyconfig/details/
> >=20
> > binutils 2.35 by the looks of things, I **think** that zifencei didn't
> > land until 2.36. zicsr and zifence get added via cc-option-yn, which,
> > IIRC, doesn't do anything with the linker. I dunno if anyone in RISC-V
> > land cares this much about "odd" configurations back in 5.10, but while
> > a fix is outstanding, you could use a newer binutils?
>=20
> This is new in clang-17 so I bisected LLVM down to commit 22e199e6afb1
> ("[RISCV] Accept zicsr and zifencei command line options"), so I think
> we need something like commit aae538cd03bc ("riscv: fix detection of
> toolchain Zihintpause support") for zifencei to make sure all three
> tools stay in sync, since I suspect that this is reproducible in
> mainline with GNU ld. We just happen not to notice when using
> LLVM=3D1 LLVM_IAS=3D1 since the tools have symmetrical support.

At least if it is in mainline there'll be interest in fixing it!
Nobody was shipping hardware worth mention when 5.10 was en vogue, so
little interest in it :(

> I can work up something like that change tomorrow if that seems like the
> path worth taking.

I'm not sure if this one is the same as Zihintpause though, because
zifencei & zicsr were part of i prior to a spec update, so we may need
to be careful about the spec version that clang/llvm is using if we
decide not to pass zifencei/zicsr to it. See arch/riscv/Makefile, about
L55 for a comment...
I'll go get myself a clang-17 tomorrow and give things a whirl if you
want Nathan?

Cheers,
Conor.

--whT7Q92xxSfANgK+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/VRJAAKCRB4tDGHoIJi
0iDBAP4pOrkepLUC1dzex3KN1VvvGvYahiVr0Y2E42GJuoT7ZgD+KUgJ9xGpMiZh
vl3u969fkX/wptXNeEpGotMF0w2OxQs=
=Mg48
-----END PGP SIGNATURE-----

--whT7Q92xxSfANgK+--


--===============2220575507039080679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2220575507039080679==--

