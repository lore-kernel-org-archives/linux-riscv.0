Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83176CD129C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgL64m3p6R8C6SLGiaeMJdjSiFHS734QZFqpnzcuX0k=; b=Bosyc/ovi9ZgUg
	MT1wwc6dbnzFgb/EXpztrkFXu1Vjw4PVKb8Njq3dPnrybXfRRCsjsisH4Jx03DY7exL0LZ+6yv8X8
	nUwTRN+TFm9NAzWDjGkVFPoIUr04LPJQrKfbirq6DpocpTDXTbOpR5Pop3FpgWjAueIbWr1Ny3+fw
	/nlbZEI2EtGUv9Aw+a3sC8CAcyK0b12xqZSiIpCsVbFG0KwranGZh5H2X5lM4yPVb9+BhXZezOCc8
	xvbdnGzHl73WxxQtlDpVdFFNULC4cuX1qidKFW/8Q+oaJFH5M6yQakFp00go3XTAS8azI7cgzzeL8
	vZ4Sq8vdG5LhMkDGupZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYeq-00000007OS2-0not;
	Wed, 10 Apr 2024 14:10:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYek-00000007OPC-2pOd
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22E1061DA2;
	Wed, 10 Apr 2024 14:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 733B9C43399;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758229;
	bh=hfbU9Wccw2aZ8tuskEDPQxJylxwyJQeYp2Cl+ti/nWk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gm2J74AaF+CIR8WZ6vyVWplRPpxFKH0WdmI71eS6HFXnp6A3NJVF+bqqTkEA/lOpo
	 HxTXzpSO/Pie183DJDp6OVDItulmV1dKXenE5fHy+10NoXicwbix7c4pYDVGKHICSm
	 27cOrx18fePsFkjk9SkPB+xlgiY6F/4nj6YdUVjoTm429lvZieR6Y0IJTUOeP0a+hl
	 tq7mabwovyKQXlYX8lkqa4TfLGGM3SJ28Jlq2kfRarq+rQ1pvE5lmLdVBWWhAEkAsl
	 FtGh+ltdgfTveHmxaPtTJSdSA+u8QhAjAEmki0zY9eqEjMawY14jpkq0i84X+2VIm/
	 9xO8TDYDjiIgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5EAE4CF21C4;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: remove unused header
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275822938.12683.4481489069563984558.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:10:29 +0000
References: <20231212-removeasmgeneric-v2-1-a0e6d7df34a7@google.com>
In-Reply-To: <20231212-removeasmgeneric-v2-1-a0e6d7df34a7@google.com>
To: Tanzir Hasan <tanzirh@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 nnn@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_071030_802632_27F88CF0 
X-CRM114-Status: UNSURE (   6.59  )
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

On Tue, 12 Dec 2023 00:20:14 +0000 you wrote:
> arch/riscv/kernel/sys_riscv.c builds without using anything
> from asm-generic/mman-common.h. There seems to be no reason
> to include this file.
> 
> Signed-off-by: Tanzir Hasan <tanzirh@google.com>
> ---
> 
> [...]

Here is the summary with links:
  - [v2] riscv: remove unused header
    https://git.kernel.org/riscv/c/84c3a079ab98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
