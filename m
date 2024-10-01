Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DF9CE7D13
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULit1Ytzxv5YVnql0RhVoo8OafnaSDJq5H2ep1YxgGw=; b=r7WJfEhKN6UKPi
	+5MXZ/zs2lV6KFRZafOisbEUbVBp+3g+Q2DAtTEw/WAvZit1BIX3Wu/apZVAXFbEAYpZ6wEY/Oyj/
	qJCmi2hxunetmm7D48yCafKajqUvCwVbXE710AJ8XxAzZB0YKfKPqCCRcOv076ZcVQCCaefiEvzdO
	KwX1vLp5Np3wajBHQqwre9UCnXcruUiIlGIe4iS76EjWkjD73Ew9ACYVFFcCNvAi3jlURQ/Ao56uB
	3RC2PJ549cTa8w/eLA5uZmyxX73BkBEF9qyu08aCqAWITEBnbOrBlfDv7AU08aAJ+TspgJujnLuS0
	BqhLYEITHtOfxDtFlypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPZ-00000002aYt-0BZ5;
	Tue, 01 Oct 2024 11:51:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9w-00000002XLR-2ZJZ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0B0B5C4D92;
	Tue,  1 Oct 2024 11:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B5FC4CEC6;
	Tue,  1 Oct 2024 11:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782515;
	bh=zFp0mA2HtE3WYDbtuo+8PY2yrwj9xGaOQjAE9lFoJjU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IZZDyihxUOf+JFRl+cHlHQH9mvl/GN6SLBLtNlVVoxvfcBpQnaFV5VyODVzYwTaWS
	 5bfEax33lxYp2zOBc93ePwCW+Nk2G0bS4KURu8B5zbEHwd8T4A8iPnas+shjOe8tFd
	 +Ko85DHn60KjSanWFMLMDragz7qPIeGek1kEYzquAzAlw2sei+HKkw1Ffg9lDb00HN
	 MQ52O63JcGdQ3pAjU5Tl+CZUZMFIXynWO0fY7iMLUaX6Lr6nufbwYmG+0SjVVHUMpt
	 XpjyZLLkxIj0J+wnrL3Js7XsFeOhyrrRMDhhnsIvS43yQdU9uAqNRRRwKOLEHQz+am
	 2NygISOkjy5vA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE6B380DBF7;
	Tue,  1 Oct 2024 11:35:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] drivers/perf: riscv: Align errno for unsupported perf
 event
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778251849.314421.13652257933484643197.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:18 +0000
References: <20240831071520.1630360-1-pulehui@huaweicloud.com>
In-Reply-To: <20240831071520.1630360-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, palmer@dabbelt.com, bjorn@kernel.org, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043516_746497_C5EEB69C 
X-CRM114-Status: GOOD (  10.01  )
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

On Sat, 31 Aug 2024 07:15:20 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> RISC-V perf driver does not yet support PERF_TYPE_BREAKPOINT. It would
> be more appropriate to return -EOPNOTSUPP or -ENOENT for this type in
> pmu_sbi_event_map. Considering that other implementations return -ENOENT
> for unsupported perf types, let's synchronize this behavior. Due to this
> reason, a riscv bpf testcases perf_skip fail. Meanwhile, align that
> behavior to the rest of proper place.
> 
> [...]

Here is the summary with links:
  - [v2] drivers/perf: riscv: Align errno for unsupported perf event
    https://git.kernel.org/riscv/c/c625154993d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
