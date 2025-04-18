Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E27C369CF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8NMwzxq7gQrbcUCG8JEmxu4BxEI2pt3CfSo0hM0Jf0=; b=NrB0RrFMFYQdhp
	PQ88KjAK6WQMdibVPz6uzebqOuryUr9/Sr6Pb7v6z0SLM9WVPqkQ19TZIFzbIfXAqT++Ykl+hW4Ma
	w6cZ2HZef/ANOPjRL8xZZyRUsYgQ3alh/pK5otFoY59rp8d98+xX/xlw6EmHFsXRy9a/Y2hx0e5Ap
	MyQnISzLLkjaCdZn38jGNwKeFU1x5TrvChk2ltRQkCcPf2UujWUGTCVFi8pO3elCNNgvrJeuLZOYY
	bv6h4uzcVtKlan+lf+IPpWCBiZcgFbnmZb273UOXTFgKvFD1JXZaPh1jJB8qy0gpNJTe4k5n6HVIu
	WvEFV7Deagy3UBLs5RBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5may-0000000GP3G-3FQ6;
	Fri, 18 Apr 2025 14:21:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mZ3-0000000GObK-16T2;
	Fri, 18 Apr 2025 14:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBDB661138;
	Fri, 18 Apr 2025 14:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508D8C4CEF0;
	Fri, 18 Apr 2025 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744985972;
	bh=om+Vna/2GFvSm09tdyvQMrH5gELgac15SstCZnvcK14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RRV/mjioS01PV47nXvZ0TWue3NIWYz4g3TvMtcGSc9SzDjv5ENiZxjjzbX9r29B3r
	 9/rQJy4n6bGeoy4ykbB+W4/4F7W0D3C9D3cINHvpgD0y02oiSDkrEm5G7Vf1UOSJNB
	 RQpnb5utZNxuqYFRuG86JaRbyR2LQdUMJyr2qEc11qUB69jHurGTthMhKqWn9Y9PcS
	 Nzl/cYyfucM8in2jji8Q98Ls2NeNC3pWDwx+RpeSSgWLOWSWmRB1nmRVItasiBs5Oy
	 j4ge2AaFjDu59Ljk0ccoDDlfXsh5ZyrSwgoTZOaXCcDebHhf0VadkqEJMQ5k7pZQjU
	 NX/2hSLrgVIsw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a071so21961481fa.1;
        Fri, 18 Apr 2025 07:19:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq1IE5wkqdfq0nOCQZmD5KpOScRTcP+I3UzcQYfR2sAX+TLJeT0sTvNArNPV4NqTf3uW7gccrRhfyp7Oo=@lists.infradead.org, AJvYcCXsun07PzZ57UCQ2/IcUJCp4LGpcXKRJM8TJ0zLyNwfmcXogIc8T4mfWoYb8FTJgRZKD4Lrdt9cffNrC5y2ocOL@lists.infradead.org
X-Gm-Message-State: AOJu0YyXQ4+SmQhvVwl8CqhDuP2Beu942c651VuiEEABYwqi/k9jMaiG
	uQrwr2y4sChnuUWwr8kdckHrihR5sFnw/e3UOagBZwOWqGXvgShSlTmoxblyf/SqAmWQ0n4BAO4
	VW9JcjdRTxOOv7xYl5NHuYm00nnU=
X-Google-Smtp-Source: AGHT+IFnh+q+URrFYgeso0knkjqFFZnTfGmXzWjvKWHdUWW3YHckdLRG/cd76/RqwZUrPe+JG12yfp7YED1LQQgVI5I=
X-Received: by 2002:a05:651c:241:b0:310:779b:9ef1 with SMTP id
 38308e7fff4ca-310904d4972mr9346751fa.13.1744985970634; Fri, 18 Apr 2025
 07:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250417182623.67808-1-ebiggers@kernel.org>
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Apr 2025 16:19:19 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE4T4p7iCkfo=4RoMeU4sHh47EZyBUSdWv7HTqdAY2oCA@mail.gmail.com>
X-Gm-Features: ATxdqUG3NGrAHvWSlyQ9Wx2CgTU0VxdHzlcc8yhyIdwCb_viAAYGMbAHFukqzA8
Message-ID: <CAMj1kXE4T4p7iCkfo=4RoMeU4sHh47EZyBUSdWv7HTqdAY2oCA@mail.gmail.com>
Subject: Re: [PATCH 00/15] Finish disentangling ChaCha, Poly1305, and BLAKE2s
 from CRYPTO
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Apr 2025 at 20:27, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series removes the unnecessary dependency of the ChaCha, Poly1305,
> and BLAKE2s library functions on the generic crypto infrastructure, i.e.
> CONFIG_CRYPTO.  To do this, it moves arch/*/crypto/Kconfig from a
> submenu of crypto/Kconfig to a submenu of arch/*/Kconfig, then re-adds
> the CRYPTO dependency to the symbols that actually need it.
>
> Patches 14-15 then simplify the ChaCha and Poly1305 symbols by removing
> the unneeded "internal" symbols.
>
> Note that Curve25519 is still entangled.  Later patches will fix that.
>
> Eric Biggers (15):
>   crypto: arm - remove CRYPTO dependency of library functions
>   crypto: arm64 - drop redundant dependencies on ARM64
>   crypto: arm64 - remove CRYPTO dependency of library functions
>   crypto: loongarch - source arch/loongarch/crypto/Kconfig without
>     CRYPTO
>   crypto: mips - remove CRYPTO dependency of library functions
>   crypto: powerpc - drop redundant dependencies on PPC
>   crypto: powerpc - remove CRYPTO dependency of library functions
>   crypto: riscv - remove CRYPTO dependency of library functions
>   crypto: s390 - drop redundant dependencies on S390
>   crypto: s390 - remove CRYPTO dependency of library functions
>   crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
>   crypto: x86 - drop redundant dependencies on X86
>   crypto: x86 - remove CRYPTO dependency of library functions
>   crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
>   crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
>

This seems like a good idea.

Acked-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
