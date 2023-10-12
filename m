Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCE0CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCBOred4m14IYxazEvUGBjku2IwRi9N2yQoEtWG3kVw=; b=38WRYrgtYZNknI
	NRpxWoU71gMV768dASgx+p36YsdWgBjkp4mtbRXaftuEcxqCrM5vLYCC6Or39YA25XZoxAteFQxt9
	RN7QEuQ1PbdJAIiTyIsxPmcPM4Wy6isSLhf8eH/kJXJ+Z5FsoVG85UXYLy5JZG+j+7345VKUw7qK4
	R7FDzMunigHer5xXAMdqRy/jp2+TlsAT1g3DpnkOvoBCHxERV6AalB0vBhJIVFOyuzYlBjQxQB57H
	+nqqonZzKt16ZGZTtTWZCwL8k2IBGnGSft1lRajPvVzOLsoB5ATjDzjVyFtoagWFcaE+Te3geR9vb
	4y5PqhueKbK19CBK6ybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvSU-00130G-0U;
	Thu, 12 Oct 2023 13:10:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvSN-0012y3-0T
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD48461E2D;
	Thu, 12 Oct 2023 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D4BBC433CA;
	Thu, 12 Oct 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697116223;
	bh=0eUQJMX3Btxg4PAzaNK7cYqlEh3Dva5wydJpj2BHORw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IhR2A6HX9bkymASYVEFZTC9TfCo3UDrXd892XbJVeH9S4OWKthMWIiK2x2luvDUpz
	 dwsC3ydt72A1pzKwk8NeYL1gTlzPzZ6xgmABxxEQ9rW6GidcoJ+DkJb2M9ZdUNbFtk
	 g/NM/zrKuJDQeRY3jiaxm4BB6e0VwGNfcrh6EL8HhIVGQPm6pjMtn/9ji3iyhrSoRk
	 exeG/V0Q9RNPF+4t8gIuACOvTjlXQhG7EW1YJO93nF1esIkqQHo++Wlm3f8RlR2ONi
	 ZLoE2pt5w3biRo4uStnIpP7NMxofI5/yFXiK+62gLpcy0gByyAlnb8hjQNQTNVK5Zg
	 /luCA2Hs+SiKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 70B20C595C5;
	Thu, 12 Oct 2023 13:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: errata: andes: Makefile: Fix randconfig build issue
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169711622345.27974.9517413306391357603.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 13:10:23 +0000
References: <20230925153844.26820-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230925153844.26820-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_061027_231641_0A50C400 
X-CRM114-Status: UNSURE (   7.08  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 25 Sep 2023 16:38:44 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Compile the andes errata with cflags set to " -mcmodel=medany"
> when CONFIG_RISCV_ALTERNATIVE_EARLY is enabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309111311.8tcq3KVc-lkp@intel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - riscv: errata: andes: Makefile: Fix randconfig build issue
    https://git.kernel.org/riscv/c/5abb5c3cd4b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
