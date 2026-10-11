Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E586CA9ECF
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9iN/QPqeI735upnQURfoUmVMPg0LarGR6MswnvUSuo=; b=ioQ+iuk+sL6tOy
	G/qc8X4ZJJegb9NFGYhmoP5b2EfOEN0WzwKHCNslFQ0G4U6VqodA4GpucKHml8k3XZc7SJgmGsrYS
	kleENVMhK3VIXMots6dNyFUjbcdr9Cb74SZN5X/HhTJ2fh4a70mzOY3y1rHJpAShTixAGT4yBSyGO
	ySx4+5VnN+ecD6tWMiHdD+SSBqFj2OBGwtoMtZe8PneY2z6DIEsSE32cTiyM5Fld2uoECZdxwP6FQ
	RymY2aPkgBgQxqwZGbSnxpHpyC3eouvL4uoOTAHJdkIT1/z7QyiqNuJMIMrYkCJdq6B4ZSfdwhE/z
	kXhaU3imIytoLrbBxeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtmj-000000094bZ-2LvM;
	Sun, 11 Oct 2026 13:40:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtmh-000000094a9-3DrN
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 13:40:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF7E60142;
	Sun, 11 Oct 2026 13:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BAC1F0089E;
	Sun, 11 Oct 2026 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791726014;
	bh=2oGOihFMlH14ZPOxpdZxrhS1kLVJsNn6JIB838S21Ys=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eiGyXw8addIgPocbNupwcasKriESzdKqLi8+FsNiK0vCg4EbY2axe+5UzxM/6qO78
	 JsKWUQI2kG1cZDpHVAvKf+OauR6h7gCaVhiQ474i0r+0gl8m9+F0MZPQGuNhuAcUzM
	 6cNu31PoMpoDrSjKLRGy/wdw1xMdQyPniw4tEZfpH5Bn2KFwcNuLXL4GHWuX6fC0z2
	 dTNBhvYwpImUcIVJ8yE8tlN7FpKnJNNxUIm7AVWF9UgZLqIDtIG4m9R64kEwEooby5
	 0HHlVMlcRZeYwH+913JYKQ3TOv4Q4b/m9JB6bqaJ8d0l4Bz9Nn7JSKaTl2OuKGvcpt
	 Oi2d9/raahXog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 770EB3811966;
	Sun, 11 Oct 2026 13:40:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf] MAINTAINERS: Add myself as co-maintainer of riscv bpf
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179172601303.2055679.524571324990468455.git-patchwork-notify@kernel.org>
Date: Sun, 11 Oct 2026 13:40:13 +0000
References: <20260930104659.1919027-1-pulehui@huaweicloud.com>
In-Reply-To: <20260930104659.1919027-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, pjw@kernel.org, palmer@dabbelt.com,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, pulehui@huawei.com
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 30 Sep 2026 10:46:59 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Over the years, I have been actively involved in the development and
> have proactively taken on maintenance responsibilities for the RV64 JIT,
> covering the related bpf core, riscv architecture, and selftests/CI
> infrastructure. With the continuous growth of riscv bpf features and
> testing workload, adding a co-maintainer helps share the review burden
> and ensure timely patch handling.
> 
> [...]

Here is the summary with links:
  - [bpf] MAINTAINERS: Add myself as co-maintainer of riscv bpf
    https://git.kernel.org/bpf/bpf-next/c/10aaef818b15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
