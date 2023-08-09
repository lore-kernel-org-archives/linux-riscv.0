Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22077C0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72MNsUVsLMOMeV4lHi/Z55wOY9u8bhDxWRTgeVgkZTU=; b=Zifu5mdV6G0q7S
	RI2EsdEFB2mXHLMda05cut4QWub5UTUxJzvkLZDXSGVoRbzm8VF29HOBUoy1BBuaFyIOU19CEnYXu
	XZRsqLe0kK9U2Mz4xUJ5Qd1uhTq2HI2e1X/Xp7CCVIoXi9tY8hFZsf+XCcKZhlR6FcOTcvfGOU+Qx
	ZWM7XisbnDhOkpYdzZ2har2EZ7n14PEs1FBSPAgl1bn5CyCy+m209vS60iKUMk+RbnOTvUHih/OqP
	JraTggpGH+Qy5m4PzcdhsmJmBFtUfFJqNnvPkdBSamme2rg8W3z9SCtmoe+gi2x5wzQLPhm6kEKza
	P/fYxboA4LBfU+SquLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk32-0058fg-0g;
	Wed, 09 Aug 2023 14:20:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTk2z-0058eU-12
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 11E4C62C78;
	Wed,  9 Aug 2023 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D23C433CA;
	Wed,  9 Aug 2023 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691590823;
	bh=O0rRZ32GVcSKvRM2KTgzM/YYRtGsLSzWH9sdjJfz7XI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EJih7LO5UhZngP0/E5robKbVAdMZ+Z9rzYQi0A9zJ8a5Qqo7K/q0eZXzIAmgRFh0x
	 03Ryk0IGcVqaUToe2rZ9pHkICg5hdPp1OGFhnd0QhKNsCgoZg8Gj++TALiG/4dTBMF
	 ufJj5HQaLLs+2y8QwVPSarXVXdZkZxRbh84qjS66yfrgAlU/btnpqKUgdX507ShloV
	 aIZ625vjAQuImR2p5Ecw1LU7MID47gLczFfnIJf+/LYoPQpyArbXT54F/rrXwbiXou
	 acQuz2jgdWzSwrXw3Qsn43qYSe0/pvDImeaLlsWNny1MMKdI1oZcX/xqXW3SGmycLD
	 KeaaBe//N776A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61CECE505D5;
	Wed,  9 Aug 2023 14:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: alternatives: fix a typo in comment
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159082339.5601.10657957305641502200.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:20:23 +0000
References: <20230723165155.4896-1-tanyuan@tinylab.org>
In-Reply-To: <20230723165155.4896-1-tanyuan@tinylab.org>
To: Yuan Tan <tanyuan@tinylab.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 vincent.chen@sifive.com, linux-kernel@vger.kernel.org, falcon@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_072025_429579_D771D2CB 
X-CRM114-Status: UNSURE (   9.95  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 24 Jul 2023 00:51:55 +0800 you wrote:
> In the usage of ALTERNATIVE, "always" is misspelled as "alwyas".
> 
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: alternatives: fix a typo in comment
    https://git.kernel.org/riscv/c/174e8ac0272d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
