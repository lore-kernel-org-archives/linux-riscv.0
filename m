Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEC60A2601
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NTYbiLMa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ta3ME0TX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yfCzxYQKAcbP9OO4ytwmHJwZMMI4w0ItzZRnkf7gCVI=; b=NTYbiLMasSP3SuJHN6PEEEfALZ
	3vkr9zXGmKqABQpFTG74gR+pnaJfpmnJiPJ2yra0klREGHVADHer9kYRPbQ1DiSRM/8S6swVE+7e/
	q6cet9dXTSQyJ2B+Ie2SWw7VU12ZWll+bXpyD+0lAQvCx+XDWSN31qP5TTWlEWaF4vdzsDfv7WneH
	OIvZOVtfppTsn08LLJ+5Ho4Yry1WNI8FEnLti48qMt0/fr8G/BSFDahwBirrKXerP1zHESD6L9HYD
	i/vXf2zPVAHpBHKP5vUAkfv/Zs0eHuftM+M5KJfJo4KUFrSo/PYTW3BvbruawMlQdOD4wXDJi6iSw
	0vTHgwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr7V-00000004rmN-3QjE;
	Tue, 10 Nov 2026 19:03:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr7U-00000004rmA-35c0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 19:03:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39EF146947;
	Tue, 10 Nov 2026 19:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3691F008A1;
	Tue, 10 Nov 2026 19:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337380;
	bh=0Nen3DE75lFZ06p2iNZ1cFUOV53MmCW0/dJJQgl8Lz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ta3ME0TXdyjvWLI8RTl/D/KZ8OX9eIxFE8UPaKUmoHdPpjemp7tE5UYSsEA2L6CRW
	 cgwohAtvbGVrQJIfaEdZBgeoaeRENsZIBNBiAOa3T2ub/q7g2ZlDykuscP9cTSI9pC
	 30iE+bW6Rah/0lNVSndbLQYrMidX0okCN6w+9u/kEVQliehneqd0xc97QGwKo7BhXA
	 Sn3Zr4b7fX5qYWipbipSYJ15Avc4tik8tcKOdsXEzBxQvy0CI6ip7NTIJpyreEieBV
	 b6CIolTXu7DrA7wTUQrNO6nM+BgPe4fWWpweg2ZgH48TkJJf+s0yAhdgAhifNidIOw
	 9qjcOvdQJmqhg==
Date: Tue, 10 Nov 2026 19:02:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Chao-ying Fu <chao-ying.fu@globalfoundries.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/6] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261110-revivable-saint-9bcfaa2fd0e7@spud>
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
 <20261110-lrsc-only-v6-2-bafc3cc0fcae@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261110-lrsc-only-v6-2-bafc3cc0fcae@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0999698426307256111=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0999698426307256111==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yEOv5UU3yImNGsK0"
Content-Disposition: inline

--yEOv5UU3yImNGsK0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 03:20:59PM +0200, Vladimir Kondratiev wrote:
> The A extension is Zaamo plus Zalrsc. On some CPUs Zaamo is present
> only formally. MIPS P8700 traps every AMO instruction into M-mode and
> emulates it there, so the extension is supported but very slow. A
> typical uncontended atomic increment costs:
>=20
>   native AMO                                     2..5 cycles
>   LR/SC, private L1 reservation monitor         6..12 cycles
>   LR/SC, PoC (L2) reservation monitor       about 40 cycles
>   AMO emulated by an M-mode trap           about 600 cycles
>=20
> The last two were measured on the eyeq7h hardware. On such a CPU the
> kernel must use LR/SC for every atomic.
>=20
> Add RISCV_ISA_ZAAMO, default y. The default keeps "a" in -march and
> the generated code unchanged. When it is disabled, -march carries
> _zalrsc instead of "a", and atomic_*, bitops, xchg, futex and the
> early boot code use LR/SC loops. The sequence is chosen with the
> preprocessor, on CONFIG_RISCV_ISA_ZAAMO like the other ISA options in
> the headers, because the assembler rejects AMO mnemonics once -march
> lacks Zaamo. A kernel built this way runs on any hart that implements
> A; it just does not use AMO. It is therefore a plain option, not a
> NONPORTABLE one, and the hart keeps advertising "a" to userspace,
> which is true.
>=20
> The LR/SC loops follow the ordering convention of the existing ones
> in cmpxchg.h, from commit 5ce6c1f3535f ("riscv/atomic: Strengthen
> implementations with fences") and commit 1d84afaf0252 ("riscv: Fix
> fully ordered LR/SC xchg[8|16]() implementations"): a fully ordered
> operation is lr, sc.rl and a trailing fence rw,rw; acquire is lr.aq
> with a plain sc; release is a plain lr with sc.rl. The futex loop is
> bounded to 128 retries and returns -EAGAIN after that, as arm64 does,
> because userspace can keep the word changing from another thread and
> futex_wake_op() retries on -EAGAIN anyway.
>=20
> Zabha, Zacas and the ssamoswap instruction of Zicfiss are AMO
> instructions, so RISCV_ISA_ZABHA, RISCV_ISA_ZACAS and RISCV_USER_CFI
> depend on RISCV_ISA_ZAAMO. The riscv64imac Rust target emits AMO too,
> so RUSTC_SUPPORTS_RISCV depends on it as well.
>=20
> The choice is made at compile time rather than with alternatives.
> Nearly every CPU has a native A extension, and an alternative would
> inflate all those kernels with the nops needed to pad one AMO to the
> size of an LR/SC loop, at every atomic site, for the benefit of a few.
>=20
> Turning Zaamo off needs a compiler that accepts _zaamo and _zalrsc in
> -march. GCC 15.1 is the first release that does.
> TOOLCHAIN_HAS_ZALRSC_ZAAMO checks for it; with an older compiler the
> option stays at y.
>=20
> Three sets of extensions provide every atomic Linux needs. "a" is what
> the kernel supports today. Zalrsc plus Ziccrse is what this patch adds:
> every atomic is a constrained LR/SC loop, and Ziccrse is the
> forward-progress guarantee for such loops. Zaamo plus Zacas would do
> as well, with CAS loops in place of LR/SC as on x86, and is left for
> whoever has such hardware.
>=20
> Suggested-by: Chao-ying Fu <chao-ying.fu@globalfoundries.com>
> Nacked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/linux-riscv/20261106-smock-headband-d6a7d56=
8c228@spud/

I had a quick glance at this revision, and I think you've at least tried
to resolve the things I was pointing out. Did I miss something, or why
have you kept the NAK after having resolved the things that I was
objecting to?

Thanks,
Conor.

> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

--yEOv5UU3yImNGsK0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNqVwAKCRB4tDGHoIJi
0vCIAPwI9tv4/veY1c2lX/x6cUlucNBdIPbCVw9jI0m16SyQIwEAwvrqq4Gw4cdE
G3N4rmccRtmc+qeZKgNCaWp7/G74kQ4=
=vYmX
-----END PGP SIGNATURE-----

--yEOv5UU3yImNGsK0--


--===============0999698426307256111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0999698426307256111==--

