Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D886EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ci27OWsiEfCZp7tco/3z7yI5QAEdfz1zittvbN0Ng8=; b=Yzfsklx+VGmeEo
	JAVZocPMQ8E8tSPXxANF1uzVEZkETbe7V0DpWjFU+0xjAcO4dEhOiCOQclff82K5SK+OYzHt49SWH
	MNLAKyBPnzF2eya4jtGKx0mp0aBVajOr9tK7V4VPnInalvF49tTGaO+h+K0BfPATPBXbMpLgtELAl
	VXrMgq6pqIoSeX8gNszpZqXL+P4aFhWay34tJl6ofjgwbDlmeaFk76phq+I0ksIN23Xu0ct2j5WmG
	gackQG6SeWSZolmUhHKzZl7E523vmO71TNxJ1eEQ6YH2EI2uadEyDgxoDTLyduNDtZMsDX/0LncCb
	yAjOWia5tV/iCW91oO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy8-00A43A-0e;
	Thu, 03 Aug 2023 15:10:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy4-00A3z7-2f
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A57D61DED;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09820C433C8;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691075423;
	bh=vFaNgVOf1d9a/Nv1QbSxl/OPoNUBiM1RhE9LpnHf+Lo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tDU1II5tvV59psSojipcbWXN4+u0Ol3x5rYJnhE4t3Dkya4wXar5k+19IG6KePPzU
	 YmZ6vMTT5cKHwLTbOGZlLfvdKPIYB4TMdO0bVP4NO43LzzYUdaKTE6eKwCQ+AXUXrI
	 kb2BXzfCjFfcLYvGX66e17KXUNG36jP1sj+ETCqVKhNMHls6syfXjSMsznqUA0KqHN
	 KaZE0hgqsHNo/gNhCC4jSqioO2Cpd1I5oRB55PCTqnb9mryVtxU2xjVCd65LVtcG1A
	 kpresnOnHXiCZWlndJNzoPKzZjWHODdTDoXQCuVdIhChv+Nzhbu3nbCz+OZ47i2u6r
	 kmJjYVzWwfWQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDEA6C595C1;
	Thu,  3 Aug 2023 15:10:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem
 address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169107542290.19238.2836773902339575620.git-patchwork-notify@kernel.org>
Date: Thu, 03 Aug 2023 15:10:22 +0000
References: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, lkp@intel.com, conor.dooley@microchip.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081024_945792_947AA949 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, 24 Jul 2023 15:33:46 +0530 you wrote:
> acpi_os_ioremap() currently is a wrapper to memremap() on
> RISC-V. But the callers of acpi_os_ioremap() expect it to
> return __iomem address and hence sparse tool reports a new
> warning. Fix this issue by type casting to  __iomem type.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
> Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - [v3,-fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
    https://git.kernel.org/riscv/c/568701fee366

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
