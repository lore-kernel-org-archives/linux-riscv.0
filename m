Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1508BC531FC
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzX6ME2JKe4LbRw0jN3jOUGJ21gmQIzoFaFBaHlpqIo=; b=kC6fXbs9sQXICG
	Q4gJXJM14KKbogq1lwNRYHhs/VOILRPbZyz1/ROzl9RMbSRwAx8rehwm+kgP8UBkBfxA/JLRkOVSE
	rrCP/9t1A5wl+9Da62ZIFsJXDnOrrpCA1OrvE5kSFepmTdLJM9yB1kPWVU+h7rsGJlPowwou7VdQy
	hFoqG5EIH9/BcvVi4OR14NiIkUulsElny8WeEHfUKUVS8eSU79rvfN6eChEBgNUIxZYrES+cCBojI
	yjOyWhdbSGrsoOK0XxWIKNFyDNX9KpscmegNHq02MjbR60oVGvlOrjTOQNy3TLadAN3XwRKr0p2if
	6CAWdTT/AED8t3gb9wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqk-0000000DCKX-2SH4;
	Fri, 20 Feb 2026 04:10:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqe-0000000DCGT-1cu8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 04:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB1206187E;
	Fri, 20 Feb 2026 04:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB6AC2BCC7;
	Fri, 20 Feb 2026 04:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560635;
	bh=Xis41vA84Ib6Iac3csxCMpPDnfg/BYT4y4VrELxBXk8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qPSxnHkPCTbPreq1C6URnn6R2Kvk+nWireKZh2YyJvgeTt4+DXdhXTaI4nxXmNQJS
	 vVnMcEuwqFFhI5qM9y84pm7NUKcL9HrtJia5al8ueCVq39h5+whMmLQXWInG4wrSgH
	 Yi48etiCuS4MVbtc1FYZGguCoNqu8kEeu+M3YidHMC28614rEPFezAtQUMhH9GNvJf
	 QsG/A0NJ10WvjEy7SCbqEDrO0X8jmjx9lVoHoumlkx38QEB3GnCTpWECY6EItVV3pj
	 x1qnM7FfQ1AooHty+ey95A5Yz4URfoeiD+OfC2q/kRLw3Mv7vTY8KLu+qu6GJznIm0
	 TUdYYt4i46+8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DA83809A88;
	Fri, 20 Feb 2026 04:10:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv-imsic/aplic: Preserve IMSIC and APLIC states
 during suspend
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064355.189817.13911084684524665897.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:43 +0000
References: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
In-Reply-To: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, yongxuan.wang@sifive.com, cyan.yang@sifive.com,
 liujingqi@lanxincomputing.com
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
by Thomas Gleixner <tglx@linutronix.de>:

On Tue, 02 Dec 2025 14:07:39 +0800 you wrote:
> Since the APLIC and IMSIC may be reset when the platform enters a deep
> sleep state, it is necessary to implement save and restore functions
> to ensure their states are correctly preserved and restored.
> 
> Chagnes in V3:
> - Refine the commit messages and comments
> - Rename "imsic_restore()" to "imsic_hw_states_init()"
> - Rename "aplic_direct_restore()" to "aplic_direct_restore_states()"
> - Rename "aplic_add()" to "aplic_pm_add()"
> - Rename "aplic_remove()" to "aplic_pm_remove()"
> - Rename "aplic_save()" to "aplic_save_states()"
> - Rename "aplic_restore()" to "aplic_restore_states()"
> - Use "struct aplic_saved_regs" and "struct aplic_src_ctrl" to preserve
>   the APLIC states
> 
> [...]

Here is the summary with links:
  - [v3,1/2] irqchip/riscv-imsic: Add a CPU pm notifier to restore the IMSIC on exit
    https://git.kernel.org/riscv/c/f48b4bd0915b
  - [v3,2/2] irqchip/riscv-aplic: Preserve APLIC states across suspend/resume
    https://git.kernel.org/riscv/c/95a8ddde3660

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
