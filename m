Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F596C10F09
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdnHkxtLIIuYQPRzf2tghEsc5iVwwiZpcfo4W2sKtE4=; b=e2jjaoJIh6B9He
	UuKuKNtXT4LZ9gS5Dwy3I0EMPLYJxzkBWg3JksI634kDuPhUVt9Bo/0kbC6lom550ofQffRSBGEt5
	JmX75/jH0uhoSfgYnUFOf9hs3waEYvUNTuHOPtYn9dhLxmamUBeuM154vucGYnXsLAQLOrxQm82W5
	L4xySme+vNP7M1OvGZ5of0JJPaYOOuOhu+YJ470EfuU0HZo2AAm1vUwGkrqYKoDe50gVrQIV9fTgV
	deLwbm8ZYmeNG/LL4TgFq9Yu73MNUlwCUOOklISw6dHGWfvwFxp+Ow/1bzn6TIXO+TmKUcGFkemjy
	gm3RifDlp1QAYz9W9ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB4-00DALc-0u;
	Thu, 07 Dec 2023 15:20:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGAx-00DAFU-2g;
	Thu, 07 Dec 2023 15:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9FD31CE2476;
	Thu,  7 Dec 2023 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0153C433C8;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962425;
	bh=l+nqUZpx5MSEtlnNymJ2grukWqOvETfYjh5w8j/NmbQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WIDEJZVOm6GaF2aIYSP7VoMwcBFEErYcScKO105R7M8obxajx0ZHDhHaJdl/6i6m9
	 mzZO8m3P/6k0QZZF8Pg28LGV/pEOletUrOemgk7JJo2aXVaQoh/jsUvgZJFQ2o/oxz
	 nw0IupvaJMBHuA3zxDqnW8uyr7wCr7ar7PvKeFSty7nhgoi6Q40pq73SsfggtMc1hn
	 t+kyfO18UOkWW1x5MR9Nr8lV8U+06DG8x9tYgYu8dUW9wtYKM78KCs34FGNtJH4h6p
	 4czk1G7S33QY+6KD5OhdVVM53/O7WxGXbvb630e+y/B43EKs8w84OylhMFQy4BKREw
	 GxXBA+epn4Paw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A583AC43170;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: perf: riscv,pmu: drop unneeded quotes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170196242567.12999.16480109529336505793.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231122224414.2809184-1-robh@kernel.org>
In-Reply-To: <20231122224414.2809184-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, will@kernel.org, mark.rutland@arm.com,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072032_066807_D4482EF6 
X-CRM114-Status: UNSURE (   6.52  )
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

On Wed, 22 Nov 2023 15:44:14 -0700 you wrote:
> Drop unneeded quotes over simple string values to fix a soon to be
> enabled yamllint warning:
> 
>   [error] string value is redundantly quoted with any quotes (quoted-strings)
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - dt-bindings: perf: riscv,pmu: drop unneeded quotes
    https://git.kernel.org/riscv/c/96ba4a47d147

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
