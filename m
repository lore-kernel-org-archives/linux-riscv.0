Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F848C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 04:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDEDyc0eRDxYCW7888T5rWUyhYRvQ6iHPFAtwUrToro=; b=BTnoOnMCTX/yb+
	4T9yIbtvrrQG7CbmMq9EnHe3YosEKP5iWCl9+yOoy5MzyEZSrC7n9wHc9WJ2G1+FZVb+vVT5k0p8c
	SgKNjo7IZpbjBMghcvxEM0vcXspPedm5FNTpJtRjqlU/WlyGuPXw8KLFHr3vG9j8NfyDKlq9tHaxV
	kAfZuUzYWdXeU4Mty1S2opGblKFP+bOwnxCCLw/gP3PZ5ji4e6Al+R74pLG2CVt0MsDtCFg+By2Lm
	RoJdz5XKGEsA7CwhYGHtr2O99eRn9nGrMCIgyIEZkDGWopZ8UTvxJSJm/IjhsuBXmRiK6A/fst7px
	4F70pYRQsI96Cg+TOdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNDd-00000007r6W-404s;
	Fri, 23 Feb 2024 04:31:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNCm-00000007qvK-2YW5
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 04:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E43DCCE2AAF;
	Fri, 23 Feb 2024 04:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41C37C43394;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708662630;
	bh=KV/zJRKEvFeJWMlyATAkxWnGr6jaudLaHsE043jXY3Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oscyNRQu/geoGXX330qXkgOb3RquaHfcmfswu2flZ8ZEv2ZqoqnIImArljdFVdMM/
	 EmCsl1op258k4m0+rFdDYgQFuH9z3KKtSujc+xCWaY+QgL93dWQexkNVz2BC91B/jq
	 L3H6l0y0c9gV7puSKsOzDdtOdlOwtjegsxECcZkWN6b/5n0pyRSd1eiy9UttUDnSRj
	 n+Y+3cCiuwGAzHABI+ss2okBbUvTXNo3/t7Gm69ZSgRUha9uG7rZUNLFTDZ56CwHp4
	 zn7sPnj84pDhMKxbZlD9TLZmNa+eNA8JH2jMtEusiPfCPvqzeYE6PpfMI12Gi4Srd6
	 B2SqoqmUmG5DQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24C5DD84BC0;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: fix NOCACHE_THEAD does not set bit[61]
 correctly
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170866263014.22939.14636378102523037182.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 04:30:30 +0000
References: <tencent_E19FA1A095768063102E654C6FC858A32F06@qq.com>
In-Reply-To: <tencent_E19FA1A095768063102E654C6FC858A32F06@qq.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, jszhang@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org,
 alexghiti@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_203036_964912_14F9FF5F 
X-CRM114-Status: UNSURE (   7.95  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 21 Feb 2024 11:02:31 +0800 you wrote:
> Previous commit dbfbda3bd6bf ("riscv: mm: update T-Head memory type
> definitions") from patch [1] missed a `<` for bit shifting, result in
> bit(61) does not set in _PAGE_NOCACHE_THEAD and leaves bit(0) set instead.
> This patch get this fixed.
> 
> Changes since v1:
> * reword commit message and add reviewed-by
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly
    https://git.kernel.org/riscv/c/c21f01481860

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
