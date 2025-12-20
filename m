Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D5E67487
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYFDTJavehJV/8hQmEGLdlgI8jpycOpq1iUJ9GZkP4o=; b=BSZIJki6JO3G9VpfXUwg54kfeA
	Yf6BmukVhN683vRmquxPmFDUNuwXDj7TNizvxxLjCR1eb1CB3U0dMmqRu/lqHJLauadEYy+SbIVw5
	AJiSlDFmRqivT0dE+UmFovkjwzwU5f2y8EWb1BsBIbbE7pOGxZfBBC/vU2jqx6kV61YdZd/Pd6NfQ
	5ULHedZagfWCyfuOi7+fW/V5wTb9+5oFYyqHuwzYv4IMrSAKB6XNM+OLMKq/Byk1FS8vAwWS8lK/y
	JvEccmJ/WEqrTFq5grrMU+6LhZ7ONcnlTYNMSyhEjT78MEByL5awdHUkrEc6iEyNcd/DcnCDjmLkI
	/6BbIoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX6IF-0000000BydR-1DMc;
	Sat, 20 Dec 2025 23:23:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX6IB-0000000Bycd-2pJt
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 23:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F7B443F0C;
	Sat, 20 Dec 2025 23:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A2EC4CEF5;
	Sat, 20 Dec 2025 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766272995;
	bh=DYYss6ZWpYzoGvO9RlSxm0H4tZWSG7kfM2Z3uoM3hWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hINoR2IEQqKuQb88S/+IK4isI2+0Cta8wVGyqPiZuiTa+HptnTzQ/sKsoiDWmZT2j
	 +XNI5LkNczhbCTnMnfwnjPb2SHnBaHZZ4Nk3V9t3uHlNOyYr81l9K9gthH9pDNKYAP
	 kD/M5W7bLLFZmWW2l55EbGOU3PYvmSo+2eqB2HSLcxeqIFQKL7drdfwfVZljv8ochd
	 lNe3wWRbTFL7z2MJyyWURThyprh8rWCXWU/ZSVc6J3NKoTWAbUl21XGJQ1VxKbiTsA
	 I866Xp11qS38rVRlSwptzLkQ35+gnCIq/yVxJ9hl9q5iFoSi5AZ2RZEN2myEOr2TDh
	 ciAWa+J8TKkPA==
Date: Sat, 20 Dec 2025 23:23:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
Message-ID: <20251220-repacking-football-c79e660e788a@spud>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
 <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_152319_756073_824303A8 
X-CRM114-Status: GOOD (  27.18  )
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
Content-Type: multipart/mixed; boundary="===============7383473228465778362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7383473228465778362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLqy3GCJri0eonfM"
Content-Disposition: inline


--SLqy3GCJri0eonfM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 10:03:24AM +0800, Guodong Xu wrote:
> Hi, Conor and Heinrich
>=20
> On Thu, Dec 18, 2025 at 8:56=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Dec 17, 2025 at 09:07:14AM +0100, Heinrich Schuchardt wrote:
> > > On 12/17/25 08:11, Guodong Xu wrote:
> >
> > > > Specifically, I must adhere to
> > > > Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus.y=
aml for
> > > > properties like 'riscv,sv39' which stands for the extension Sv39). =
If I
> > > > add extension strings that are not yet defined in these schemas, su=
ch as
> > > > supm, running 'make dtbs_check W=3D3' fails with: 'supm' is not one=
 of
> > > > ['i', 'm', 'a', ...], followed by "Unevaluated properties are not a=
llowed."
> > >
> > > If Documentation/devicetree/bindings/riscv/extensions.yaml is incompl=
ete
> > > with respect to ratified extensions, I guess the right approach is to=
 amend
> > > it and not to curtail the CPU description.
> >
> > Absolutely. If the cpu supports something that is not documented, then
> > please document it rather than omit from the devicetree.
>=20
> Thanks for the review. May I clarify one thing? Both of you mentioned
> document them, given the amount of missing extensions, is it acceptable if
> I submit a prerequisite patch that only documents these strings in
> riscv/extensions.yaml plus the necessary hwprobe export? Leaving the actu=
al
> usage of these extensions (named features) to the future patches.
>=20
> To provide some context on why I ask: I've investigated the commits & lkml
> history of RISC-V extensions since v6.5, and I summarized the current sta=
tus
> regarding the RVA23 profile here:
> [1] status in v6.18 (inc. v6.19-rc1):
> https://docularxu.github.io/rva23/linux-kernel-coverage.html
> [2] support evolution since v6.5:
> https://docularxu.github.io/rva23/rva23-kernel-support-evolution.html
>=20
> Strictly describing the SpacemiT X100/K3 (or any core) as RVA23-compliant
> requires adding these extensions that are currently missing from
> the kernel bindings:
> RVA23U64: Ziccif, Ziccamoa, Zicclsm, Za64rs
> RVA23S64: Ss1p13, Ssccptr, Sstvecd, Sstvala, Sscounterenw, Ssu64xl,
>           Sha, Shcounterenw, Shvstvala, Shtvala, Shvstvecd, Shvsatpa, Shg=
atpa


> Plus 'Supm', 'Zic64b', 'Ssstateen', 'B' where the kernel supports them but
> they are not literally documented in yaml.

I don't think Supm is suitable for devicetree, doesn't it describe
what the kernel/userspace are capable of rather than hardware?
Zic64b doesn't sound like hardware description (so not really suitable
for devicetree either) but block size information is already represented
by some existing properties (see riscv,cbo*-block-size in riscv/cpus.yaml)
and duplicating that information is not really a great idea.

I'll admit that I do not really understand Sxstateen and how they work,
but my understanding was that knowing about Smstateen is sufficient and
implied Sstateen, but having Ssstateen defined seems harmless and
possible. I think kvm is the only user of this at the moment, so
probably worth CCing Anup and maybe Drew Jones on the patch adding
Ssstateen to make sure it makes sense.

--SLqy3GCJri0eonfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUcv2QAKCRB4tDGHoIJi
0iR2AP9Yk3/6cNreOG5xP/f/Ga3J0EIzYWjEal9Q3S4fWg1J/wD/W51HcFJ+XVx8
UNjjhag+wvjdA/6x6J2/eZYqdoVHUQA=
=M6ap
-----END PGP SIGNATURE-----

--SLqy3GCJri0eonfM--


--===============7383473228465778362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7383473228465778362==--

