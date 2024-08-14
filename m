Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F55C531DD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zlYMJGl0mezTFCjiuGeLauMk8K1GY3oOI6DBD+a21k=; b=bbUfmw3YGxB9T8
	VgSYVwRaHZFhlR4i5EAh+m2g1FY+M+H2mpy5XufZUxM/X4ZQ3B8NzSmDzkuYl5IoncnAb5KC+g54R
	hI1W9+iSOlfoCaIoyzu7JXFmDx2r3015PEadECyip6To8MWDDS+x430/Mlkng7ZpL10HQ7kw3jQ4e
	ZK2cI59rJlYEWCjC3oFcod3QxdXqa2OqBjPAuk9ISyCg8xK8w+mk/8+t3mIBZAee8+ZJpPnsFYkpe
	WJRxOnpCXQg0py7cV61Y7qsaz8SdYKhMRDSac7JIKxvKH1d8xUowp1o7dtQI4LnwBtux0AqcmXCfV
	0yVotvxI56sJudXVatjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEi3-00000007DkA-1Yx5;
	Wed, 14 Aug 2024 14:10:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEhy-00000007DhM-2HZw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 767F261AA8;
	Wed, 14 Aug 2024 14:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7E3C4AF11;
	Wed, 14 Aug 2024 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644637;
	bh=YwGJUc3Z94a2A/QpganPxW/sR2FdyfIWklhxVLiY1pc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MjmJ2jaLU84+pDD5IquIjGIfwNDdEU8xQNthDY2vnRfi24oF1gp+NukNp8OoXfuDV
	 jD4dcWuqouGxtetTgAtDRqHWkXrIHiWK3mj20cSttAKzc+QEanUl9RASmAaSU4j5cm
	 /rPXK5XUc+mZZWxM9QK9nwsYxlq9BZQqu2OfESgcYfu+ZlLuRqYGG59EzHClrHTUL9
	 KfH2EEFnQv8S3uRtDTkSICuDAUHSTtsdlUOrlXUTahgxNWDH1wYlg7QDvpbBYU1JPW
	 tvmyjna3P1J7jY0wsOJtm7cdt0tVw3HkSzBQb2p5zra/2Vhq6O++y51raBEco1Tz59
	 WaAcp1FoDYP+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEF338232A8;
	Wed, 14 Aug 2024 14:10:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RFC PATCH] riscv: Enable generic CPU vulnerabilites support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172364463625.2278280.12786224959163993278.git-patchwork-notify@kernel.org>
Date: Wed, 14 Aug 2024 14:10:36 +0000
References: <20240703022732.2068316-1-ruanjinjie@huawei.com>
In-Reply-To: <20240703022732.2068316-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_071038_794288_861E6A79 
X-CRM114-Status: UNSURE (   6.13  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 3 Jul 2024 10:27:32 +0800 you wrote:
> Currently x86, ARM and ARM64 support generic CPU vulnerabilites, but
> RISC-V not, such as:
> 
> 	# cd /sys/devices/system/cpu/vulnerabilities/
> x86:
> 	# cat spec_store_bypass
> 		Mitigation: Speculative Store Bypass disabled via prctl and seccomp
> 	# cat meltdown
> 		Not affected
> 
> [...]

Here is the summary with links:
  - [RFC] riscv: Enable generic CPU vulnerabilites support
    https://git.kernel.org/riscv/c/63dd775cc050

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
