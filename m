Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C24C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe/1nK+qvLqx/U5RW4oKubOKlhJn66BLkNVFE6v8C7Q=; b=iGZOpUqJyyfABz
	eTYuB/6iiV/L1oto6ABTnVdrawQJCZ3L1sFa/mL6MhdqQRepcK2GqJgG5aOhXhM6GtdkGwS7aNf21
	fzKQbRMUEJUwSg1wHogZgoaAMHqAsZfR5djQeH+G+vPs1EV8QknM2dn+IEMYWXd0p42vid9gzxZCO
	x1SWaEC8TMllP5TsvmNGTqtnPBHBcb8OVigo5uLGrEmVozbDlAd2BU4DXjWLokPAye/YyRKUCwvSf
	FA0iKujHw0pqzeq4yrc8t3TVf33aSczsbPB8vEKHqipWHWoedGKIHlfJZNPs/1rDnhTIzJGoEKION
	mXx4VZyyKtDcapV6QIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2ux-00000009NSL-1gtd;
	Wed, 02 Jul 2025 19:14:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Yv-00000009KJH-3LTO
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 18:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E3446111F;
	Wed,  2 Jul 2025 18:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E0CC4CEE7;
	Wed,  2 Jul 2025 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482324;
	bh=+uLr3dTzJTV7nrPr55V5auGbMBGpX7ZhNLHcum1L5wM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JzXbebKNFfiGvybLuFqc/g9V+1T3qFKFAh9dMjsrZ4JG1gCL4rS0ap7uA3TN6kqSK
	 s8+XqtwcEMITD5WVifrMW165E30dYuod2nVTuoHkoTH/iZM+F2q2BhV79Ein/NhjV7
	 67S+/lOaGKt+AGgTPAmBrRO/JoQ0DNUIKznHLB6YIPd/tdOdfX4C8V83C18w+po+bm
	 TCmKFlEtH2j106BEHX6KlnwRv5YFdsjB3gK/2OyKG9qLSz12Y0ZL+Vu+DVzjIUS4RQ
	 S/LrXe6HsI6Oj6BEuE+fiG7DlpALfgSES4H3Xf4QWEODyMnwlMgMXMdRB0alzcUi95
	 0eZ6M5tFOiD9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCE6383B273;
	Wed,  2 Jul 2025 18:52:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175148234928.828808.7437950953839931814.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 18:52:29 +0000
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 dlan@gentoo.org, elder@riscstar.com, uwu@dram.page,
 linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
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
by Bartosz Golaszewski <bartosz.golaszewski@linaro.org>:

On Fri, 13 Jun 2025 17:25:33 +0800 you wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> 
> [...]

Here is the summary with links:
  - gpio: spacemit: Add missing MODULE_DEVICE_TABLE
    https://git.kernel.org/riscv/c/e6382fcf9890

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
