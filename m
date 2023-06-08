Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA1CC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ruIqAA+d6NXvIMOGf7r96VxqFzyxbeWisBEcpIhbhs=; b=KtSi503O7fc3e6
	wzGnBhWDcF8LuviGELOSbWYyGWVFn4y0RweBUcXxPaqvNChuj+DcattZ0z6IaCVik20IbKWyo54C6
	PKoOdF4qoW1EYfjm86PjHM8brUN0cxG8mjJpMXjKvHoDqLTRdYcv+YXVuK+Y3lCnMHA9FTnlGqQeY
	8N7WYlz9Siynu5H4ISjm4fCH46dUbAngQSVowPBEKkMVp9JJNybrtOt/f9/hg+M8Onn0QBWbW+D0q
	psRuHDUXDdrjY7LwlqlWWGasMXe+zdPNUCn34GmWORK8mpCxQjd0Wr69BM39my9e/xR+yX4WiLQ6A
	mODEpKssHL/1vUWOcnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GLN-009aOV-1G;
	Thu, 08 Jun 2023 14:10:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GLJ-009aM5-03
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:10:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2110464DFD;
	Thu,  8 Jun 2023 14:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81B13C4339B;
	Thu,  8 Jun 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686233421;
	bh=Xd3JVUfizwLssTthf/9Gvh2qQZKvAiOFqy7tI7keDNk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cIzkcO3zg8NNuGcsWrNnl1tr6ee+koTWfg5u1zZBR1OFLh/9Xy+fHzJMaIkkaJlA2
	 6RylHxl2xRYf0a8H3ep2vuO1BpE7eDdu6WKYur5Mwishc6xkARj7VDmraV4OntNUw6
	 eAAmEIy87IUkdSmkfsK1+SfiGUY1xv7eR81W7yoh+GUpfWV53PUhm6svOHYccCCRAf
	 3/MBa7g/+s1rmN6ZzpQm3mwhfjdPTLyDSeAQ0dP3syNUr1eJgK27ucq7DLF/hTjNSz
	 bc1aUzjv73IdGgXukEYWAMv7awwNXrFbyXFIWQQGotB/lrTa5h8VsWsGZqixVABv9a
	 7BcjAnb1DVF8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67BD9E87232;
	Thu,  8 Jun 2023 14:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be
 readable
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168623342141.30670.4526253125262728096.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jun 2023 14:10:21 +0000
References: <20230425102828.1616812-1-woodrow.shen@sifive.com>
In-Reply-To: <20230425102828.1616812-1-woodrow.shen@sifive.com>
To: Woodrow Shen <woodrow.shen@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_071025_097173_1AADD44F 
X-CRM114-Status: GOOD (  11.23  )
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

On Tue, 25 Apr 2023 18:28:28 +0800 you wrote:
> From: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
> 
> Commit 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
> allows riscv to use mmap with PROT_WRITE only, and meanwhile mmap with w+x
> is also permitted. However, when userspace tries to access this page with
> PROT_WRITE|PROT_EXEC, which causes infinite loop at load page fault as
> well as it triggers soft lockup. According to riscv privileged spec,
> "Writable pages must also be marked readable". The fix to drop the
> `PAGE_COPY_READ_EXEC` and then `PAGE_COPY_EXEC` would be just used instead.
> This aligns the other arches (i.e arm64) for protection_map.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
    https://git.kernel.org/riscv/c/6569fc12e442

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
