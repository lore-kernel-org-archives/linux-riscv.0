Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DBFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJpJpWxzZts9Zg0fYloeYlJxkiskKfzmGdNAnERVob0=; b=cd4AnSe9yBsxgb
	00klkQJX+gag2+qQ+3VamcpPGZ8beLLjtu9F1IdXMpjtAfJbtQ9FCXt1b9m2kGQhINIDsfZ3vHGJX
	/+RHPKd9FpID2z3s5NIwiQaBp0tZxfzl1LEBPmoaW2NJkDqSHkEu95YmcyWoJp0kXIXheDn53fBL5
	O21yXQJuYEanQ/SixhgchWT1qwL3GCLaSxVzlXT7cXc3EwuY1KZ5gfM5/z8nqqUufHYXww2sG0WYX
	/gSdS44vVbSUPq0wxe6uqAtxYVSAwtvOHDv2aQdlg79ok2R977smzCCtBXKVW6Q9psHJMEMNgM7kL
	LYoMrQrmK0hsZ2+w+z3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndvWh-009T4W-7R; Mon, 11 Apr 2022 15:00:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndvWd-009T2V-Ia
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 15:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 461D0CE18F1;
 Mon, 11 Apr 2022 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F83C385AA;
 Mon, 11 Apr 2022 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649689213;
 bh=V54g/PZEBmb+JWAcE95i2teXsmkq+vHWgOgmnEO0+GI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CxXIj8HVl+vi11X0GLT5XDDS7N02mF12kpaZlbr825I0jgbC1LoLQ+LFH8s5SuusE
 HjDJ9gOXUq7wqxd7wG9vDzGlVSAE0iBEHueDHnd32AKsCgxlgU31C9DD52/HcYi77B
 qNqao3im9yMah0Ao8zTWbg4Ld3cA+Ev0HcT5Q2EcB41GgvnUr56WY6RXhRkaDhfAHJ
 ZYiEhTtKEZ4AIWGE1aaqViFralU8OvqgN6VtFCASq01Kykqagrs4ZDgIaPODFdzf9B
 nDDvA1QIQA/kJM6PIROMLQCmrHSOpDxapLJY0W+mbNlqJVgOE9fCL344tlVtQt2jMA
 g4ym/5KWjaxGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7D364E8DBD1; Mon, 11 Apr 2022 15:00:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv,
 bpf: Implement more atomic operations for RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164968921350.21641.10561289384425020291.git-patchwork-notify@kernel.org>
Date: Mon, 11 Apr 2022 15:00:13 +0000
References: <20220410101246.232875-1-pulehui@huawei.com>
In-Reply-To: <20220410101246.232875-1-pulehui@huawei.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, bjorn@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_080019_869516_FCF3BEE8 
X-CRM114-Status: UNSURE (   7.98  )
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

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sun, 10 Apr 2022 18:12:46 +0800 you wrote:
> This patch implement more bpf atomic operations for RV64.
> The added operations are shown below:
> 
> atomic[64]_[fetch_]add
> atomic[64]_[fetch_]and
> atomic[64]_[fetch_]or
> atomic[64]_xchg
> atomic[64]_cmpxchg
> 
> [...]

Here is the summary with links:
  - [bpf-next] riscv, bpf: Implement more atomic operations for RV64
    https://git.kernel.org/bpf/bpf-next/c/dd642ccb45ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
