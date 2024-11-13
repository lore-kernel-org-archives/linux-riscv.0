Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0117D462BF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU71wyOCTm5ZOlb+b22pVYSvzgBjEe58dlYA01WnK7c=; b=iqOziIRWaYERI6
	gZDZovp77OuevxOmPIQRR/feQM+pN4GdcP8Y74lBt8xlk/wZamcoZwj7Tv2Srnx/sBieNEMgxZ0uP
	haDo9PiTShRla31yI1X62sORHuh4ZLiGRoMEtoRh+Ohk6yBQMp/xQzcz134KkhmIxww5/d/v2JWgZ
	SjIQKx+qdC+TB3vOOaHGAd9XbFInaCa11eJlZuVzFVRJP72GZRiWI9DOoKJ8aSCvPP5BIYJ4Jmg2J
	mwKzoVMM0ushEVQE2KWO8699tDKOXYrb5RtDQ+jGOccyBP7cg+CWUa0urMOOfatu2zu9pU43JpXeq
	+2VoF0OUMez7QdfXlkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF38-00000007FoK-0ZW0;
	Wed, 13 Nov 2024 15:12:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF32-00000007FlW-3di4
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 15:12:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 087DFA40D10;
	Wed, 13 Nov 2024 15:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEEDC4CEC3;
	Wed, 13 Nov 2024 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731510767;
	bh=4547KjisiSzSsjrc9K9ehuBqFLkQAd8IxQnZbpsV0Gk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ggfx9paO+4bEx7zmSlVE0vDRqio1zCqzgORBfpOkCAqrrMiuCQgnVu8ycPjZccgHk
	 NPXx7GgqQTSyvky00FVlfvHsWk4uxy2N5YaSythvwGEPT8J2AUe8Nh+vyX72tC3JCl
	 npCVzxG6OByH8+/X44+oO72MsXf2HQheSQ60QbwPXlp7jv8QvTNM1dVs32D/BH6VQG
	 za73EsK30mye+UXVZpnwZbAQ2mqCjX6W7SOo/FZqdGA/cHZLT7RAAbYCtpsDC7BT9a
	 RswdJoppNMpbF4SzVr9Vo9JDbKak3MCPGR1V9bBqyAclw3/YHj4L0xMP6F3rRAqmNL
	 7sn+JqPHGxtkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7118C3809A80;
	Wed, 13 Nov 2024 15:12:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH for-next v2] riscv: Fix default misaligned access trap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173151077824.1250875.1331896085573525028.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 15:12:58 +0000
References: <20241108-fix_handle_misaligned_load-v2-1-91d547ce64db@rivosinc.com>
In-Reply-To: <20241108-fix_handle_misaligned_load-v2-1-91d547ce64db@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, Mr.Bossman075@gmail.com,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_071248_990937_86CE331A 
X-CRM114-Status: UNSURE (   7.20  )
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

On Fri, 08 Nov 2024 15:47:36 -0800 you wrote:
> Commit d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses
> supported") removed the default handlers for handle_misaligned_load()
> and handle_misaligned_store(). When the kernel is compiled without
> RISCV_SCALAR_MISALIGNED, these handlers are never defined, causing
> compilation errors.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses supported")
> 
> [...]

Here is the summary with links:
  - [for-next,v2] riscv: Fix default misaligned access trap
    https://git.kernel.org/riscv/c/0eb512779d64

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
