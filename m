Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA991C3601E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFyu/HH7GtOl/5pizK0wulc9xWvtVUR402kwdU4iGQk=; b=xAZHbAoF31sPF4
	n2jS1NKi7SEA8+4o6A6gQZose7Jq3q3w7VeDK6yZNpEdDFWCkm7XhBKOkmGh63PWpZPrvXtbE1y/0
	m6V947rbXsunS6F5l+BEwpNytP8axgtc00M7Qy4FQVZ9OkL+kSh2n/m3aeJLi/bbnT3QuXbpsI7Nz
	xPRnnQLiCxU2/EHcbYxc+SmxV+quoMtDbsqcoNn9WjWZCokHH1ezEXEan+VTuGvrN6uUcU19kSvvA
	1RWKLSwKVQrrA1FgnS/KkPZQ/jeMtstBYRS54+mSB/ve6ksSpxnXSnD2BIXCxHJVxB6xObIz+MVUz
	CShKclB4d1s6LgRllT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nqf-0000000CoPP-0F7o;
	Fri, 04 Apr 2025 20:41:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nqb-0000000CoOD-3b4n
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 20:41:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EAB05C68F8;
	Fri,  4 Apr 2025 20:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D789C4CEDD;
	Fri,  4 Apr 2025 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799264;
	bh=oO6a+PolbHhF2/l4EP9dubRLRdHmOJmKuAsA59yXaxQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s0oQKxjSmtwzkS4GB/pAoYnPG+bAg6woFWZg1S8lgKT+zKn+2kOxGYFv5C7/LBWhy
	 5uLuKJ9PjR04L66Vhg0hdRXQKQ2es6j3avXOuFIX9UROhErAD7TkRIVdZLubN4xd9u
	 LIlqPvu9T5l9q4tD9nXrXw3k5Iy6RR3JRCrY0UNm0W1Yv2MKfEnxY/j2o8Cwulek2u
	 Nkjxwbsmw6vFJ05uFul5MLxXzk9FlDDw2R+dmknFPnz8I37RgCfRcBNeX/1dCtdW0o
	 Ex+079bjStQoPAb6lVclsU+hJ/osaGJ+CZmwjYuay6SfvXvVjX1+NbC5i6OCFCJaje
	 qLaVS7Z3VhGEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C633822D19;
	Fri,  4 Apr 2025 20:41:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/3] irqchip: Add Sophgo SG2042 MSI controller
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174379930126.3383526.7240371635899898248.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 20:41:41 +0000
References: <cover.1740535748.git.unicorn_wang@outlook.com>
In-Reply-To: <cover.1740535748.git.unicorn_wang@outlook.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
 fengchun.li@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_134105_952656_823CDD6C 
X-CRM114-Status: UNSURE (   8.29  )
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

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Wed, 26 Feb 2025 10:14:26 +0800 you wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This controller is on the Sophgo SG2042 SoC to transform interrupts from
> PCIe MSI to PLIC interrupts.
> 
> Thanks,
> Chen
> 
> [...]

Here is the summary with links:
  - [v5,1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
    https://git.kernel.org/riscv/c/a41d042757fb
  - [v5,2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
    https://git.kernel.org/riscv/c/c66741549424
  - [v5,3/3] riscv: sophgo: dts: add msi controller for SG2042
    https://git.kernel.org/riscv/c/0edaa4593efe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
