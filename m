Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7C5C4708E
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4wAq6kVQ28TXdySZTAf2ivyxi5E4JeFiKvZccSnIo0=; b=JXuA9hh+Py53RY
	2H/ws99fzgRHxXFAhqDuQcvODUA+MJ5h0f6onshgkf8PU4f6GOeP0nbGDQ/Jd8vDbmZ/KXVH/ZnZI
	Xbh8FONKgI4adQA+niT6CZGgS/HQ05pabINohN0exxUbjKDu6wYJoTn4RIGK57lIFls+B7vwGMf+Z
	6S2++cA2dzjSby2jHCDCqwir0Iwa/z0aPwBvxgpsP8B9NN50IZ118w6Se2OC3EumOV3SPbyH6JLN2
	08trjXU1Y+RJX7XtTZX0FzTIK1sGhayR/zdLrIBSEwiYYJXAiHlnXcmmrY2eZKEVI35Gw38cQotux
	LQHRdIiWacFNleOfkb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015g-00Gvf5-2s;
	Mon, 06 Nov 2023 15:00:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015a-00Gvam-2m
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB13460DCA;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 392EBC433C8;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=xSG+Ja17EDqBU85fr8ps1SzNAsdaKw9WxD9i/lfipeY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QZibdXyCXVmwOX87BsRnnWf+9oboGZDdYb1eYiLcbAS+mzutFZcCoZFL9EgNIIguA
	 bzoQhBm+owb5t6LSQHtKqxmk8FOB/koKQ1sCXfyZfJAL4vPgGfwnjzBw0IkVbHoOa/
	 dn/KwjzGR9aT1kg3/rahaIL4LiXEVCz0u/rCjAahBSwlyz/dIxLDWPLkukt2Fi2sCO
	 QfT7x/v21dw2tzq3EXCe9mchLdAQCj6ZOogJmkXKwdASYelC/S/vkFau7hBuXnwRKk
	 /EdSRhCbzEYnt5cmnMaYTdSKQ6VD0RJHpDjJAKqfMqeps6/GogxmpUme7WW64u9p2e
	 AwIzOF5/jQFrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B0E6E0009A;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: don't probe unaligned access speed if already done
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282910.16503.15372785968223640890.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230912154040.3306-1-jszhang@kernel.org>
In-Reply-To: <20230912154040.3306-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070030_989202_0BDF5B48 
X-CRM114-Status: UNSURE (   8.83  )
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

On Tue, 12 Sep 2023 23:40:40 +0800 you wrote:
> If misaligned_access_speed percpu var isn't so called "HWPROBE
> MISALIGNED UNKNOWN", it means the probe has happened(this is possible
> for example, hotplug off then hotplug on one cpu), and the percpu var
> has been set, don't probe again in this case.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - riscv: don't probe unaligned access speed if already done
    https://git.kernel.org/riscv/c/c20d36cc2a20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
