Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EDCEB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIhBGFau9uDLu5PsKXXCtMjeoYm9QYkKXgKWnkf2hGs=; b=UiGyMHHuH7P0o2
	OBhkOCN+neUgRpE0Bj2oM0xIyO/DaDda1iXD9+3Mi0X9J864D1BTIAa7i9kfIJvQ0+IXYu9ZSMjpE
	fPB3PxSYOWDrYezojhjg9cCwHBM0kRndD0fcVwsf7qPkRvg/c14gngg9A0f6ICBV35zIMqe4lL/Ms
	f5D/TOtfWIePAZAVHBV7rzhPlKsuj7jRvgRtLP2HE92LksnroZ+9ub3c683GkU1blZ5KUiI8BS853
	rhre9MJd10+kXz1zk82lPYJiUQ2hiDr3njRwDpgi1Xq1eR4df1OeR0RWNTg7jpVW5+MIvrL5pD7jJ
	CWwbLCqonjAUX8+euPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhDH-00CCOQ-1r;
	Tue, 20 Jun 2023 19:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhDE-00CCNL-1q
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:40:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15E6961195;
	Tue, 20 Jun 2023 19:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C8B0C433CA;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687290023;
	bh=NMfOxx6q+hxrTh7EK1c+LpZj/IcR3oyMUkdkNjdu1QY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ScMlDdRKJITYQwHZ5thwj3BRhtBNXKiebqKZKjd47Uov7xTtdrWYyEHVlCUwveOBA
	 DmkZSpIsidKffAtrCMj8s705uiWbUlD6x/g5QvpVMqQCpEl0VECCqyLPHgPSj8WEqC
	 Nt9f3QHqOe80kAxH62CBfbpYGVdz66bXpkukX3VRd6aejt5UHvI7F6lZnDXLVadhVE
	 IyGtW/j5KdnxArst2iUZ4FGGVWep+nZugoK2IZlypfA1DSnZ2culXqt9LZb7TtxME9
	 evE6jR/7w+kTQriogJuMBluOLTw0Ev7skL+x4FvVpTKNdoPfXFwqjNm2q1mvIcLGYF
	 yhFWA4jVVg1sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5089FE2A035;
	Tue, 20 Jun 2023 19:40:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: uprobes: Restore thread.bad_cause
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168729002332.20607.6961437038563461199.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 19:40:23 +0000
References: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_124024_679165_05FF9170 
X-CRM114-Status: UNSURE (   9.52  )
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

On Sun, 23 Apr 2023 09:42:26 +0800 you wrote:
> thread.bad_cause is saved in arch_uprobe_pre_xol(), it should be restored
> in arch_uprobe_{post,abort}_xol() accordingly, otherwise the save operation
> is meaningless, this change is similar with x86 and powerpc.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/riscv/kernel/probes/uprobes.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - riscv: uprobes: Restore thread.bad_cause
    https://git.kernel.org/riscv/c/58b1294dd1d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
