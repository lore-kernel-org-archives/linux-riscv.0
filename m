Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE3C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33iuyRH0370yYAiyJ5TsQm5R/ds3CqWABT2vcYT2K70=; b=QvtZXUHbZs9uig
	ivlxfLQjvek1O/a4XtkA2b76aBq6Gs+92YESTHlLvk1jJ/eHqhNpKqWVUqPTMsq1gk2tlOL5Bh7Ms
	yGBUdMU6BCzi5cJ3GEmRcVqWBsqE3U7DyKOoqmEL9ajwcqXMNZ6lc23V31i+XYPLvPLPCPWHedx0t
	eQcPTqyvo6iap5nQ+tFGcKtT5VkUx1XsEx3dRcnlw1DuPwOTV3dVxUcQyZqkYbFd1m4PEFMteUYwS
	Xi+dKDv9KYimUSpDlyNwdo4W34rY6OoaJzxTUi3bEFpXAq8HwVtU3zJ9SMpRXphkKMDJsMRye7g2J
	laQRH63HVQJn1tdNYCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJdv-008VIs-0Y;
	Sat, 20 Jan 2024 22:16:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbF-008ODE-2W
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5A72EB80935;
	Sat, 20 Jan 2024 21:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 098DAC43390;
	Sat, 20 Jan 2024 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784996;
	bh=qZBgpjmamHDPlUItPHrxc2aKEFdUoPHs1VKKC2XaTaw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SXYLo9ozrMquXpBfJoj1/Fs+vjzeiQrrXgPsDPUGXT8HpTVE/E4ogJ0naAYMt0InN
	 eP4oQudM7Q3SfBvRFciS19wkPyDwGmXsaNDdtWuJNHF06nLzRP+5qRZUH8WSa9HjIR
	 n6jw8P5mTSGyEphttSS8GaO/Mb78eBPddpcv3lPpH5+ZBzLoSZtScupta/RDyUeRQA
	 yIF/ixVC+YFLDDminA2G1U9uKox4v3PC2YscQMPsSFQvXlDV8J1DuIbiwsrcY9W9I9
	 nnD3pPKFP0WL/ypKIx7kanlTcoaqxQHKpNgnBfSMgLNEYD/lLXYwXu04l6KdNZ1Shg
	 02yYR7mVijaMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC2CBD8C970;
	Sat, 20 Jan 2024 21:09:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v15 0/5] riscv: Add fine-tuned checksum functions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499596.24348.11397809768578424439.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:55 +0000
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
In-Reply-To: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 samuel.holland@sifive.com, David.Laight@aculab.com, xiao.w.wang@intel.com,
 evan@rivosinc.com, guoren@kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 arnd@arndb.de, david.laight@aculab.com, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130957_993380_B0893B7D 
X-CRM114-Status: UNSURE (   8.53  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 08 Jan 2024 15:57:01 -0800 you wrote:
> Each architecture generally implements fine-tuned checksum functions to
> leverage the instruction set. This patch adds the main checksum
> functions that are used in networking. Tested on QEMU, this series
> allows the CHECKSUM_KUNIT tests to complete an average of 50.9% faster.
> 
> This patch takes heavy use of the Zbb extension using alternatives
> patching.
> 
> [...]

Here is the summary with links:
  - [v15,1/5] asm-generic: Improve csum_fold
    https://git.kernel.org/riscv/c/1e7196fa5b03
  - [v15,2/5] riscv: Add static key for misaligned accesses
    https://git.kernel.org/riscv/c/2ce5729fce8f
  - [v15,3/5] riscv: Add checksum header
    https://git.kernel.org/riscv/c/e11e367e9fe5
  - [v15,4/5] riscv: Add checksum library
    https://git.kernel.org/riscv/c/a04c192eabfb
  - [v15,5/5] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
    https://git.kernel.org/riscv/c/6f4c45cbcb00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
