Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD3C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnJ++raR7JSzy6rv4abt+2ebzjqp+1V6joxFG/7JaF8=; b=M0tcgg32Ba+t7y
	dclcLtU8rsxXxiTGgTXxyOIac7fymV71OBCPpqiEVF9YoIkB/7Eb52ejgDjhworDUGpPJSvAF/rbH
	1jWFlF8Vt1EB4eW+FLSXjgZVDBhneK94mIoEcxDS5Q+RpbfK5y6qNc3bnehGYLKFdeXs4R+BQXWYv
	iGYDv7yex2PnWbkTq32zZHaIs7sAXPiR+/15gMqFo48HGIcrrVZL2k9MabGy+OMbf5ZLSH5JBI889
	xhUhHlptyeghlQXQimwZ4vCAOXyCSiqxyrlD8e9GDGB/czwNXTSwlea2N985THLmousv0QoKG62qc
	+iZAZuQ+jf31Bmpo3X5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMM-005CHN-0y;
	Wed, 09 Aug 2023 14:40:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMI-005CEd-0u
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA9E763C54;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A5F0C433CA;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691592021;
	bh=Lhf4dunGaMpKTl1uQVkZSCuLWY2zJMjBo+ZX8A0Oqjw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cxdBtGOm8WaqOeYDsX3kOYWYgVzDTFN2+fgQRKIFZ40YmzzhvhjVYEk9Dg4GilQTQ
	 /y/DqonMpDL3YdF+bnWLJDW3/klJWLLD1mXHB7Q3h7FgxFXmwWi13LdaI0uGgNDLgQ
	 zDyAOjWTHTEHMvd1CZ+5XGpb7A6YxfCRNQrgqX6oYrGHuabSnBqo5NwC3mQPYqGR5y
	 Da9f/tQTt1eKlu6szvE2RM2+n4TbK9kyxQZqfL/2MTRFJVu+Gz6ipC++ujUkPgzr5C
	 wabbRumTznfJX3fGi+a02sGnOgjugXGKx2e6a1VbYH2xcdpzArzlmGVuH9MjovvNM0
	 QH0MVNRUE1zHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1178EE33090;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv,mmio: I/O barriers fixes and cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159202106.17533.2222118881302041934.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:40:21 +0000
References: <20230711133348.151383-1-parri.andrea@gmail.com>
In-Reply-To: <20230711133348.151383-1-parri.andrea@gmail.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_074022_387955_07C6B7A6 
X-CRM114-Status: UNSURE (   8.71  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 11 Jul 2023 15:33:46 +0200 you wrote:
> Andrea Parri (2):
>   riscv,mmio: Fix readX()-to-delay() ordering
>   riscv,mmio: Use the generic implementation for the I/O accesses
> 
>  arch/riscv/include/asm/mmio.h | 72 ++++-------------------------------
>  1 file changed, 8 insertions(+), 64 deletions(-)

Here is the summary with links:
  - [1/2] riscv,mmio: Fix readX()-to-delay() ordering
    https://git.kernel.org/riscv/c/4eb2eb1b4c0e
  - [2/2] riscv,mmio: Use the generic implementation for the I/O accesses
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
