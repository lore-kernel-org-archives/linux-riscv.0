Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D030BE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIbgz8dFz4jKlQOMkdE49UVnbqwsVWY/cwDHX2Md/nI=; b=nTylTePckY6Odu
	qndgxiHlmzXoJaFHtf0n5HIiL8ROD4P06xPwsDqmypWzUzb9jzPPmASuo+tIoX4bj77GbHq04rc2n
	nL8N3Z0xKOlz/ury+UypDlcxpO7RGRGFrqrdVb3+ny0gGq57Z/i+Vm2d4bcWqTCpz7kYBrmgSo3SD
	9lV/4SvkZJun1AKo11qJzaxrY4zjq75S3+C5iDV8zC/i6KkwbUUSGAxbHiTYBGfD/XdBP44Ra6SIe
	PA2Pnys0R02g8pokqLKdcSCkep9xsrZYWLAdibQIF5ALlb/8zRqLDi1jQVySgLZ1SxdZJfafpPIf3
	w+wsdlKBKwv7ORuNtiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGt-0000000GLGA-2tNW;
	Wed, 11 Dec 2024 22:33:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFp-0000000GKRv-1sAa
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 577055C67DF;
	Wed, 11 Dec 2024 22:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C33C4CED3;
	Wed, 11 Dec 2024 22:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956344;
	bh=NGdHSLNI0l4aBJ0f/wN2z7bSGQikMSaNjVw2lkQNoSI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BjfwijMbLAHcxokg+pJC2/UdLPu8w5NNJmdVSAOq2BH6ThTgopYBX0+fTtZ0X5Kuy
	 NfKs4ecBx8K7owJiX4gaHbZBZVEBE69mG9OnadEwoaVEg/YlWV4VJLxNr+lfzV/GM4
	 iA1E8xJfJ2sY3w+RU6+3M4tkCTnE8gjvlGNhbmRMLplxytpDE2GUi7CltDLER9CJyH
	 af7l45Q1lRTiP73iaTZ93p0r8Fdwq1sRnbHHxXRYZbnkmrZjFr7m4xdrLOhsG8VX23
	 P33IqFJvqHyO4uQPBwp0R1LbM7vOM2Cv0K1r4G6XH+u5VBDgJKVnd2C0jB45rqkTCf
	 vX12KmEy4LCbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC8A380A965;
	Wed, 11 Dec 2024 22:32:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/4] Optimize bpf_csum_diff() and homogenize for
 all archs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395636024.1729195.5884060368915845974.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:40 +0000
References: <20241026125339.26459-1-puranjay@kernel.org>
In-Reply-To: <20241026125339.26459-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, ast@kernel.org,
 akpm@linux-foundation.org, andrii@kernel.org, bpf@vger.kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, eddyz87@gmail.com,
 edumazet@google.com, haoluo@google.com, deller@gmx.de, kuba@kernel.org,
 James.Bottomley@HansenPartnership.com, jolsa@kernel.org,
 john.fastabend@gmail.com, kpsingh@kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, martin.lau@linux.dev, mykolal@fb.com,
 netdev@vger.kernel.org, palmer@dabbelt.com, pabeni@redhat.com,
 paul.walmsley@sifive.com, puranjay12@gmail.com, shuah@kernel.org,
 song@kernel.org, sdf@fomichev.me, yonghong.song@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143225_525112_03C5F079 
X-CRM114-Status: UNSURE (   9.99  )
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

This series was applied to riscv/linux.git (fixes)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sat, 26 Oct 2024 12:53:35 +0000 you wrote:
> Changes in v3:
> v2: https://lore.kernel.org/all/20241023153922.86909-1-puranjay@kernel.org/
> - Fix sparse warning in patch 2
> 
> Changes in v2:
> v1: https://lore.kernel.org/all/20241021122112.101513-1-puranjay@kernel.org/
> - Remove the patch that adds the benchmark as it is not useful enough to be
>   added to the tree.
> - Fixed a sparse warning in patch 1.
> - Add reviewed-by and acked-by tags.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/4] net: checksum: move from32to16() to generic header
    https://git.kernel.org/riscv/c/db71aae70e3e
  - [bpf-next,v3,2/4] bpf: bpf_csum_diff: optimize and homogenize for all archs
    https://git.kernel.org/riscv/c/6a4794d5a3e2
  - [bpf-next,v3,3/4] selftests/bpf: don't mask result of bpf_csum_diff() in test_verifier
    https://git.kernel.org/riscv/c/b87f584024e1
  - [bpf-next,v3,4/4] selftests/bpf: Add a selftest for bpf_csum_diff()
    https://git.kernel.org/riscv/c/00c1f3dc66a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
