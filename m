Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE70C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhZAdOSnnRjMagYRUOJRmTObG1kHyj4tKx3ENUGtvK8=; b=rQSBHgXj8YtOo7
	FyEuJx0eUc9aChJLonWQXcUyXW/TNScJx0suza+/9SyT8qrvW1L4CPlApy6QWgdsVJz26bmS4qiLS
	wsK3Kdl3oZchS3/BSH8Z2F7CMJXjoVfq/9OIA8Pj2bu1QJ4nfikR8XCxsBwWjKyc/rk6i+grdjDXc
	2P3jJgOMkEVstHsoNkkRHYGsn6fjLzz/yYGINFh6g9haUGisE3+SXTnfEft6hiN9tZ6gZeLICHJXx
	rmjmiozTfreHvu+Riq25Z/Sdl5nhVXYbECrctXjZA/I6HgiOcnBvwcVdCg3FEXOi3Rn/sFCwd3qn6
	Leoo7a5FI3TzaVE6D25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOS-000KOk-0H;
	Thu, 11 Jan 2024 14:50:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOH-000KIm-0X
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32BEB61AFD;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C818C4167E;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=iGnhSFR4oy8vML/vLeOSYSO2FOyqacVWkaXJJeDyNUM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i/3EBLIOo6blQ/RTham11oq8xEbA+ix9e1GUFP3qr5Km+lP4dFbNgj8zfhJWUc6wn
	 Gw6IIhtXLXdCmd8hKsAR80QhMetUXYHI2tA9Dy5/1Y3GPw5zywjjHLSPOogx3QW8OY
	 4W6TqQByS4uC2WiNITnApAg1Hi647lv+u1b7Hd8VeQ8fVwtkRaAMLmSMcEsOHz6Tsh
	 0/oqIa6vmzPmxY4Ud8xRbNUD/nbafrwlkRkYXd7YKnrg/GRn1yXayYYatPaqksCbGj
	 HDt+A9yiXCY6tBVw0Ee2oN6kRT9p3Tc5Rn7RUJt1kvXoQo9t4Pfqz7K7SniATUKiVZ
	 GQRYFXvMmcYWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED18FD8C975;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv; fix __user annotation in save_v_state()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463796.20080.14961218265938269771.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231123142708.261733-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20231123142708.261733-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065041_274720_89F58171 
X-CRM114-Status: UNSURE (   8.69  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 23 Nov 2023 14:27:08 +0000 you wrote:
> The save_v_state() is technically sending a __user pointer through
> __put_user() and thus is generating a sparse warning so force the
> value to be "void *" to fix:
> 
> arch/riscv/kernel/signal.c:94:16: warning: incorrect type in initializer (different address spaces)
> arch/riscv/kernel/signal.c:94:16:    expected void *__val
> arch/riscv/kernel/signal.c:94:16:    got void [noderef] __user *[assigned] datap
> Fixes:  8ee0b41898fa26f66e32 ("riscv: signal: Add sigcontext save/restore for vector")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> [...]

Here is the summary with links:
  - riscv; fix __user annotation in save_v_state()
    https://git.kernel.org/riscv/c/869436dae72a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
