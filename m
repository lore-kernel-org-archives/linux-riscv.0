Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2E6C021A6
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1aneQe4XtizabWNpAvugr4IxVdevjqObGM6WYs9Ltw=; b=JiUE0+omT0o3xG
	/O1iemaX/Rv7Mix2CbU02rUMnfjQMxl8d457TjaWy+kXqDyIoRjLw1wmQNSlx9nRtHU+yXo6wYevS
	TIQPHaY5NrRNECxMSTqKhVrx3rfD7BmCnNKk9RmhVISU5Sh0o3LOyrrC0fKC7XElkXhwxOnSZ+9Li
	ng2TKTnwzl/qihGDdl77zA8M7qvTbA3Ciqi8q6nvYRvUH5CE4f2sYXHbqzJ4obC0qmZjlc81DGyYz
	z8lrscn4QJTZqQlV5YkUVNnec1ZAI5pX9yPu1qtQdvZFLQnQ5q4mo+J/RLSICmBgu0wWiZ8NLcgyx
	qo4qo5bg4mIhVhgEYVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezx-0000000CQ9W-0ZLW;
	Thu, 13 Feb 2025 19:35:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidyU-0000000CFEc-1eBH
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67C3E5C559A;
	Thu, 13 Feb 2025 18:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63BBC4CEE8;
	Thu, 13 Feb 2025 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471409;
	bh=nYiLZEWwxEDFeGSrJEI37JBzapCreCcmn3jtv+TxgNA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K2/6EKH5uuihdFdQQvWelxx30VCvTK7nhJXalWiyU2O70abv3GiMXT3L2xhj0q8Wq
	 aeWNaMrRW3AY+5+tN+6f8jYHpP7qxG/FjF1iR38X+vcwMtVT2naOmwTM/x2PkLOhHI
	 tSqX+mpxJs1FanrGvxBo9JKA8dC3GYamrh7CAqTIhuj0HHkQpeupYT67kD9ae52OHx
	 pn3RJ6kVckQrdbWWuVMYF0Hx6ER9nWDHna+F2Fhg0s9F0w3Td9L10p/cNTG3DA8BDD
	 QZL8IVd5/c6wlFjG7mqWAMU/vXoeaRg11UXLUwEwN4IBJoJbn8RQVRrWTRhb5McWHk
	 kx2IiwM/WyBXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0F380CEEF;
	Thu, 13 Feb 2025 18:30:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947143900.1330575.12977521291070529712.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:39 +0000
References: <20250108020342.4172-1-cp0613@linux.alibaba.com>
In-Reply-To: <20250108020342.4172-1-cp0613@linux.alibaba.com>
To: None <cp0613@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103010_470897_EAE4503B 
X-CRM114-Status: UNSURE (   8.06  )
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

On Wed,  8 Jan 2025 10:03:42 +0800 you wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
> kprobe on ftrace is not supported by riscv.
> 
> And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
> ftrace support") removed the relevant code, but left out the
> documentation, so fix that.
> 
> [...]

Here is the summary with links:
  - Documentation: riscv: Remove KPROBES_ON_FTRACE
    https://git.kernel.org/riscv/c/ccc71244f95c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
