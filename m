Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E6CC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObOJJs3xS7F/Zmg62SSPqcCtA34CFrYwgCfqAcsi4xI=; b=kHYSn2agyE3xKYLQ8fEXE9xaLz
	oqyqz7lpNTnhejwEEhyWi1++ExxO7IP+KAC+zRh7n3MQ+BIvQlRYz4KqSRmJwMl6vvxvIs+sDTU1h
	zsnui4QXQKGV/4Q/afb4Y7zYK5WDjj6Md/VXWk/keypW8y+r62jh+zwXGej4Q6+j9Mh3oOCghdgml
	sXEjUxVVw5Kn+B3kZ9BbH+j95THUtDLts90+fKKNT0wmFez9rKhOMYUToGmDPKbXv4AiCJHewG6gt
	gLWnoCl6BUsTLkY697BRjPRGcY2SeRo4HcsEf2kzCl8PKuiQHZZp1IrmxV31VwK8fBQYlPPNnT7p5
	C1WscrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8Jw-00000003a8U-3aCk;
	Tue, 25 Jun 2024 15:43:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8Jp-00000003a5k-18m0
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 15:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70F20CE028C;
	Tue, 25 Jun 2024 15:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9049C32782;
	Tue, 25 Jun 2024 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719330170;
	bh=0EWqU0TQngTF3BLWUKxqBKCJJ/uf0uceTeoQNO0hkEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEQUFkmya3YR+mR/j1IfIw7nhDcTMrVSVpBkCSfmCY+AvrHHMRp0leFrhiPBCMXec
	 WIC+RIJCFVem677msnmCo+b1lST8j77gMxbUTZnjuR8tOJ90ccP5Qx450+VwsTApKq
	 RQHm1u5EZ9631bvdj3vLUIjp9SNAFnl6WMDcizSmzA4ezPK27owtAmJTtOsdiNhGOn
	 xbis7nC1Eh+zXx8NCBA39MqwNnvYaXdxHqVUlVvZX8oswAcq4YGho2JH9VY7vPj2Jf
	 vslMqgLshuT5pZmD4ZteXZUfnuYhvf++aVA1hfT4Y9EQpWrSdDqZQQBkvsjGEHDwTG
	 +5tNhEHlfvpaA==
Date: Tue, 25 Jun 2024 16:42:45 +0100
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
Message-ID: <20240625-broadside-cope-52ecb71d459f@spud>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
 <20240410-unwoven-march-299a9499f5f4@spud>
 <20240619-hammock-drum-04bfc16a8ef6@spud>
 <CAJF2gTRYpDLij1aQoftz6ZqEgXDrfhNA39KiFVrwm7qc4WH6Fg@mail.gmail.com>
 <20240623-graveyard-consonant-97eff0f11808@spud>
 <CAJF2gTS_KkQjyQPubc2+naYiammLjN8jJyptGtCe8Z56MAmT2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTS_KkQjyQPubc2+naYiammLjN8jJyptGtCe8Z56MAmT2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_084253_704772_8C276431 
X-CRM114-Status: GOOD (  33.37  )
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
Content-Type: multipart/mixed; boundary="===============8091941446918406084=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8091941446918406084==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OM922ceDo/uZsKlH"
Content-Disposition: inline


--OM922ceDo/uZsKlH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 11:55:32AM +0800, Guo Ren wrote:
> On Mon, Jun 24, 2024 at 1:32=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Jun 24, 2024 at 01:07:55AM +0800, Guo Ren wrote:
> > > On Wed, Jun 19, 2024 at 6:45=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Wed, Apr 10, 2024 at 11:30:25AM +0100, Conor Dooley wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > On Mon, 08 Apr 2024 00:26:58 +0800, Yangyu Chen wrote:
> > > > > > K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add=
 initial
> > > > > > support for it to allow more people to participate in building =
drivers
> > > > > > to mainline for it.
> > > > > >
> > > > > > This kernel has been tested upon factory SDK [1] with
> > > > > > k230_evb_only_linux_defconfig and patched mainline opensbi [2] =
to skip
> > > > > > locked pmp and successfully booted to busybox on initrd with th=
is log [3].
> > > > > >
> > > > > > [...]
> > > > >
> > > > > Applied to riscv-dt-for-next, thanks!
> > > > >
> > > > > [1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
> > > > >       https://git.kernel.org/conor/c/64cbc46bb854
> > > > > [2/6] dt-bindings: add Canaan K230 boards compatible strings
> > > > >       https://git.kernel.org/conor/c/b065da13ea9c
> > > > > [3/6] dt-bindings: timer: Add Canaan K230 CLINT
> > > > >       https://git.kernel.org/conor/c/b3ae796d0a4f
> > > > > [4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
> > > > >       https://git.kernel.org/conor/c/db54fda11b13
> > > > > [5/6] riscv: dts: add initial canmv-k230 and k230-evb dts
> > > > >       https://git.kernel.org/conor/c/5db2c4dc413e
> > > >
> > > > After some discussion on the k1 thread
> > > > (https://lore.kernel.org/all/ZnEOU7D00J8Jzy-1@xhacker/, https://lor=
e.kernel.org/all/ZnA6pZLkI2StP8Hh@xhacker/)
> > > > I am going to drop this series. It's not very useful in the current
> > > > state and there's not really been any interest from people in getti=
ng
> > > > the platform to a more complete state. Jisheng made some good point=
s in
> > > > the k1 thread about the missing clock controller stuff, and I think=
 I'm
> > > > going to make having basic things like clocks and where applicable
> > > > resets and pinctrl the minimum requirement for the platforms I'm lo=
oking
> > > > after.
> > > Here is the k230 clock driver based on Linux-6.6:
> > > https://github.com/ruyisdk/linux-xuantie-kernel/commit/196242fd9b9b4a=
191dab0c7c3c5bf851ed857d8d
> > >
> > > pinctrl:
> > > https://github.com/ruyisdk/linux-xuantie-kernel/commit/baf26b6622c9de=
2ff64a6ed58eeeb98c8b2c828b
> > >
> > > No reset driver.
> > >
> > > Most of the k230 drivers are under Linux-5.10, and we are porting them
> > > into the newest version of Linux, which takes time.
> > >
> > > So, if the clock & punctual drivers mentioned above could satisfy the
> > > minimum requirements for the platforms, we will update the version of
> > > this series as a supplement.
> > >
> > > Is that okay?
> >
> > I don't understand how that changes anything, these are all out of tree
> > drivers based on an old kernel. I know that there are drivers for a lot
> > of the peripherals that are in-use in the vendor tree etc. What I am
> > looking to happen, before I apply patches for the k230, is that the clo=
ck
> > dt-bindings will have landed in linux-next - and ideally the pinctrl on=
es
> > too.
> Okay, clock & pinctrl, the reply is clear to me. Thx.

If you could get someone to work on them, or convince Canaan to do it
etc, that'd be neat :)

--OM922ceDo/uZsKlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrldQAKCRB4tDGHoIJi
0mj/AQDSC+8biqd74U/wZIAYY5mPtlzOLL72kl322YLxabTrsQEAlqZIiS7uT0VG
hn+xDxQiJhWGReEGAEQpjvt64ET4LA4=
=j+ri
-----END PGP SIGNATURE-----

--OM922ceDo/uZsKlH--


--===============8091941446918406084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8091941446918406084==--

