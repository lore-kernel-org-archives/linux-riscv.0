Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2277C46CA1
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/b7VZB+PUYFruffIMfLDra4E3mVn9n/kgD3F1mGCF8=; b=jyYoG4tCCXJ7sq
	PSpXOGFoP/Nxy9+WQHSoSQAbtUMo+rcp2qZurNxIxuc5Ht6P6aGgrk24LdlYeS64rR5zvYxQBsQsJ
	tODGh32rNPqLKVDZbV4WAwAn2ngXoAMqOLI40zb6xtmap7h0A/2VJiy3IXvINdZzP+TOwJnqu6pQ3
	RB5o3FrkInXU/K8XGbs6QHUVg8YEqPMOrjZ9s/5hw236Yvq9HRz1pIMNXX7C/JhabRGw1I510w94x
	118IvUvgvX2favh6t3xiBdoIA083N+pgVDyRPawLKliy3S8vbXvigg28fGPB0IdPnrYb+bVq0yvlv
	LgvFzzlhWKkMY20PtjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tw-001oVY-2C;
	Thu, 12 Oct 2023 20:40:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Ts-001oTJ-04
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 20:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53765CE2A6D;
	Thu, 12 Oct 2023 20:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2979DC433C9;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143225;
	bh=Fauph9JoaEidptKpc+WMZmrBs887AnYOmzORE7FONmU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pyRZmD9ryji+iaTLJKK9DSKujCHuv7xdFnJEiv62kt1C8/qUq+96w3IzZ487U8BBU
	 vzOcEmd/wm2QYW7jRUUxjMpjeWrefBJ7JcvD2kTq3y0NZXQr6zIC9NLs5lGcOj0C/C
	 ziLlwQllZ9LiulhOPo2v/Sd6OM3AzBjqxJm1a7IEeRyD9PfHUhQAwLIae8s9WBCwu6
	 l3oyx4rNGkU14UHdP3Cgr325sFUC1s2hNiM3T2z8iHyYzm1aLq8f7CrzVCv10RKkPF
	 QVwx8ds9MtD1RAk0Vnv7voBiEAlwUAZ4p0iFXc3QvqbY1B+GtlirYbPzjZ+jXYb/TS
	 4cXSa0f34fR6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0B6E2E21EC0;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix ftrace syscall handling which are now
 prefixed with __riscv_
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169714322504.23371.7333099870836142544.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 20:40:25 +0000
References: <20231003182407.32198-1-alexghiti@rivosinc.com>
In-Reply-To: <20231003182407.32198-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samitolvanen@google.com, keescook@chromium.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_134028_229421_92F6A91B 
X-CRM114-Status: UNSURE (   7.69  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  3 Oct 2023 20:24:07 +0200 you wrote:
> ftrace creates entries for each syscall in the tracefs but has failed
> since commit 08d0ce30e0e4 ("riscv: Implement syscall wrappers") which
> prefixes all riscv syscalls with __riscv_.
> 
> So fix this by implementing arch_syscall_match_sym_name() which allows us
> to ignore this prefix.
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Fix ftrace syscall handling which are now prefixed with __riscv_
    https://git.kernel.org/riscv/c/a87e7d3e8832

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
