Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7358AC47DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yf2kF9ZKxQcPi45ma313vDmIV1Zy3PFxBzmjYMizK/I=; b=CuFAmJsrf8avxE
	9GvQOBeEryRnGrASi87ZugxrZ3bxLfmfifbLDCLLPAJXUr8vnVvZP+e16IXW7bn5PqYlHcysHZX99
	PDhqnJ9Fsf99/qGDx7pwL3VRjJfqRv6Iar8pDsSg+GGI5HHOS0qvdz3b1QDcecmnWEOPJKm1Bv6oh
	D4jbf/Ph1WCOGkFTBZ+S/xPrylHAJYKIAY8vUCGyLp1Sn/KwJXn1Fn4GY6vYTkwGSiQAOKEY0r1+K
	tYjidBcYgPw3XMn3i32wr4NchPS0Xxh2YLcJ/hrbq60J+5BzzVvffweVRUaSvG0STPdbyjxZlHlNL
	TVmXlzDpAHEoVB6vAaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOS-000KP2-2f;
	Thu, 11 Jan 2024 14:50:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOG-000KGv-1g
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2D605B82061;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEFDCC43330;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=9FCkSsWMxgSl2xN45f2zMDQn+WFyj8ygw9+oME9RILw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kDDG1Idg184euvVFC9dvpy+WY3Dbc5IuDz1ZOQAtAh7ZQo+fCVzD69aJEOXx4Kma/
	 TXOoG+hLZVttYmgEWGPbG6IZG2t2Ox6NroG9sT5ccnIdMCs5JJW5IsevZE5oS/3qko
	 1IRyAGcL2un6j0C4GYzbQzJ/3DYk+aRhYOX/z8ayXTyQhjh7UXHgZrvsD3lpDjS3a4
	 SKkxtURMJBNVu+1NCb/G0fmxpSfJ3jplaSq0iOkSewlI8wkUUTsvQAWh4dOC2czXWj
	 N8byp1bKmhW2OtAvovnOIPkjBxUBgX6pwfuJD2LpWvJzbWbV52qoruXPX9y5DwDcgj
	 J9zSBwq0yZtMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BAE18D8C976;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] riscv: enable EFFICIENT_UNALIGNED_ACCESS and
 DCACHE_WORD_ACCESS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463776.20080.6132478533788411387.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231225044207.3821-1-jszhang@kernel.org>
In-Reply-To: <20231225044207.3821-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org, conor.dooley@microchip.com, dqfext@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065040_694300_04794A5C 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, 25 Dec 2023 12:42:05 +0800 you wrote:
> Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
> support efficient unaligned access, for performance reason we want
> to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
> avoid performance regressions on non efficient unaligned access
> platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globally selected.
> 
> To solve this problem, runtime code patching based on the detected
> speed is a good solution. But that's not easy, it involves lots of
> work to modify vairous subsystems such as net, mm, lib and so on.
> This can be done step by step.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
    https://git.kernel.org/riscv/c/b6da6cbe13eb
  - [v4,2/2] riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
    https://git.kernel.org/riscv/c/d0fdc20b0429

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
