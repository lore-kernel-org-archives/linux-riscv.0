Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75761C52CD9
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTPZqM9w+EPZyxgYaIRsYcm9VvhhZ4q1Grft91MHe24=; b=EkRJH6vAC9VsuO
	zmWGerxPLilftPUIaci3VS/EbxJJXvXXmlF1KoQM1FTTLefEAtc/yzPLOyVM4Y4J4nPxwTIHJ1N5d
	uxnlZse7mASH6s/sbgcUN10estRX0IlnS6FWTwVoB2Gk++/GUSxUGcJCtT8H/hArFKp0VebBP+QoX
	HbYV3RIfSxPoq36fnncn8yDttZc9km7XGNJ5CKrPbhedR8e//j80IgxRDAlnCKkpONQtzfxLZtGC8
	QnhmQjTdRoLIXx7l2Tc+x5hWb04hn8nXnD3vmg3NAd+2SqFt2cS1IVryOBl1VzqQCMR4p2L0l5gbd
	pnrNW+EHny3N2c0k6Y4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOo-000000012qN-25y1;
	Thu, 25 Jul 2024 13:20:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOg-000000012iy-16SC
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 695ADCE135C;
	Thu, 25 Jul 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46BD9C4AF0F;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=NCWZaF607AaCtMMQUTzysFKr43p3JyTYHA2mzCn9qm8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cV7owqwdoy9b4gB8ouBMUoMXi/mwjXvOd+XdZPNbbtncJnfno4eDiTANcALBKI8Q2
	 2Q6s3QJADPkEz1pBYJtRy4YeE0/69ueCZHDiAWuSXQYl7H4c+AaTE92mZXqYLocNxB
	 Ay6iQpRi7Ni1M3Rv3DoVmmRAJotJ+o6O/OR99cipbrZpn7EcCVw6gALU/Djp8rtqcm
	 syDWXkuV3D0jRhvpwl2PuQj3HL+3I6QWaQvPb/VOjJuJYbI6cxPBkoJY62hkGeJBVC
	 p8hEGFti9qQgmzHXznBFo0qfm7PnMpgVgIhCYirQZfOddfsL+C10FqD/r/Op9w83xj
	 on5YRSEXfOp6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37A39C54BB2;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] trace: riscv: Remove deprecated kprobe on ftrace support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363922.6240.436902680893546478.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240613111347.1745379-1-ruanjinjie@huawei.com>
In-Reply-To: <20240613111347.1745379-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062042_661073_ABA6520E 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, 13 Jun 2024 19:13:47 +0800 you wrote:
> Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
> kprobe on ftrace is not supported by riscv, because riscv's support for
> FTRACE_WITH_REGS has been replaced with support for FTRACE_WITH_ARGS, and
> KPROBES_ON_FTRACE will be supplanted by FPROBES. So remove the deprecated
> kprobe on ftrace support, which is misunderstood.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> [...]

Here is the summary with links:
  - trace: riscv: Remove deprecated kprobe on ftrace support
    https://git.kernel.org/riscv/c/3308172276db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
