Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E0C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VR+6unZDq9SkMoWz1ZhHdGPDHK2qR4S+hE4tF8OKiKo=; b=13VrsQoXHkbQqp
	KKlhhwB+F+2tMd2wAuX6jnsaLXRXOxaB/9lCGMRl9KOIVz9sTsocMy15TULdamVs/cyOj8HuDrErx
	kOtc9rONsnS6vdEDzFfnQ+6NuiWe1EnIBHKUj6a3uHcJiA0wWhxzZ1/VToACJUjNcG15h+NNGxxlQ
	6JI10TKSa36LqBQSo4kVnV9WzmPb6iBGOqnZdsnHwjf3HguTr0Yez+bT84aEIoMcknzmqZDfwTO3+
	5xIxMGGhSbonIfLLYdt+BHC/BuMOC+W8Ldcw7VlZ8yyF/HRH37clRJn+LhQdBxStm4v/KX9GZ4WSO
	XYk0tlznel+pEZHC0PPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGWi-003cPR-SS; Thu, 09 Feb 2023 23:40:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGWd-003cLF-NV
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF635B8237D;
	Thu,  9 Feb 2023 23:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76D32C433D2;
	Thu,  9 Feb 2023 23:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675986017;
	bh=tBO9rl6wLLIEb6LYMFEVhbFpu0eTRNNEGdf0K5Z2O1w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N8xZmUCq0S4MI9tSIskysBA4ShHOBs77JhI9BsQ/ta6qOney2e/BGxLCFLrMaQ+Kn
	 knDAy/x0+s3LCCiU1aHSgHTl5MsftQbXF05Siw/YBGIOqCd1p6nua2VeVdeJ5QL22D
	 TB6QtsXiwm38zWSFPxYRJqHFekLg6dFMDPRecQjCRWvqGhcJ88ucfF18NjQGxx/13S
	 PiZnHSF9kaH9KvjkO+VImg3Mccy26HJdG0FMvE6GFgBHnSOJqQA69OJf3UITgVAjJf
	 IFCYpm++u6r4IGktV3AErgXE6YYpLmOFPH7mQUxalwx32ri0JL8l879l2fgeHKqAld
	 ICJIV+cJt+YeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A603E49FB0;
	Thu,  9 Feb 2023 23:40:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: Fixup race condition on PG_dcache_clean in
 flush_icache_pte
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167598601736.16272.8641782921035193984.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 23:40:17 +0000
References: <20230127035306.1819561-1-guoren@kernel.org>
In-Reply-To: <20230127035306.1819561-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, palmer@rivosinc.com,
 conor.dooley@microchip.com, apatel@ventanamicro.com, atishp@atishpatra.org,
 mark.rutland@arm.com, bjorn@kernel.org, tongtiangen@huawei.com,
 ajones@ventanamicro.com, andrew@sifive.com, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_154023_974073_519BFBE8 
X-CRM114-Status: GOOD (  10.23  )
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

On Thu, 26 Jan 2023 22:53:06 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> In commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean
> in __sync_icache_dcache()"), we found RISC-V has the same issue as the
> previous arm64. The previous implementation didn't guarantee the correct
> sequence of operations, which means flush_icache_all() hasn't been
> called when the PG_dcache_clean was set. That would cause a risk of page
> synchronization.
> 
> [...]

Here is the summary with links:
  - [V2] riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
    https://git.kernel.org/riscv/c/950b879b7f02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
