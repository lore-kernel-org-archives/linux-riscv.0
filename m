Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41EFC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJxMLhoVU3Rr7gQiX31RwRmCobr9xbTdTRiqUcSYsw4=; b=qApyhTyiGQRaLi
	6GlDkE4y4ZbRtHzC7yO3sYRfLPgT9KPto0wOSt4lLzpskvOYstuIyIJ23Iv6x9V0bsrOqJlQZGfQC
	se3uXwIBAnR6DqccTUaYbrtAJI85T0jwVDJytQSC6sLOSG+cp9/70F+pcQ7EMwVFv2Rig5ZW7tofT
	1qkLqHb07CqhKz+uqracY7i3ECrzoSfhFWFf9LoA73DOjyLXkrBozNeLl9HInqX/HNt+xSb1O2fvX
	tnb2jpK5liPXDWchWzlO4R61oT8RTXTtF8+7JzpZ6GWjG9AMQew1b+8cPMZmGpuM1/4zDYG4+i4Dc
	JRnmGN5Rb7k+ooGiu8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sefie-0000000ApyB-24cF;
	Thu, 15 Aug 2024 19:01:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecS-0000000AhAq-2s9l;
	Thu, 15 Aug 2024 17:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2574C61F7A;
	Thu, 15 Aug 2024 17:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6460C4AF10;
	Thu, 15 Aug 2024 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723744239;
	bh=M7g4AOWgcoM+Mxwn7Ms0klZO17PB9AXv4lAQo5UV8+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EunRdICVSRyrNtKdY5GCdUi/0YRYT2C2KEXBfkK6aEQ1SF192EU8AGh1VbhCky+O6
	 9oiuNzRmy/Blz/zvE1DxT3+3Ufgp0TfP4YvKk7eqvM/znCy7Zr8s9fsZMn+lrahw5A
	 omNDl3P9ZbfLmqXKp+3YTCAy/e2qDxOkS4tzB2LaryIN2/YRe2yzDAbSItfSwVi0oq
	 /jfYIi5yINeXb8UcXjVzS29ykxi/5VC7gaeY9zVMNZ9CjiYOM336zHusNuxql7yJp6
	 hZfl4P2ZPefEDsFUoDXP7VatgNiLl1EwIKs64eBEE7InAYHz1xBwksGFvdmEjJZw6y
	 rEE+wBy+1WVjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5C65E382327A;
	Thu, 15 Aug 2024 17:50:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] RISC-V: ACPI: NUMA: initialize all values of
 acpi_early_node_map to NUMA_NO_NODE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172374423926.2967007.4687839335755873720.git-patchwork-notify@kernel.org>
Date: Thu, 15 Aug 2024 17:50:39 +0000
References: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
In-Reply-To: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
To: Xu@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Haibo1 <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_105040_803578_C790FF60 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: aou@eecs.berkeley.edu, gshan@redhat.com, catalin.marinas@arm.com, lpieralisi@kernel.org, Jonathan.Cameron@huawei.com, guohanjun@huawei.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, james.morse@arm.com, linux-riscv@lists.infradead.org, will@kernel.org, xiaobo55x@gmail.com, linux-arm-kernel@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  5 Aug 2024 11:30:23 +0800 you wrote:
> Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
> To ensure all the values were properly initialized, switch to initialize
> all of them to NUMA_NO_NODE.
> 
> Fixes: eabd9db64ea8 ("ACPI: RISCV: Add NUMA support based on SRAT and SLIT")
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] RISC-V: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    https://git.kernel.org/riscv/c/a445699879f9
  - [v2,2/2] arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    https://git.kernel.org/riscv/c/b8c09eb34465

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
