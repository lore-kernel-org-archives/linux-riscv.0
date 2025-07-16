Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFE7C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApmIGwbh7/L8yP02jswXzSRH0XO5xgV/HP5TQ5Gt3sE=; b=CirbSmTTrW2X3U
	OerhXCfajMl5Lc7IrqPNXd2HmVZjuPmIsxGxAYqxdmCujDm3YTUqDKYaD/UVmZqBdGubPRqaa7CIo
	OCiHt8jrJktLWSBUKqzkW0izvewYOK7HiyxgbsS0TES3SqRt7+8LM29977+xLYslJ3PUcVC9gNFJb
	MbUbVOQ+MOMHm5J3g51jI9J4FFs36W3m1DT+vRohfVJ5sqncs85LQPD0qDglfIaV5XYOIpC+fHAle
	DVZn9ld9qNcYN/JWrnorrVhNULOLtvX6AHjfGPX5kKF31rsUQdtSJc4OwKK/2R3yDWzzA1gNupXtf
	czQag+fM6tCl6AEIfu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Df-00000008eXr-30da;
	Wed, 16 Jul 2025 20:59:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8IC-00000008Yyo-0LV6
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 19:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0FBD44E2B;
	Wed, 16 Jul 2025 19:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE87EC4CEF4;
	Wed, 16 Jul 2025 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752695991;
	bh=Ba0/4wUdmvPvCviBJEMcf2bCt1YkS4e1WEYt99/unjk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u1wLoGopkpLIPzP3iXvGEZfATpbpuPYqmMlf1EQ3b/YBcKoXbeSnoZnbTpno37Toq
	 uT0K/GO4mSczBvCeCheS2ZMjdXY3ec+JRl6UH31bAEdi6idEdShQrfWDJJ0IOsv7iS
	 Et7p8MDbEunOS+FbR2Z2gTBM1sdBrHhpx66MrMP8wLime4p4cgqc62KmhRgdQd7IM/
	 W8QNLXV5xlc/atdnav+9XrJ1M4Lo+nW/QVarnoEtx31EEdJQeqAF22oSk4atzZ0T+p
	 gcPmcbTqhu2P55sAPh9PkMW5dC8QshbsZpm5nNdEaF4hltp2d0cXlJFytHfJ0Aigjf
	 ekpUutBZWUNEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6C383BA3A;
	Wed, 16 Jul 2025 20:00:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] ACPI: RISC-V: Remove unnecessary CPPC debug message
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175269601173.1308944.6913257148834233964.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 20:00:11 +0000
References: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
In-Reply-To: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr,
 rafael@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_125952_144967_FD9C88A7 
X-CRM114-Status: UNSURE (   8.81  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 11 Jul 2025 19:30:13 +0530 you wrote:
> The presence or absence of the CPPC SBI extension is currently logged
> on every boot. This message is not particularly useful and can clutter
> the boot log. Remove this debug message to reduce noise during boot.
> 
> This change has no functional impact.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - ACPI: RISC-V: Remove unnecessary CPPC debug message
    https://git.kernel.org/riscv/c/16d743606dba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
