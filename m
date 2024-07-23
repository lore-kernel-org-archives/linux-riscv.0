Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446DFC3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vvf23Vw2zU5wgSVl9v6vBd79SA5/QZB6VX4heXyWrkU=; b=h2ZCt/VbIk6VnA
	lcGXqqBGonAsToYVSnW9Fb2AVsnU+Cs9A8g3MIYlHe2mTTswTtB4/ZqDk8ghkyNSWRuBkQ7GLqyzM
	wB/ZVlr2R3aOI1JZMlaezLxA7d8JtW90RIMM/y7eFYS+NEIpoROEq5IIk8P1SjZBEhoDmDenrrK3O
	pmaEVOjbA/VSUKHu+A0vSsNhWyD+rHmrKHS01+5CromwwvZuNKwhikDPB75ZNYIgEdBKq3uvwAJt/
	fC26/YpJ0Q4U7UbYLz0uBNSEWRldA3IP/pmYSILExXV+vwL9gLreEGdXsaGo2fHv6cUhCZkGuzM7h
	YoKOxNA+jlg+UjnQosrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF74-0000000CRfI-1GCj;
	Tue, 23 Jul 2024 12:59:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6E-0000000CRFa-0tHI;
	Tue, 23 Jul 2024 12:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4397A60E86;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85835C4AF15;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=fR1aySQ/+oVgf1My0oaj19WwBAMmOZvLsxd4wUUyhRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O7M2I86Fc86jPW9j7tzdrwXEwQ1iF9utnViosLowjTR6NAHGuVzXvhcsNIwvSNQwE
	 xpWqWGXPw58k1doZFZaEIFkqKKVrg6uN2E8N+NdAVfrNtvLuxz0Fw4vUnua3FnZ6ZT
	 lFgDbzM3H9a22SCXtN1vdvZk2Hf241vgjyQwLGtLTovpbOuHD3bkA81xWx9nmu1oBW
	 9nnNFBzUYWkL66Wfpqo2laPH7t9HKr/UHNX81RKI7qtZiYG6ZnkOMaXfP/YCZeZ1t2
	 88vtAEiFn1QEjQhl1gMs+CVOevmfAlNE562sJKjD9RzaZVx7moEmIpQy/5gF14DRXd
	 B84Yi/nS/ta7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7480DC4332D;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951647.10883.3771071105070465600.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <cover.1718268003.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055838_332589_36B06C08 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: alison.schofield@intel.com, tglx@linutronix.de, jszhang@kernel.org, rafael@kernel.org, catalin.marinas@arm.com, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, zong.li@sifive.com, kernel@xen0n.name, will@kernel.org, linux-riscv@lists.infradead.org, dave.jiang@intel.com, rrichter@amd.com, bhe@redhat.com, maz@kernel.org, chenhuacai@kernel.org, ardb@kernel.org, linux-acpi@vger.kernel.org, samitolvanen@google.com, james.morse@arm.com, dan.j.williams@intel.com, lenb@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, arnd@arndb.de, charlie@rivosinc.com, chenjiahao16@huawei.com, ytcoode@gmail.com, loongarch@lists.linux.dev, paul.walmsley@sifive.com, cleger@rivosinc.com, xiaobo55x@gmail.com, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, gregkh@linuxfoundation.org, rmk+kernel@armlinux.org.uk, samuel.holland@sifive.com, evan@rivosinc.com, palmer@dabbelt.com, andy.chiu@sifive.com, akpm@linux-foundation.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 13 Jun 2024 16:54:32 +0800 you wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
> 
> Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
> by default on all supported platform.
> Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
> potential boot noise on ACPI platforms that are not NUMA.
> 
> [...]

Here is the summary with links:
  - [v4,1/4] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
    https://git.kernel.org/riscv/c/eabd9db64ea8
  - [v4,2/4] ACPI: NUMA: Add handler for SRAT RINTC affinity structure
    https://git.kernel.org/riscv/c/39494aec8a04
  - [v4,3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
    https://git.kernel.org/riscv/c/adc3e82d2537
  - [v4,4/4] ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init
    https://git.kernel.org/riscv/c/5f76d4211ee4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
