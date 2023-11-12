Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7BC072DD
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+SZh80XoW4dkobG4efQGSjbbsBi3fzr+ZVR+ib8u/s=; b=DkA80IBC2iwhkD
	mSIKxGxJdbCF0eZ3mKEGwBulvnUZiM0baZPAu6k/89dgufVjh/G+C1mnlNdTtCvpHo25g4nlJnz8d
	WPBO6WAPn27KMKtngK2A3QPrqfuPXN+HgRiPTLFxSX1v7oZQR01T65sBmVMiDgD3QlzqkEjct/eUP
	Q4mcHLH+smIDyId/oLtpFj86MUVB/NlIbDvsijtfQhjQVceAflD3lyo3aSNNjbME8QH7Qnl68Riug
	4ksPAOU2K58w4mZkpPm/KMlK8YHLM5deqysbjt+0LpyuGbm0sRpzsmWNDq4NPhUle3GhozoJMxJO8
	rhOrQdR2kmTvEKeh1YmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylf-00BWs0-01;
	Sun, 12 Nov 2023 00:56:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylS-00BWhN-2Q;
	Sun, 12 Nov 2023 00:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 69C6ECE01C5;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB5DC433CB;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=+f1eXcr91euPusl3Xe/1/DfSwfjp6Uid8mOwDf2yltU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H9MS3tqxULUVIVZESINTI28qjs/DgCx9l4kuIeVhz4pohNE2WbN6BAyRD14y7BF90
	 RY/kpgyT8TdPukD/AJXGR6o8Z2GVO/Tbn0sIbWVqCz5W7mWfsxghmcPMVtHUtZAPrC
	 qqNpGPrxFKZ3yyxP0rldcBKY2bhSoRfQtQVcL8qvIMNKeEmyCCrEvebptP7LgI0KBF
	 /AnhzXoAPcu8zsPopEYtFbsEgq1v9bjfR6k6cNBR6JEHcNqYRsqNMQaFXwH/40eL5s
	 lBAwWg+oSDpWNSMXZQtdILBi85B+aR6+jOZwz8NZST6UxEclBVUtElAOeYPYWgvOQi
	 DZpbY6goJKsuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3BA38E00089;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/9] RISC-V SBI debug console extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054624.11360.10545081285064306783.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231020072140.900967-1-apatel@ventanamicro.com>
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com,
 atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, conor@kernel.org,
 ajones@ventanamicro.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165550_960036_EDAF72FA 
X-CRM114-Status: UNSURE (   8.79  )
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

On Fri, 20 Oct 2023 12:51:31 +0530 you wrote:
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
> 
> This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
> and Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] RISC-V: Add defines for SBI debug console extension
    https://git.kernel.org/riscv/c/dadf7886993c
  - [v3,2/9] RISC-V: KVM: Change the SBI specification version to v2.0
    https://git.kernel.org/riscv/c/b88e87a0a1ec
  - [v3,3/9] RISC-V: KVM: Allow some SBI extensions to be disabled by default
    https://git.kernel.org/riscv/c/56d8a385b605
  - [v3,4/9] RISC-V: KVM: Forward SBI DBCN extension to user-space
    https://git.kernel.org/riscv/c/c667ad229d13
  - [v3,5/9] KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
    https://git.kernel.org/riscv/c/d9c00f44e5de
  - [v3,6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
    (no matching commit)
  - [v3,7/9] tty/serial: Add RISC-V SBI debug console based earlycon
    (no matching commit)
  - [v3,8/9] tty: Add SBI debug console support to HVC SBI driver
    (no matching commit)
  - [v3,9/9] RISC-V: Enable SBI based earlycon support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
