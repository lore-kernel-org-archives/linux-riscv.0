Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2EDC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 22:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euhfZ6H8vH/D5tf3vZnYwSkIum+b/UolO4EaqxWhKbw=; b=zSO+gTqgWdjU/5
	LioWweOgLp6TO0kdiEyvjNJOc6sy9zEBiaaj42D0TsYXV4rUHkzGosCbNWo0Hm0QTjiGms3ZFk8uH
	QsXd8BdhKXJoJwe2D6g7xHTagBRI9WLi2yd5l2RaEz3AikssfFCKl5tXNq1JYF7Qu9iB57mfK4ANY
	5Rk+kM+BMoQpF9ov/pMhvuBDS2frUZNqd6EUumLI/Xu2pfhOSrQaVzqMjqwswLJhbMfBVIoQSN8vu
	eskzi+qMimI9FMD5JBuxhJzLcXeuwzL5Tt2RSN4ZhlurTl49hxwn2fhoesuo/GrFEvkJXDZDZuO2V
	3iXSHtJo6NudSPZcZZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobu-0000000FQ8j-3xTw;
	Thu, 29 Feb 2024 22:10:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobr-0000000FQ7A-3BHT
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 22:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21157612F1;
	Thu, 29 Feb 2024 22:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A405CC43390;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709244634;
	bh=3cFNJDOvNB4UfHtvAGBxHkMi/gySnAOSMqMm61Zsibk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ma9GepHyz2UlZW6t7USASudgBRjp1fOpyB6swY8MAPhLe17A27LnpG4kZ/l7NqwYq
	 XOJ+mT3wHYAMXLQqH8qk9n89fSeERJa39eqEg+/a72AETQsd6JEKXP89fbSOBp4V7w
	 OL4JrmHmYwuw/6Wd/kG53oIUYIwdLCg9DfaZ7fT7S1V8pqbl4g4wzcj95WTfgE0vhx
	 BgugBCObwBQO2j/thM1dQka/jh8hlqbJZcQpiGQNwXX/NfnngjbL/6kOywzujYAiIO
	 9cZ2+S0j4oZpaVdSQ+FuAgfimfHKmtb3ANIbYsU03A8c8TNdY/AMh9iUa9/sBcmuWX
	 AjlLcHi5b2CGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 872DCC595D1;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v4 0/3] riscv: cbo.zero fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170924463455.14902.4462676677426238717.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 22:10:34 +0000
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
In-Reply-To: <20240228065559.3434837-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 ajones@ventanamicro.com, linux-kernel@vger.kernel.org, conor@kernel.org,
 alex@ghiti.fr, sorear@fastmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_141035_912451_86C6EAC9 
X-CRM114-Status: GOOD (  10.38  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 27 Feb 2024 22:55:32 -0800 you wrote:
> This series fixes a couple of issues related to using the cbo.zero
> instruction in userspace. The first patch fixes a bug where the wrong
> enable bit gets set if the kernel is running in M-mode. The remaining
> patches fix a bug where the enable bit gets reset to its default value
> after a nonretentive idle state. I have hardware which reproduces this:
> 
> Before this series:
>   $ tools/testing/selftests/riscv/hwprobe/cbo
>   TAP version 13
>   1..3
>   ok 1 Zicboz block size
>   # Zicboz block size: 64
>   Illegal instruction
> 
> [...]

Here is the summary with links:
  - [-fixes,v4,1/3] riscv: Fix enabling cbo.zero when running in M-mode
    https://git.kernel.org/riscv/c/3fb3f7164edc
  - [-fixes,v4,2/3] riscv: Add a custom ISA extension for the [ms]envcfg CSR
    https://git.kernel.org/riscv/c/4774848fef60
  - [-fixes,v4,3/3] riscv: Save/restore envcfg CSR during CPU suspend
    https://git.kernel.org/riscv/c/05ab803d1ad8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
