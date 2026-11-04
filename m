Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD91606AB08
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 21:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t8SNYevU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk4t3nQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=to7TNnpiqe5PyDMVgj/tRWCNUKd2Y73eiXei1FXZLA0=; b=t8SNYevU1gTxCgJkA4aIefEC2i
	YnBDQcIxjBz8+9LJ02O3la+IjgfjyYZTZucP1sCZYRjGzX0qAK41wbhhmB4MW4o8aKk64yayo3Usw
	WgbekAkKJU3XfDr8+MgHpEvEfCzoROFJQU+p/PbhEmhnAM/g0wOUf7AD9rIAlZiasFGPQXf85X8rM
	HZWULuiQyNlEVfczGYSOyfAvt9iUxbfs6UOy0aaY+tAmunK9dP/Esjr0u6yvbo0yeU9ssxJw7mgyc
	KY+rjYEcyndKVlOudfpY7r48stdhj5YE8GC0t9AZOxU4Oz3Iw/emQPRbxivwBYXNLnAb40NYs4SPK
	p4Xrw5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOixf-000000076Le-0vvN;
	Wed, 04 Nov 2026 21:56:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOixc-000000076LE-0jEd
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 21:56:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82D65605F4;
	Wed,  4 Nov 2026 21:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35261F000C1;
	Wed,  4 Nov 2026 21:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793829359;
	bh=D4h2FEETnVEpGv52rXuV56YLxzG2GQ7jhklvjDnNRjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dk4t3nQ2AyRHkhM4jWCe+9MmcV7SZgCX4BWc2JWJDka0i7hrsK4FyrAPoA+m0TwSS
	 yyeysme84OC2s9OdiT5qaV74+IFr0N3l1EIWLnzK9XhF9m4HsN3ZYh31KRYI+c00nq
	 uHxVWrvOP1x0FSHaJhWMFmx7r4ZbjGqjGquJe2ZXbaSbbCrl3I6zXhtjSz7Ue2MPqx
	 ZpNkbjQoHfHcu0lXzceooyku2oNsU2CHYX/joAhPueGGFDW/dEpc2wc4PYiRvFzL2Y
	 pxtmcMNuUL6kOyCCWYiok3y2G1MwzfJq7nyMnY+feLaBf8QvllWxBSIZJ/AgHgsHuh
	 gsXrqpGYqNdBg==
Date: Wed, 4 Nov 2026 21:55:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261104-saddlebag-starring-4380fcc9293c@spud>
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-2-4e1d010463b3@mobileye.com>
 <20261103-pushcart-very-04a34d0ffb0e@spud>
 <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <507f3761-1104-4d15-8fb0-c2fca037ddd4@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0997622240325566515=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0997622240325566515==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FgSR+QDkNdZGN1o1"
Content-Disposition: inline

--FgSR+QDkNdZGN1o1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 01:23:52PM +0200, Vladimir Kondratiev wrote:
> On 11/3/26 23:41, Conor Dooley wrote:
> > That got me thinking though, I feel like this breaks some of the
> > extension parsing logic in other ways.
> >=20
> > If you putting zalrsc and zaamo in your devicetree, we never do any
> > backwards processing to set the a extension (we don't do this for any
> > extensions by design, we only populate "child" extensions based on their
> > "parent"). If there's some userspace thing that expects to see a in
> > cpufeature or w/e it'd break. There shouldn't be since a has always been
> > supported but who knows. You need custom userspace anyway so I honestly
> > don't give that much of a shit about this going wrong.
> >=20
> > What does "worry" me is hwprobe. Currently you've not modified hwprobe
> > at all to correctly state that you do not support
> > RISCV_HWPROBE_BASE_BEHAVIOR_IMA. (and brings up the question of whether
> > you support RISCV_HWPROBE_BASE_BEHAVIOR_IMA_FD etc!)
> >=20
> > Maybe, again you don't care cos of your custom userspace, but this needs
> > to be holistic if it is being done at all.
> > Personally, I don't want to lower the minimum requirements - the people
> > designing this stuff to run linux should have checked to see what our
> > requirements were (and have always been...).
>=20
> I will drop this patch and keep advertising "a" because formally it is
> true - all "a" including amo instructions do work but rather slow. Also,
> not worth to complicate logic here for (so far) one very special SoC.

By that logic, do not complicate the kernel at all with this zalrsc-only
stuff and drop patch 1 too. Please do this properly or do not do it at
all. If we are introducing the ability to configure the kernel so that
it runs on systems with only zalrsc, people should be able to run the
kernel on such systems without a) failing to boot or b) incorrectly
reporting to userspace what the hardware is capable of doing.

> For this SoC, we will compile user space with upfront knowledge of all
> hardware features.



--FgSR+QDkNdZGN1o1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauup6QAKCRB4tDGHoIJi
0tyTAQCr6BHIWi2JnJO0X/6lATO17o3V+TmKTbRxO0npO1HrHwD+L47N3tNstjUd
VjHMaGKyJDMgYEPbpqH1R4fmYsBEuAk=
=stpy
-----END PGP SIGNATURE-----

--FgSR+QDkNdZGN1o1--


--===============0997622240325566515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0997622240325566515==--

