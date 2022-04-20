Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FFBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BDGKX57DmtOWLTG6bE9Ctq6kwR0M7nMqv3nP9j2mQU=; b=N5lii524bIjYsG
	pwDeRoL4P8Sdmeew1CroVEyl8ZjCFDwvO0ejaCVpTeoqH736NH6M/jX2/AY4gbO2+TayIOPncC/8F
	TW0gji4HqQ1X1t5eyRkIRDOorKZT+xdLWSUtqUbEW93PCnJurjKYj2xF9Tabz2nblosFPveJd3E4E
	pzezkuiVPgXnjlmgpjrOarjRJLzjAGjHukkFDFEwemMLI3Yr8HDnegB7NZkgedGXdUHY0cc3y0PMP
	lQNz5UfUDqGXL5lLF3ino1vyOrzQ/EXlIS8lW4ndnRQyMZVp1wehjiRElPjI8Vm1ldC5qzLMvFRix
	ZwA4akx0vNJn0p5qaOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3EI-007SsE-PF; Wed, 20 Apr 2022 05:50:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3EF-007Srd-P6
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 05:50:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43B52B81244;
 Wed, 20 Apr 2022 05:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE1CEC385A1;
 Wed, 20 Apr 2022 05:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650433811;
 bh=/+U+gKD1f49TgqriF1wxYhDRqEV/GkSfbSwhfHIPWUM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CbcKD81xuskVM6n7374T5uTjSsnAUgTGBo/oKpeOxbrLlKstCh75aPK9hLROkYrhF
 9ohJlet33NsMQ+JCHLHRQ48emiDKbT/Wo3IFOs+2s/bfU8vjkdUPmpqSJm3dqaYxy8
 MJBS4mnMxITU2LTyxFWxBP3mwQ3fIkIJcp9T6FFx0p/NU3IbfTGvDL6TVM8wMDFUGd
 rbLER66azoTi4CnUccQ8gBgiKsN0pS7w3BbTKwKqMThQmSZmVoOdJe/2R5zkMzoTQ1
 5rnode6Vm60n/XPhS4vd50Gu9mXBHbckv6AkU8pUN1h+FmOWvYdJXgMhAMxg2Tl1Tj
 +RpZe9b6NwFCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9DC4AE8DBD4; Wed, 20 Apr 2022 05:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 bpf-next 0/2] Support riscv libbpf USDT arg parsing
 logic
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165043381164.28808.5094554750645072306.git-patchwork-notify@kernel.org>
Date: Wed, 20 Apr 2022 05:50:11 +0000
References: <20220419145238.482134-1-pulehui@huawei.com>
In-Reply-To: <20220419145238.482134-1-pulehui@huawei.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-riscv@lists.infradead.org, andrii@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_225015_998320_6D844850 
X-CRM114-Status: UNSURE (   8.49  )
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

This series was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Tue, 19 Apr 2022 22:52:36 +0800 you wrote:
> patch 1 fix a minor issue where usdt_cookie is cast to 32 bits.
> patch 2 add support riscv libbpf USDT argument parsing logic,
> both RV32 and RV64 tests have been passed as like follow:
> 
> # ./test_progs -t usdt
> #169 usdt:OK
> Summary: 1/4 PASSED, 0 SKIPPED, 0 FAILED
> 
> [...]

Here is the summary with links:
  - [v2,bpf-next,1/2] libbpf: Fix usdt_cookie being cast to 32 bits
    https://git.kernel.org/bpf/bpf-next/c/5af25a410acb
  - [v2,bpf-next,2/2] libbpf: Support riscv USDT argument parsing logic
    https://git.kernel.org/bpf/bpf-next/c/58ca8b0572cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
