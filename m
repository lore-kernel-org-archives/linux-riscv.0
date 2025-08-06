Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2664DCA0EC0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TK/3OlCEQ150XBcZWwzlX7XSffPvbJ9sVxxwWIWokjY=; b=qA6A5Ob+JprHRv
	dadCHXwXQewApIc+Wn6wfDpycPAxe0sj6x0PK6iogGiwWvVXL/6Ac1cuOqdp4+G7x/acWvPJLzS7G
	iB/jDEShQ6f9vH8kxH1GYM23UdYdCiy1X8x0WDms7L5627ps7l3jOjB5WFwrbc60MIn+dpv+ohvSM
	H3XyJhd57WAvqfTJQPLPlGH9An69zk9RJIc/JvHU8m/O2fwg36C0RcPRMcBalSZeQck4n7aExDVId
	h1f/g1Gojs28h/sjWsRu9geHLw8CpjFWWBCpMthl85HOHOF/aRokhl/huZuCpOcmCqGxvLU80UO+R
	75VWGZcZa3R9Y4rODDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnp-0000000FtH3-399M;
	Wed, 06 Aug 2025 17:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjZ-0000000Fs5G-3j0g
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9234D45EE7;
	Wed,  6 Aug 2025 17:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EBBC4CEF7;
	Wed,  6 Aug 2025 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500525;
	bh=9gHLl9tgdN6m1xyHwJYn8Gcm+hsXzo1alXOLXcT0Rmc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uGo5p72z/YSNwZ1I6UbTVcz27GhocJbrNBWOLq4Q/oXPYdFdGMaJPh9zdmagyrPcj
	 N6CmkPqP3I2MZA7GgMPF8S4OHbWMvuQYgpnIqZ517XA6nWpyacgW111JLoI00BaQxm
	 55j57tW4ccBXx9IiifkbRVf2/74FGgvvheKWQ0G6pWk49X4v+IXeNe7PWIdICv9JVZ
	 KBJyNkxFSz7xrKfV+0Q4NNf6fThrnnyTNeOPxClUtZbEcDAv+E0HzMnkguwGoheZXE
	 uuMMUGGf1UnQkry94v/jE2f1+4/i5qpJ+tSWJ3P9TGssXz8QNYIOejMyBcwbo0UIv8
	 R+8m1sljJFHtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F97383BF63;
	Wed,  6 Aug 2025 17:15:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: mm: Use mmu-type from FDT as SATP mode limit
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450053927.2863135.18156029900049802152.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:39 +0000
References: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech>
In-Reply-To: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101525_943981_4029A26B 
X-CRM114-Status: UNSURE (   8.77  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 22 Jul 2025 00:53:09 +0800 you wrote:
> This patch series improves RISC-V kernel compatibility and robustness by
> refining how the SATP mode is determined during early boot. Some RISC-V
> implementations, such as the Anlogic DR1V90 FPSoC with a UX900 RISC-V
> core designed by Nuclei, which I am currently attempting to run the
> mainline kernel on [1], may hang when attempting to write an unsupported
> SATP mode.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: mm: Return intended SATP mode for noXlvl options
    https://git.kernel.org/riscv/c/75ede0a8e07b
  - [2/2] riscv: mm: Use mmu-type from FDT to limit SATP mode
    https://git.kernel.org/riscv/c/a870d4f78f11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
