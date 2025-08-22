Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6BACA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqy1QE9ticsNM8yQvOaaVf6HPtp3cY7VERTrSdG7QOQ=; b=ufHgJkf+HMi3SA
	dfUJ2wgYYbZuXs0EFu4mmfu9Nu8ZFFRs3BFKxkT0tV1pjc9O9Y9hfu5ylMJtnxFpHxxnkz4+qFAb/
	Scv5gG0sHnawKTWt4mp/Pb7sPnGfcDZBHM9HlPhJVMXD3p4qjTmbLt0xfzN/sdKCf0DtBKq1ClPQm
	8cswrH86DeaEMFDH5hVxS8Zwn1ENMJ3Pdmi2WbnBcT8VDuArOY0O835Yk5SZzH1hJxmfuJceR2fHW
	1NhubQjJClzMVLP7IYd4tLu2wUgYoYuxLZVclZPTL31HCAMGiIi9PYVNpZMwbNKjeH1+050Gr44Tf
	SAgwPI2wsLpsWCYjvCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkX-00000003wyo-24XF;
	Sat, 23 Aug 2025 06:29:13 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQzJ-00000002VZh-0fav
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 12:35:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A7D643848;
	Fri, 22 Aug 2025 12:35:16 +0000 (UTC)
Message-ID: <c09fa979-e853-44b7-9287-0c4b71cb1073@ghiti.fr>
Date: Fri, 22 Aug 2025 14:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] riscv: Unconditionally use linker relaxation
To: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-8-635f3294e5f0@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-8-635f3294e5f0@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieefjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeehiefhuddtuddukeetkeehhedtffduhfevfeeftdefveffgfeuffejjeejfeekueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeektddrvddugedrvdduuddrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeektddrvddugedrvdduuddrvddtuddphhgvlhhopegludelvddrudeikedrkedtrddufeefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghom
 hdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_053521_347043_5E8D535D 
X-CRM114-Status: GOOD (  14.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 8/21/25 23:15, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, CONFIG_RISCV_USE_LINKER_RELAXATION will
> always be enabled, so it can be removed.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
> ---
>   arch/riscv/Kconfig  | 6 ------
>   arch/riscv/Makefile | 9 +--------
>   2 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d53bf02d0fa..d482236e93f4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -246,15 +246,9 @@ config HAVE_SHADOW_CALL_STACK
>   	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
>   	depends on $(ld-option,--no-relax-gp)
>   
> -config RISCV_USE_LINKER_RELAXATION
> -	def_bool y
> -	# https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
> -	depends on !LD_IS_LLD || LLD_VERSION >= 150000
> -
>   # https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6
>   config ARCH_HAS_BROKEN_DWARF5
>   	def_bool y
> -	depends on RISCV_USE_LINKER_RELAXATION
>   	# https://github.com/llvm/llvm-project/commit/1df5ea29b43690b6622db2cad7b745607ca4de6a
>   	depends on AS_IS_LLVM && AS_VERSION < 180000
>   	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index df57654a615e..ecf2fcce2d92 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -46,17 +46,10 @@ else
>   	KBUILD_LDFLAGS += -melf32lriscv
>   endif
>   
> -ifndef CONFIG_RISCV_USE_LINKER_RELAXATION
> -	KBUILD_CFLAGS += -mno-relax
> -	KBUILD_AFLAGS += -mno-relax
> -ifndef CONFIG_AS_IS_LLVM
> -	KBUILD_CFLAGS += -Wa,-mno-relax
> -	KBUILD_AFLAGS += -Wa,-mno-relax
> -endif
>   # LLVM has an issue with target-features and LTO: https://github.com/llvm/llvm-project/issues/59350
>   # Ensure it is aware of linker relaxation with LTO, otherwise relocations may
>   # be incorrect: https://github.com/llvm/llvm-project/issues/65090
> -else ifeq ($(CONFIG_LTO_CLANG),y)
> +ifeq ($(CONFIG_LTO_CLANG),y)
>   	KBUILD_LDFLAGS += -mllvm -mattr=+c -mllvm -mattr=+relax
>   endif
>   
>

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
