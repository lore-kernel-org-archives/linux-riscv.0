Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A844C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDcXOcDWpRdqNJq6dnA/H/u/S0jj4K8qusfaPBYQR70=; b=zqHHcL+eNqT01b
	CZ4W0CK91IhQ0B9FP4DnnFqKs6Mi+iFiqoiJQ4q8OnUZeocUhSIxoRErtWRsc6E9uJcfmiYqjA3v+
	UfMQIgPIITZVi3hA2wk6ImUskpARDJXeGex0yIAhhvEdwBtkGyTPZeA6FYQo10ODHqjDM+kx45X3i
	JEf+/eynWFvFWzzdCbGw/NJueTN80jCThNGv9rHKLVEmt8gwaiNxCJob8+kNCuLEwrnYUnO0Npfbd
	DLRfPR3FWAMtZtBU+K/QMxUc8RRjZ6nmz5vfKwz0s/L8KB/hAAhzO1sYOL35sl0yLGOjjqnHd8tdG
	Vg0PFjhpQOC/0Rwo6ffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJGp-006IzD-1Q; Wed, 15 Feb 2023 15:00:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJGl-006IwY-Ro
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 15:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 779A6CE25BB;
	Wed, 15 Feb 2023 15:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95104C433EF;
	Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676473220;
	bh=gAEa31AYEDjZmUvHEiW7JfL4UhgpHyb6OCumJEqk5qc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TXhyaYbcR7TMX1dgz3IBiT7xQLbEIruGiwe6KLHeq88PpMMjCr+wmjCzAfDvxxY8X
	 0JcIQ/RhbeOumVr8u1LmiuPYsIrUwHIJjOFV/F8hvvu/7sE7+7AJwFgefHDQ/b63uX
	 zgZHl3msu+StN2BiJjBvnsH0xNhfXMxhYI8tDZr33MGYqROjC1zXRLL4X1SGQhS+x3
	 AfrPt2SWtZ6fWoKfxx4+G0fyxeoqhbpbPwc/XQif0BzFafl7kbAWbDQwVoE+E3Lphw
	 PzlK5K6gj4/5b3r4CUo1our7qK7n7aqxGzJqLIXUznw1pN3I97oSWYjsx6B2mU7I3f
	 diS/2ax4BfvIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6AC20E21EC4;
	Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Fix alternatives issues on for-next
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167647322042.11521.13482164945173632656.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 15:00:20 +0000
References: <20230212021534.59121-1-samuel@sholland.org>
In-Reply-To: <20230212021534.59121-1-samuel@sholland.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-riscv@lists.infradead.org, heiko@sntech.de, jszhang@kernel.org,
 palmer@dabbelt.com, ajones@ventanamicro.com, christoph.muellner@vrull.eu,
 conor.dooley@microchip.com, guoren@kernel.org, heiko.stuebner@vrull.eu,
 nathan@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_070028_160697_62F4454B 
X-CRM114-Status: UNSURE (   9.80  )
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

On Sat, 11 Feb 2023 20:15:31 -0600 you wrote:
> Several people have reported that D1 fails to boot on linux-next.
> Patch 1 fixes a bug where early alternative patching used the wrong
> address. Patch 2 fixes a separate issue where the Zbb alternatives
> are incorrectly applied based on the 'C' extension instead of Zbb.
> 
> 
> Samuel Holland (2):
>   riscv: Fix early alternative patching
>   riscv: Fix Zbb alternative IDs
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Fix early alternative patching
    https://git.kernel.org/riscv/c/bfd6fc5d8014
  - [2/2] riscv: Fix Zbb alternative IDs
    https://git.kernel.org/riscv/c/d5a7fab7859d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
