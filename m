Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B3DC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvJwTXHzAG8Vstt2323Fp4PgLb2d1MSt0NNQRTsyiWk=; b=bd/1xnyznK2Ctf
	7rY5fc55wp+YhsCnZODo+oo4Fg+wYo7tfQPMb1yQhWkum+xlB6m0uKBk0gF/wWwEJxRkVTbbDiSKi
	3FOjZnPQbc0MQTjVGWNVtqy05eYs090p/1WgrdCUNHFQVWbMJgbq6Y9py3eV3CfCnijJBpbVrFmEQ
	sUdg1/5tqXwNG8EUr0NuJXEhadMSWkLdRdLsC5PptvoO83IFsR9XF8kxCUCRf9J8nLo5krHjiQbRv
	PW/Wt4A5m/mKSne3loroFYte1H4+ZTnDINAz8a2NzGGlMbWP5w5ajzU455fVmpTLknSj/NgPoqMWm
	tzkc4Jd+xoc7GDJl+dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs3-000000067Xr-2Syu;
	Thu, 01 Aug 2024 16:41:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr1-000000067AI-17tN
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4B2362921;
	Thu,  1 Aug 2024 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4129C4AF0E;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530437;
	bh=d+0w/utyCeOUAJB0faml6J6Fo1KVfysprXdgsrmI0gY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iyEHzMtgm0NvIQ74RjpgOupB/46iT959lYS7ymDJRAYBuWh3U4AxFqUVRzL6CpWwI
	 iSUEdMCg1WFvGhPZmEpqtkP3RMvjPn+N4SXNtK+Qay3HdPzUQN/u3cTEF8vLFyfw4h
	 bQeFDPUkBw+hVaOBiWOozXjZsGSuYNA41lGtD9eV2OS/gK9g7K/fo7mfQP38lMJVww
	 XdaGbStyJbzXCf4KiMg/5Zwc1IcX4yYd6DjzzU2grDC9KHPa4e+PQe9oz6zHJF7iNQ
	 APvyGlX1XUpiRbNb83lgaw//eb4/kxMXMNsL6WGePpPyZ4H4xB2R0uIGnjC4r/H2TR
	 NER1moyfX0gjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A91B8E8876D;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv/mm: Add handling for VM_FAULT_SIGSEGV in
 mm_fault_error()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043768.13740.17412211332901181883.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240731084547.85380-1-qiaozhe@iscas.ac.cn>
In-Reply-To: <20240731084547.85380-1-qiaozhe@iscas.ac.cn>
To: Zhe Qiao <qiaozhe@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 surenb@google.com, akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
 willy@infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_094039_444084_D23AF2B4 
X-CRM114-Status: UNSURE (   8.91  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 31 Jul 2024 16:45:47 +0800 you wrote:
> Handle VM_FAULT_SIGSEGV in the page fault path so that we correctly
> kill the process and we don't BUG() the kernel.
> 
> Fixes: 07037db5d479 ("RISC-V: Paging and MMU")
> Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [V2] riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
    https://git.kernel.org/riscv/c/0c710050c47d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
