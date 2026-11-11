Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B78606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 04:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nyTKRk+J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ihi7Z3mW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wQnJ3KFRpfNpj7TasAK7Wkt49Rbg+dFFYUCI58/yU48=; b=nyTKRk+JHG9Ws3D3+8pvPkRIPT
	CqqLcvVC2ybSAK3OumD6D4z3QX86iGE5Xw8yD8mMHFBIFjbBsgQG5gbbeER/0ww6l3F+X9Ryln0da
	V9p7gzHBIpv02DPuUbE5/RgVgwyPD4TsJ0wv8z5r2x5MT6TUnwiBkXdnhHPI0FfaxmUskKZWEwA2Q
	197l4SnmhwXDM6oRUjhTTrr16OT6NES3v2PwlNZueTBKBFyUDsyz5W+G0TA2jBalO4cBJ4IxNPVAV
	lO7k0UmDlSmx3L6brCEywnruYHP8O6+JzV9q+HhFqx4zkFyljVfEYgZZNi2z2ymy6s4cjXMPmIG1T
	wOOCDU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR071-00000005cxw-1OOa;
	Wed, 11 Nov 2026 04:39:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR070-00000005cxo-1Gzn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 04:39:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A698F6142B;
	Wed, 11 Nov 2026 04:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0221F0089F;
	Wed, 11 Nov 2026 04:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371945;
	bh=siZmirI+f1Pyy8EXeDTuyyN9Ke8UwfOLkM0owVcLHTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ihi7Z3mWuOUA+kXYCdelMQfc0wNHEyM63cO8JoyRFYBXxLRj8v9SXEXjRfpt4HZsv
	 II8l7k07UN+GKvuGkYa8T9S1h38HBW19Rc0o9Hxs5BkXX0G2sL3QNUJqiwVXXT5ZSO
	 41eAboMlgACcl6rcoxul6g6au1reU9+lgHoppdBVGDiUeRgoQeUpuPIInwj97STiaz
	 qrj49xx01AHBcnRPjlhs2SzAiXgvOgz7ILb1AnMtBVoA0VaOOFVv0XcS/9vr86vOqh
	 wVb5zsw2OiBPHuZn/vrAQEVMXB94uXx3SwfFKg4196+omMgSgdfscT1mCVx2pZ0y4o
	 ip2vQIxoEvWbw==
Date: Wed, 11 Nov 2026 12:18:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
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
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/6] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <avPsnAlbfEsNa5zq@xhacker>
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
 <20261110-lrsc-only-v6-2-bafc3cc0fcae@mobileye.com>
 <20261110-revivable-saint-9bcfaa2fd0e7@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110-revivable-saint-9bcfaa2fd0e7@spud>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 07:02:48PM +0000, Conor Dooley wrote:
> On Tue, Nov 10, 2026 at 03:20:59PM +0200, Vladimir Kondratiev wrote:
> > The A extension is Zaamo plus Zalrsc. On some CPUs Zaamo is present
> > only formally. MIPS P8700 traps every AMO instruction into M-mode and
> > emulates it there, so the extension is supported but very slow. A
> > typical uncontended atomic increment costs:
> > 
> >   native AMO                                     2..5 cycles
> >   LR/SC, private L1 reservation monitor         6..12 cycles
> >   LR/SC, PoC (L2) reservation monitor       about 40 cycles
> >   AMO emulated by an M-mode trap           about 600 cycles
> > 
> > The last two were measured on the eyeq7h hardware. On such a CPU the
> > kernel must use LR/SC for every atomic.
> > 
> > Add RISCV_ISA_ZAAMO, default y. The default keeps "a" in -march and
> > the generated code unchanged. When it is disabled, -march carries
> > _zalrsc instead of "a", and atomic_*, bitops, xchg, futex and the
> > early boot code use LR/SC loops. The sequence is chosen with the
> > preprocessor, on CONFIG_RISCV_ISA_ZAAMO like the other ISA options in
> > the headers, because the assembler rejects AMO mnemonics once -march
> > lacks Zaamo. A kernel built this way runs on any hart that implements
> > A; it just does not use AMO. It is therefore a plain option, not a
> > NONPORTABLE one, and the hart keeps advertising "a" to userspace,
> > which is true.
> > 
> > The LR/SC loops follow the ordering convention of the existing ones
> > in cmpxchg.h, from commit 5ce6c1f3535f ("riscv/atomic: Strengthen
> > implementations with fences") and commit 1d84afaf0252 ("riscv: Fix
> > fully ordered LR/SC xchg[8|16]() implementations"): a fully ordered
> > operation is lr, sc.rl and a trailing fence rw,rw; acquire is lr.aq
> > with a plain sc; release is a plain lr with sc.rl. The futex loop is
> > bounded to 128 retries and returns -EAGAIN after that, as arm64 does,
> > because userspace can keep the word changing from another thread and
> > futex_wake_op() retries on -EAGAIN anyway.
> > 
> > Zabha, Zacas and the ssamoswap instruction of Zicfiss are AMO
> > instructions, so RISCV_ISA_ZABHA, RISCV_ISA_ZACAS and RISCV_USER_CFI
> > depend on RISCV_ISA_ZAAMO. The riscv64imac Rust target emits AMO too,
> > so RUSTC_SUPPORTS_RISCV depends on it as well.
> > 
> > The choice is made at compile time rather than with alternatives.
> > Nearly every CPU has a native A extension, and an alternative would
> > inflate all those kernels with the nops needed to pad one AMO to the
> > size of an LR/SC loop, at every atomic site, for the benefit of a few.
> > 
> > Turning Zaamo off needs a compiler that accepts _zaamo and _zalrsc in
> > -march. GCC 15.1 is the first release that does.
> > TOOLCHAIN_HAS_ZALRSC_ZAAMO checks for it; with an older compiler the
> > option stays at y.
> > 
> > Three sets of extensions provide every atomic Linux needs. "a" is what
> > the kernel supports today. Zalrsc plus Ziccrse is what this patch adds:
> > every atomic is a constrained LR/SC loop, and Ziccrse is the
> > forward-progress guarantee for such loops. Zaamo plus Zacas would do
> > as well, with CAS loops in place of LR/SC as on x86, and is left for
> > whoever has such hardware.
> > 
> > Suggested-by: Chao-ying Fu <chao-ying.fu@globalfoundries.com>
> > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
> > Link: https://lore.kernel.org/linux-riscv/20261106-smock-headband-d6a7d568c228@spud/
> 
> I had a quick glance at this revision, and I think you've at least tried
> to resolve the things I was pointing out. Did I miss something, or why
> have you kept the NAK after having resolved the things that I was
> objecting to?
> 

I searched the maillist for this errata, or workaround or downgrading 'A'
or anything else it's named, found something interesting:

IIUC, Paul has rejected the series, at least call for "hold off on merging them"
see
https://lore.kernel.org/linux-riscv/8afa0702-4d30-86e2-5afb-a7c113a92dec@kernel.org/

and 

https://lore.kernel.org/linux-riscv/6201870b-b50d-f6e2-814b-7a1fdbf064db@kernel.org/

But I'm not sure why the same series is still continuously sent out but
in different titles. I think this series can be ignored until riscv
maintainers agree to downgrade the 'A' to subset of 'A', I.E zalrsc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
