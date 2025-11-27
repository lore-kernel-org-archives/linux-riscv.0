Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FDD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gqNfw8l7sCOKpPpZ+UYlVC8j9l+K3tB16KEotGzyC8=; b=fdnfODZiTcY8aX
	jZtHgD1FbPLN77No5IjVvQ+fyB9NHWr3JFGA9GRTeNHBJYxldGHqESFJ9t0D/dGRZE6nve5xOXWNk
	MWabZnGGysN4ZM2I7EQakKhHjxfXj6vVbO1t4G3eY9eq0NjK+opb+ETSl1CwyU1XKLnH/xpxRQ3O/
	/Dh9iR8emQUzC5aD1zdiHNPiKp5xDlHaigZzqG2BSxt1SoX7CRprKzcs9+9Mpjn/jKxQfv0EnfAAa
	z+Vsn35aw73pwECY4PKqXUOsJRrYa+4QH5WhYFV/2ZBdkpiVT2mVR1Dr64I+93BRxmgJudFbec9mG
	oT5PMj83BH8mqWVo/B0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXP3-0000000GCoQ-0h1g;
	Thu, 27 Nov 2025 08:31:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXP2-0000000GCoJ-2cxZ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 08:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA58760172
	for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 08:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFE1C4CEF8;
	Thu, 27 Nov 2025 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764232259;
	bh=G9N/FJXb9nW3EQkBRwKrM1gXFF5CA9f833hnSITDu6s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ramJtnLOxNj4+JMPCW5XDOrMZ+iuHGPhzqkqxh39sTZN4Z6Li36ulf1gPyKTQpyHE
	 /LQwWMFtq1myT1xy5i9kjSTJAd2Xi2f+wmVZQBon1eaXyzE0rWK+HzTGtfj3y7p4uC
	 nQ17qstabC5utlzroTTrea83+dc5+YrEX2p72sWfHYdhndXDSBSJZUoKKr+t6vYmdM
	 UC+RQO4w6bj+IqOfUSadxGEhPKRmOHy4qJ9vzxZZHDlJlf0L+UGDqpcWtmodtkk3Wc
	 A6WcXaP8KxtsS8GzaTdc6ubwCBoXIgq8wrPlfyDHSuwzBK+fF/bfR3ATd0RRyFdIg+
	 fjqSsLMq5V8zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E1A380CFC2;
	Thu, 27 Nov 2025 08:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176423222101.2476283.6124056807128709475.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 08:30:21 +0000
References: <127dab2c-a77b-c1ae-7c36-2144e9203cc3@kernel.org>
In-Reply-To: <127dab2c-a77b-c1ae-7c36-2144e9203cc3@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org
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
by Paul Walmsley <pjw@kernel.org>:

On Thu, 27 Nov 2025 01:23:35 -0700 (MST) you wrote:
> We've run out of bits to describe RISC-V ISA extensions in our initial
> hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0.  So, let's add
> RISCV_HWPROBE_KEY_IMA_EXT_1, along with the framework to set the
> appropriate hwprobe tuple, and add testing for it.
> 
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> 
> [...]

Here is the summary with links:
  - riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
    https://git.kernel.org/riscv/c/6ad8fa358ba4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
