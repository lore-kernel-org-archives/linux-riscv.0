Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3A0C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wk0QXGOUPQPgNTTkpAQ7DNnkECpQ8ZmghPFhQOWkH0=; b=Yv508TFK8nP7RV
	eeQp6VBz99/+OwiXF9jjrAFq6G34SjQDaQ9LVIN9xStMm6121LFryh71xoBPq7SvZLCLHte9zvSEC
	3m/JVSCBCa5fOPSkG8V0q4g8xIxkAL6qsj9YD8hO3KA7VOXnReuRQV3RVUghqRqmptkCv1O71B8e1
	UIug9SQbQjLDDw0+gBxrcXIwHLUNiPJzpHI+6WShG17a40NrkxrYwaP4Tn7xMVX4a/yVKFHjYoOr/
	CYBXlvgyN5SkldJsRCNEa7fd3CxQkqEFQmdPu4mlB2N7l4bW8MO+gY3FiG/Yr0JsFrWu1n1fFcgzD
	e+V5T5XI7UuAqAHGkYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7KsM-00AF1f-0s;
	Thu, 08 Jun 2023 19:00:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7KsJ-00AF0j-1E
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:00:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 623496507F;
	Thu,  8 Jun 2023 19:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0C3AC433D2;
	Thu,  8 Jun 2023 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686250845;
	bh=y4lE6oEoFP0eJ4zD6nKH61KcwLbt8oaSqhE3jRkPibQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XW3BWEIUmz2OEOxxB1GEvyV74zD+DZZUY7dbA0oCX3lH+ItDMpHna8gnaAdlF1T0z
	 GrAX8GVltruvjshhFTpsaLL/oZWsaVqM7+Z7k4XwFhoG+ZfqazJi5hdjyIUiAJJlz3
	 hLgzgDi39o5Wd11CT/7wFRR26vbNtd1kaPUDdPI6xhfvwXDkbcj9qx2N1ESSLrSqTF
	 dTtMM/MoLfkqq3xNWppiXvumHHAV5gkEwiQqrAhFpQ7BZRWyOCzfsL9z8eXrUeQTTh
	 ODGdaPE9zcdAEirrKk+ceUpkEKyLlIAMhyzpHQPFHEfkbaIt0HQ5NzZFT62KrQiFwI
	 kdtjY9ZNEKX+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1CC0E87232;
	Thu,  8 Jun 2023 19:00:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: fix kprobe __user string arg print fault issue
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168625084565.18888.13800044190125074326.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jun 2023 19:00:45 +0000
References: <20230504072910.3742842-1-ruanjinjie@huawei.com>
In-Reply-To: <20230504072910.3742842-1-ruanjinjie@huawei.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_120047_456534_D80ABF8B 
X-CRM114-Status: UNSURE (   8.12  )
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

On Thu, 4 May 2023 15:29:10 +0800 you wrote:
> On riscv qemu platform, when add kprobe event on do_sys_open() to show
> filename string arg, it just print fault as follow:
> 
> echo 'p:myprobe do_sys_open dfd=$arg1 filename=+0($arg2):string flags=$arg3
> mode=$arg4' > kprobe_events
> 
> bash-166     [000] ...1.   360.195367: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6
> 
> [...]

Here is the summary with links:
  - [v3] riscv: fix kprobe __user string arg print fault issue
    https://git.kernel.org/riscv/c/99a670b2069c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
