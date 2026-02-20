Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B8C531E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPy7KkVfe0BWh+uW+kHR+xoknmPo93Zd2e+yYcHr6Ps=; b=McdQAlqi3s2iq0
	tQieVTgiX5MNQZ6oNjJwQQh0Ow2Kbhm9pkNf0j/TH4bqHzZU8+QodsGp5IJ5+WqyOcQbuIPtZlXyT
	ouKdtKCS1pbMuDAMKctBZvpHjtfJhceQlp1zsBr7bAW8jci8KDiwAogDTogtGmD59ZNYQj8xTwi1f
	rFiyrUvpYYjBheQkqcDh+yZhU6YG+jYCxkTbwv3+yt9hzUh8+nepukU/7Tm/38E16JSFmOp97THPy
	ETv/0pToRbl74fIEz6cWvh2g62bcQfZg7cV5n08rDgSKZ2BegG5SkPILqBN+GhC5NMW5N5WO5Wj1b
	ETqo5PLfSksciz9eTQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqo-0000000DCP9-0TC1;
	Fri, 20 Feb 2026 04:10:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHql-0000000DCLE-2RyT
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 04:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 033A861855;
	Fri, 20 Feb 2026 04:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B32FC116D0;
	Fri, 20 Feb 2026 04:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560642;
	bh=vY3RNXjFg5jE/lRwJrLxbPR1SDUOknv1RwuQChIByMA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ibVtTQMqgNkDai+LkCqmzmqiemxWToTM02koymKY8eaha8BdQ93O8uV4DTA0YIXHn
	 Yu9q274SIY/8RzECnMV2tA9xaFQhKKNyCEo/keISiyWCbn7hcPJ4piIrhOLW3WlcmE
	 aypdlfN0YeV+WaNKmSNlriwjWq4uu9xgrVVwcJhL/4CicmsKWqV1fxiA2JqgQT7o4f
	 Xa+wncnZlXxR9gELWoslXYZ9JtTTmtmm2yeKBtnZ7a+iiiK64ww3mxdeg1AKLg6MGV
	 Y+tXzOGZzlwCl4ENNcnoLsKQQoBv/HCQQvtGycBBhRCAoX+SVud5btd3he6EEBBGz5
	 vs9wUNmodP6/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF503809A88;
	Fri, 20 Feb 2026 04:10:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] irqchip/sifive-plic: Fix wrong nr_irqs handling
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156065079.189817.10993105171560022947.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:50 +0000
References: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
In-Reply-To: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 anup.patel@oss.qualcomm.com, samuel.holland@sifive.com, cmirabil@redhat.com,
 lzampier@redhat.com, tglx@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 mason.huo@starfivetech.com, zhangxincheng@ultrarisc.com,
 charlie@rivosinc.com, maz@kernel.org, jeeheng.sia@starfivetech.com,
 leyfoon.tan@starfivetech.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, alex@ghiti.fr, devicetree@vger.kernel.org,
 yash.shah@sifive.com, wangjia@ultrarisc.com
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
by Thomas Gleixner <tglx@kernel.org>:

On Wed,  4 Feb 2026 01:17:07 +0800 you wrote:
> This patch series fixes long standing bugs in sifive-plic driver regarding
> the handling of nr_irqs. Some code assumes the first irq source is 0 while
> some assumes it is 1. Since the first irq source is actually 1, this causes
> various issues including memory corruption when the number of irqs is
> multiple of 32. Also, some code assumes nr_irqs is the maximum irq source
> ID while some assumes it is the total number of irq sources including the
> reserved source 0. This patch series standardizes the handling of nr_irqs
> to be the maximum irq source ID, and the first irq source is 1.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] irqchip/sifive-plic: Fix wrong nr_irqs handling
    (no matching commit)
  - [v3,2/2] dt-binding: riscv: Clarify the riscv,ndev meaning in PLIC
    https://git.kernel.org/riscv/c/889588d75050

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
