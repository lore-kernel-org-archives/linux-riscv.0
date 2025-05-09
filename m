Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC6C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6/QPzwgUzH9DmzG9iOz2PTWgIED82nqIs/JIio5n8U=; b=mVx3O8QNMpbRy/
	sZ6aGJWHugv9U4CnZ2ebZTjyeZiJgyNmEy/IE6wXE8ScMiZbjnw2JjF9X6JyEtKip2ouFqIaUA1K6
	gA4YWTl2Jh8wex1mlknjSzYJ6pU2dBc75wqL0PSa8dxQdfWVKkE798Jy/U0B3rMuW+i6cnEuT6nn7
	TwU+KyOFS9g4eV+jcdD9Zu0q2JgjSqhk0C0CNYTrkhgnDC+QdJdqvzSyC79KJ33yohFoVY1HPk1et
	It/NN3FS498xxXJgcbc4nj4ePjRuuAlvTTuc8U7RX/FIUpxrIc/LyCSo6rAB1RwLu0WtI/KedXTc3
	zGeI/J8abHrcPEBoN6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUI4-00000004n5O-1Eb8;
	Fri, 09 May 2025 20:25:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDROD-00000004QPa-1R0o
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 17:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3ED9BA4CC52;
	Fri,  9 May 2025 17:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C416AC4CEE4;
	Fri,  9 May 2025 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746811199;
	bh=GffpHlxdBZtvdLLC3Nu+X9+VGrswBZjIPrfp3jgM+rc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ffij97tdK0QgqvVjMhKTaK8UO+2Vzk4346Td/ZPgbqLoT8JWyICAckET5Cx3XnMvJ
	 4DqI0+RFkjkm04wkenX6VKVBT54bgBnc0COXzbws/iSxJgkukkGbeVEtxDpQR+gxcz
	 3u6ube4g5MRxZngh4TLc+PlARQz28Kl8jWX0z2qLWEWpOPr9VIav6jj5+Cp8fUph8m
	 HmtJLbVqTWxoCYuw2s4cFHhRzi/b769Y1pDYTl1BJaARGCCLeOqonGVEkraf1CH4Cy
	 cZxkvxWf7Un7SVMNMPAOkoWseCLd/oetT/6wYsUs01C6nobYkihwGTXVfhEDLVNs19
	 wDMF4HOPOYNkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC2380DBCB;
	Fri,  9 May 2025 17:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174681123825.3694746.2689572723731178946.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 17:20:38 +0000
References: <cover.1746588351.git.yepeilin@google.com>
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
To: Peilin Ye <yepeilin@google.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 parri.andrea@gmail.com, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, paulmck@kernel.org, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, luke.r.nels@gmail.com,
 xi.wang@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, mykolal@fb.com, shuah@kernel.org,
 joshdon@google.com, brho@google.com, neelnatu@google.com, bsegall@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_102001_453982_130F2C52 
X-CRM114-Status: UNSURE (   8.29  )
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
by Alexei Starovoitov <ast@kernel.org>:

On Wed,  7 May 2025 03:42:29 +0000 you wrote:
> Hi all!
> 
> Patchset [1] introduced BPF load-acquire (BPF_LOAD_ACQ) and
> store-release (BPF_STORE_REL) instructions, and added x86-64 and arm64
> JIT compiler support.  As a follow-up, this v2 patchset supports
> load-acquire and store-release instructions for the riscv64 JIT
> compiler, and introduces some related selftests/ changes.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2,1/8] bpf/verifier: Handle BPF_LOAD_ACQ instructions in insn_def_regno()
    https://git.kernel.org/bpf/bpf-next/c/fce7bd8e385a
  - [bpf-next,v2,2/8] bpf, riscv64: Introduce emit_load_*() and emit_store_*()
    https://git.kernel.org/bpf/bpf-next/c/118ae46b7942
  - [bpf-next,v2,3/8] bpf, riscv64: Support load-acquire and store-release instructions
    https://git.kernel.org/bpf/bpf-next/c/8afd3170d511
  - [bpf-next,v2,4/8] bpf, riscv64: Skip redundant zext instruction after load-acquire
    https://git.kernel.org/bpf/bpf-next/c/db7a3822b5f4
  - [bpf-next,v2,5/8] selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL when appropriate
    https://git.kernel.org/bpf/bpf-next/c/13fdecf3456e
  - [bpf-next,v2,6/8] selftests/bpf: Avoid passing out-of-range values to __retval()
    https://git.kernel.org/bpf/bpf-next/c/6e492ffcab60
  - [bpf-next,v2,7/8] selftests/bpf: Verify zero-extension behavior in load-acquire tests
    https://git.kernel.org/bpf/bpf-next/c/0357f29de809
  - [bpf-next,v2,8/8] selftests/bpf: Enable non-arena load-acquire/store-release selftests for riscv64
    https://git.kernel.org/bpf/bpf-next/c/d3131466b4f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
