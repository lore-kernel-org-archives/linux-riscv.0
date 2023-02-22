Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E16C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ms5O/428/0VVseodhf9RNiWtssEYy/MEPl0F6ab3qo=; b=gBofiH8589zfxO
	3vttgoCFVQIVQ8yDsEXwxeJHc92ulh4QADi9dh0nIKOVNClF0v3mBgjd7xpJOCIugnzmPs+iShJVe
	xRekx8A7GlTncPzEznlZ5nYlv/X3XOF/8QMmTLBoXYkVw1rpynH1bHRvtnWMZlTUPuL3JQXxCNv+9
	ClPEor/hHiu2Jxe2HLdo2DZpMnw74knwoeVonTFm8LABABTRhaSo2pRNzUvp2N+vvnXYcps1akWF/
	J0GOHrMBkrStvNJvK+fo7nBbzdjXmnEPUgbswm2VeAZxWafznNJ7ZZstAFVNZh3wr3Lyfm6Dot3Fi
	OM2hSEevub5HpSz0hbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqc3-00CmTN-Fb; Wed, 22 Feb 2023 15:00:55 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbk-00CmAt-EC
	for linux-riscv@bombadil.infradead.org; Wed, 22 Feb 2023 15:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DE9uPC5m0ZdG83T7bbslTSd/pqamqrcsH6cVzUZVOf4=; b=l/9VnkSrt/thnIULuX5qjJRdXM
	+wNbMrTR1wqZQFyHgxrGlLX0JR2uF6rbV51QahB2cTX5ofySYSRjyo5D1PzKuPb540zBaAfa5CT2l
	q5oSo3BaaBwOfwAVupyn81ETTER12MzwUhmqSyan7V3UNPb83jjcpKa7vaKAxHfI2uUF6DTcO7ynC
	cJ8kDHblQ/tiAJepjiPryr0jW4hzlIqNsVMHx+5qxfdKldQ/nE/GukYSfCz9Vvb264tHBVKy5/zuC
	syAby8ppkUni7zZUkUeACE07oUINpH33flGaG5yBHTtaQNv/idBX3bm1sw8iX26ffAaTbo6VTaCfu
	SXX5kJww==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUqbf-00CZvP-11
	for linux-riscv@lists.infradead.org;
	Wed, 22 Feb 2023 15:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 06C87CE1DDD;
	Wed, 22 Feb 2023 15:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D95DC433A0;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=kidVPjQlQACRlomyP0Pm8XvailuP+Xu2r0mW1ryzT4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CwXPamjQ1El4IQmZIwcpR4jnxcAcornB+yT4q+mcnOgzGK/5CpoRa3t0el7UNWoLr
	 VLVddpIpBYEKwcVwey1jxvPW9zugOsTD1i/9/xQBGrkH1pEWCtyp45Mi4yAjXKcbAb
	 g7+ZsDJ19fCWwzkKOtX0s+u13QyQg4cU0H2QyXwHvSgWEzEeXcUHd+1duYtk4bdU+E
	 Ho/3EK8xsxjH9omUD0I0yxGZ9E6jurKfrWDARthmM//jWLUJQnYIKzcaOea9X9k12c
	 gaWXNnWfQBHLM5A2vKufUZ1Er65tAxMlWiibMntJboSVOPNmKNi9P226lB0Y9vazf8
	 u/C6Fnutzw1Og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1885EC395E0;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: add a spin_shadow_stack declaration
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802209.24438.2348901330563496551.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230210185945.915806-1-conor@kernel.org>
In-Reply-To: <20230210185945.915806-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_150032_231869_2C76DF6F 
X-CRM114-Status: GOOD (  11.68  )
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

On Fri, 10 Feb 2023 18:59:45 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The patchwork automation reported a sparse complaint that
> spin_shadow_stack was not declared and should be static:
> ../arch/riscv/kernel/traps.c:335:15: warning: symbol 'spin_shadow_stack' was not declared. Should it be static?
> 
> However, this is used in entry.S and therefore shouldn't be static.
> The same applies to the shadow_stack that this pseudo spinlock is
> trying to protect, so do like its charge and add a declaration to
> thread_info.h
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: add a spin_shadow_stack declaration
    https://git.kernel.org/riscv/c/eb9be8310c58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
