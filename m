Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B35C83F19
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyh9bJk2NwOYR6QeQtaycSAbx8R4KmMBE1wVY/Niq74=; b=4oTAGiuvDmfD6Z
	iIL02se9P3Y8sXwMcnqONxP6frvcHZr1b8s9zqDmJxx7Tqye+o4Zj3ZmUmseBIUIQGWhIJqvB6DTy
	JjTMTdc7rSe5KCHCfLabQ1T+27Q6BU0Ow7jiM6OFgF+AI/ERfRnbA2exJj4LNZ7DtUqjQ1BEvKU9z
	oC8tQSTuZqKhgx9u2XIpFHEErq+ebicDOyHJsjC5I9SBTrIHOdEQxsGtm+yBmDIY3Wr3YEeQIHK6H
	z0Q+dFmfxDERMtmB2D914uNGtIXLpZn5kXoJneo0LiQFtWzzpgnpeTQJ6vHO/dX+lrYxIVcwkJRh3
	7zmIUR/uCqv4S2sEn/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7t-00DXgi-0O;
	Wed, 30 Aug 2023 13:20:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7f-00DXXV-1u
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C28262090;
	Wed, 30 Aug 2023 13:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0191DC43142;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401635;
	bh=KzwJRFCBiaAVTS0ZoB4zQT8L/wyozk8i7uO2fyuq0gc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sLYgIWC03UyP+2MVxVmpI51YEVIhuWcMENrYJjYx523pfTx/AXlQmbOaYPeNkYYiw
	 U/1gCBRvdDdqF9hWU/oI72hmkTdORtk1rLC235U4Enw7h3kb0CbMBthE/oXJ5YP8Lc
	 YEpPyfN69zAZuGnGMGzdSpeu8Kn1weeWxUOAsABQxhHDi+w/wxL5+ucklGjQnWNvA5
	 m8VDdzLAgoryT4fyZUllUB7drwD/btzX2A59iOWCe8UEFQXnMxvw2uYMiR4qdCxtVU
	 6LiQKU3T6NT+CscAHOn65TiTZk7WisBvSTbVe+Wu57/BnqYWOc8Wo0XyIF83S7NEFC
	 s+5CDZENrInbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3363E4509F;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163492.19859.13643349679698398127.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
In-Reply-To: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 conor@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 llvm@lists.linux.dev, patches@lists.linux.dev, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062039_723994_0E7E0F0E 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, 16 Aug 2023 10:35:43 -0700 you wrote:
> When building for ARCH=riscv using LLVM < 14, there is an error with
> CONFIG_DEBUG_INFO_SPLIT=y:
> 
>   error: A dwo section may not contain relocations
> 
> This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
> '-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
> with newer versions of LLVM:
> 
> [...]

Here is the summary with links:
  - lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
    https://git.kernel.org/riscv/c/9fa9a5f2714d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
