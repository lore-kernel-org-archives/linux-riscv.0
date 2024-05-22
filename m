Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84DCC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohO/ZcDe/29+wfvzN2o6U+K1c6hRiT0CmIbV+HBycI8=; b=qdrNSqdmPez3VT
	UWsWZTpssqkznk0qA36Qp/UX6nlEiPuoMqeiT6j5gFKfmrz/A/2A6c2fbfq9h2RYmORjpwxizrB7y
	zmHXuMMXd9tc8up+W2jq+i+fEhjMA8PpoFNG31r8Mmb4XIdLSRCk5KPrKo2ThLY83oxRhSo99v+Ee
	QtuE2T2WC5M64lymLpDbLiYTL8vry4EI5y5n8dIjs1dAlWAnHIO+P5YeMO2N7uL3z/2BbQk6pXDFd
	0elxtrDxhnxsYuYdYY7B/T/ptt1ZjXAIiPn7MgtRQ4ivDjuo4bT/pR3qFrwSYcnVun5AgM0XdPVdE
	CCa+UJ52cm0JYOGdi3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9mfu-000000039uP-0ozo;
	Wed, 22 May 2024 14:10:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9mfr-000000039tR-2fCm
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 14:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20599627FD;
	Wed, 22 May 2024 14:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6C34C32782;
	Wed, 22 May 2024 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716387031;
	bh=G5jx41m2NJEBfmuU84pfaSn8qvt+7itfBV6dI/8zugY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IchHSFJ+AGvac+0x1wL3SbSrGlohoHDA81RiyXeID/x8iwP0KzsAUJAugxhW+5RyB
	 51O7B9quDgqApbQA+NiL+sHfuU7LAeSvy0y5BhhJMs8mmwvphBkblwd8r3CbioNLDn
	 NBFntAu0njMOCMzkpUjV9qYmHvfdQYaO/EDaw8+4rwjKhqADqf/lGaby4G0ZvowCBn
	 xEf1mEozzm2JfG8RqPJ+rHU23jZFYoKEBkPb/vl7xOoV2SciK4Jd6AwTuQ9jRACDaQ
	 ade/MpjSaq4Qiq1ziCNoa88LB6tzDZ8YKNc9vMT6g1/xu3o9WkkBVxqIpCs9WultNW
	 TSojxbXras6BA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFE89C43619;
	Wed, 22 May 2024 14:10:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: do not select MODULE_SECTIONS by default
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171638703171.12705.15078741837244671625.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 14:10:31 +0000
References: <20240511015725.1162-1-dqfext@gmail.com>
In-Reply-To: <20240511015725.1162-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 qingfang.deng@siflower.com.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_071035_822754_50F5EF53 
X-CRM114-Status: UNSURE (   7.40  )
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

On Sat, 11 May 2024 09:57:25 +0800 you wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> 
> Since commit aad15bc85c18 ("riscv: Change code model of module to
> medany to improve data accessing"), kernel modules have not been built
> with -fPIC, so they wouldn't have R_RISCV_GOT_HI20 or R_RISCV_CALL_PLT
> relocations, and handling of those relocations is unnecessary.
> 
> [...]

Here is the summary with links:
  - riscv: do not select MODULE_SECTIONS by default
    https://git.kernel.org/riscv/c/2ae376aa0cd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
