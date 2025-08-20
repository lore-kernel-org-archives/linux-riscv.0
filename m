Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761F0CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w03m3oI9fCDNOU1flv9x9Jwu04cXTVQnqFjzz6LAJxM=; b=sQstyPmN9Vb+aK
	/C5GRXxLQ+iac5hgasjzFxUxL2K2KkuM/hdB5zQcm1ffwxG1jVf4ilNpZUnyCBjwOfx7KFvGu3KPB
	W8LM3ft1TfIk69oFmR6vnrlsYsZtGXNjWyfvKX6U08wsrYX99GhCbXmrWuBKlcz95PpxtiffC1HWF
	MeUSLwDX+71RH0RXCTEyk8T0n2xt1ehY7rikvF4BiqQwkQlprDtEJqWceysopUYQ8CpJii8xCItiX
	hSrgtqg0hcHxm9BdK06EXUZC4OamTo+1LtNtdeKV4xEfLlr44BDpic36JxGo5zQZuFSB+jpFVLQv6
	1462Y9KsTDf/EY9ynk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodOS-0000000CcU6-0171;
	Wed, 20 Aug 2025 07:38:00 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodAA-0000000Cb7r-1Jx5
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:23:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BD45442D0;
	Wed, 20 Aug 2025 07:23:08 +0000 (UTC)
Message-ID: <8078e385-e08e-40a5-b6df-31c0b5be8f43@ghiti.fr>
Date: Wed, 20 Aug 2025 09:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] riscv: Remove version check for LTO_CLANG selects
To: Nathan Chancellor <nathan@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
 <20250818-bump-min-llvm-ver-15-v1-7-c8b1d0f955e0@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-7-c8b1d0f955e0@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheejjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejveeuuddtuedtffevkeevteelffelueeiveeitdevieejgeffteekkeevhedugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdegmegtvggttdemuddvudgumehfvdefvdemjegufhekmegsfhegsgemgeeliegvmeduugegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduvdduugemfhdvfedvmeejughfkeemsghfgegsmeegleeivgemudgugegspdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemuddvudgumehfvdefvdemjegufhekmegsfhegsgemgeeliegvmeduugegsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhin
 hhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_002314_491754_28968BAA 
X-CRM114-Status: GOOD (  17.90  )
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

Hi Nathan,

On 8/18/25 20:57, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, there is no need to check the LLD version
> before selecting ARCH_SUPPORTS_LTO_CLANG{,_THIN} because it will always
> be true.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
>
> Small note, this will conflict with
> https://lore.kernel.org/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/
> but I think it is simple enough to deal with.


FYI, I'll send this patch for some 6.17-rcX.


> ---
>   arch/riscv/Kconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a4b233a0659e..1d53bf02d0fa 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -64,9 +64,8 @@ config RISCV
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>   	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>   	select ARCH_SUPPORTS_HUGETLBFS if MMU
> -	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
> -	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
> -	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
> +	select ARCH_SUPPORTS_LTO_CLANG
> +	select ARCH_SUPPORTS_LTO_CLANG_THIN
>   	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
>   	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
>   	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
>

I found another bunch of LLD_VERSION check in this file that could be 
removed:

https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L253
https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L262
https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L630
https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L731
https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L746
https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L781
https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L804

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
