Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EEEC79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y00Yz3XkiQg0jM7B2RdUP/WOK8Gc8uxgzmP6OmERZM=; b=Jlxun9r8/ZzOuq
	wwyCD5AqKLnRjDmQHz0J43BvCe99eCxWGAfsaKW/pQUatSJya0Q7qpmz1tkYfetXzUicXLWlM9yDi
	dGSaqW3lvrfpUnSYlQ5bEcN2Z19oymhFm5aCvI0sIDFeJY4Y/OuYSi09bX9K9yFjh27ny1iOhiW/I
	45v9m4f1Bo8bueIwyaJAXYHkDY2ByOLSkqZf/KaoVoCF6Yf9nDMlZGKvWgKVe90yB1jrnSWUDSozh
	/BknNONTEBBKixQzaMSJmevfroUJ0gcbAitXb9YZCsSuUKfGSpPND04IXHCFSa0uyklHnNUeLEaCC
	M0Fqj0lnDt+x2bDXt0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Dtl-000000055ZG-0jp9;
	Sun, 06 Sep 2026 14:31:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Dtk-000000055Z7-0JGL
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 14:31:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 805D6423DB;
	Sun,  6 Sep 2026 14:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E30C1F00A3D;
	Sun,  6 Sep 2026 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788705067;
	bh=tna64wOLyHrKxDUvqiaZj8paqxCRPkRUaREiyzKay5c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LDdpf3v9L5C/S6o7KcdZMvwHFdAGWUnDmsFMEFjbTRZ1BLw7YOXhH8uavnwRr4zad
	 PX7EmghOYn59ZUn+FyRQdDeN6AqsVHgVIGwNJBN/w3RpVj/TtJdJsvXhCsD/wW4TAO
	 /38HrNktkTtwXLEsvVMnjIFSRTcGGFmpWM7YfCgL/cElTWDzCIkNQ6c0ALjjhKWndT
	 h4zWPBjQTPFyyVJGsTU+EyGv4HklxKxbzfh747kWXJTpB93gQX/jS+CJBWUJx6PGwk
	 og5R5AASz+pNnxjsOhvSvUNwd5tgBPioZEFxOtYgcJWs0a2+ItTnZBK76jqLvkiynU
	 9HRJ4bNlZO36w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A5E39253F7;
	Sun,  6 Sep 2026 14:30:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] bpf, riscv: Make arena support depend on ZACAS
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178870500689.1578634.17690662717423907051.git-patchwork-notify@kernel.org>
Date: Sun, 06 Sep 2026 14:30:06 +0000
References: <20260902061451.1416-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260902061451.1416-1-cp0613@linux.alibaba.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 bjorn@kernel.org, puranjay@kernel.org, ihor.solodrai@linux.dev,
 eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 pulehui@huawei.com, pjw@kernel.org, palmer@dabbelt.com, guoren@kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

This patch was applied to bpf/bpf.git (master)
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Wed,  2 Sep 2026 14:14:51 +0800 you wrote:
> The arena range tree allocates its nodes with kmalloc_nolock() since
> commit f8c67d8550ee ("bpf: Use kmalloc_nolock() in range tree").
> kmalloc_nolock() requires slab caches with cmpxchg128 support
> (__CMPXCHG_DOUBLE); on riscv cmpxchg128 is provided by the ZACAS
> extension. On systems without ZACAS every arena map creation fails
> with a misleading -ENOMEM.
> 
> [...]

Here is the summary with links:
  - [bpf,v2] bpf, riscv: Make arena support depend on ZACAS
    https://git.kernel.org/bpf/bpf/c/536b523b4073

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
