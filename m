Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1116C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FznxOgrk6lo1enDBPeE66AjkxRi1+eRN7pRXcWiZvrs=; b=al9BjDJD7aNxFx6AZjxxtXlgEP
	rNgs7i+LncRvJO0ulik09EGoz4JGjlsMo9Aq3xxBGyIfh0p5XEhD4eAg/pqeIJd+9PgUEwmD2pPeE
	RwRLgvZG47oMkWByVGubWy2JfXjyaCqdY3F8FXZslezO3z5f2+zUnZhXnlO5UU65w8arYOcESkgfe
	gy/+6mCdFzE2hwZchCZ+tDZZ+eiqjpZ0R5Xu3au0JOFmWHXAcrlV6co/dC5BPk47W4t0G8W97huG6
	YfRYVWwxPdY0hY9oSUpbR7uABVMqtI4uSBnm5YPirIlz3uk5D/q2d6vB/6ojE/pi+8VRg6xpeekQ6
	MfZPmvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLmy-00000000txI-1xxB;
	Fri, 12 Apr 2024 18:38:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLmu-00000000tuk-2smK;
	Fri, 12 Apr 2024 18:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EEEB6140D;
	Fri, 12 Apr 2024 18:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E42C113CC;
	Fri, 12 Apr 2024 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712947091;
	bh=F6zQv5ic7tyHfVnV+5BzE9fGTieop/gUlPWBQ1/NTQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqNKaNJyrcbRforb/MYgMOxrEDl0SnFDz+UiLgKXR0VegcimDJL8+gNaAxjh9arLZ
	 j62nWhmhH0h7D1Bmhba/CnW9u/YGgTofj+BAjD10gL0TDJCs0f3Z1UujiCzKi6GAFk
	 YEK3dm5xQ8+PL2KeHe3w+isaK+CMqV7wVeCklahS/AVcxH4s+CpCV3GOFnMAoH1Gk8
	 IdV5QM/34y7EioeIdQiUM8Z/ntcFPAm3ef00weUono8+NlvVOID5lvimmTOKcm0lbr
	 FeG93C8vNVD9g4HsuYhpsnenlo3aCiD7XrPo4S8dV5SLWn3U3VoSz1oBTBARD9gD+j
	 IjG9UHOou+uXw==
Date: Fri, 12 Apr 2024 19:38:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240412-employer-crier-c201704d22e3@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_113812_888540_7404D236 
X-CRM114-Status: GOOD (  31.37  )
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
Content-Type: multipart/mixed; boundary="===============6694006748666614865=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6694006748666614865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gRwXSR6OMoeFGriG"
Content-Disposition: inline


--gRwXSR6OMoeFGriG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 10:04:17AM -0700, Evan Green wrote:
> On Fri, Apr 12, 2024 at 3:26=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > > populated until all harts are booted which happens after the DT parsi=
ng.
> > > Use the vendorid/archid values from the DT if available or assume all
> > > harts have the same values as the boot hart as a fallback.
> > >
> > > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property=
 on older T-Head CPUs")
> >
> > If this is our only use case for getting the mvendorid/marchid stuff
> > from dt, then I don't think we should add it. None of the devicetrees
> > that the commit you're fixing here addresses will have these properties
> > and if they did have them, they'd then also be new enough to hopefully
> > not have "v" either - the issue is they're using whatever crap the
> > vendor shipped.
> > If we're gonna get the information from DT, we already have something
> > that we can look at to perform the disable as the cpu compatibles give
> > us enough information to make the decision.
> >
> > I also think that we could just cache the boot CPU's marchid/mvendorid,
> > since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
> > repeating these ecalls on all systems.
> >
> > Perhaps for now we could just look at the boot CPU alone? To my
> > knowledge the systems that this targets all have homogeneous
> > marchid/mvendorid values of 0x0.
>=20
> It's possible I'm misinterpreting, but is the suggestion to apply the
> marchid/mvendorid we find on the boot CPU and assume it's the same on
> all other CPUs? Since we're reporting the marchid/mvendorid/mimpid to
> usermode in a per-hart way, it would be better IMO if we really do
> query marchid/mvendorid/mimpid on each hart. The problem with applying
> the boot CPU's value everywhere is if we're ever wrong in the future
> (ie that assumption doesn't hold on some machine), we'll only find out
> about it after the fact. Since we reported the wrong information to
> usermode via hwprobe, it'll be an ugly userspace ABI issue to clean
> up.

You're misinterpreting, we do get the values on all individually as
they're brought online. This is only used by the code that throws a bone
to people with crappy vendor dtbs that put "v" in riscv,isa when they
support the unratified version.

--gRwXSR6OMoeFGriG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhl/jAAKCRB4tDGHoIJi
0ptyAP0ZNjBpBCn7hL8p0/KqkB5iLRYcgUFzEfFnnLIR4Xu6bQEAnNsKHlMQNDHe
Gwr2lxxHHiZdULO9EWHcunPE1hXT4w4=
=sTMn
-----END PGP SIGNATURE-----

--gRwXSR6OMoeFGriG--


--===============6694006748666614865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6694006748666614865==--

