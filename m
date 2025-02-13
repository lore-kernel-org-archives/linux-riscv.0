Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7C1C021A9
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWx9o1fTPDyNhm9kErKlhk6OZZCF5Vo3OtXk4cub05E=; b=IH6QQFf/l2Ei0F
	afDzubzHAkMyS8d+ON4b/bEpivsY2RkT9sxSPMdRfP9ilGOPzIsMke6mYXvojicS8t/d/sD+gG/Yo
	zxRI0E+x4/RSXz+aGRupHXMcEHlpoNoPtllulaP44An4TH6AiJmyh8wzs18e5s4wuK0i9OKcaGp7y
	T1tK/c6I1eRztUwDbk9a+pQ5wPyU3LY15uMn7Gd4WS432pf7OpElor6o8V2VDcFdqDkMMnCN/zSZJ
	Du0oJHKsPMao6DfXau6CVIWQtkN5TZwVFjGZ7n+cZyGvxxS73g3qHQ0nePKvI6aferN7FipJY39Rv
	TXFW9HciKSoaVZSyw4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezz-0000000CQBl-3Vsr;
	Thu, 13 Feb 2025 19:35:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidya-0000000CFHm-20VZ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66A405C563E;
	Thu, 13 Feb 2025 18:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFB4C4CED1;
	Thu, 13 Feb 2025 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471415;
	bh=ON39bWBP6obgADqKbPUp+DFPNKslG1W5VOxKxDu0CxQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q3Dmp82eDjCPua4n+tQAopIgyrBsAYio4ilKnXlDlYdi4+tOiajZ2JxlZMAyfReul
	 qPd8/ovRKwZFmg+oA0DJUp2DvbQX4uyW042cxkTcBfE4/EKXtdEmtxX+ekMmV4x+0v
	 pIzzjGqmQXDD3Ls/sW+lWbZX37ADrOCM3yYqGuY7YLL9fXP3D6seZR9Xy5mS6zs+7O
	 8f6Yxgu4H0UBxFpbPTRVlbgeqG0ng5aE8lSGymDJi9Uz0wqC0e5uiYF2VhlWTtAv94
	 xSX1njbd6pTuGvT9ikmw/E0HKvNA9fI1h/LgTQPuRYG+Ct0dcmDs7flbJCrHmOXPU7
	 o0G+Of6bZ9QeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FEA380CEEF;
	Thu, 13 Feb 2025 18:30:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] rseq/selftests: Fix riscv rseq_offset_deref_addv inline
 asm
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947144478.1330575.14473914966753905352.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:44 +0000
References: <20250114170721.3613280-1-shorne@gmail.com>
In-Reply-To: <20250114170721.3613280-1-shorne@gmail.com>
To: Stafford Horne <shorne@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 charlie@rivosinc.com, mathieu.desnoyers@efficios.com,
 skhan@linuxfoundation.org, peterz@infradead.org, paulmck@kernel.org,
 boqun.feng@gmail.com, shuah@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103016_581909_44CA7C6A 
X-CRM114-Status: GOOD (  10.24  )
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

On Tue, 14 Jan 2025 17:07:21 +0000 you wrote:
> When working on OpenRISC support for restartable sequences I noticed
> and fixed these two issues with the riscv support bits.
> 
>  1 The 'inc' argument to RSEQ_ASM_OP_R_DEREF_ADDV was being implicitly
>    passed to the macro.  Fix this by adding 'inc' to the list of macro
>    arguments.
>  2 The inline asm input constraints for 'inc' and 'off' use "er",  The
>    riscv gcc port does not have an "e" constraint, this looks to be
>    copied from the x86 port.  Fix this by just using an "r" constraint.
> 
> [...]

Here is the summary with links:
  - [v2] rseq/selftests: Fix riscv rseq_offset_deref_addv inline asm
    https://git.kernel.org/riscv/c/b6059e2adc1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
