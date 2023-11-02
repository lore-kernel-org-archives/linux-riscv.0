Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8BDC001B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RpVc1zkUTwvwNE9ZiXlxx/K+zGq78D+dP6UZqK9JZ4=; b=1D0GyxDxCYQuiW
	xnRUHm0Ipt9t7zMzKnB/rY3UstBwF9tH2yQS/FS+6F7G0F61no0Bivai4W5eydQEdOK6r/GZWf8Bw
	SIqzzWyfg0W5QVmSpg3C/5Qq9b4VFGbyOWjt/u+08PkL7C8L7FGBI5FzCZHgSENLplZjaAW2vAFzu
	DD8GqXrD/zI3mtuHC3pTOf3RPagPv3GrzuSmg9yTGKvv25Q+lp9vFOV/W//jYrzM9U5e1iNiqsQip
	ue1M9VMEM83EtBHmGKbyLc3d90LV+F+lnKk/CQrKJyVt0ioPV9oRTwnPft5kVpLURUGgsmOme4Tyr
	DFbK7kuOgb2tlZyzYCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBB-00AEJT-3D;
	Thu, 02 Nov 2023 20:20:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeB7-00AEHD-0h
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 20:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33BCCB81DD7;
	Thu,  2 Nov 2023 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83A3BC433C8;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=HVj+Q5gWy9MekQe/rtqFld2BFOsZW6hBXf8kTSaTucM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NIrTMaAFDU3yln3xrYTrgfd5aZiLkFgShBQJhoAzuVqRSTp76a0JsPlTQR/HKhd6o
	 HnEWZSV3+xtUBBWwfHF7Z1eaZgf1QZpOK+vpwxkUpnuslmmqRZROH4GL+mlpWqE/Su
	 DPRA6yoWPuVfPM22g3i0EO/T/2fE1ehvvr4D4KXCg5VlImxZh5M+c6JbhZtZKUxSIA
	 cwvnVBbADp7KXA0W4BwO/GFydP6xw1DJtgGSEyjEO9HZj9WN90oPKRCCRsjPHWC55r
	 36R44ci9EdAcmQNt6k4ig32cB/Kg1wp8+wlUXTRu9zEHuEmxfYqA6ODbjpjw6H54od
	 twLONEAGtqw8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67951C4316B;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Add support to handle misaligned accesses in S-mode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169895643042.22248.9341176488317872120.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20231004151405.521596-1-cleger@rivosinc.com>
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, atishp@rivosinc.com,
 ajones@ventanamicro.com, evan@rivosinc.com, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, rminnich@gmail.com, cyrevolt@googlemail.com,
 conor@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_132033_403682_B5C26CB9 
X-CRM114-Status: GOOD (  10.39  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  4 Oct 2023 17:13:57 +0200 you wrote:
> Since commit 61cadb9 ("Provide new description of misaligned load/store
> behavior compatible with privileged architecture.") in the RISC-V ISA
> manual, it is stated that misaligned load/store might not be supported.
> However, the RISC-V kernel uABI describes that misaligned accesses are
> supported. In order to support that, this series adds support for S-mode
> handling of misaligned accesses as well support for prctl(PR_UNALIGN).
> 
> [...]

Here is the summary with links:
  - [v2,1/8] riscv: remove unused functions in traps_misaligned.c
    https://git.kernel.org/riscv/c/f19c3b4239f5
  - [v2,2/8] riscv: add support for misaligned trap handling in S-mode
    https://git.kernel.org/riscv/c/7c83232161f6
  - [v2,3/8] riscv: report perf event for misaligned fault
    https://git.kernel.org/riscv/c/89c12fecdc4d
  - [v2,4/8] riscv: add floating point insn support to misaligned access emulation
    https://git.kernel.org/riscv/c/7c586a555a48
  - [v2,5/8] riscv: add support for sysctl unaligned_enabled control
    https://git.kernel.org/riscv/c/bc38f61313d3
  - [v2,6/8] riscv: annotate check_unaligned_access_boot_cpu() with __init
    https://git.kernel.org/riscv/c/90b11b470b2e
  - [v2,7/8] riscv: report misaligned accesses emulation to hwprobe
    https://git.kernel.org/riscv/c/71c54b3d169d
  - [v2,8/8] riscv: add support for PR_SET_UNALIGN and PR_GET_UNALIGN
    https://git.kernel.org/riscv/c/9f23a5d2f6b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
