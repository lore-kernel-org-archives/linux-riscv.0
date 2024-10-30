Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E3D5CCB3
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLsuwZhfK4yluVEkJt1e+UwSzNh6b7kQcSTakU1k6F4=; b=PxJKklvXfDEGkI
	q/y6tPyUWlJa9Y/OvQw6vx0muFmk4p5py8MTl5vNffWgM/GnOtfr3EgI7yUJqfWssGNBkWOY+yV99
	qScj62J2QHnqomGhT3hs3fb7YyEEcfXzb0w3Xm+9A8Hm3Ahsd9CemeD5vQVaSXkyRvADePlB7jInU
	Aelrn0UYhWOm4CeQUwn+g13Vm0xSPhmcs2YofH8yipQ+LXa0uBhPTFSBg2Mg5Q87EhCW+kug4HrpE
	RRzFYtNGJXz2c1BgX3BHCxN2k9zTpDajZRXAGwS+7ietSRUnqCqkeMHoMz93nxvoHXYNGjFn7gglJ
	xI988aPr3klP4dIaTF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69sm-00000000gvH-1FgC;
	Wed, 30 Oct 2024 14:41:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t69s1-00000000gq4-0Ecq
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 14:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5E845C5C72;
	Wed, 30 Oct 2024 14:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC33C4CECE;
	Wed, 30 Oct 2024 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730299223;
	bh=vB3pvWOA7axGK3P12THCJTUlY17q7zuJreBzEmisMrM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C+qQ0ibRuSgpkjSdXWVlurXrPNrevIoPI9+ZnWRSvtKm8Rw++dcE3rn7jrBK46ZvI
	 wqRY1cg12sMJqfI4CGeRUPQR0CmfZc4pb3ZjYQjkDA44j/WurH9LyJCuvLEaxM8sTu
	 iyW57V89pBj4cFmIGOW3NGa2rj0v2j9vAnyU4n6P++DckrkzkaRCoMQ9IH7zuF+OP4
	 hQ5DwFzOa3Ebiy9UPxy8RlftGZ+2cNRt2DKrPmQ/jlCMeAWVBbb0Zri66YX/KwtBkj
	 INuWWGA2UnAi7RVsS2Dqpnugg87fR6Fr7Bx550vO4OFm8LglVv8jWo8w+Mv7ej03x7
	 iJteFwZwvRWnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DAF380AC22;
	Wed, 30 Oct 2024 14:40:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/4] Optimize bpf_csum_diff() and homogenize for
 all archs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173029923127.1361326.16471187092779052308.git-patchwork-notify@kernel.org>
Date: Wed, 30 Oct 2024 14:40:31 +0000
References: <20241026125339.26459-1-puranjay@kernel.org>
In-Reply-To: <20241026125339.26459-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: aou@eecs.berkeley.edu, ast@kernel.org, akpm@linux-foundation.org,
 andrii@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
 davem@davemloft.net, eddyz87@gmail.com, edumazet@google.com,
 haoluo@google.com, deller@gmx.de, kuba@kernel.org,
 James.Bottomley@HansenPartnership.com, jolsa@kernel.org,
 john.fastabend@gmail.com, kpsingh@kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 martin.lau@linux.dev, mykolal@fb.com, netdev@vger.kernel.org,
 palmer@dabbelt.com, pabeni@redhat.com, paul.walmsley@sifive.com,
 puranjay12@gmail.com, shuah@kernel.org, song@kernel.org, sdf@fomichev.me,
 yonghong.song@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_074025_163669_43E66982 
X-CRM114-Status: GOOD (  10.15  )
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

This series was applied to bpf/bpf-next.git (net)
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
    https://git.kernel.org/bpf/bpf-next/c/db71aae70e3e
  - [bpf-next,v3,2/4] bpf: bpf_csum_diff: optimize and homogenize for all archs
    https://git.kernel.org/bpf/bpf-next/c/6a4794d5a3e2
  - [bpf-next,v3,3/4] selftests/bpf: don't mask result of bpf_csum_diff() in test_verifier
    https://git.kernel.org/bpf/bpf-next/c/b87f584024e1
  - [bpf-next,v3,4/4] selftests/bpf: Add a selftest for bpf_csum_diff()
    https://git.kernel.org/bpf/bpf-next/c/00c1f3dc66a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
