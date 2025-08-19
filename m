Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1C2CA0EF5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 00:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXYetnlAYYDf0UqXyBfgvFpW/qqZ2SlJB4h4N4tFxFo=; b=I25D64GMyroSu9
	VOHWtG2tmATga8MrJfXmZOeC6hRSj0ZnN6JBv/m8U+gU/04zaHjDuNhHz4dn05f7XxCx2VZdEU9Wj
	NzMt4ZEYH0hUP9/zOo8u0QyeJ3P9NCuGAd27fnlbNhIXZlOlVVLTDdu5fMtz06VEjrBLrPkvIn7xg
	glIbHznyjZOFRXk8kIWarz8pB9JgCaYovr3Ms3ZmT30U2iahcpqBPodI9N3pf0b/CxsYg8bRP588I
	mDB8Ecjr0PF4uR+oz9kbMJxftpTHiULAoTwOpT0Nlj49n8SneKTYLBM6YuEJ5dCeOd50oAvvjcbmC
	hl6iyQc4wJ2htPWS5H9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAfy-000000092hy-2dvd;
	Tue, 19 Aug 2025 00:58:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAdO-000000092YK-3U4N;
	Tue, 19 Aug 2025 00:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896C55C57B0;
	Tue, 19 Aug 2025 00:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A33C4CEEB;
	Tue, 19 Aug 2025 00:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755564929;
	bh=RHDDgdI1KU5gTd6q3RZ5KjPYkSkpxLcDr1NCuu19268=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xf9fcNQgSU+Jeg+ZP/DY9xu+7OEGwXkut8IrHzRW8NQLSJst0aTV0vjj7mBLD2TMC
	 w5Fy48Sn79iupubE3YtfbIfAZusLxLPs26rf7V0ryA7My7a+9RNPJSdkDFA+bypbef
	 SxGw74sKCkXQJfaZC+ps0lk9znD9XBmUnvgdm6lcfG4Dymf7j7PwKOAneQrOIzbUez
	 vCSoiI+k4kes3saiX75j3h1XiAq43lBTMSMpkalNwUodG0ItYSp05wxSQjcjHYl4v/
	 z2RjuW+7g/v5dY5viRILFm+jyrKcdgAUsnv3ksqOxqwz7dYrU5SvTErUHtrouytaWZ
	 aW3FdXzlx4+Dw==
Date: Mon, 18 Aug 2025 17:55:28 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 00/10] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Message-ID: <202508181753.7204670E@keescook>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_175530_912037_073CE6B8 
X-CRM114-Status: GOOD (  12.28  )
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

On Mon, Aug 18, 2025 at 11:57:16AM -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
>
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
>
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.

Looks good to me!

Reviewed-by: Kees Cook <kees@kernel.org>

> I think it makes sense for either Andrew to carry this via -mm on a
> nonmm branch or me to carry this via the Kbuild tree, with the
> appropriate acks.

I vote you carry it with Kbuild. :)

--
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
