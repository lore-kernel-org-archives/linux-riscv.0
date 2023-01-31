Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AFCC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgYpJB1oFH6tzOcSKIyA2cSc+11GAFIW9rl5BOopOvw=; b=AO6nQY4lv0nv5a
	Kjl3yjPnaR6GKOU2I80DIfwMUyjYUm8o+aayVdglOO8zXfVdMbGJJleu6n9uSx5EPVPS2kdF5J0i9
	52V8uZr38Cao+SqpQeI2GFSgSLCUA7CuTg0w0dCP7Pzw38MDeN1SCkkI9u5x+2vMj7AK1uYy+Aw9X
	yCl2bS9sUlZ9k6EcvsG1UXPr9HRRqqmrHs18vTZ+dI8NGxlrZAYphyx9QgxQiSoTUeXoLWzzx2fqN
	UyZo47GbeTM3PdjWyCYEIkuY84nXTzqeDgkSiQhHxW3YwERLsmtVcCtdWe+GZn2i/mW0rqNCo2hQg
	yxtEKbJOCsuJ7oW4jTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMvOj-008zb5-Cu; Tue, 31 Jan 2023 18:30:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMvOg-008zZc-4O
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 18:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2012FB81E5F;
	Tue, 31 Jan 2023 18:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6CC7C4339B;
	Tue, 31 Jan 2023 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675189818;
	bh=GoK5EVyg7iAGUDzQ67IEnM2/09vn+YzqOhP/+ej7EvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HHnVKtjXpdlgz7kAqDfHn8BGnccUTdpaRsdFwI7bFXpnsYuMu9T4N/Vm10p5zsuo8
	 Qpg0kdvK++Ci7uzv0W+wGc3w7et1CCss+9GqbxcYIZYLhK4+Vbhmct7zPJWaD+jxBP
	 H+nrN8aFmhd2tu9lfXvHpTH3hWqPkxAP0dlWyS4NrVFGG/xq0LrKgL6PlxNM79BxeM
	 iKUDMoABhAAZ0QYiCS/5GuTuye1Ui1RgwHBk2fJHj6YniXzT6v5lZtZWmutqUzbRVK
	 o4EDWtKSL1F3fS4f3hdtJu6uw7fTDwt4M3rlgvJFJVQ1abz1p965PjQ8+sFxo+idkN
	 VmghFi7mHoJcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F9ACE4D00A;
	Tue, 31 Jan 2023 18:30:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Fix do_notify_resume / do_work_pending prototype
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167518981864.30496.9079639810241417567.git-patchwork-notify@kernel.org>
Date: Tue, 31 Jan 2023 18:30:18 +0000
References: <20230118142252.337103-1-heiko@sntech.de>
In-Reply-To: <20230118142252.337103-1-heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, abrestic@rivosinc.com,
 heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_103022_355688_3901A91E 
X-CRM114-Status: GOOD (  10.47  )
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

On Wed, 18 Jan 2023 15:22:52 +0100 you wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Commit b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to
> userspace slow-path") renamed the do_notify_resume function to
> do_work_pending but did not change the prototype in signal.h
> Do that now, as the original function does not exist anymore.
> 
> [...]

Here is the summary with links:
  - RISC-V: Fix do_notify_resume / do_work_pending prototype
    https://git.kernel.org/riscv/c/285b6a18daf1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
