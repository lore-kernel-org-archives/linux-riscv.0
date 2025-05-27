Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D4EC54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsTvHSernArFdcnTpqnS9j0UNTx3UepaV1cdVyaQ4EI=; b=qApxSJ2p86LjcoaoRLAuzxfkkI
	TEh0zRQYqdHsx9q3h/Ss4kcFD9C2ay5P26epINLsVVrUFsF/fpZWcmRjUWVQh4Z886UmWJiRuqg6W
	UdKRce3PLJk0yV02nQbTE8PeZWhNk1PvQkl3XCz6/gzbGIB/1SuLw0Z8T1lp2EeilqvJsnMr1wmeG
	5d3N8Qmu1aWT8kwunl7Dvym82Q007UxpwgAv6x2MC05T/eja/lX5e1bQwX1sPy2krBxlL0T0jJAZB
	yqYv9Jejr3N/5GOlMpBxiEW1+8eK62t96XX3yNwu3SwYHOWCI2sIKFrdhSdXS2MCq3/3QXivCG5zj
	jCFAnIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJunm-0000000Aswd-2uwd;
	Tue, 27 May 2025 13:57:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJunk-0000000Asw0-228s
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 13:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFC2E5C1713;
	Tue, 27 May 2025 13:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CF8C4CEE9;
	Tue, 27 May 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748354227;
	bh=sWjTd1b4saAt0goojyaoXWF5Z91e7Gpdg64+FdJRQdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6p04V9OH+I6LP9PFnOQd04QlUaLSHclDi8RwzQnPa/ZoYB3xTIINen5RcI5pZzP/
	 /A51/Up3p/o1dhnrgXkSGn/cqIsCKpiwLUlGVWYmbpFQ46jjJDNwHBkarOzjv6/8hq
	 MHm2Ba7DW3CgKo0t0RdJ5aVQ4QSccBwD1+SnIMPv73rKC+297u2I2gsq+GWTiFIh3n
	 z9u3az4G9eX/oSt1ro3XQaNZcQtZF3IVZDCLmdkFWbIZjseEYWykQD4sZbXiqYARKr
	 R+mpP0W3DF6FGH1IbM8u+NdObThTmQtgb/3a9phecV4UZOw11wmK323sF9S5ae8O3G
	 0s2jkagEOzKFg==
Date: Tue, 27 May 2025 15:57:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: "Michal Wilczynski/Kernel (PLT) /SRPOL/Engineer/Samsung Electronics" <m.wilczynski@samsung.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
Message-ID: <3qdplpa3w2uxq7emonc4tufr4mae3xelk4habdhfvuvw5vxwe3@qdyu4rkeobhd>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
 <aDMHEcpJn8nyJHFV@pollux.localdomain>
 <db8e34c9-daff-43d9-b79b-8ec1bc98a00f@samsung.com>
MIME-Version: 1.0
In-Reply-To: <db8e34c9-daff-43d9-b79b-8ec1bc98a00f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_065708_607439_F4E243AB 
X-CRM114-Status: GOOD (  14.62  )
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
Content-Type: multipart/mixed; boundary="===============2607618195577195803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2607618195577195803==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnawmuhzlrg5qj6b"
Content-Disposition: inline


--rnawmuhzlrg5qj6b
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
MIME-Version: 1.0

Hello,

On Tue, May 27, 2025 at 02:44:57PM +0200, Michal Wilczynski/Kernel (PLT) /S=
RPOL/Engineer/Samsung Electronics wrote:
> W dniu 25.05.2025 o=A014:03, Danilo Krummrich pisze:
> > On Sat, May 24, 2025 at 11:14:56PM +0200, Michal Wilczynski wrote:
> >> +impl pwm::PwmOps for Th1520PwmChipData {
> >> +    // This driver implements get_state
> >> +    fn apply(
> >> +        pwm_chip_ref: &mut pwm::Chip,
> >> +        pwm_dev: &mut pwm::Device,
> >> +        target_state: &pwm::State,
> >> +    ) -> Result {
> > I assume those callbacks can't race with pwmchip_remove() called from d=
river
> > remove()? I.e. the callbacks are guaranteed to complete before pwmchip_=
remove()
> > completes?
>=20
> Yeah this is my understanding as well - this is something that the PWM=20
> core should
> guarantee. Fairly recently there was a commit adding even more locking
> 1cc2e1faafb3 ("pwm: Add more locking")

I confirm that starting with that commit pwmchip_remove() and the driver
callbacks are properly serialized. Before that this an issue, even
though it was hard to hit. (Because if you triggered the callbacks via
sysfs the locking in sysfs code implicitly worked around the problems.)

Best regards
Uwe

--rnawmuhzlrg5qj6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg1xK0ACgkQj4D7WH0S
/k7AoAgAgE6kPJ1bWcoaVzz4NG5KVOPDcjUi7+v9I5B79DFiy/xRcsUpAci8rFOd
ndfUs3BSC7MNhbGn3TqPLdHFu13JlfAM8SiaomyGJY//cFZyLYea6eW2ZSBFA8ja
NQH+C3AEG3OjnOgVQ53AcGR85thfg/hpk08UV+rWZ70xC9s6nFZZO3xn0r6sjCdr
3ETCq0a9KPvv3BrAHBGEmTD3+dsEgPFWJqje7I0+FUheZzqwn/M4OqmU5t6SMbL4
NGFc6KEWx6747Do9zqL5qKcIiDKqVlebkcYSPalO1epD4cMgSLKop259dBGIGKYF
cdg6otbdDgUaWHNIiPNAyvpYlpgEsg==
=IUKj
-----END PGP SIGNATURE-----

--rnawmuhzlrg5qj6b--


--===============2607618195577195803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2607618195577195803==--

