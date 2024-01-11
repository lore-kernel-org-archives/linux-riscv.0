Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69362C47DB4
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VeFJS9kfVXzYNFcX7g6gyF+bY2mqgZe2bcX16Kk6/g=; b=AKPreWcPVIJrSm
	oH2v21PVmxFoh42+cvVHk0CEw4FryMMFu+PH7sUu/T3vzTD9iY7v0Zg7cePkJC1zPOxBsARYb5tkC
	BNu/uXlL0biXcpL6ewCgkp4ULKrH95xT8ycVLNN5dzlT4zfUCx9ArilgmuYpy0EhRP8ZoR+Nz/L/k
	/WNSqAZxqJ4cbgr/FrxAHK6g/j+XgEBYG5Us57EAgGZFRyjXNoFM5X7w9vCVyI1UDcWlepzyP/aiw
	8WlQkkX5O3afC2TCi2Ud8syZd8+8HZiRydaKhHrCsF5ojk/Vf9QTDQzFpWxMce6A6+l6KwVFnCkU8
	4kyUP6V85jTxAwklOCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOI-000KJa-0C;
	Thu, 11 Jan 2024 14:50:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGD-16
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1074A61ACC;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF128C43390;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=nNHoCRmS5didV6mSaD6BjLjyd87nCy39fs25lN2LzMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GBnAtEH1ZC+pnrk3tUJCWry2AHPQaXwQBOgHrA4zwoQUxPp7P4rH0+8Ibdb8U3tKK
	 oOx5Oi7zQft3ixA5sGHG/E15FS6CJpBmf3p9DUbkJIP1K4MN9R14FwX+r7mhGAqn9J
	 1nwKNvCh+QlnFzJxEjrSc3ntr8b7G2ZFWMXuCjSDLXmH8hjw0+H0NGyqQ7ZF5Yoalz
	 BfxKox/xZXcPj8a0/1J/ur8dfv4bQsFq4u0210Aypw+dzAUeVpsM0nKMzG++s5y1kh
	 eeon6/bCAtzPGEMqh+cRrQOWRUxzVDr/32OF1WUmZSW2kUHitGZaOxbfNinZ60SJDs
	 wBqgdRr5wsFvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98F30D8C975;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] riscv: modules: Fix module loading error handling
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463762.20080.10354089217933383289.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
In-Reply-To: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, palmer@rivosinc.com,
 linux-kernel@vger.kernel.org, lkp@intel.com, error27@gmail.com,
 julia.lawall@inria.fr, dan.carpenter@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065039_446678_A8A38E18 
X-CRM114-Status: UNSURE (   8.04  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 04 Jan 2024 11:42:46 -0800 you wrote:
> When modules are loaded while there is not ample allocatable memory,
> there was previously not proper error handling. This series fixes a
> use-after-free error and a different issue that caused a non graceful
> exit after memory was not properly allocated.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v3,1/3] riscv: Fix module loading free order
    https://git.kernel.org/riscv/c/78996eee79eb
  - [v3,2/3] riscv: Correctly free relocation hashtable on error
    https://git.kernel.org/riscv/c/4b38b36bfbd8
  - [v3,3/3] riscv: Fix relocation_hashtable size
    https://git.kernel.org/riscv/c/a35551c7244d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
