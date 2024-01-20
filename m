Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06C3C47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5kDBxVFaM05CZoKynDN+qzVIT66T461zcjgaZLSLyY=; b=KhapNIH7HlwE4n
	rEb45TLLcHxyo21wtqwSeA1cIcczEHggc+xJN9VdfDeuJqA46zYBY3l9G6JvgP5PZxD+9uwcVvhPt
	gtdVFz1vpJFmGzrPbceWr83GIOznmFmtx6Bggwwprr7vEp7FT82u0exOCPnj7Xg16IujxpU0BKDtK
	UUl4Y+myl82BD8KDUsfqux4vyu77BqlCOAkLgAVO/pqAXXZtVKOOjntWpsFAXaKE+qvx44Go+ucEe
	qEWCvdfZJ9OUbDJPMsNT3C5ldCIqfpHpG4rBE4IxCipGllcgqIFKcy+iHHskyCGTk83cwS/Ibwm/w
	CHGjaI9+lLefxgbCOsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbL-008OKf-2I;
	Sat, 20 Jan 2024 21:10:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbH-008OEv-2f
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5780360B34;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 264E9C43394;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=7lzodkQb8V/3EVEvAvA4s28Kz+AbZj+UdtAJn77t/Vg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nZrt/GFWs3IMUIg3JBeJKGApAgDTlt+hiUwtQRLs9+pGxoO6AMWtoBgmNsEkh2gMj
	 1FRkkhROw8yblMXe2afOfh3qgFfVirAy92IPiRHfj5FbRUaKt+fGRQfwJOdeIb0FXm
	 lzZXmGqYluHp0RCxJ1fiywjPX5lNtGDQY0oUeyZBf7FpSloPwQbtol4HmzHMMqi/B2
	 nnfxdwM0oahirxSJxVOpDcCYXW7ZqU1tQPxTj2Yur4kVIeE72QV9yLCjsPhbjzxjcN
	 tYljKDRMKUC3FmQIknC+cT2nmDC/GXOClqc1t99PAWfdDqdSo7x17A1ALbn8TL73KK
	 1Xl9a6x7VkaqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 130CED8C978;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499907.24348.2424712213063362005.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <mhng-878cc879-7aa0-473f-91e4-8288072cdd4e@palmer-ri-x1c9>
In-Reply-To: <mhng-878cc879-7aa0-473f-91e4-8288072cdd4e@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130959_910619_C2A26526 
X-CRM114-Status: UNSURE (   7.12  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 20 Jan 2024 10:17:18 -0800 (PST) you wrote:
> The following changes since commit cb51bfee7f62a8e26b694f9d84c0041b3e3ccc71:
> 
>   Merge patch series "riscv: hwprobe: add Zicond, Zacas and Ztso support" (2024-01-09 20:14:51 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.8 Merge Window, Part 4
    https://git.kernel.org/riscv/c/e5075d8ec564

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
