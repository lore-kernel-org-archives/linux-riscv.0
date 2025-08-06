Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58848CA0EC1
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lDSYELA3m8vi6qKHQ0N6foGRdZ9iOqTxcZoiG7V59A=; b=4o/rEFRWBYO3vR
	X87oQ9jcF9RElwRMe34Gv7ACEK21O89yDLB1FDxWdb8cTj//lxlo4GVZrXlCX50T7zGnOTPTsUGz+
	9YVbwUEnM5u/BBXkg6xHdQsRFP3jo09jCh+1DSjxBKzXc6V4A1TWywQVqu1cafoKg5ch3JgwOhH8e
	cfdJObLrTzPki56mNM8l2sQTYgoo/W8ynCXUhe7W23b7FA4pSgKH1bKo3iKSBPcTs6mPSk0dXO40X
	Ydqp2jCCLhYROzvYGBFfh/g6P07PpIZVDIBpyl9ZlZmXvDzxyUvVXQlnjURH9pFw9rk8aICcC8qsx
	x2stLjWO5h2UFcvdzVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnp-0000000FtGb-0bij;
	Wed, 06 Aug 2025 17:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjX-0000000Fs3i-2fJx
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC29943574;
	Wed,  6 Aug 2025 17:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CE8C4CEE7;
	Wed,  6 Aug 2025 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500522;
	bh=I3R0ZZuPVZjnQiFgtmFRVCZ2r5++kREGhtzLYMxzees=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WJ0K6HTZEfT8BNH+os9kpt9pf57Ww0MKKW5Q7tRMASQtIpPlQvkgZtJGsw3KeEdBK
	 BaretPZGh8nFdv8U5zaWt1OzwhKxoJ/IkUeZPYDzwBy08EJGVTNbKkcbH2X8J81Bl+
	 21pdP1RoBJTIjViiGoDvOqsFOk0J250MYa855KdnLPkSAN5fW+l5PCNRAocBooOQJd
	 ijz9vEfwOt0CurH2++NyCsU+zuubaqSiZDz6GiTYBAV/K4DmuHSOdm9A0yC3KXDUwt
	 DdIvUQUmIwjvd/OCQc5uEfiC6otmfcVZXBuEDT9eCIYmSOCPwtX8P6YDl4Km+UYygT
	 xfKN+B9hO+jeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDD6383BF63;
	Wed,  6 Aug 2025 17:15:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/3] RISC-V: Add ACPI support for IOMMU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450053651.2863135.8588545093021909171.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:36 +0000
References: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
In-Reply-To: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux.dev, apatel@ventanamicro.com,
 tjeznach@rivosinc.com, alex@ghiti.fr, rafael@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, atishp@rivosinc.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, ajones@ventanamicro.com,
 will@kernel.org, lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101523_699447_D02A9038 
X-CRM114-Status: UNSURE (   9.44  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed, 16 Jul 2025 16:10:56 +0530 you wrote:
> This series adds support for RISC-V IOMMU on ACPI based platforms.
> RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
> to communicate IOMMU information to the OS.
> 
> [1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf
> 
> Changes since v4:
> 	1) Rebased to 6.16-rc6
> 	2) Addressed Anup's feedback on formatting.
> 	3) Added RB tag from Will and Anup.
> 
> [...]

Here is the summary with links:
  - [v5,1/3] ACPI: RISC-V: Add support for RIMT
    https://git.kernel.org/riscv/c/ea35561bc965
  - [v5,2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
    https://git.kernel.org/riscv/c/0d7c16d0df92
  - [v5,3/3] iommu/riscv: Add ACPI support
    https://git.kernel.org/riscv/c/368ed89f7ac9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
