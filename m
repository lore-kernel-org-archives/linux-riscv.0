Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57BBC3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzYYml0BOCeoXxtBFBfigaODBys7x3RNgNHvPVyT0j8=; b=yYX/S2Od7P3HTv
	WhEBvfvJam4ZgKAav5A08rPXviDAa/+Ej7f0dBl8On6uM3UnQIChHpGY4kUBnQirqqA4umNxWzVhW
	+HRKB0aQFTwmhZnSeVS+V4A+ptYJfxwgERapaYmae6jy477k7/Ru6MBhOcXkh7Jj41XqejKuII6yh
	xIqRzDOR1Jlob3IoBCqnY3VYTj3S1n1/h/CVj08BgPPiJZCwNaAb1XtZ4Eb+uIqTM8W++yk6v+fim
	rqIc8WQJrLTIgzD+zr0fAsi3Z8Mq97hkfj3CKv1wNxq93WqzVMXnBE6xqgmz7RaIeSqvFYvFBMuph
	OMR0NyLa7vx9/aQayThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp4-00000006Aww-1ccm;
	Tue, 17 Sep 2024 13:00:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp0-00000006AuA-0PIL
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB92C5C1FDF;
	Tue, 17 Sep 2024 13:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470EFC4CECD;
	Tue, 17 Sep 2024 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578045;
	bh=n8Buve7v1KrmZohbeNemU9LWq7WmgDsBpw1Q2CjmTxw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=edSpS4QJohj07aHxjoSzDggdPKjWjAkU9VnAuFujcrXntQkIVw8rJVGHGOyez3U7T
	 cnmmzB4KTwAUBOdUxNbcDcmlXQSjdFZz+cneoGYWBc93Ym1TdCqEQzWCFIhwTkk08E
	 JuBtMLnQLvrfeYUemoF1B80F9VXEIQ8ZJJJMHyITAEgxbL9n9N9N6jHGMiJHWRlLnU
	 TEF5dTLI8qwzg6g4PeNwa1fA0FqjPLgS+lWjX31p9sBDpUFZomwtgHmIVtKMgb4+Rk
	 jyuXM49n8Q9l+uDcHmmoAkqD4G+wFVULbRh4caj9yzvVBKRBKGxIFv+wX8HnQ2461F
	 pvWoJrXWi7M/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B563809A80;
	Tue, 17 Sep 2024 13:00:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vdso: do not strip debugging info for vdso.so.dbg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804700.126252.3532222769922306946.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:47 +0000
References: <20240611040947.3024710-1-changbin.du@huawei.com>
In-Reply-To: <20240611040947.3024710-1-changbin.du@huawei.com>
To: Changbin Du <changbin.du@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060046_199766_8206C359 
X-CRM114-Status: GOOD (  10.43  )
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

On Tue, 11 Jun 2024 12:09:47 +0800 you wrote:
> The vdso.so.dbg is a debug version of vdso and could be used for debugging
> purpose. For example, perf-annotate requires debugging info to show source
> lines. So let's keep its debugging info.
> 
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: vdso: do not strip debugging info for vdso.so.dbg
    https://git.kernel.org/riscv/c/7587a3602bf2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
