Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07C9C52D7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vup5ZX1hmyyuJZH5hlEiBjwOAOTs9UTieW9x7ziaTIM=; b=pBqpHoHpXHhC9q
	b2F7ZiH3ZdYGXp6neyGdW/FkpDCqiKokGIuDk9upXIqH20Gp1NY8uaqZgDSO5JYmZMA7erWkOCLpM
	HNWynZk4wXQk6fgoSi4cytMOTxfnzupwY77MKLFBNmBrFsVoo8TmMcO1/Ecvz1PPD17R7nLV3GenK
	dQdTAeAAkX9dusc9ESm7SCoBCytaqwjddwU8QKdalkJsTSBovdOe+Ih2NqiCnMK+Kpojmm95tfDbl
	HrHG3VNqyJO1ZDQwzxyfuLk9oIFzYUXN35CIZf8NGu64ri8eJBkPskfdAf61jY4sjdf9epQWV0LjN
	yU8VXC/IoR7FLXSdVrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sefif-0000000ApyI-1MFr;
	Thu, 15 Aug 2024 19:01:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecT-0000000AhAH-3eQf
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84C1961F85;
	Thu, 15 Aug 2024 17:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54805C4AF0D;
	Thu, 15 Aug 2024 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723744241;
	bh=zAxfP5/czEKKMzAKvyihgPXxRvPBFRr7sKK/n0cERzA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=chxMhja65j84IpXDszL6AXblCnXwHnVZUr6DFDxeUuXuDyBDQVadzFcCzIYNedpb4
	 hrY0tvWGZtYUOmQsnvP5r8oOevwymqARWuZiHl91mh7GvtWTqKqWttLYO3D20Hyde9
	 B6N3SoIqrcytnRFWa6mGj7LFy2+blYyv8W7/Qafq/pzV0IAkg3O354wn3YdCZoLhz9
	 l9ryAqUEUGRRIUaTqjiqI2xsU9M/CtxET9UG6jOEgc3dXS4nMqK9pvbYW4c5jToz9n
	 5xQsSKunB7DE/XQr7vdBzjf8VpYrxUCAAYtOcBO7UqxcxDhXIByhsyYbkJ2m+sVAO+
	 QurCGkkCfct3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC4C8382327A;
	Thu, 15 Aug 2024 17:50:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: change XIP's kernel_map.size to be size of the entire
 kernel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172374424043.2967007.9731794002045827088.git-patchwork-notify@kernel.org>
Date: Thu, 15 Aug 2024 17:50:40 +0000
References: <20240508191917.2892064-1-namcao@linutronix.de>
In-Reply-To: <20240508191917.2892064-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_105041_981294_7D92811C 
X-CRM114-Status: GOOD (  12.34  )
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

On Wed,  8 May 2024 21:19:17 +0200 you wrote:
> With XIP kernel, kernel_map.size is set to be only the size of data part of
> the kernel. This is inconsistent with "normal" kernel, who sets it to be
> the size of the entire kernel.
> 
> More importantly, XIP kernel fails to boot if CONFIG_DEBUG_VIRTUAL is
> enabled, because there are checks on virtual addresses with the assumption
> that kernel_map.size is the size of the entire kernel (these checks are in
> arch/riscv/mm/physaddr.c).
> 
> [...]

Here is the summary with links:
  - riscv: change XIP's kernel_map.size to be size of the entire kernel
    https://git.kernel.org/riscv/c/57d76bc51fd8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
