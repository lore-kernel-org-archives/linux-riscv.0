Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91012CAC593
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76HmY5h+z3YgI6stxAOYj5bRTjQ0/7qFlqZfQWMg1vg=; b=Zp8rmCdNwa6/IG
	x2Je5gFG5/mA6UlutCPh7VC+yf6iBF+8yA1XF/a51Bvm0QN0MZxl6LqWvL2/F1EzTXRMqy6xdEYbu
	pBMndeAlET1dpRvHsv6ghh7UDEf/uuP0fFTH3Nq6hp8JUqcycSYvN0EBuKMH6n1+sFNrNEQXYnKPE
	2s+JXNpvSDH+NYm4x9RZjD3zyJE34OuBNES2qpiOMy3bx2NT4sPXZDl8oUWRDZZGN8rrrkYgWTdW9
	h96mzQ5CZ3NFu4I64J9mklyqFFgTAFnGRCTFrp8+esopBiau53k0NprCZxoEC3QZRCtUn89o1Hj0+
	3V6kE0vRYYp5A2xlV2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcGZ-00000006dkm-0oJt;
	Tue, 17 Sep 2024 17:45:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb62-00000006VWJ-34nq
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 16:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E39EC5C5C7D;
	Tue, 17 Sep 2024 16:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C094EC4CED0;
	Tue, 17 Sep 2024 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726590632;
	bh=dVn6toOWUMndWz0phAgZEkT51ag34FEvN23AY+GMlWE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ys91hG9uFq6OA7NKIX7tE56ex7D90o+edlc2ucpaf6EXRhiF1hvn0gcsTSAYiHQh+
	 YrzKVvF2YGWBZoxGrgH7pUp4NzirWH05v7uZkCtWjTUU3iwempLKa/qPlGx3ud0maN
	 ZHn5rwGkkvPALfYdRVeJa+Yk/kyvI7fcw+WIlZmv6anN+xIlZw5MNrJUm+GbDcymO/
	 qKGq3tMPiXml1d0japm9CWsIa+xBgXsfkGtcqcLknOcpzgUH2cs1f4Am2Xsby1J/xX
	 ZcE8oKD30QPTKsCsng8qPI4H5oRdwhm/BCn8kkRluVHRJUqr0/9+1bYqrabWv2dVKG
	 OYbbJQUhjM96g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE31B3809A80;
	Tue, 17 Sep 2024 16:30:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] riscv: Use LIST_HEAD() to simplify code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172659063451.214459.17274423748599144826.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 16:30:34 +0000
References: <20240904013344.2026738-1-ruanjinjie@huawei.com>
In-Reply-To: <20240904013344.2026738-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 mcgrof@kernel.org, dan.carpenter@linaro.org, rppt@kernel.org,
 alexghiti@rivosinc.com, kernel@esmil.dk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_093034_859918_F33B645B 
X-CRM114-Status: UNSURE (   8.94  )
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

On Wed, 4 Sep 2024 09:33:44 +0800 you wrote:
> list_head can be initialized automatically with LIST_HEAD()
> instead of calling INIT_LIST_HEAD().
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/module.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Here is the summary with links:
  - [-next] riscv: Use LIST_HEAD() to simplify code
    https://git.kernel.org/riscv/c/3cc754c237e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
