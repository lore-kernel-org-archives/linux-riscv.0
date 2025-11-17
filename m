Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC85CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BSkyPZbfuM/rQn9bC7AsfhUc4CBacM9UHvlBR45U8s=; b=dtjeqs3kfkoTCy
	YIYcnanXzIKMTOrm915mTvAwLjPAtoRCnL4yxVne5koiYwA9/LIxvVMgxio9hcfC+RKTJT2leRFHd
	TgO7C1oAOskL6W6KudbxfXoasI4+vLB0y3b2+jUHN7lJNO2iuVZLYckpOMbJvo5S3oJm0I5r9wZ3b
	eTpVcSsm3KZTMik0QGOZHztBLzR+LTjPIptRC5BEHUtOqujYq+qqWLn2tfoTFNkyJnxN0lDolh0wM
	Inr6YgQHjlj5hX2GbCvvJYMsK4RF9cTmwZE8CoS/jLy5XswGiQXHADi8Iv1EHCXWXY39FgZSa0nK6
	Pemo5+CQGE3A9kec6O0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKH-0000000FfIH-1whb;
	Mon, 17 Nov 2025 08:11:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKG-0000000FfHz-1Isx
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 08:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 678BD601AD;
	Mon, 17 Nov 2025 08:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D396C116B1;
	Mon, 17 Nov 2025 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763367063;
	bh=vbUccxMenlFoZC2XraZMyQ965D0BsrX06UGVWNJuRQw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uLghrQkZjCrWvLUlFDthoUGIfTmbtNi+2tQ1Ng19rOyu8Df9bM/VTiAxnoMEZs88g
	 WfZwQhMba9cQy/JhD5qjIqf7hVZ+bk2hXKJpyCaBTyzY+JPQCvJA1xr0i9Z3b3VJRl
	 CXv1qk90WWTjqivGG3nCBb8BdZ5DOytsh8zjCs1MXaR1OudOmuaTnXElMuFo/i0MA3
	 4+KkPp8S+Wr9VakxEGhG2nGzVh9tCENhLmPngmCCOR2R2Mf88h/B4v9yHJx/1pppxv
	 Xvw2Ex4YaH4GW5yH9T8tSQ5K/LhGk5xx9FoZyBGK9UBiIsRZmkKXk65xyCgOgFEOAy
	 EGuTsmH8h22CQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CC23A82557;
	Mon, 17 Nov 2025 08:10:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Update MIPS vendor id to 0x127.
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176336703025.2854411.5259093565399811125.git-patchwork-notify@kernel.org>
Date: Mon, 17 Nov 2025 08:10:30 +0000
References: <20251113-mips-vendorid-v2-1-3279489b7f84@htecgroup.com>
In-Reply-To: <20251113-mips-vendorid-v2-1-3279489b7f84@htecgroup.com>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, conor.dooley@microchip.com,
 djordje.todorovic@htecgroup.com, linux-kernel@vger.kernel.org,
 cfu@wavecomp.com
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
by Paul Walmsley <pjw@kernel.org>:

On Thu, 13 Nov 2025 17:10:32 +0100 you wrote:
> From: Chao-ying Fu <cfu@wavecomp.com>
> 
> [1] defines MIPS vendor id as 0x127. All previous MIPS RISC-V patches
> were tested on QEMU, also modified to use 0x722 as MIPS_VENDOR_ID. This
> new value should reflect real hardware.
> 
> [1] https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Reference_Manual_Rev1.84_5-31-2025.pdf
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Update MIPS vendor id to 0x127.
    https://git.kernel.org/riscv/c/91f815b7073d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
