Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3A2CE7D12
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nG15GcfJViCsA1Qa3UCUd7hOr2LXjA0e2n3YJo5KD6I=; b=NT1o6Y1WLS30m2
	rbs9avVEznQmndur2CNAuIczugzF5TMGpYXnZOMTyRXenEeA2GxwlA/W5tUyxeR0/yQVK15QgJEkk
	+1yq23XBPy/dXeUNc+nEEtVJOzzkKhUZSpcDvLWqXGLFSrEPP8StTyQm0uj9ngq7R8q2qcjx0oo3c
	B2bZnZ3Aebs6F/aacsRVWntv10V7m79ll9LVswk1W9yz5V00B2G9SZhWx0iC0t/5UWZspWlVmF4MT
	v1UM9csBucFs5hDRLnlMfS7RdxQY1PqWIgbW9j2Cl5nzv273gki2CCqeyW658EMOSu8J8+n6yev/k
	Q6ZlA6hhoTGwqtINLRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPa-00000002aaI-32aq;
	Tue, 01 Oct 2024 11:51:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9y-00000002XM4-1Pcm
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9D8DA40E62;
	Tue,  1 Oct 2024 11:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AAAC4CECD;
	Tue,  1 Oct 2024 11:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782516;
	bh=01KB6tP7Ie9eCPsnc8LBlGs1DaUFNLllcbFhYKmsJr4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hPlVhqJG7jLpuHC7koENBe/YwLTc0TzkCe2z4oeLZH5jYArcFHOJuBosc3a0j07Je
	 9LfB8lwebZNN/gHZ7zf4eNjGvyvl3bFrmYT1QTdnOoY01BFLwLoE3+n69iVqii8eLh
	 tEruN+7lrTFHdCjSRBMfmfGPvlsyz2ALnzXLpzPW9F2jCu7t6nv0Ntxrhp/SdSc77u
	 bHAYpkFO8s0CJK2CKuWRl7mJEGd8wddbW4kAhocOwRWZY4/UyKSoVHHkzWPlU9HmHo
	 irhbe7djKCA586KuxSrkMDKDZmMNsgcSgrJIHcqWuDRaEc/KmdNN81AiLckQGn4hkk
	 wSBoLeFE0kkaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0D380DBF7;
	Tue,  1 Oct 2024 11:35:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: make riscv_isa_vendor_ext_andes[] static
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778252000.314421.4988733398467937549.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:20 +0000
References: <20240919061524.264007-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20240919061524.264007-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 charlie@rivosinc.com, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043518_479318_1C0C3ECD 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, 19 Sep 2024 07:15:24 +0100 you wrote:
> The riscv_isa_vendor_ext_andes array is not exported out of the
> file it is in, so make it static to fix the following sparse
> warning:
> 
> arch/riscv/kernel/vendor_extensions/andes.c:11:33: warning: symbol 'riscv_isa_vendor_ext_andes' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> [...]

Here is the summary with links:
  - riscv: make riscv_isa_vendor_ext_andes[] static
    https://git.kernel.org/riscv/c/594ffcf4efe5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
