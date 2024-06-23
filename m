Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A8FC27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jun 2024 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIqyHjSBizVGMogGFv2IJbTWFKorijgwuFef1wOaZj8=; b=xoBSJ6fjIQpe0OzTleaBiFd7K9
	HmqTo9jP0saUHWYj5byJN+sPNyiK+9qKnovCCcghIbGPx3OETeuX7qwSk9Z41x9jqAKz8cDfAx6AL
	i5JVn7RrqaE63s/7UqQw+n1slzgKrQejNWA/tmsKL2DU/HiPMYfC/pAu93balkuV+esn9l0PIWJMG
	JyCTfga4mcE+ptR82M7ybK0cr4RPLtj3X7eZn6PxrkzzqqHrVbGoUrcP0Q4n6HiU8ry7JBobygObX
	Sz630CVCfQGEQhsZ6OpUau8kwXiEVEY/+GvYoFwzQnMBJ0TkjDQMirdN3sMomq+wK89LsTp0/RIAx
	57heEJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLR4Z-0000000ETxX-3Os1;
	Sun, 23 Jun 2024 17:32:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLR4W-0000000ETwr-1Q13
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jun 2024 17:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C7E16CE0C71;
	Sun, 23 Jun 2024 17:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F0BC2BD10;
	Sun, 23 Jun 2024 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163927;
	bh=4RpJrjP+HQ5Hl1Kqa2ZS0D5BRTr/aIQgYxzQ18Gv6Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MuWYOZaexDplPuJDc+7/dS2pRInpaHtqdO/USSBExy4BnfhHi50WuTSF3LFLSlrRX
	 tDErip4tn5+MChXWdqew174rDb9UI/7FmWF3xXZyFg1irIbp1gUfLDxXNVXUQ7ek2M
	 X5BqBF10FBSWbNv1D8rgk2b+CN2Usrh7Umi1f/nvdNyLwQZaEDnbyKmqM1n1UlhZWz
	 vifXql/SG9nSlfYNwJx8fM0INI/CGsZwmf1qpwh2tCXS8j/56v9kZlkZfGMcJyE5Vu
	 bUoGxg/KcKDNF4IRFUdyM0o86FWD06VkHC2Hz/VGxUw2cCBQnj1Q6TP8zZg8PROKZJ
	 sNJwt9JEo/lPQ==
Date: Sun, 23 Jun 2024 18:32:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for
 Canaan Kendryte K230
Message-ID: <20240623-graveyard-consonant-97eff0f11808@spud>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
 <20240410-unwoven-march-299a9499f5f4@spud>
 <20240619-hammock-drum-04bfc16a8ef6@spud>
 <CAJF2gTRYpDLij1aQoftz6ZqEgXDrfhNA39KiFVrwm7qc4WH6Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRYpDLij1aQoftz6ZqEgXDrfhNA39KiFVrwm7qc4WH6Fg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_103212_760546_58CCB9A1 
X-CRM114-Status: GOOD (  28.99  )
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
Content-Type: multipart/mixed; boundary="===============6006624333467551395=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6006624333467551395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7CnmFpihGKPoqw+z"
Content-Disposition: inline


--7CnmFpihGKPoqw+z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 01:07:55AM +0800, Guo Ren wrote:
> On Wed, Jun 19, 2024 at 6:45=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Apr 10, 2024 at 11:30:25AM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > On Mon, 08 Apr 2024 00:26:58 +0800, Yangyu Chen wrote:
> > > > K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add ini=
tial
> > > > support for it to allow more people to participate in building driv=
ers
> > > > to mainline for it.
> > > >
> > > > This kernel has been tested upon factory SDK [1] with
> > > > k230_evb_only_linux_defconfig and patched mainline opensbi [2] to s=
kip
> > > > locked pmp and successfully booted to busybox on initrd with this l=
og [3].
> > > >
> > > > [...]
> > >
> > > Applied to riscv-dt-for-next, thanks!
> > >
> > > [1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
> > >       https://git.kernel.org/conor/c/64cbc46bb854
> > > [2/6] dt-bindings: add Canaan K230 boards compatible strings
> > >       https://git.kernel.org/conor/c/b065da13ea9c
> > > [3/6] dt-bindings: timer: Add Canaan K230 CLINT
> > >       https://git.kernel.org/conor/c/b3ae796d0a4f
> > > [4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
> > >       https://git.kernel.org/conor/c/db54fda11b13
> > > [5/6] riscv: dts: add initial canmv-k230 and k230-evb dts
> > >       https://git.kernel.org/conor/c/5db2c4dc413e
> >
> > After some discussion on the k1 thread
> > (https://lore.kernel.org/all/ZnEOU7D00J8Jzy-1@xhacker/, https://lore.ke=
rnel.org/all/ZnA6pZLkI2StP8Hh@xhacker/)
> > I am going to drop this series. It's not very useful in the current
> > state and there's not really been any interest from people in getting
> > the platform to a more complete state. Jisheng made some good points in
> > the k1 thread about the missing clock controller stuff, and I think I'm
> > going to make having basic things like clocks and where applicable
> > resets and pinctrl the minimum requirement for the platforms I'm looking
> > after.
> Here is the k230 clock driver based on Linux-6.6:
> https://github.com/ruyisdk/linux-xuantie-kernel/commit/196242fd9b9b4a191d=
ab0c7c3c5bf851ed857d8d
>=20
> pinctrl:
> https://github.com/ruyisdk/linux-xuantie-kernel/commit/baf26b6622c9de2ff6=
4a6ed58eeeb98c8b2c828b
>=20
> No reset driver.
>=20
> Most of the k230 drivers are under Linux-5.10, and we are porting them
> into the newest version of Linux, which takes time.
>=20
> So, if the clock & punctual drivers mentioned above could satisfy the
> minimum requirements for the platforms, we will update the version of
> this series as a supplement.
>=20
> Is that okay?

I don't understand how that changes anything, these are all out of tree
drivers based on an old kernel. I know that there are drivers for a lot
of the peripherals that are in-use in the vendor tree etc. What I am
looking to happen, before I apply patches for the k230, is that the clock
dt-bindings will have landed in linux-next - and ideally the pinctrl ones
too.

Thanks,
Conor.

--7CnmFpihGKPoqw+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnhcEgAKCRB4tDGHoIJi
0o3gAPwIKqvtW8/ntyAJ2oP0W/Qxo6lOiR4/hpCuM7YY2syHAwD+K9UEOGv9IGnf
S+SPP1Ff/veVlNcIm6//1+yG3FV6dwQ=
=J+o1
-----END PGP SIGNATURE-----

--7CnmFpihGKPoqw+z--


--===============6006624333467551395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6006624333467551395==--

