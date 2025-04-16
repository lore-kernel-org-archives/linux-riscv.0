Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A18C369BA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6isFVK6hYGUcUMA/qVXKduxx8TjXXwl+doFFUw0mz9s=; b=pdCb5vh/Ztrc4+
	S32GbW1S2qnoaWqQWtgVc3o2A7tKvroRMxeSMmwAEIyNlwjM/SM/LYsGMYddrBUTuO4VmiSRf37TP
	q0tHWA3KvX8evc0nZbbUNkdTthMSAa7HiNEc9FxWsau9CdBsYOG9H4TRO7YUNVOa1awh3BTz0Jkul
	6LyXX9iNLp8I0GoQzNLKZK++ATt7Co28fd4sm7WU7zTA+9GEATkTFgGHnZnQxDiZUOLK8Y/yv/x2y
	bvJdtQEL4V2eFuHZGpnlLn+IJtO9tXvgg/OhZi7V8fts9F0jq0+j6JpNglkuXLIswxnDYB8GZikXN
	Q+GdUAo7HF8aAfOJs9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iV-0000000Ab19-07v0;
	Wed, 16 Apr 2025 18:42:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57ht-0000000Aarg-3Vg2
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 18:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D41A43FEF;
	Wed, 16 Apr 2025 18:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393EAC4CEE4;
	Wed, 16 Apr 2025 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828917;
	bh=Mp/wib5BAqlkaggzGbmMacYQ0EBI4nk2SmqoXlgnLC0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NKOvucS14HyNLr0slfQgUIdYKqudutud5bBP3d9g8HQNMP0c53FGwsSSSQlK7gaVa
	 ngBT6TLy60kHPC2bJ28g5E7ogkcPEx5bee2vPLFsWxwZYRMEBjhlF4k5fcsbHY4JoO
	 BYia8k9ZsPYb9QVdCHkT8ve2qHV6nWaIYhUurK7SkXMQitm8l+GkYxvsGfyVMZmFvZ
	 tPmGeNe1ny1coAgC7QJwKoz6WH1k/V7iuN8zGao1j01t77OFH1hOenmYgiMfWlIpQq
	 yEIzCrkSbLE9CZVCRQw9i1QndJwUxgYcQ4AiYI0r/ZNNhZgr39UbsXZopw8twuCasY
	 XVYzj7HtppLjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C1F3822D59;
	Wed, 16 Apr 2025 18:42:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174482895499.3460781.7794582579733916217.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:34 +0000
References: <20250409171526.862481-1-samuel.holland@sifive.com>
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr,
 ajones@ventanamicro.com, pinkesh.vaghela@einfochips.com,
 pritesh.patel@einfochips.com, darshan.prajapati@einfochips.com,
 aou@eecs.berkeley.edu, lixiaoyun@binary-semi.com, charlie@rivosinc.com,
 cleger@rivosinc.com, ruanjinjie@huawei.com, mcgrof@kernel.org,
 fido_max@inbox.ru, rppt@kernel.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114157_893919_8EB00B86 
X-CRM114-Status: UNSURE (   8.13  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  9 Apr 2025 10:14:49 -0700 you wrote:
> The current code allows rel[j] to access one element past the end of the
> relocation section. Simplify to num_relocations which is equivalent to
> the existing size expression.
> 
> Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/3] riscv: module: Fix out-of-bounds relocation access
    https://git.kernel.org/riscv/c/0b4cce68efb9
  - [v2,2/3] riscv: module: Allocate PLT entries for R_RISCV_PLT32
    https://git.kernel.org/riscv/c/1ee1313f4722
  - [v2,3/3] riscv: module: Optimize PLT/GOT entry counting
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
