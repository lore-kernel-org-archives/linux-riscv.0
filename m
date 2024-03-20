Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C7C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfoYJma94eOCQ4VpF9Gw7qKupwkQK4fJ2Jb0vFCIc4w=; b=uxdrqUFRFrawaD
	r7yiwT3beuE3u3ZVn25r4HyQJcw9WfgWn6yo3+OFStKeGri7iXIEfLYXA+YBbjTAo4EHIBtfF6hWF
	klNKcGaeEIJhxqtJ8sL2PzHS7qY7D4oCfM21V3zVQIT/3dY8X+Hv0zA9ZW8jWK0HuSq2Yy6FmR+6W
	pvT16d+9L2QaOuHK/C2XcYa4UC+TKYjehBh9ZsxccfoljsmfXF0Q/Ckda2pxEC1HNG8p6ek7mKAXc
	iTomffku/jyOALXpM+gSwG7WlR9EGtJ2+lwn6NRKCwcB0rAtCSetlrxi2yVq7lbLZBv9GwUJ8B1CF
	BJiA9/lhMh2370UvsDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tr-00000000w4G-1p1K;
	Wed, 20 Mar 2024 20:51:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tW-00000000vpl-3VKs
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89052CE0F2B;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17321C433F1;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=unp53PjekzZMC/5vEoDX88dY1TMRGKCJLqvM+e32nrY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KPvhtzoff/CyBMTlGfR9NwYwpWRBtm25NWFcHyo0ahqdA2nGfogYpX/FBXrLuVU7v
	 iULJfq45x31mUbF3xLfSuN+vSeW/vOk6hnXwzgDTxFkXGZRWiHlZ/P2+4VenOKSyV4
	 o4lvpUgtuiuIyBI3/Y1C6T88zfPvDY+TEZjI+ZQqt/6HJv2kZLOAQQdgA/Qp6CpzLw
	 X6qu0bnnh0cxMJ7VCgAvNdePQV1OT3ufPqPoECYObsC9YkV/Qztr0S6NgoWY4vfCiD
	 JiudvBXgXe453vGFfQgD02RktoTGZdFIpB+VKROw0zv7rsWwiprSC1i2lz80i/HUGK
	 2B0+7GS0HtuhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0A23BD84BB0;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783903.6804.2033008831254517156.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, apatel@ventanamicro.com, aou@eecs.berkeley.edu,
 rafael@kernel.org, viresh.kumar@linaro.org, atishp@rivosinc.com,
 conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 ajones@ventanamicro.com, lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135043_271778_B02E904B 
X-CRM114-Status: UNSURE (   8.01  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  8 Feb 2024 09:14:11 +0530 you wrote:
> This series enables the support for "Collaborative Processor Performance
> Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> encoding of CPPC registers as defined in RISC-V FFH spec [2].
> 
> CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> enable this, is available at [2].
> 
> [...]

Here is the summary with links:
  - [v1,-next,1/3] ACPI: RISC-V: Add CPPC driver
    https://git.kernel.org/riscv/c/30f3ffbee86b
  - [v1,-next,2/3] cpufreq: Move CPPC configs to common Kconfig and add RISC-V
    https://git.kernel.org/riscv/c/7ee1378736f0
  - [v1,-next,3/3] RISC-V: defconfig: Enable CONFIG_ACPI_CPPC_CPUFREQ
    https://git.kernel.org/riscv/c/282b9df4e960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
