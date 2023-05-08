Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA85C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Serf2UW+lEGTFRIvD5cJsbZ3H7zn85nZUqqCx3VZ+bY=; b=LKtNFD6UPzMS82
	NprcDpxzadAiDS3Kysl7IBdqC7/1N/I3hRP7+frEqDdeNkz9cyn0ROOClfE46NGxbDRDGGMkeKnVm
	NIBTeFYjH9Ga3/iv4xYy+/3euTJUfcos21AMGo6P/N6ApxZjhh5iyUbi4baplX/BQ0Mul/HebkH47
	UABdeFV67PQWT2VERhYozPDmRO2QrZz47xim9Sg+CsJP9Y3cYOdvqPT7gHtYCCrxYz6+QhKeEq5VT
	HVL1qechUZuuQXqy+5cUXWmmjUHwULkrNSqIwDShQU/vVefbsOGDrM3cvQPm4QnEwlBPZgf5ibwW8
	u1F8H3n88J321f7l8v2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23x-000mZe-25;
	Mon, 08 May 2023 14:42:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23q-000mUu-2J;
	Mon, 08 May 2023 14:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD7C640C5;
	Mon,  8 May 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42548C4339B;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=YXxl4On9aUp+qENgwuLh+t3KJIhUCYKdbI8RTQ8n8hY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iRzfRfbCybwnwxZuK2UWb0o12Ni2gO3hrV68RhuCx97sWEn8BpGCSso5OMSh04Sc3
	 PlBULxZhC3h3b+cLkhXyC9yd4J5nb8bgf4bRdZ+ikUQRfq7j5uqDCbKm4+RL2XEkXZ
	 oS8My+zuEVvUJ+S5yIltduZQbX4YkCQvH+mBapZsbFM1OvFq37OWFtMmLqP2Sn/EGC
	 P8nD7VXhRU8b1fMkLOPpmlqY3n4kqrQOrC23vG44oayGnHhA3vaWXvX2vHUbQn+FHh
	 nQeO6TQ/vLICZQRUsgL3Dlt6PWeIcKlAhzsmcsLFrxSxgGUxV210JuxdXTbTfhsNaQ
	 aIgS6UWPb0XZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20FCDE26D2A;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/9] RISC-V KVM virtualize AIA CSRs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691612.25692.18026597841875424784.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com,
 atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074158_816452_6B898BCF 
X-CRM114-Status: UNSURE (   9.17  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Tue,  4 Apr 2023 21:04:43 +0530 you wrote:
> The RISC-V AIA specification is now frozen as-per the RISC-V international
> process. The latest frozen specifcation can be found at:
> https://github.com/riscv/riscv-aia/releases/download/1.0-RC3/riscv-interrupts-1.0-RC3.pdf
> 
> This series implements first phase of AIA virtualization which targets
> virtualizing AIA CSRs. This also provides a foundation for the second
> phase of AIA virtualization which will target in-kernel AIA irqchip
> (including both IMSIC and APLIC).
> 
> [...]

Here is the summary with links:
  - [v4,1/9] RISC-V: Add AIA related CSR defines
    https://git.kernel.org/riscv/c/d6f5f6e904be
  - [v4,2/9] RISC-V: Detect AIA CSRs from ISA string
    https://git.kernel.org/riscv/c/8fe6f7e14c7e
  - [v4,3/9] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
    (no matching commit)
  - [v4,4/9] RISC-V: KVM: Initial skeletal support for AIA
    (no matching commit)
  - [v4,5/9] RISC-V: KVM: Implement subtype for CSR ONE_REG interface
    (no matching commit)
  - [v4,6/9] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
    (no matching commit)
  - [v4,7/9] RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
    (no matching commit)
  - [v4,8/9] RISC-V: KVM: Virtualize per-HART AIA CSRs
    (no matching commit)
  - [v4,9/9] RISC-V: KVM: Implement guest external interrupt line management
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
