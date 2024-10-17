Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9349CD3C523
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+AGBYyp6/vrsjidFJXoSoDFjWGauy9sc19CYJaZkIM=; b=0bywksYTpcrmvd
	SPV9xRhssQcMedkfka5nx+9dBD6+/f9ZQU5hbGS07GZ1Ul6gQrk0o25vyah6I+DUHd97YsLZou50f
	T3dt1G1tl6ZwZgxeAqKdtka+PjGtamCmPqn2J3zd3dNegPI6VnZHSAxXlokazngO4nEw01i1Mb8BD
	QcqTK66wOJSd/QU2GCT/YhiMBI6y0hqFQ/oDeM921qEOKja7QYgVIJl6uFO8EFqmUzH2gN2KjxP3m
	hlywOwbXVjDxIBif5LwdjynG6bp/uAAjMEKnaj39aw2eZy5UFch9yvuM/Gw/z+iEpgFIMVam/fU+N
	5RCKlY+oSFokaTLcWShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOl-0000000FUzd-0kq1;
	Thu, 17 Oct 2024 16:30:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TON-0000000FUrS-3Kuc
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AB1E5C6128;
	Thu, 17 Oct 2024 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C04C4CEC3;
	Thu, 17 Oct 2024 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182626;
	bh=ReJ5uhQRcBg/1XL59l+RmpDPJh/BYKyOS8QEpIqsA7U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Vipj3Th0pCqGVCEiHcQf5AabDrH4AI6EPjqq3Fk/BRFd5qhrXSnedIxqrFZQSIAxb
	 QljU3VEBzxxSqSe7+3YGTITwmz42hcOUAFUzpsQfzM9ncLTzUuPcPN66cvl2ouE74h
	 uSCxsdxSnMYvodA+mQSOSDFrPk1UiyZJ7RmF1TWv8FVhhe6C+4sGxcEC8XttwDmRya
	 7zkDdCfAH9ZjHExb7Bzh0bNkbsLpS4mpsuFz4i0apri5fw9TlXJWA9nSik1QkmYa8q
	 4rvUIXlSIB4ebxuQpON7uarHX16LDD4MZqzA9TkhBqSP7iYxe0m+dlUqQzwHcTDBp6
	 zej/6d4JJRtcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E8C3809A8A;
	Thu, 17 Oct 2024 16:30:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: ACPI: fix early_ioremap to early_memremap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172918263201.2528145.6233563101425140097.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:32 +0000
References: <20241014130141.86426-1-cuiyunhui@bytedance.com>
In-Reply-To: <20241014130141.86426-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_093027_910309_6C4CFDAE 
X-CRM114-Status: UNSURE (   7.20  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, jeeheng.sia@starfivetech.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, haibo1.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 14 Oct 2024 21:01:41 +0800 you wrote:
> When SVPBMT is enabled, __acpi_map_table() will directly access the
> data in DDR through the IO attribute, rather than through hardware
> cache consistency, resulting in incorrect data in the obtained ACPI
> table.
> 
> The log: ACPI: [ACPI:0x18] Invalid zero length.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: ACPI: fix early_ioremap to early_memremap
    https://git.kernel.org/riscv/c/0dcf8269ecee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
