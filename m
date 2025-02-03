Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9FC02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GZC4Bc4Y9BSZ7iql8Y/iIf/HZy6VFA4OUInbsJSv+g=; b=GeRSGvq2JF+Pqj
	tYvVWEP7rZOzRcqdNWBfSCfq1ZCMj5jU3gd8FwDy2to+IymdmDGOXxNYS9liGeEpOcQfg6X892Uwg
	xYhkAPhukE8WPzGy4tpc0/lRmV+QtweLrUjTf2dRozXXUBc32f2W6h7ml88rPY+GDjhBW9e0NNvcM
	Myd3DMDe5hUTnM36EKJageEAABTu0tP3x4Bu9gNJJjtX7dfMgsHGiWgmthrfARygvXi42ahPn6ZPE
	iuwuhBn3Q8EswJ/W5oqDW70iqK7Rj0JRYcglxX2m+/KX+LupzG53d88RmtPCzWPih1U+omJ2WICwf
	dgNA/kIv0AjVQYRyFKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1zt-0000000GS0q-1UbK;
	Mon, 03 Feb 2025 19:20:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uq-0000000GQFU-0q4L
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 395D4A41C0E;
	Mon,  3 Feb 2025 19:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202F2C4CED2;
	Mon,  3 Feb 2025 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610127;
	bh=KSPtOuW3Y7uccCGPaz4N71aPVV/qLhJF4x/HtTZprdU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gbsokPPOVbAr+hxpRjIjdqcnKS1OFLw8GFFoluTtrExBNLY5rOPJUKQYmgP/AeWE/
	 UFHoJ2hP4/KozSthIcub+Hg0FdVir3qx/B9fqaNV2LwTjw3mt1EnxlIVMJjizpaUfq
	 2vvdT98DmNVkppjCml1GIvQK47rCZm95Fve8BN5c1d6FMoOQ7g6TpZkhelj7Tpqdra
	 3xWna/9xhy4H9t2pH3QTgoYWCwOr2sNp5ffKSsRpJrgZA2DZlnLqDlt/x0lqq3GWKQ
	 Qyx9L0vSC/zdLO9fCL+26suauKkZGBikBkdRtR9l1IABnxIfgTKGLpmKlDbw0duHzp
	 nyGju3Agg2VOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CC7380AA67;
	Mon,  3 Feb 2025 19:15:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] tools: perf: tests: Fix code reading for riscv
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015401.3409359.1963171242133274809.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:54 +0000
References: <20241219-perf_fix_riscv_obj_reading-v3-1-a7d644dcfa50@rivosinc.com>
In-Reply-To: <20241219-perf_fix_riscv_obj_reading-v3-1-a7d644dcfa50@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111528_303672_EAFFE455 
X-CRM114-Status: UNSURE (   8.76  )
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
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Thu, 19 Dec 2024 13:44:25 -0800 you wrote:
> After binutils commit e43d876 which was first included in binutils 2.41,
> riscv no longer supports dumping in the middle of instructions. Increase
> the objdump window by 2-bytes to ensure that any instruction that sits
> on the boundary of the specified stop-address is not cut in half.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v3] tools: perf: tests: Fix code reading for riscv
    https://git.kernel.org/riscv/c/0f9ad973b095

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
