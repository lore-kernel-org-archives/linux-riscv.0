Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6829EC3063E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsamKetW7eqUgi5SqPc96ReWDccGXQExhlsn2czLqGg=; b=Y9aWGL3vQVlFcA
	oHEpC7KulDZIZEFytIEpGXkEZOkA9bh+5qTrL3LcFHxhb1c6wNB/DW0QO+d3Z5cXk8nfOTF0yAXer
	AKkrOiV3KhKxjABG8mIrKW/+/njIBzzfSvAYwKNJIQ59qIWei+wfAUjDhgkv2O/efSAk7/TWmTD5i
	tTIugTgQjCdYyGlQ/Itf0JkZWN6BILTDVbwPjqPLtvpNLniDFPREQFDGj3U3hJF4oLmnhRZqvQQuo
	hyxmNRJv5Zv3UsUCfLxU4yJjmi6Lhs4R4J/242vSk9Lb5sEtRxrIidhSoDB3ZjN46DWch5TPDOVCd
	+xO8RKpq1LYtRxXahT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenc-006fUx-0c;
	Thu, 17 Aug 2023 15:20:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenS-006fRr-1a
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB5B065872;
	Thu, 17 Aug 2023 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8BDBC43395;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692285625;
	bh=qR6kigngMHcRwuRvA7J2U593va9JFSML77bkafy5IPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jt0wKcZDmE5NOyOJT0HC5QwXnRO0aqMe3XhQMCQivbQgcWq/a6TnuQxhPUG2V3y6y
	 QUo9JC9e8TYNLH2KxgAns8ojt3vdIufLXNoepPipIq8tZ5roJbQe1QxfkJg+QPUjXy
	 hAOOgK5QuQ0Dhy1hFUMk+dBflRBK4g6BhZmebBtoWkPqQO/qY/T39b7Y1E8/LKxvFR
	 aieKn/nNBaiwFIFgbrjEOi9iA8VFWA+pLJLiQsZBxmCUYA9l0sR/385r5z3GF3msiM
	 tzCN/TuI8z/d6FqLYeQRftBm8iiJCOSBjfoTsU6iZblqCyrp7Otp3IKi2Qwc3GYCdE
	 fRnK71TCk9wsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D06B7E26D3B;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 15:20:24 +0000
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
In-Reply-To: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 bmeng@tinylab.org, guoren@kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_082026_569598_ED212832 
X-CRM114-Status: GOOD (  10.56  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 10 Aug 2023 00:56:48 +0800 you wrote:
> Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the newer
> 20191213 version which moves some instructions from the I extension to the
> Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
> that version, we should explicitly specifying Zicsr and Zifencei via -march
> to cope with the new changes. but this only occurs when binutils >= 2.36
> and GCC >= 11.1.0. It's a different story when binutils < 2.36.
> 
> [...]

Here is the summary with links:
  - [v5] riscv: Handle zicsr/zifencei issue between gcc and binutils
    https://git.kernel.org/riscv/c/ca09f772ccca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
