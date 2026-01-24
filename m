Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA6ED715D1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A/MNjuU+adlEMSfzeAMp1A7fLSNr+/F1mK9+u0b51A=; b=LGjNrL0vyK4ihu
	EDHtaUFpLbmfFTQFLbq+epiuiuw4EcfOH5niJI656YnDJQBUY/3tnq6ByAk9M7FKVWGRXnRlyJPxr
	u3agHc4gei7UG/usuteHStn6W4Dl6SiwBhyPHSIjxOncgAXbXTD0EM8FOj4GqNS1IhdsGBCpVQDlh
	RcfJzgWOtbW8yOdH7FeF4hIzjFIvtwYGwWZtSmzbvBg1sv2l63Lw1NHFWXvaAla5XmIcT9Z+LMtCp
	JBFFHR34ptHTgs0Kg/bd6ELOasJiyTBdDneEywdUpgDbSQvdE0fztN+oN0g5Jbnp1YdkkAChKRjwH
	04AA8KU3ld71M0F36Eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjZ28-0000000A6O8-2vrZ;
	Sat, 24 Jan 2026 08:30:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjZ26-0000000A6NQ-1Rcq
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 08:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E53E442ED;
	Sat, 24 Jan 2026 08:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B949C116D0;
	Sat, 24 Jan 2026 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769243413;
	bh=9L7MsPn/yTRYaQJfDQXFZSPwd6nACZKVtmVeqe/nHsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EAZDXcLvXoZ0z1Bw3AQU2+31ctKLApI7j0KcyIJOgPvYltbM/km1BOPX3Xcjtvl2n
	 +92/Gn5Xubmi84iinuGeV+IRJwiz7pY7e+uEU1lPw/WqDx7G80Amik6bko35lhhkL8
	 FW2y2dgFyPqsC4l/x4HfRQ5Y3HpsWDpplAQuDR/W2MKmgs6CjwP8Yhy/eqOk9Thqkk
	 Ku1nC3sb984LOBG4ZYVyvM2Jn+5SNvWXcB1iI5QshQrJjWm6nLykLcLO3DnVoA3btF
	 yL4KCDwAyy5wnMCygsXctDrbmSd5dY0QkKNSckZQyKa/feEzTuumvNCNSB1SbCgkCd
	 XVjNFioFWVIpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EA4A3808200;
	Sat, 24 Jan 2026 08:30:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] errata/sifive: remove unreliable warn_miss_errata
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176924340910.3247175.14220716295719514263.git-patchwork-notify@kernel.org>
Date: Sat, 24 Jan 2026 08:30:09 +0000
References: <mvmv7i8q8gg.fsf@suse.de>
In-Reply-To: <mvmv7i8q8gg.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_003014_408440_B391C6B6 
X-CRM114-Status: UNSURE (   8.60  )
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

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 15 Dec 2025 12:40:31 +0100 you wrote:
> When both the SiFive and MIPS errata are enabled then
> sifive_errata_patch_func emits a wrong and misleading warning claiming
> that the SiFive errata haven't been applied.  This happens because
> sifive_errata_patch_func is being called twice, once for the kernel image
> and once for the vdso image.  The vdso image has alternative entries
> for the MIPS errata, but none for the SiFive errata.
> 
> [...]

Here is the summary with links:
  - errata/sifive: remove unreliable warn_miss_errata
    https://git.kernel.org/riscv/c/45862b586936

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
