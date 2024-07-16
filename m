Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D13C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THUUwHd12lEfOKwmwswzpa+DJlBBcMQZBFFmfwwqkJA=; b=knzYa5SVzSkY3n
	1qnzWiS17oIEC5+c9H1PKJusW+aY0mNT7ENquqb7C9Q5RjWmCL7TekmRvh+16oOo0EjA+NWMiwwTe
	MiOyDOqQ2rfIs09+3pZshgsSyK1iRxgNubv/NHhSoNLBxM3d9OBE7EC245EwZjuHpS+UX/V/YJbrL
	XYrZgky/zi8jX2D9r0maHcGWFf/VOXeYQWyuK5D5mtnWSnE8AbOrgRHmilnVs01+sGQlt21pKxmz+
	2zQOM5B5KLRb3/0s9FBnrQVo2FPTUejgLYF3+TuaCdKOEXw2pVB3bOeAr9SDt8g3trFmxZOFw3lJz
	oBw0pzCa3NG9Z1dZI06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjM5-0000000Alzb-0Qw7;
	Tue, 16 Jul 2024 14:40:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTjM1-0000000Aly6-3x8r
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 14:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4D8BCE0E1D;
	Tue, 16 Jul 2024 14:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1678BC4AF09;
	Tue, 16 Jul 2024 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140831;
	bh=PBO2ewmeUiu1P2OlbjXR95+ysrCUmj5kcHJz80vh+z0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iXFKDoNnFuP665VsBRXxF8xlf376tP8d2FC5GrxB23OTheD3tfNcfcLHUDfzY0FH6
	 ++59NLPgiZsm3sXbj3UGZ4TsXvFRM8PzlDP1PSdqt84zwt7kBu3sZkzekAzoweXfEB
	 CNyuJh7QPGgT4xeCevJ2Hff1BUXLbWdLz5GyXG/tQCZ6z5TuMLcxlbutA5vKgMEd2D
	 VadDONiLvVkHpAzi1MalVTEXAecJ/cw+4G7bjubytFy7FkVNQOzwakTiGGrlihQ78Z
	 aFy+e/qY7tbYWHZZqCqdzVUqBYmut9Om5+6KUKrFZIY8ezVa47sFUOr8T5t4CfP/kW
	 gsNm4Y+bSe3Tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02CB0C4332E;
	Tue, 16 Jul 2024 14:40:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: lib: relax assembly constraints in hweight
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172114083100.24303.3143384859191995319.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jul 2024 14:40:31 +0000
References: <20240527092405.134967-1-dqfext@gmail.com>
In-Reply-To: <20240527092405.134967-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_074034_180226_CC8A7B68 
X-CRM114-Status: UNSURE (   7.09  )
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

On Mon, 27 May 2024 17:24:04 +0800 you wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> 
> rd and rs don't have to be the same. In some cases where rs needs to be
> saved for later usage, this will save us some mv instructions.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: lib: relax assembly constraints in hweight
    https://git.kernel.org/riscv/c/93b63f68d00a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
