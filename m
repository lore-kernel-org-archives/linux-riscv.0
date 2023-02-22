Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F60C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1+mlWD4dSYvXkDOTqJuzCLNvPdsXeZh0L9PD5gsGCI=; b=sA4wLzTfJ8CqMC
	+QELJwSVXjjzkLQhR5xpAwnQOkHwvW5zmMt0/TKK1z2BTGl3h0OwvU1QC/tZG07+d+YOzi+dqpZuL
	rUWPQCQ5bppTvOUEn0538gN/mjErJdLoHEsrVjZz36w5pXI1iC9c0p7PBxlNBGbIF4mVSqCZM9WJa
	R8a848i5EFASUuCwBSUqXkd1Y7/mvGA1hTuy7IZ3n0hLH9ZvKkRkKNSK6adKy88E7K1V4Sc3IXzYt
	CuX+ovZipWeC29yfSkhVL6ZfaBDFJriiDl11S8YHcoxY0fkuaZm6vRIHsMmPEd4XVwCjA7ezFSLS5
	5C/C7fRMjMQaf4qnDUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqcC-00CmaZ-At; Wed, 22 Feb 2023 15:01:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbu-00CmJg-45
	for linux-riscv@bombadil.infradead.org; Wed, 22 Feb 2023 15:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3AlfW3PdqEPj8MtqU8hwalakSqL0Z8TzPlYBVKEkkik=; b=G9mMoClh7X3hwceoDYk5KMk6k7
	CppKzBzoIK/7MlsJI/JIdOy6XMdFeQm3b9tBgBm23QeUsZiSjhZKARbXoegwLmBwcRzz4Y5D0VCow
	E6VWsKbnvssV0A2nPPB2oNE3MLG8iPTpBnOpiFvy3wQgLnQ0biVe7ox1che4c+1kOAqWuYL+6XV6B
	9DmaCVulowDOrlYhUDcXOqx1VAN/2lI6Kwc5OQWG51gPUgoum/ZC+hRrxSgAF5Zig6Exrt36anpC9
	ohhm9REkXfAOXyXIux7qYGb8MSKBdUhD/HP8pOasTFXJcKe9p30QwRTZtkvp43Sf1vWxT9xWZIdAG
	b3VoMopg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUqbf-00CZvT-27
	for linux-riscv@lists.infradead.org;
	Wed, 22 Feb 2023 15:00:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5073E61492;
	Wed, 22 Feb 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8055AC43328;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=RrVsBIj7UvtnBWvbg125gE40pGVf7FXtEecNC7rJlJc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C4UCJpHLDeyMbByHmFPQF5QxhcTcOgSFHZGnrAXqKkzPo/gN73jzxWDmmmouFIwuX
	 inu+3WX5ewquWKgp/PGat0vHs7DkaCVO6DEQNuLpS4ViAjMuCSZqxzujyl/jb1a+Hi
	 c4lVDgF8ZyZhWMWVyTgx+GkJF1lxHK4JQ7vKPr72kHVB2A5Pn04fBFoCjKIqzD2mzv
	 4Cf/q/+igMDU9rUE6DNOrTLKhpoDJnA4WoZ+so+5v//azrDO6P4E85KCLf2VLReq/d
	 FoYJ/sPJEqWJugdaYYVLT0yiA4Y1GrQnSzIgim/o/WL7G6TaLMNYvxrduQkn6MvZ/V
	 gRKg8H6eIiaXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A06FC43157;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Avoid enabling interrupts in die()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802241.24438.5855525202122643251.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230215144828.3370316-1-mnissler@rivosinc.com>
In-Reply-To: <20230215144828.3370316-1-mnissler@rivosinc.com>
To: Mattias Nissler <mnissler@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_150032_232757_CF76E46B 
X-CRM114-Status: GOOD (  10.15  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 15 Feb 2023 14:48:28 +0000 you wrote:
> While working on something else, I noticed that the kernel would start
> accepting interrupts again after crashing in an interrupt handler. Since
> the kernel is already in inconsistent state, enabling interrupts is
> dangerous and opens up risk of kernel state deteriorating further.
> Interrupts do get enabled via what looks like an unintended side effect of
> spin_unlock_irq, so switch to the more cautious
> spin_lock_irqsave/spin_unlock_irqrestore instead.
> 
> [...]

Here is the summary with links:
  - riscv: Avoid enabling interrupts in die()
    https://git.kernel.org/riscv/c/130aee3fd998

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
