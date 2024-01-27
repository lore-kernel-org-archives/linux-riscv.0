Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32077C47DDB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MX2rxh6A8Vc38A3QZMv6TqKMM7avBRpAH9CcBS30GvE=; b=Srky1fD5q+y4LL
	gGieUD+s+cB/mEBacEK8KxtMKhw6X0u8aFWRke/f02mzO/c6bPJSJZROCYz/mfcrEkyHADLZCiwN6
	tb3m8TlwkBsxdi/X5XzhJ0WCfJNACft8LF2/OKVpHJBBJV23YyotTtS6fa4XMfooE1wcKgTpPcQRc
	qTDzcfvFfBfAY/BzeYo3xlgKC0+7GuD9qJ4aEE7whajFrTPd3N24gtaDq0UdzTySNV7neyubVHbPm
	OBzadaevRIaRu+7HtPsQz/aspI7ja5nwCgi0W3ZicTiBw0y79EjbzLjWfqLQ+ViodNDnliau9TUF8
	L1iQZx8MYw2UCTRbyVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTeau-00000007CbY-0HO3;
	Sat, 27 Jan 2024 09:03:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTear-00000007Cb6-1gCY
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 09:03:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85C84CE02C6;
	Sat, 27 Jan 2024 09:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD3C433C7;
	Sat, 27 Jan 2024 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706346192;
	bh=3CEC9+s/RgV3W453q4JCCo7clahZ+kguMoxyN5D2wY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVHa/WHNCuTpM+sFtsfuqn5gAIFVBhVSGCWQh0dAYjNRAKKYFiWAck8Phpf1076cx
	 +FY+5nM+daqdHFi39v9JU6iAKmKKPheUYi/YPOP1NLRGTUJVV1+R25ZYZgOdSeYvly
	 snfv46B3E69rNby/TgxZNxhcc4w+cC+nCii/gUGB/AReNjw6niP1tU88VU6B2ZUKR/
	 MI2+XIk4JMWw4Eav7Lct+D+FEEVBMffYhSUmuy7GSiBDcRAfAimiUiWUpUuvMDdzsV
	 emOLwwqOOa4vcyUbaG2AH5WWp1okWyeSVhqHlSlque+bHV2xLknpNLllSzkUsvwbe3
	 jixcBqLEcYxfw==
Date: Sat, 27 Jan 2024 01:03:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	masahiroy@kernel.org, nicolas@fjasle.eu, andy.chiu@sifive.com,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
Message-ID: <20240127090310.GF11935@sol.localdomain>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_010317_642309_F91BD83F 
X-CRM114-Status: GOOD (  21.85  )
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

On Thu, Jan 25, 2024 at 10:32:10AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> Eric reported that builds of LLVM with [1] (close to tip of tree) have
> CONFIG_AS_HAS_OPTION_ARCH=n because the test for expected failure on
> invalid input has started succeeding.
> 
> This Kconfig test was added because '.option arch' only causes an
> assembler warning when it is unsupported, rather than a hard error,
> which is what users of as-instr expect when something is unsupported.
> 
> This can be resolved by turning assembler warnings into errors with
> '-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
> which is what the first patch does. The second patch removes the invalid
> test, as the valid test is good enough with fatal warnings.
> 
> I have diffed several configurations for the different architectures
> that use as-instr and I have found no issues.
> 
> I think this could go in through either the kbuild or RISC-V tree with
> sufficient acks but I will let them fight over who takes it :)
> 
> [1]: https://github.com/llvm/llvm-project/commit/3ac9fe69f70a2b3541266daedbaaa7dc9c007a2a
> 
> ---
> Nathan Chancellor (2):
>       kbuild: Add -Wa,--fatal-warnings to as-instr invocation
>       RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
> 
>  arch/riscv/Kconfig        | 1 -
>  scripts/Kconfig.include   | 2 +-
>  scripts/Makefile.compiler | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)

Looks good,

Tested-by: Eric Biggers <ebiggers@google.com>

Unfortunately another LLVM commit just broke TOOLCHAIN_HAS_VECTOR_CRYPTO, so
I've sent out a patch to fix that too...

But with all the fixes applied it works again.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
