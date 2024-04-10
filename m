Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E956CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4hrE09JutfJ93qb1U9ysqaL+9Hp7kxjto46zj61qng=; b=y4ZSb0lPxhT5Ip
	XBRAt2+hmd5gm73DaJ68LtuW0KxK4Nn9E1ZwQ/a/dDcse2dyYNV9fYiTjTYYnl5MAAzBvVWKA1HQz
	hLyVmEV8RjnKiknrQ9rhwL5BDgIDyRmFISgFYKOtabQeY5D3iJixmGQi3I3gvBgmv5m7Dh0laAaFh
	EFeozvb4/sAZAgj12yNBsB6pCfDLs5IpPj9B0q1hsCB1/TW5nCqtkzvpPxJTP9z9jG1G4c7sUjGzT
	tkkIcVhKIv5AUTsNcLS1ValNDQgRPBhygeRGi8JoePsLkbnoj0nwwgkN3f/1fTzQn/uKTW+WY8xts
	yBPJRmcoWLzwuHksjrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYof-00000007RBx-2fv3;
	Wed, 10 Apr 2024 14:20:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYoW-00000007R5B-2G3H
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AFD67CE29EB;
	Wed, 10 Apr 2024 14:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69078C43394;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758833;
	bh=96EroGBucN/XgCKG058lK4TrE/wjf9osJZ/hchKA2Qc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q8vc0L8SS+ED/SjnwXPSCTK/WjTR5+3x7tIMpmnNdvBupgN/Lc/A7g2ygw7978BME
	 miUzhSbeVbmDcWBMp1ZA9Dnf1PWEU4hklH0n1CJJ7ytWmLcoWow0ptvKXloPkIOiT1
	 Nl3QJ/MXEcttk4CsgHCiVJoN95uTi2g1s/VYhyIt8ExwomIk5xQPa72ls1vF8SV5Ab
	 MV0FoVmc0YTIfDcL8x8Ms/hfsLGG0CJ8mlCY2+aSU1470yOkK/C04J3U/n4TkQlwfM
	 K9usfAt75uDvCBr7H0FyG1R+P2hiXESDbTenHwZiiT5oQLYCZdEsTOF/Pztoe+Otpn
	 hNDYfBKwNLAUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5ACFDC395F8;
	Wed, 10 Apr 2024 14:20:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/1] RISC-V: enable rust
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275883336.18495.14519035632596668351.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:20:33 +0000
References: <20240409-unsaddle-skittle-c93eb77732bb@spud>
In-Reply-To: <20240409-unsaddle-skittle-c93eb77732bb@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
 nathan@kernel.org, ndesaulniers@google.com, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_072036_783748_B7B59BF5 
X-CRM114-Status: GOOD (  12.17  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  9 Apr 2024 18:25:15 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I've intentionally not turned on the gcc support, as discussed on
> v1. I've also switched over to using the target, but it is a bit heavier
> than the one arm64 seems to be using. RISC-V has fewer targets available
> and this was the closest. I preserved the redzone disabling, just moved
> into the Makefile. Any comment from Gary or the LLVM lads on the target
> would be great I think:
> https://github.com/rust-lang/rust/blob/master/compiler/rustc_target/src/spec/targets/riscv64imac_unknown_none_elf.rs
> arm64 is using:
> https://github.com/rust-lang/rust/blob/master/compiler/rustc_target/src/spec/targets/aarch64_unknown_none.rs
> 
> [...]

Here is the summary with links:
  - [v3,1/1] RISC-V: enable building 64-bit kernels with rust support
    https://git.kernel.org/riscv/c/81889e8523e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
