Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF73CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yJR5TKFkRyvpvOBSnXkUOmRi1sU/ldb8zVlzsShciQ=; b=f3CjLL6uV2tu11
	/24/inE1KbjEO5vhdAsJZ9pb//oEt3FfK/wuiO5DKYVMnrqjXZ0HNMPKfC/cZnZ/mS70F1dML9pr9
	O/jRfQY4q/5fEcFccNPkebePjdSqFSB3NMs4mnaYulhS9z3NQsaRrSzEzx60b7haykH97dlJT4tJd
	ZEHxu/HoYSZ1fhtsxuGmdx8BnqEcb8I5krurixwMZiHgitdoLoQzJi/q91VIaMH23M6StMfgtqTzQ
	0O80LTJ8KxiqDyJr+mwtz7nWr0tbIZzp4KZpcuycAbr9t7RRLQRpzjiANIICUWdxMtjWn/e7TCOav
	+lUXHqji0T2L8O/N6Vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkb-00000003x3z-2gIx;
	Sat, 23 Aug 2025 06:29:17 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upR29-00000002Vu7-0yNY
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 12:38:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E13EB443CB;
	Fri, 22 Aug 2025 12:38:11 +0000 (UTC)
Message-ID: <30ebd580-80e7-456e-8628-9d0a08dced95@ghiti.fr>
Date: Fri, 22 Aug 2025 14:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] riscv: Remove ld.lld version checks from many
 TOOLCHAIN_HAS configs
To: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-9-635f3294e5f0@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-9-635f3294e5f0@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepkedtrddvudegrddvuddurddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkedtrddvudegrddvuddurddvtddupdhhvghloheplgduledvrdduieekrdektddrudeffegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhgl
 hgvrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_053817_415988_72FD898F 
X-CRM114-Status: GOOD (  13.69  )
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
> has been bumped to 15.0.0, several ld.lld version checks become
> tautological, as they are always true. Replace them with a simple
> CONFIG_LD_IS_LLD check.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
> ---
>   arch/riscv/Kconfig | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d482236e93f4..850ba4b4b534 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -620,7 +620,7 @@ config TOOLCHAIN_HAS_V
>   	default y
>   	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
>   	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
> -	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> +	depends on LD_IS_LLD || LD_VERSION >= 23800
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_V
> @@ -721,7 +721,7 @@ config TOOLCHAIN_HAS_ZBB
>   	default y
>   	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
>   	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> -	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on LD_IS_LLD || LD_VERSION >= 23900
>   	depends on AS_HAS_OPTION_ARCH
>   
>   # This symbol indicates that the toolchain supports all v1.0 vector crypto
> @@ -736,7 +736,7 @@ config TOOLCHAIN_HAS_ZBA
>   	default y
>   	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
>   	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> -	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on LD_IS_LLD || LD_VERSION >= 23900
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_ZBA
> @@ -771,7 +771,7 @@ config TOOLCHAIN_HAS_ZBC
>   	default y
>   	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
>   	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
> -	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on LD_IS_LLD || LD_VERSION >= 23900
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_ZBC
> @@ -794,7 +794,7 @@ config TOOLCHAIN_HAS_ZBKB
>   	default y
>   	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbkb)
>   	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
> -	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on LD_IS_LLD || LD_VERSION >= 23900
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_ZBKB
>

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for the v2!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
