Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC3C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB3nUyHx7WvhYMENc/1bqrMdBncqHif8N0g7YM+4PlE=; b=lkjcG8EG3esKpv
	rvALc3YQrEIEDN+GgqZjA/UhRBEKqDh1MFU8hd+aFO/Bmt3gg6S5I+3/o+JRH2P+Rq6Aucp9rJy2c
	jdFJ0IY5wjofV3jsZ7tmc15vY+RaUWcTvubZ4LrzKvEcIC1IY+Oc65Ld8zkotimHHL0aGxw/9ZOZL
	cWXbMj+J0fx7ZcG4mHDV0o/YddFBMxZiR25TuKMoBeDkXrk+G33JW7c8wxJpj4GkMxsXmC/fATFdu
	ZPSUpHEFhzbZCxlOlq9ZW+miUrJr8W3OT6dTXrWbTzxumvn7Za9t8S75CTROzeH1P9x11s6hzJgqF
	ScnOqU+mZDvvvCffUPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pI-005fwY-2h;
	Wed, 19 Apr 2023 14:30:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pD-005ftH-30
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E285C60F76;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48E30C433D2;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914622;
	bh=M70RX4NCruISu4PxvB6EcGl+QW8E4STaGkaa4S6an8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aAWM7ZqJRuVsph/2fNLv2Zwednvp3qgyDgiKT1CBbAv3qcSoLjfkqejb+GX8d3hJa
	 Vp32YeEApyxftA2PFG3bdjCzmLtsj1FLyT0j5Uy5YCRZunbBMdJY9quc1KI1B87FSn
	 aKttwMZlbQ5yd4fjYHgMnO9QVGTSjwamvYxykvolEg0M39Y2GrKJkc/X8hXQdKXfRC
	 ka4pdQOjG1NCx1qU2K1EUhBPrtPWuGv1eJu+APBgxa8+u7Jcqmh9Qsil18kaZ1lMFg
	 poVC+fcatl3MPzuPXVJLY89AzC0U9rK1BlNpCNxmXsRtnK4VNC1WjaQ1QU/LwUtTAP
	 /IBsLKFhufR1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30BC3C395EA;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Kconfig: enable SCHED_MC kconfig
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168191462219.22791.16015879723160274958.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 14:30:22 +0000
References: <20230310110336.970985-1-suagrfillet@gmail.com>
In-Reply-To: <20230310110336.970985-1-suagrfillet@gmail.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073024_013558_3E375712 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, 10 Mar 2023 19:03:36 +0800 you wrote:
> RISC-V now builds the sched domain based on the simple possible map.
> 
> Enable SCHED_MC to make the building based on cpu_coregroup_mask()
> which also takes care of the NUMA and cores with LLC.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> 
> [...]

Here is the summary with links:
  - riscv: Kconfig: enable SCHED_MC kconfig
    https://git.kernel.org/riscv/c/8bf7b3b66762

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
