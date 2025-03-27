Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396D9C36013
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qakN9PuJbCHmiC+I9Ktq9yD++zix/Hfi/YALYUe/IOE=; b=dKcuOeAqrq0k7A
	aoX5pd0gXTf2oHAR0vbiE4Sqv1T8o5SCvOHcVYw/ZWae+g7yShbJ4pZuSOs9+1K2R0m+azMzcnFyZ
	Csay43F27nrJllve0s77M26/7YePtkgiloNTPVC/kqFFg0d3UJZbTkqDJO7qg5/5EftnqTEcjB7+i
	w0PWb2y6cKxZdLhB0sNcvlTsXJ4a3shYqHn/2Dh7b+46Ct8hHF7xugsybHIe8re9OAErR8DDLv3/2
	+xSdgRyTkVRLm2aGAWvZ3bDDtDy13W5/bvspBp1enm/2Zcj2JlTBw78xojJio9nkL+pZaMWYz/lH/
	StXTjWpb7jioih47POVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf15-0000000A9vC-1v9L;
	Thu, 27 Mar 2025 04:38:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqz-0000000A4Uy-3Ff2
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 314825C6838;
	Thu, 27 Mar 2025 03:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE63C4CEDD;
	Thu, 27 Mar 2025 03:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045864;
	bh=KuzdeSU+gWliFwXow9YM1xmKtoV0AKeSOb/fjjNgCw8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KA/4aDycKbZD2jNKPjQ7oXD30BCvby0/dSDk/wFadtlFNakcp9s9PszHCctdNrDkK
	 q0vWWVYVOipIkVUdQ5y6mePwkbQWL1m2jaArlJeelCOy06NPehhK3dOdc4adVFiDWH
	 Ng6mpFg7+AOXWROiYnedkJJmkGCtdpJUcPZsJ7yoQPx7G9RtDzIwWLE8KA5gXvloxr
	 m5PErBMmm2u6KBce2WPRW1DITJti4PaQBUyW3QsyrmkQGTZFPyKnNMAyIjeD81ZwqI
	 WK+FFJLB16AJPxd68Yh6GZaGD6V83FIBSfvCe63CtJpYiZiwdqy4Nn7QqyDQRn+Q1r
	 VX+gc/nE1er4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71121380AAFD;
	Thu, 27 Mar 2025 03:25:02 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: tracing: Fix __write_overflow_field in
 ftrace_partial_regs()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590100.1549280.14019445612094934083.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:01 +0000
References: <20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com>
In-Reply-To: <20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, oleg@redhat.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202425_900245_06F3D0D9 
X-CRM114-Status: UNSURE (   7.47  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 24 Feb 2025 18:42:21 -0800 you wrote:
> The size of &regs->a0 is unknown, causing the error:
> 
> ../include/linux/fortify-string.h:571:25: warning: call to
> '__write_overflow_field' declared with attribute warning: detected write
> beyond size of field (1st parameter); maybe use struct_group()?
> [-Wattribute-warning]
> 
> [...]

Here is the summary with links:
  - riscv: tracing: Fix __write_overflow_field in ftrace_partial_regs()
    https://git.kernel.org/riscv/c/bba547810c66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
