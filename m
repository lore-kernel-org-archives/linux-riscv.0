Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F7AD3CC88
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrG2bvJSKKPUZQ/9iM8iro9ft5tR1Q+fxzfreUQwQIw=; b=HLt9I8RHdG6N0o
	2rWsQkW0R/EfvP/sBobSTpjDDcUUKageVICPJkIZveonqugcFdVC1pz4ra1d79QVS0aMm5z68Tq7r
	Qwo9QY9xMBeMnzxxTGtqNxot2aVVYoi4wLhSv3ov6LHWGAOoXP1bf3q5YCxuU9FRWTeCJiWcolhEP
	/xCU6AxnKKQkyCld85FtpLgU4hi0cvLoFhFlJxedMPJNxeFkzWjyRLaH2JRIiIGsXRYrFNcm9R35T
	SqWU/yt3E53lahH8mVy1YxDmx3W6qoJWdf3u16qO4QtrICZxaWmurWN8lQhcEV55iu0BZq6qFBB1P
	Fj9QWxTndbqu33Cv4jnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBlH-0000000BJxS-2q0y;
	Thu, 15 Jan 2026 01:02:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBlF-0000000BJwh-3Sm2
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 01:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AE3F6000A;
	Thu, 15 Jan 2026 01:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721FBC4CEF7;
	Thu, 15 Jan 2026 01:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768438971;
	bh=jVBqlcLqSYseOgAHYybbgxO53XS2Bsh6/8CM4GtShzE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kDvTK8d4hpQPa0CO4skL5dFMNKYiupT4QYHsMg2RDLscHlG/jv8ca+2pzZIupkQDt
	 VNOFC9PANKfgV4+2yQc1IEHyC5+cROm2GPysCuPLvU300v3hfYgFiX0HuQ7J55ANk4
	 MYuDm8q17bwnl6Gsn71BtEVZLw+oA2R8KQDtOLNIwhY+AKdRJ+Fw9pLB34V87wDwQ0
	 K/mHwgGBAwBnucAXu35LMkTfcz1PvqeiLpYKFsj8LIFzDDVmn/733duDo73i4Uiuqe
	 70YXVSGcyDfuyY5lEOn5F0gCTmt88Tmu22M2Mfp3obPLLf0l2MauV84ADS0zZUYIKa
	 dvZTzciYsKkRA==
Date: Wed, 14 Jan 2026 18:02:46 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Craig Topper <craig.topper@sifive.com>, linux-riscv@lists.infradead.org, 
    llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH RFC v2] riscv: Use 64-bit variable for output in
 __get_user_asm
In-Reply-To: <20260113-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v2-1-e04aba2e1f9f@kernel.org>
Message-ID: <7bc39d4d-6e2d-f0af-9787-5fd2c92bfd4e@kernel.org>
References: <20260113-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v2-1-e04aba2e1f9f@kernel.org>
MIME-Version: 1.0
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

Hi Nathan,

On Tue, 13 Jan 2026, Nathan Chancellor wrote:

> After commit f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for
> get_user()"), which was the first commit that started using asm goto
> with outputs on RISC-V, builds of clang built with assertions enabled
> start crashing in certain files that use get_user() with:
> 
>   clang: llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp:12743: Register FollowCopyChain(MachineRegisterInfo &, Register): Assertion `MI->getOpcode() == TargetOpcode::COPY && "start of copy chain MUST be COPY"' failed.
> 
> Internally, LLVM generates an addiw instruction when the output of the
> inline asm (which may be any scalar type) needs to be sign extended for
> ABI reasons, such as a later function call, so that basic block does not
> have to do it.
> 
> Use a temporary 64-bit variable as the output of the inline assembly in
> __get_user_asm() and explicitly cast it to truncate it if necessary,
> avoiding the addiw that triggers the assertion.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/2092
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Rebase on 6.19-rc5
> - Send to updated addresses
> - Link to v1: https://lore.kernel.org/r/20250811-riscv-wa-llvm-asm-goto-outputs-assertion-failure-v1-1-7bb8c9cbb92b@kernel.org
> ---
> I did this unconditionally but I did not do much investigation into how
> the code generation changes, as I never have good luck with figuring out
> what is real vs. noise. If this is a worry, I can just duplicate this
> under a CONFIG_CC_IS_CLANG block. Alternatively, we could mark
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT as broken with clang when targeting
> RISC-V.

I'm assuming this would be a temporary patch, and that we might be able to 
remove it at some point (years, I guess?)

Might be worth adding a comment in the code to explain why a temporary 
variable is needed.


thanks for the patch,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
