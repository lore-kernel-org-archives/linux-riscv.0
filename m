Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4195C3DA49
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQKdktx2qcB1jIRyoznsZj6873095Ms8GtRwg4B0O4I=; b=kdIt6gUL3vD6S5
	frOgW9LxJSk89OXoHiK1/92JK7gWgXfVw9CXL9w/mN/QZ4mS0vNvyzkUSYuX+9qBh9q73fIy8+mV/
	vQ94PvNi4V5VILgssGuxrkEivSgqHLUHOGR0F8eNwFDsL/B9UTyH1rt9Zqk4u6ww35aGuAr4pvgV2
	CwCfz1GE2hJ+zn3VitCUEtw+sN/6iotFrn8achR6oALChmp6PSSf2mQnedgQU1uDldWzfsfu0lLBI
	/l3NtlepKY3d9K7N7eJuB7Fn/+chq8ug+MeB785G6yWUlMxyXOYn01aePYI2apWgK/2GI5SXAx9S+
	nESGpGQvLzJTFLqpNrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT5ri-000000056eN-3mXI;
	Sun, 14 Jul 2024 20:30:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT5rf-000000056d6-1RNs
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jul 2024 20:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AA4160B5A;
	Sun, 14 Jul 2024 20:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4DFBC4AF09;
	Sun, 14 Jul 2024 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720989033;
	bh=Ce7pl2KxrRRF4NFenOes3MKbZmcZhLGXZ+zIHmI4KJ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fHRY2LK3T1u4Nn8x2OOdVAi4ogeTKqJPZvT9xOwfKpFKNdhbRsii6tFD82nEBgxdz
	 rRwV1S1eYPAQd864zFcREoSyrEiKJf80Ui0WzUTASHjJey+pnlcvKSp7B12iHX7TeW
	 amVUwlVUpKCNgYagFT5211c/QdouF0lZQCnrXuyyWROlMF7Rms4OkN7wC4izCvbeIh
	 KuiU0rU/nCag+pWOXu4+FS5rQpF5s9x9q9ja8YNe1F0YzP/Kt7m407tzmMn4HD4Ya0
	 HZUZe5KM/o+Qf4fWJSDgDOuiY5n4R9FXlB6WILm6eZWXYtMrFCv5NCMi2KmMmCnvvM
	 2ItVSvSzMA25Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A4CDADAE940;
	Sun, 14 Jul 2024 20:30:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V3] riscv: set trap vector earlier
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172098903367.7439.15717595350937923936.git-patchwork-notify@kernel.org>
Date: Sun, 14 Jul 2024 20:30:33 +0000
References: <20240508022445.6131-1-gaoshanliukou@163.com>
In-Reply-To: <20240508022445.6131-1-gaoshanliukou@163.com>
To: yang.zhang <gaoshanliukou@163.com>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, yang.zhang@hexintek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_133035_466939_F2E97556 
X-CRM114-Status: UNSURE (   8.08  )
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

On Wed,  8 May 2024 10:24:45 +0800 you wrote:
> From: "yang.zhang" <yang.zhang@hexintek.com>
> 
> The exception vector of the booting hart is not set before enabling
> the mmu and then still points to the value of the previous firmware,
> typically _start. That makes it hard to debug setup_vm() when bad
> things happen. So fix that by setting the exception vector earlier.
> 
> [...]

Here is the summary with links:
  - [V3] riscv: set trap vector earlier
    https://git.kernel.org/riscv/c/6ad8735994b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
