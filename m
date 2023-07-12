Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D21EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WpklKL/MzIY80q2p/pwU4R9pHzCVeKUOXaU/IjajSk=; b=vMHSaAP6iiWeww
	bnqzyk2KJPe4uDq7AVj2gypVfrYL5OYDnMcOkRNyL5zAbLTospluHoDkKr9bjtQibiV0e/zIFhIZP
	d0dUGTDFi8bUu/bBE920i0+1BUjqEGzy5ZTD/52jAsZP3FO0c8gk3Y9Iwp4nCE8TLuFMKvVP3l6P6
	NN5wLaxrcoAhGV7UQvUqKKk0GQQXsj4qImXl7CzneVaTxQ9dn29yM57iRCwKQY8yd+9tLtx9giGEz
	4cSqlVVLUhhPgCEh3Pl/j1Bkjmg52OVZOwkeHvyP7DyB62vpH+aaIP1UicTd3u+uHfd9AirUpgCaV
	1eP6qXVR91uXwUlxQl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaEe-0006ao-1m;
	Wed, 12 Jul 2023 13:50:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaEa-0006Zk-2t
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 13:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5E7C617C6;
	Wed, 12 Jul 2023 13:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22FDCC433CB;
	Wed, 12 Jul 2023 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689169822;
	bh=+INPXCSjseSzvQoIoq1K3Ufdrd2Nr/9VbLoRTyTK27Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DbfCGjVJTPIgow49B4kh03vLgqRiPE1f2YrId/mmhoQ3QaxWLwjA+xSF3PY0/Byba
	 kGACyCPmtpAPF7ZaULXkN2iCw/zpnWRWVeUD7npvnkOyj/ptYtVkRecCJShhlG4wXm
	 qh9DYfu+J/H+W+EqEX7z52g7auACdfwckf0gTe6z/MbdS95o+OYd8sLE9D9d7QsiWr
	 eVeQE+Qloc/Ik7lfjEzkeHQ+rfq4QfMYOPS6kYIxYigeYhqPEFNDBLcooqM9hDthzC
	 QBWYoTQEh5yD6o8rBjBID+saoP1a9w9uG/m8rsaDzMsBc7spzZ4IQ2+K27MIfkEekt
	 uyhHXQaloRgKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0ADC8E4D006;
	Wed, 12 Jul 2023 13:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: sigcontext: Correct the comment of sigreturn
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168916982203.8919.10360262283664186104.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 13:50:22 +0000
References: <20230628091213.2908149-1-guoren@kernel.org>
In-Reply-To: <20230628091213.2908149-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, palmer@rivosinc.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_065024_975600_8DCF7790 
X-CRM114-Status: UNSURE (   9.26  )
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

On Wed, 28 Jun 2023 05:12:13 -0400 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The real-time signals enlarged the sigset_t type, and most architectures
> have changed to using rt_sigreturn as the only way. The riscv is one of
> them, and there is no sys_sigreturn in it. Only some old architecture
> preserved sys_sigreturn as part of the historical burden.
> 
> [...]

Here is the summary with links:
  - riscv: sigcontext: Correct the comment of sigreturn
    https://git.kernel.org/riscv/c/471aba2e4760

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
