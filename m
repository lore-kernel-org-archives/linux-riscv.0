Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC102C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tO6lcTdtTUC4ns6tP++Cd53ogAa7Gdv50Ygn9/WLtI=; b=vbWPtZ6IBq5dv3
	WZi+1zuMgxjf7JrRaUXGANsSmk9jXhGYByqrIDwtnxRI6KmMj2FXz2fU7VL3Ni0mzMG/uUK/r121v
	3FqYRkY9Tslx5AW9fOT+XNRuuteRrpxJ/PNxYL9QdXLVFU4pSHptbofjA6QTThboZ9t6Kzxx4G4uz
	OaPdecNjHaBWFuxhaQHPS7MQ68HzTDmts8nppgr0sM5q2jV5LQk4jUuEw+GZfAIKrBk+SGGng2YZA
	LPlYW0RCStt3hX6AdMKYCUcSw4eOaBQcVfSfbgd7iEYvDlN0UgsT6QdM6JHBdYHhoyoyAgEnbRHyn
	jj7nJuEhBBI9PM1RXIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSsT-0000000BIco-2XJ5;
	Wed, 11 Jun 2025 21:20:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQNt-0000000AtMU-09KK
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 18:41:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BD6A61135;
	Wed, 11 Jun 2025 18:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBA7C4CEE3;
	Wed, 11 Jun 2025 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667271;
	bh=dmSmsOSfNexAj6f4AfOckgvW1QZ58ApdfuCwjYsPsXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2A9Q4vU5kApajaJzbuMwQvcZeWaKTB9Q6kxXVjOVBLJXa64nYFX2LsAsEWaZV2gK
	 8G6reWkkMEBnbz0TEK9wMWCENpeGpglgn7enmbojaeelMZxA+nKe6ohKxRPjeTopdo
	 tQ5KUzDMutTBqRqFdnhzm8ad4ZK2Bzi2I1Lqa82Sb9HAhsozqE92EDhAbbCSrpkvmN
	 GCKPicCY8swm9tGxpTcTwuMc1j361ZDjgjHB7X2Z9/Q1I2p3SZzGZNBLxs27q314mY
	 wDvjVVWT9BiAIxRuIMV7cq0NT+8X/qceUS791LVLWpbqCmrw+jbfV0eI14yGGZEg6A
	 cEa7Jsa/f/Vpw==
Date: Wed, 11 Jun 2025 11:41:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/3] riscv: vdso: Disable LTO for the vDSO
Message-ID: <20250611184106.GB2192624@ax162>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-2-47897d73784b@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-vdso-absolute-reloc-v3-2-47897d73784b@linutronix.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11, 2025 at 11:22:13AM +0200, Thomas Wei=DFschuh wrote:
> All the other architectures supporting LTO (x86, arm64, loongarch) do not
> use it for the vDSO.
> =

> Its is problematic for some upcoming compile-time validation of the
> generated object code.
> The LTO object files do not contain the necessary relocation information
> and -flto-fat-objects is not compatible with clang < 16.
> =

> For consistency and to enable the mentioned compile-time checks,
> disable LTO for the vDSO.
> The vDSO heavily uses __always_inline anyways.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

Yes, I would agree this has little actual value for the vDSO.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Mak=
efile
> index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd302=
2e9e1a185128b73 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds +=3D -DHAS_VGETTIMEOFDAY
>  endif
>  =

>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_VDSO =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO =3D $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
>  CFLAGS_REMOVE_vgettimeofday.o =3D $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_getrandom.o =3D $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_hwprobe.o =3D $(CFLAGS_REMOVE_VDSO)
> =

> -- =

> 2.49.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
