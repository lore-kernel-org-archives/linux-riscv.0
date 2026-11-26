Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071F3606BF9D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 01:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wwb5/AwS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bc1Oroi2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ImPChSERQaluqEFw/MgGsvi+Zn0im6T0KjDkOtBxlpk=; b=Wwb5/AwS0vioskcZVvCTfrztGD
	eGchZCdGhwKV3WeBKStTf2mTHb74ml1JpXi9SwfJ2kqUZ50+2wLxhwrb+5pRWcpNZmYPD+SCovSKo
	r8EZKpk98NKGhFIiLaDhcQaoYi08LVAnND1DIX86LJdqwn2BTYTrfjXqKxSRj5YeJp1fSg9e7U/C+
	5RZT3x+IPK0ARMK8HBH/S6YGWi0waU/3thcYY1a7jaj12F1Erf5CDqTki7I895TVv8VEg11TtBEAX
	+CrBPrSypiOAV9ff28POg3W6c1h2+RapkKEHDqq+HXrMb9Wc9cZ6YqsSWDZ5Y4M0h6RR2yabIk7kn
	sgO29tIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNzz-0000000BlG4-2qCK;
	Thu, 26 Nov 2026 01:10:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNzz-0000000BlFx-0S2T
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 01:10:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE2E745E03;
	Thu, 26 Nov 2026 01:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DF61F01563;
	Thu, 26 Nov 2026 01:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795655406;
	bh=n3eDNRFNkis7rRhskdmMxswZGudGLnk3t4gSHbRSwfs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bc1Oroi26uPkyEsALHrZUf5G9DEPdcDpYa/lyMgb607YBDOuZ//wSlKHBzJpQjn6Y
	 p8alsnXQHbNbvdhO72hsGUsytiZeUBH8qJjAw111jj5+yDRQfVv8h30of9MMg13l0C
	 pcSevcG5b6dL+d8VHazb3+yMmE8zscJF8VVQYtC2+NYPWAhNcOxcgv/GYiwbZKAYJi
	 6NPKAUd999ahIHMX7NvnXDvcOgmujxdH+vhKcag0isBo5rnB/giQqryuuiBGTJBsgh
	 Pdijmke+Hrxa7o65FuNgL2TLc7spDvLpoOzkoJCy6azRmogyq5BjcwDRz2k9OJERuG
	 11+Hpv7iT6olw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774C43809A24;
	Thu, 26 Nov 2026 01:10:06 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 bpf-next 0/3] riscv: bpf: Add BPF private stack support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179565540527.1427026.16404193754358900267.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 01:10:05 +0000
References: <20261125122126.939-1-cp0613@linux.alibaba.com>
In-Reply-To: <20261125122126.939-1-cp0613@linux.alibaba.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 bjorn@kernel.org, puranjay@kernel.org, alexei.starovoitov@gmail.com,
 eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, pulehui@huawei.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 luke.r.nels@gmail.com, xi.wang@gmail.com, shuah@kernel.org,
 rgbi3307@gmail.com, guoren@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 25 Nov 2026 20:21:23 +0800 you wrote:
> This series adds private-stack support to the RV64 BPF JIT.
> 
> The verifier rejects a struct_ops program that requests a private stack
> with -EACCES when the JIT does not report
> bpf_jit_supports_private_stack(), and sched_ext requests one for its
> dispatch callback, so no sched_ext scheduler can load on riscv64 today.
> 
> [...]

Here is the summary with links:
  - [v4,bpf-next,1/3] riscv: bpf: Add BPF private stack support
    https://git.kernel.org/bpf/bpf-next/c/15a0f4bb0dd5
  - [v4,bpf-next,2/3] selftests/bpf: Enable private stack tests for riscv64
    https://git.kernel.org/bpf/bpf-next/c/02f7413abb36
  - [v4,bpf-next,3/3] selftests/bpf: Test a private stack together with stack arguments
    https://git.kernel.org/bpf/bpf-next/c/805728c7feb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
