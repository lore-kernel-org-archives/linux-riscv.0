Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0CEC021A8
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBxFpQ3v+j/w8mD76PxcqfBALlBnqPmx1lSW5rA/+c0=; b=Oqbd4bomnyB0kd
	wKjJHR414Gxa3Hha0s/qefz09E5CpWJVUKr+TX2uSLVglBOPzymL5iaZHhDtm4PB4bw+k9NXa6XZJ
	hF6cxaC+J3MK91hkfczK9DlQJVszepbEWkbNLfhJmLhk7BVyQQ8jgNJP2dx/mgg2gvzwdMP+ddI5/
	CUofKfKJjWHf3tjT1xRnTjzzyQh8ez/o1p0VUORY0dO+035NOjTSm6oqMbdIuuttB4Qg4ymYccSTq
	YXQoDgSbaaWu8bs2RfFBKWuHM7acVF3Ftm9hTsIpghJZt42bRtliy7rbyW8CPddzeWNoryRDbbi3H
	BcbJ3dodsfi4i4ef5/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezx-0000000CQAH-3M7Z;
	Thu, 13 Feb 2025 19:35:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidyW-0000000CFF8-0D6o
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 023305C55FF;
	Thu, 13 Feb 2025 18:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F30FC4CED1;
	Thu, 13 Feb 2025 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471411;
	bh=/I8XkFmjwOBQTCuYuYfxvzqCS/2fPW2XvfbBm4xgaYI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=drEF+5Gqd9C3Gj+IA8Y4eE/tnDMTw4O2y0XCMkVSrtkyIQWzbYIjIVchJ+3TZ8Jwq
	 /nuvz3EaI7GE/IYgRzKEc98AeJQVLF1+epcm43D5PUMyjgfze9eDBwZ5mcfmAA87XJ
	 5jvJ1mOixLiMU4RPXU+FDiLrvzvvzXSKCxaivxaVXAqlhknssOFen9b1M2EVfsCJHF
	 oiE6u4XOaNyhYl9olEgiFoqcA04pNxz6RmSQPfXErFM6dSA4In+O0OTmSMfC7AkshY
	 JYvIbu7y9JA7YeMz4nSJ4TJlp2SqbWpwhsbQlKT1lsuMRJWS0miz0bH0pW/7kt+u6l
	 oUGctlkF754Fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE580380CEEF;
	Thu, 13 Feb 2025 18:30:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: signal: fix the size of signal frame
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947144024.1330575.6054499758611770955.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:40 +0000
References: <20241220083926.19453-1-yongxuan.wang@sifive.com>
In-Reply-To: <20241220083926.19453-1-yongxuan.wang@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 greentime.hu@sifive.com, vincent.chen@sifive.com, AndybnAC@gmail.com,
 andybnac@gmail.com, zong.li@sifive.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103012_157565_1986B5A0 
X-CRM114-Status: UNSURE (   7.38  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 20 Dec 2024 16:39:22 +0800 you wrote:
> This series addresses two issues about the RISC-V signal frame size
> calculation. PATCH1 removes the unnecessary header preservation for the
> END header. PATCH2 reorders the apply_boot_alternatives() and
> init_rt_signal_env() to get the correct signal_minsigstksz.
> 
> Yong-Xuan Wang (2):
>   riscv: signal: fix signal frame size
>   riscv: signal: fix signal_minsigstksz
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: signal: fix signal frame size
    https://git.kernel.org/riscv/c/0eeb13956757
  - [v2,2/2] riscv: signal: fix signal_minsigstksz
    https://git.kernel.org/riscv/c/5338770fc74b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
