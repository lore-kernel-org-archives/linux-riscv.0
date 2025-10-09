Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3620ACCD189
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TY/6jJTG9KzBN7S/GFq4kkPmB1AYDXhONvpkKoVp5k=; b=NR5S7C+6EMwfkI
	GtxzFzo02Ck1MmtCJKGutJJFVr0B/xcCrqejzzNVHa16uqv+7Y3oFNrsjIP8pPMnd1VHOqDCBk6DY
	XhtOQuNbRMv0yyZWobJ2WYs4KMOvzZpN+tUCgSNISGj16NjZEMM23ufUKpX8dqRmYJ4l7KcvlZJUP
	puvH6l1edsmWC1VStmPDQRv2pQXQdBNDU7/nihw1+1kl1xaI4LlUw9eiG/xBsjnZ+rt6ok3eNyVHl
	3Gq+wyxnMQMsxuPBDjwegIBIAUvGskiG0p3a06Df8Ev6qmhXW7y9xCuV+xAaPwgDkWYifKgr6iTNm
	r5LY9emhydgL9WClTBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7h-00000004uU6-2eHF;
	Thu, 09 Oct 2025 01:07:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7e-00000004uS5-21hV
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C0FC44F8E;
	Thu,  9 Oct 2025 01:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07299C4CEF5;
	Thu,  9 Oct 2025 01:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972030;
	bh=8lLvrSOJdnG2+/1GjnzlTqFjSAwkMIFcfM7bGqMBkdo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UyZOPJwH3RjkXnLVgTJzxH5oVJpDqfmqP7LzmM+awC+tUq7Rt5vCg0abl7bSheIUJ
	 Oq1je4fQcNzSpt7ogh4/UqwBvheY2RcpMkgO+tIhJ2H3sOlB+v56G5JgMYVcGJkKIb
	 jWP0yl9+MPdvQ7wK8Ek9FeXfhsp8HFKey+1Y5A9Oq5oXtrQwJ07kavbrAJuiqy2NDN
	 V9EY8zlrTmFiMOQCcyrtJqPDmaPyL1MzSqLxx0EDpCJP3TauSYXm6GAeYAeA1GqAtk
	 66wb2AuVs5HwMXTXRApex6ApzJ7y7vHjVXrDQR0K9OzFQ1VFDQVCnYPlu7UxL5gJLV
	 Q7r5J4Bfkkqdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEE23A41017;
	Thu,  9 Oct 2025 01:06:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/3] RISC-V: Add ACPI support for IOMMU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997201849.3661959.13962135221127346845.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:06:58 +0000
References: <20250818045807.763922-1-sunilvl@ventanamicro.com>
In-Reply-To: <20250818045807.763922-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux.dev, aou@eecs.berkeley.edu,
 tjeznach@rivosinc.com, alex@ghiti.fr, rafael@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, will@kernel.org, lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180710_540123_DF259064 
X-CRM114-Status: UNSURE (   9.18  )
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

This series was applied to riscv/linux.git (for-next)
by Joerg Roedel <joerg.roedel@amd.com>:

On Mon, 18 Aug 2025 10:28:04 +0530 you wrote:
> This series adds support for RISC-V IOMMU on ACPI based platforms.
> RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
> to communicate IOMMU information to the OS.
> 
> [1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf
> 
> Changes since v5:
> 	1) Rebased to 6.17-rc2
> 	2) Fixed incorrect id_out assignment (Reported by Xianliang)
> 
> [...]

Here is the summary with links:
  - [v6,1/3] ACPI: RISC-V: Add support for RIMT
    https://git.kernel.org/riscv/c/8f7729552582
  - [v6,2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
    https://git.kernel.org/riscv/c/cbf4fbc484e1
  - [v6,3/3] iommu/riscv: Add ACPI support
    https://git.kernel.org/riscv/c/4f901b3dce57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
