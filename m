Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7FAC2A09B
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 03:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f31yEfvsVx09vgze2ZviZFLM3PnXB8p62QIiescjH9s=; b=kmuBgbXP6bRma/
	/dfZp9aHdzQ3Zo0/vqUmS29ZeiUQnnWVgOW085tPlEzy8DEVapHj//DHDAoS89ULoY0Ai+mpgw7ny
	Z0I2K76gHXlgYkGKGp69fZdjVsB9vEjT4HuoSbDLTY9OvTHSRex8EGWcoTQX54MXFx6GAKtEhABqH
	iOKSndUPpCM2ANBgH1bguYy6rtBJrja4aiCqQkAYpsdpqlRUf/DceNSQZE76cizSVB+d7HeVl4o3Y
	owYrRppVd9rhoI6J/8Oke8WBqUFgzHV72xN+KHqh99pbV2B4Cnfg7l8Gym8beLJUPb+SispLojwg/
	LcQJSmoIeSfiOc3tziQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRsK-000000039bd-3BFp;
	Wed, 05 Aug 2026 03:01:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRsJ-000000039b8-0MPw
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 03:00:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 890E3432E6;
	Wed,  5 Aug 2026 03:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D421F00A3A;
	Wed,  5 Aug 2026 03:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785898857;
	bh=ba+vbNnDg7KEZ5mkKJOl95vmh2w9hWrKDPbB0eCoedw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JGIFxRCYCPlWG0G4Hk7AE2eI4xl4IO5QReLOsyMwhBg3ZNAw6oV4VymNBgNExtSLm
	 3DC6KDj9Enb1q/O9CJ/bWmV6EmNmwNXX/SJYWBknS1nhZP88qGaYKDA+FIOeYy1shh
	 5rBTeM65WYnVfP0edKMby7ZtpgzAg/Lde2UuXuHo3L6CvXCb3ieGbVQkPrfqgDFz+/
	 n9YDEXhw73CrFpCsedj0vM8sCTAFvCkZNIN9ZKwGH1+ftnRySn21kOQgoQQYNP0sZp
	 pHSwimau24LatlamoPqRRCgxjzRxt6+9idUT4WSyuhuvqNjMugpB+zYmv2IpNWV3zj
	 xQEPf6zsSSM7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A97392666B;
	Wed,  5 Aug 2026 03:00:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] riscv: Add Ssqosid and initial CBQRI resctrl
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178589881738.3892316.15531912831365778150.git-patchwork-notify@kernel.org>
Date: Wed, 05 Aug 2026 03:00:17 +0000
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
In-Reply-To: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, aricciardi@baylibre.com, alex@ghiti.fr,
 atishp@rivosinc.com, atish.patra@linux.dev, babu.moger@amd.com,
 ben.horgan@arm.com, bp@alien8.de, cp0613@linux.alibaba.com,
 conor.dooley@microchip.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com, gong.shuai@sanechips.com.cn,
 gsh517@gmail.com, guo.wenjia23@zte.com.cn, james.morse@arm.com,
 mindal@semihalf.com, krzk+dt@kernel.org, liu.qingtao2@zte.com.cn,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, pjw@kernel.org,
 peternewman@google.com, rkrcmar@ventanamicro.com, reinette.chatre@intel.com,
 robh@kernel.org, samuel.holland@sifive.com, bigeasy@linutronix.de,
 tony.luck@intel.com, vasu@rivosinc.com, ved@rivosinc.com,
 liwei1518@gmail.com, cuiyunhui@bytedance.com,
 zhangzhanpeng.jasper@bytedance.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-doc@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 29 Jul 2026 18:11:27 -0700 you wrote:
> [NOTE: only patches 4 and 8 are different in v6]
> 
> This series adds initial RISC-V QoS support: the Ssqosid extension [1]
> (srmcfg CSR), the CBQRI controller interface [2] integrated with resctrl
> [3], and a DT-based platform driver for cache controllers. It has been
> tested on both the Tenstorrent Ascalon Shared Cache controller and a QEMU
> implementation [4].
> 
> [...]

Here is the summary with links:
  - [v6,1/8] dt-bindings: riscv: Add Ssqosid extension description
    (no matching commit)
  - [v6,2/8] riscv: Detect the Ssqosid extension
    https://git.kernel.org/riscv/c/5f94a58f4103
  - [v6,3/8] riscv: Add support for srmcfg CSR from Ssqosid extension
    (no matching commit)
  - [v6,4/8] riscv_cbqri: Add capacity controller probe and allocation device ops
    (no matching commit)
  - [v6,5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
    (no matching commit)
  - [v6,6/8] riscv: Enable resctrl filesystem for Ssqosid
    (no matching commit)
  - [v6,7/8] dt-bindings: riscv: Add binding for CBQRI controllers
    (no matching commit)
  - [v6,8/8] riscv_cbqri: Add CBQRI capacity allocation platform driver
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
