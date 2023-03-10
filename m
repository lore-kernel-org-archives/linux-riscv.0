Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD94C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzPC+d8Usl4zNheavj2idgp4Q1u9+eAuCpU8ARjMnzw=; b=NFJYOjHVtWDuDQ
	WZVrcTkiqUgZjCYEYhNZ+vf3JVTYmR80UI8LTAPZa3SpBKYE4Pox7X6eTfPOUTUxPhdi+gdDz4tLv
	O6pnUhWLrrJBH51hKelnrQfFpf1HJja9H4UFOx1oa0g3U8j1JHTyJGSW9YMrkjb37XTlIFUih1s4j
	WJjcEKO29rDEaTX+oJinfKc97NIjWKeSPFeVVk10AxDEo1mZfCb/YxdZ7CLsmZJCE9mUZMPGzyxSt
	vHKumPoXvJHJdUdSOaakE9atIVMSNrEIClMFL7EsF/CSLap7YimvWPeoAENAnlD3Pt+aRv1EPCMtL
	toJ73UdenzWRwocFb5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSWW-00CiJX-6G; Fri, 10 Mar 2023 02:30:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSWT-00CiHz-8z
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 02:30:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E81E8601D2;
	Fri, 10 Mar 2023 02:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53A67C433D2;
	Fri, 10 Mar 2023 02:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678415419;
	bh=JYEuGJPerZQWE9jyV7v7rPtX36PNN8q4mLcKxb71tB0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dNY8jnhOLlagupmBxFgkXocycsKHDqrC4qh1r50yZrCL+KvildJza32he0GZ/w6FW
	 BFDJ6ucDYWEvMyKdndtdQntyYYaxbISJM4X151Zr/LYusRzfbou8I7cOmuvj8OPqhZ
	 1D51l+8euZr/A+6b8o/lARa4aMbWfqbiDAL3ZzMN7IsXr6zlqUlIrukVeAGG+VYZl4
	 ADH+8G94RAO6sJQC617OoRw4fpMVO3rdJWYK8tIproTVLVXXU8EehFtIlUiiP0NPnb
	 cbKsQcPBe2T5ogOseCwPSxOjt7k4OXnkbwUl/uqAWT0NHbOEZkPFer9QJ7bma6APcL
	 ExPUYtROpt/Og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26EC9E21EEB;
	Fri, 10 Mar 2023 02:30:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] RISC-V: Don't check text_mutex during stop_machine
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167841541915.17842.2873145112302800461.git-patchwork-notify@kernel.org>
Date: Fri, 10 Mar 2023 02:30:19 +0000
References: <20230303143754.4005217-1-conor.dooley@microchip.com>
In-Reply-To: <20230303143754.4005217-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 palmerdabbelt@google.com, changbin.du@huawei.com, rostedt@goodmis.org,
 changbin.du@gmail.com, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_183021_397954_B70DE76D 
X-CRM114-Status: GOOD (  12.26  )
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

On Fri, 3 Mar 2023 14:37:55 +0000 you wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> We're currently using stop_machine() to update ftrace & kprobes, which
> means that the thread that takes text_mutex during may not be the same
> as the thread that eventually patches the code.  This isn't actually a
> race because the lock is still held (preventing any other concurrent
> accesses) and there is only one thread running during stop_machine(),
> but it does trigger a lockdep failure.
> 
> [...]

Here is the summary with links:
  - [v5] RISC-V: Don't check text_mutex during stop_machine
    https://git.kernel.org/riscv/c/2a8db5ec4a28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
