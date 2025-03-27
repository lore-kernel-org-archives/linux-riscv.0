Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06E9C36002
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgescHyr8zVrYoqvGMk9iY9hfXTqSKASSTzItj3yNHo=; b=AdykYzpQ9bGS8p
	h+uc97BrKlfNqLhOrA1bVO6N10PoHRIzaX/usXlgZeyP3IcK17lEZaamVZCGXA2E3ckze1qsl7HOr
	s9+Tg6BWNLGNAk7inKOruqK899n5lQmS1oYXPsZUTux8p/F/2lOLon8RzlvqTyUB9w/KUwyma1OXf
	dLUwARmbJnRgN3C2YNURi2ZlWfoDOpYkGtDqMNq+a3gql7/GhQGliLlRENDgGmEh0mbzRxPGWb+Sl
	EKxl/x9ks8BhMRghF76/KXrXL5NuJIRGMX/VV8CGiWjN9ncnENiirfpi3DIw8s1tUtqEMTsYG6PY/
	jTOHZZXnGfXlFK8bGDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqo-0000000A4EH-3Pgw;
	Thu, 27 Mar 2025 03:24:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqm-0000000A4BB-2E6f
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2623961364;
	Thu, 27 Mar 2025 03:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A912C4CEE4;
	Thu, 27 Mar 2025 03:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045851;
	bh=wXE9QT59mwlhkHqahXpOLcJNBYIg8SFZbH6Sj2GDj4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Zxx65NNz6L1kpnGHFGxR3A9yIEzvl1KTson/KzYFg9ibzu8ehf/ccJro0DEgtpKfB
	 qNnXNhnalI10unGtYno8swsfZ6vjN/nGKq0Myw1kXEOBIfWbEADl89+YvvYhgXDJ5C
	 SYZoMQro3z0k2L/C5b8HC2z7sy3Zw4g+DmadmgO/xkmeSHwRy/hW+lIhXGezNA9asK
	 nelEm4hziAaIF3p+aRVYA/VD4P0GV5iF5X6NwYe4qXtJcXeOMl9r7nbTDStlo3A5ea
	 YI5imRWK80VArnhon+vfEDsz40NjFS9EhKzvsc5x3TMlQW2qjYuv1LRojZw+LJABQO
	 puQqatFiBlOQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C0C380AAFD;
	Thu, 27 Mar 2025 03:24:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER
 depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304588775.1549280.6265955912800341807.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:47 +0000
References: <20250317031214.4138436-1-pulehui@huaweicloud.com>
In-Reply-To: <20250317031214.4138436-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, bjorn@kernel.org, mhiramat@kernel.org,
 rostedt@goodmis.org, naresh.kamboju@linaro.org, pulehui@huawei.com
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 17 Mar 2025 03:12:13 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Currently, fgraph on riscv relies on the infrastructure of
> DYNAMIC_FTRACE_WITH_ARGS. However, DYNAMIC_FTRACE_WITH_ARGS may be
> turned off on riscv, which will cause the enabled fgraph to be abnormal.
> Therefore, let's select HAVE_FUNCTION_GRAPH_TRACER depends on
> HAVE_DYNAMIC_FTRACE_WITH_ARGS.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: fgraph: Select HAVE_FUNCTION_GRAPH_TRACER depends on HAVE_DYNAMIC_FTRACE_WITH_ARGS
    https://git.kernel.org/riscv/c/e8eb8e1bdae9
  - [v2,2/2] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
    https://git.kernel.org/riscv/c/67a5ba8f742f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
