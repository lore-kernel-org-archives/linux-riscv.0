Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A356CCDE00E
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yz0uFMKOZURgQHXhJeKB4ogCjxKHOSXQmnT4t+incWM=; b=EXm/ho28CKNuOQ
	9RLKFfaIvHEDkXFeP/qoC21sN240/6ouiiYE5VMbSH6ioYX4ufAVB1MJqcF8U+JN7bj1F4F9afRUS
	ISwJy6ZbzUS1tFv/a1nOcCkGzJMRpd1An2unaU9PNuTc89e1QEem1PIQyEg4Yuh1EK3BzTQgjK5k/
	Ydit1hCrQlCyiYO7WQIH8D5E4KafhdCP0rpyMQtYhIc3JXMqjZ1ec//5U63ID2qHydiTv1JsEpFzO
	Fx50MZqIi2TX3P3sHgbecLkle/4JD9lc8zeOFhsU/QsoRV9KXLGk0zXHFzG8KvoX7UzPKLZl35N6e
	gmqJJt/RhBavoI4ZoSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oC-0000000AmyE-3T1v;
	Fri, 26 Jun 2026 08:21:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oB-0000000AmxD-0FR0
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E31F960098;
	Fri, 26 Jun 2026 08:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944D31F00A3A;
	Fri, 26 Jun 2026 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462065;
	bh=Hd48Vo1zZRuniF2+TmHwwxThB9aCSuhA9WEZ7WkytJ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JOmAVBiBFCRy04ORniCItBvjcez5viZEntfi5bdM0eoVja301FBH1EojafOQ33Gxl
	 r+ASN8SgU2YzT0cp9FglIYfZMDCLlMs4jetT8ajc4wQyKyfZbidwNHd5z1FSNC5nzf
	 zN+zX4S4ZN1al7wVU/NLpU7/dBy85Drl2zC5TwsCSXcfUilSLg4RXMxH+HlHeSDNIg
	 8ql7G+Ufv7aAiHqq89wTeF5fdjNqNSq3hqQceVYmtGREIB0OUP2b/7gw3h6bNb7XN6
	 yzGny9NlauumObP0FEo6VOpvCEbybbxUD8HSoqwXVt9r9ZwKoKfOew3UEuRCokYyJc
	 HDyMD7tVwhWMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AAD39389E8;
	Fri, 26 Jun 2026 08:20:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] lib: rework bitreverse
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246205280.3816447.13667687327162917011.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:20:52 +0000
References: <20260430211351.658193-1-ynorov@nvidia.com>
In-Reply-To: <20260430211351.658193-1-ynorov@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, yury.norov@gmail.com,
 linux@rasmusvillemoes.dk, arnd@arndb.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 ruanjinjie@huawei.com, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
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
by Yury Norov <ynorov@nvidia.com>:

On Thu, 30 Apr 2026 17:13:44 -0400 you wrote:
> This series is a resend for Jinjie Ruan's "arch/riscv: Add bitrev.h file
> to support rev8 and brev8" [1], my follow-up "lib: compile generic
> bitrev based on GENERIC_BITREVERSE" [2], and the fix for a build error
> reported by Nathan Chancellor [3].
> 
> No changes, except for combining pieces together and rebasing on top of
> the tree.
> 
> [...]

Here is the summary with links:
  - [1/6] lib: include crc32.h conditionally on CONFIG_CRC32
    (no matching commit)
  - [2/6] lib/bitrev: Introduce GENERIC_BITREVERSE and cleanup Kconfig
    (no matching commit)
  - [3/6] bitops: Define generic __bitrev8/16/32 for reuse
    (no matching commit)
  - [4/6] arch/riscv: Add bitrev.h file to support rev8 and brev8
    (no matching commit)
  - [5/6] lib: compile generic bitrev.c conditionally on GENERIC_BITREVERSE
    (no matching commit)
  - [6/6] MAINTAINERS: BITOPS: include bitrev.[ch]
    https://git.kernel.org/riscv/c/7b2c5b4e43aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
