Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD5CC3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoChULj/JyASrYyjkwlBHiwaKGRy7630GJBNSGtdV7w=; b=EQlg95e4/RPjIC
	ect9UKjXQI7Ysy0wavu2QNdtJwbRMn5AV+HIw6Q33XS4OTeRu/mYd3HdWrj4UjZT60ZQloMHOM+0M
	LefcX/ptJG+7pzPW2UA5ZLfFZhO9L/EwlzlbOBBkYM1+Y8OAN+NL/IKr/Rr9ixI3A8wQ/o0ij5fH8
	9HmozzD/mIxfsX2YM+5ZwmwBgTCUH3d1eoVplbfzBD0JBH3DmpWONX1Z6IJO2fvsKiNvF2S+TW5UW
	MA0tBymWDGBFHOOHyyHYUZnwahUp2CJPtG6ktgSwGJM5XdDlN7MYXnXHVM8cla0rjZ7QSQ/cwATU2
	bVzLEXsJajx0WYcSHOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6H-0000000CRIn-0YGN;
	Tue, 23 Jul 2024 12:58:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6D-0000000CRFT-3vwe
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 12:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B55C960E03;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65238C4AF0A;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=MTx3Yhz4wCNFxt8epbAA+GjuRUdAILMPbUYRovO+OVc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EvM9r+ot/ByNtKDgPHhwxfEsiOgD4qLC6dq1qmja/+WdFIrl4xj66LA2lHHLu3A7s
	 Vh1mpUIK0mz6uE3vha64vJ92/bKZZX99FT5T8j5I8RfCB569RIG2WmXhiAYZL3Ywse
	 riEwoL1MFv3mLyyQx91gFKaImpaatwMSd8QA5HdO9hBsrpazm2/AWgNz1MZMJK0B+b
	 uSZnpkq6SnE3lKwvxOiHhIVbNcnBa4O460CvlkdY7XX9+vxWiw/ZHD+D+U/2iuJEBM
	 ykWieW3hr/pcDBet7rtdnUxPhV2XPOFVquB8ahQevZ6zA/uYhdQ7SMaOqxrHFcr0fb
	 hotRk430gHSYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55C55C4333D;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: hwprobe: sort EXT_KEY()s in hwprobe_isa_ext0()
 alphabetically
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951634.10883.1451787380987627929.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
In-Reply-To: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055838_065164_688308B5 
X-CRM114-Status: UNSURE (   9.14  )
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

On Wed, 17 Jul 2024 09:54:38 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Currently the entries appear to be in a random order (although according
> to Palmer he has tried to sort them by key value) which makes it harder
> to find entries in a growing list, and more likely to have conflicts as
> all patches are adding to the end of the list. Sort them alphabetically
> instead.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: hwprobe: sort EXT_KEY()s in hwprobe_isa_ext0() alphabetically
    https://git.kernel.org/riscv/c/3d8d459c8ba2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
