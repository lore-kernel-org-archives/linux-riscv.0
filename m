Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0DECD4F25
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wzZxWpb+CNa1yq6+bKNVzlegRBCqg80uQoX3k1mi9I=; b=SVcZ4D4iTFNijk
	IAq3uQPQe5YysmoZ7LsbkYFo8cAN4tJQBIqqy2DEZx0mtMxbIBlq7CXgNTbPzRQmpnd3cBPNpmzgv
	UIhZlulwmpgZwaGnlCtm7ePeCAd7UTZhxtuhia5D4+oBYq8NU2SXkHHAM6WFODC8/nfCJ9Jh50oI+
	Km5XBsbYj3zAtnmIBbrQQMTvOJBbdej55tizqKJb/7FKBCwuTe5dlpcnh9CxyEoYbhqpmHqcs5hS0
	tnw6HnBUj4A50vFW0kMsI29wONULg1nHc6m0D2NqzgmawEnd9Do2NNHIuAAOhSEnksyy5u0fYIlTD
	8bX11sgoQgekGib6xvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slweB-00000005ySd-1kCW;
	Wed, 04 Sep 2024 20:30:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwe7-00000005yRG-3EbA
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 20:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FDCEA44579;
	Wed,  4 Sep 2024 20:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEB1C4CEC2;
	Wed,  4 Sep 2024 20:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725481830;
	bh=ZDVqpTpXFqfaQOBp5jbdRI+wlIMqz5/1OVyt667YST4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mrzNlBMFEsp7n8AE5qk3UQVmKDA2R/m+wCfhYHJ0nrP0WwtV+3YLXgzPbuXARX4tv
	 jS0KSkgsZk//TO+fCx0l2I1HVyUmV5YGRSjFieQDi5OUtXrWVhS0Sx0SNO/A6kttYI
	 l5vNW5MU0O6oThFon7QQGUT91pTT+v13l1pU8nyZwwSQi7PboAhv/HnajNyaZEo/jL
	 mJOM+zquArWYrloWULK9D1f2BTTl2nJeEoBHc4Kc4FfkBZAFyjGHaFcG+GlQks55lV
	 Lnh0JpDmo63LtKdlhqwZm48SatHEJZZrRrMQwTU4xRqTDoLMBLFWpYJFAWi0P9Vio6
	 vFgnfKqO1b2bA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DFD3822D30;
	Wed,  4 Sep 2024 20:30:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/4] Fix accessing first syscall argument on RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172548183128.1158691.9881712792582282151.git-patchwork-notify@kernel.org>
Date: Wed, 04 Sep 2024 20:30:31 +0000
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
In-Reply-To: <20240831041934.1629216-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, andrii@kernel.org, bjorn@kernel.org,
 iii@linux.ibm.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 palmer@dabbelt.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_133031_890782_4D2857F0 
X-CRM114-Status: UNSURE (   7.63  )
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

On Sat, 31 Aug 2024 04:19:30 +0000 you wrote:
> On RV64, as Ilya mentioned before [0], the first syscall parameter should be
> accessed through orig_a0 (see arch/riscv64/include/asm/syscall.h),
> otherwise it will cause selftests like bpf_syscall_macro, vmlinux,
> test_lsm, etc. to fail on RV64.
> 
> Link: https://lore.kernel.org/bpf/20220209021745.2215452-1-iii@linux.ibm.com [0]
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/4] libbpf: Access first syscall argument with CO-RE direct read on s390
    https://git.kernel.org/bpf/bpf-next/c/65ee11d9c822
  - [bpf-next,v3,2/4] libbpf: Access first syscall argument with CO-RE direct read on arm64
    https://git.kernel.org/bpf/bpf-next/c/ebd8ad474888
  - [bpf-next,v3,3/4] selftests/bpf: Enable test_bpf_syscall_macro:syscall_arg1 on s390 and arm64
    https://git.kernel.org/bpf/bpf-next/c/3a913c4d62e1
  - [bpf-next,v3,4/4] libbpf: Fix accessing first syscall argument on RV64
    https://git.kernel.org/bpf/bpf-next/c/13143c5816bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
