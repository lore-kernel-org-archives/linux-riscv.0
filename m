Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0326BC4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKWXkJ6WeFspHIfuRKCr/oGQfvWABHeTMXFmsf1nNcY=; b=k5baoFltI6YqTW
	p4L4lagWYEmk9GnHcyPlX6wH8cz3lzm4uK9lc0VMWTpXMEBC68mhL5JkMC9obgvHrO/nvEyxNhGj/
	qnGh2FlBZeTfDwHfit4thqrJNaI5BdIQYFar85pECq0xiFjiv7DJeYV/yxXAPkAP1+Y+Euo8uG5Cy
	pFmtm8/tN0pEud8hTwZypRjWcGZASQG3uQWDlXjvNDpqAV6khpILDYcrgPK6HLenmOpJYKkYkuDSQ
	tbE2s5AEqmIpR2EOPIaDHxC5wxgTJxWb9gA3RuB0fj1WjEInO5Aj0+/OECBGs6Rl2owu5nDLbydLz
	YEJqBZaZedJG/9y7YWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUPb-00000005AfU-25VG;
	Sun, 19 Jul 2026 16:30:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUPa-00000005AfH-26Tu
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 16:30:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B8DC60A79;
	Sun, 19 Jul 2026 16:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDABC1F000E9;
	Sun, 19 Jul 2026 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784478640;
	bh=RRapGTsGtbx7AnvVAOYh9BqiiWT8W0qCvoOYZZ9kcY8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nJ54kTGUdL3IZNEwJ2u9pSbsh1yNonY3bSK7hUYOWUXnwIw3iLVqv0UDaKyOEz4uD
	 UMVXXGXUGP1hutyB26v4MtVkHl9CPsrqxzfgepVZv1CSox9VrWmpDnSNJeWHo+s7XI
	 ig8cctcqf2M48T/AnwWVA9Bs3O1JYneJf7kv9ksSFAIGo+YWgDXs7oeKa8umX1SX27
	 VcMIFif6AmL+LHy2VDCiBJ1oE+Xnk8MuCdLn7SgCPg3P5BSc755qSkKRfjbVydlBto
	 HMIzT3h5QNsqoZdfjCRzBKr9pHNtKOX7JYKdprHl4HqTWuxpozo910Y8J83mqLwX7k
	 P/LVfO8UEcM2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CA238119C8;
	Sun, 19 Jul 2026 16:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] selftests/bpf: remove redundant config option
 from selftests fragments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178447861140.2768115.4487511323893385210.git-patchwork-notify@kernel.org>
Date: Sun, 19 Jul 2026 16:30:11 +0000
References: <20260709-testing-fragments-v1-1-65244b0650ff@bootlin.com>
In-Reply-To: <20260709-testing-fragments-v1-1-65244b0650ff@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=3Calexis=2Elothore=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 shuah@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, ebpf@linuxfoundation.org, bastien.curutchet@bootlin.com,
 thomas.petazzoni@bootlin.com, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, jakub@cloudflare.com
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
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Thu, 09 Jul 2026 20:42:59 +0200 you wrote:
> CONFIG_IPV6_SEG6_LWTUNNEL is currently enabled in each arch-specific
> config fragment for the BPF selftests. Commit 33a971d549d8
> ("selftests/bpf: Add LWT encap tests for skb metadata") has enabled this
> config in the generic config as well, resulting in a small warning when
> configuring a kernel for selftests:
> 
>  $ cat tools/testing/selftests/bpf/{config,config.vm,config.x86_64}>.config
>  $ make olddefconfig
>    HOSTCC  scripts/kconfig/conf.o
>    HOSTCC  scripts/kconfig/confdata.o
>    HOSTLD  scripts/kconfig/conf
>  config:269:warning: override: reassigning to symbol IPV6_SEG6_LWTUNNEL
>  #
>  # configuration written to .config
>  #
> 
> [...]

Here is the summary with links:
  - [bpf-next] selftests/bpf: remove redundant config option from selftests fragments
    https://git.kernel.org/bpf/bpf-next/c/45bf95da6de8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
