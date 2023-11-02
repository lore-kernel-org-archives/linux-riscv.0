Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FFAC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 20:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4+zMwyCU+/OP3QQUOZn6P8WNXX80gbGa11GnFvSpww=; b=K6khxMzn3EQo3f
	pb/k83xKSbG+hZghO+HwtjGMSecvpOdgwlJHQbgCCjqUxMq6Nm6/Qw5BcVuuhbxcYfQJeMU/gyenb
	LrZIZQBGBipdabtgeEAYibgLL3kILsflVqfkWTJ4m0s/WJI+AggbWsV/k2dXJpC0sgDFtQKFu3xk2
	AzJeecu87YMchfqIbaJEaomd4x3HJIL2HwOHJDI0hqjMthYzfXciCD3JRj/iMge21+K+OWx1fJ8Cf
	o7dnFsSiYSExid69KWzIWxICQX+Ilnh7GiTUUblf3cGq4hOrlncDfksVkZpS9t9EThkDYXGBQjOjg
	vbpn43Wdx3vXlzCkOvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBA-00AEIN-0k;
	Thu, 02 Nov 2023 20:20:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeB6-00AEHC-24
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 20:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3EB161448;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9143DC433C9;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=XIqNneDvwTUx7cZETBqQ41jJPKUkTvgEnD4GcJ4v2qE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l6Qo4iPat8GOPplyhUoIrrYPBX9OsgqRtj7hPbT5ygjd3kcrurT4pXbrpw7oSQr+1
	 +C4cnwXyza0086uofo81tbCsVwG/hjZ66OAXIF0frdhhrssZQeujDzBO1+dICvbB+N
	 /RUrJ3pfFFJ0lbWA4qmD2E52ndGB324EVVEz545K/2ONZLmwFld3D7g9LVWbVu4J3I
	 xDLJ5gBAfXlqrhNlfrbsYH4EKerSqYwFQ113ClOBP8Uml3PwRETc9Ukfc56ZG42byR
	 OLuRFDmMZAXcoKs0TKGvEaugi+OKUu8d849z/vzxQ1WuEghkVPMnsyDi4KlqlrE0vb
	 rgRxSwAcGdNYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EC45C691E1;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/6] riscv: SCS support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169895643044.22248.9260509736343720996.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20230927224757.1154247-8-samitolvanen@google.com>
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 cleger@rivosinc.com, guoren@kernel.org, debug@rivosinc.com,
 nathan@kernel.org, ndesaulniers@google.com, maskray@google.com,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_132032_741755_E12105FE 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 27 Sep 2023 22:47:58 +0000 you wrote:
> Hi folks,
> 
> This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> uses compiler instrumentation to store return addresses in a
> separate shadow stack to protect them against accidental or
> malicious overwrites. More information about SCS can be found
> here:
> 
> [...]

Here is the summary with links:
  - [v4,1/6] riscv: VMAP_STACK overflow detection thread-safe
    https://git.kernel.org/riscv/c/be97d0db5f44
  - [v4,2/6] riscv: Deduplicate IRQ stack switching
    https://git.kernel.org/riscv/c/82982fdd5133
  - [v4,3/6] riscv: Move global pointer loading to a macro
    https://git.kernel.org/riscv/c/e609b4f4252a
  - [v4,4/6] riscv: Implement Shadow Call Stack
    https://git.kernel.org/riscv/c/d1584d791a29
  - [v4,5/6] riscv: Use separate IRQ shadow call stacks
    https://git.kernel.org/riscv/c/c40fef858d00
  - [v4,6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
    https://git.kernel.org/riscv/c/245561ba6d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
