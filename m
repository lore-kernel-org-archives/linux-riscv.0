Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB35CC54E67
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 03:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7Jtij2lUjDAnotHdoq0qfZT+IROQM9NMROhoxufCLM=; b=E8LxhfS5v8EEer
	S6HHUb1Ifp0Z3nT95dTmxj0A0ccQUpy3H6bgVl/+YJvTYjNXTRsTskfNxoXoRWZn6BPYKAc3XL4Y6
	CJsMeNO3i9/ZMwRNByXFra7XjZU0bNhEBwYCvWYLGFus8zzC9WYX2Xqz1bEYI9fLJNEmcg/kX4jK0
	N1AnOWq7h/eWUkBlQiseHGOAxyHuq9G1Oiw/r6zyQNLPZCaKiTjTEWjWHNcG0KwfKjvycKPfzU2ym
	iSJz1oHOjG3PGJBnOnw4vVLiPyNtJn5oJh3X/qvbYnxL0u8FAn3pIHj7iJ4XnXOsrIs+0dtMM60gG
	Z0jcQxl4gV3hGoPSY+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnsOw-00000009NDI-3zjJ;
	Sat, 23 Mar 2024 03:50:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnsOu-00000009NBg-0EJV
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 03:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E109E614E4;
	Sat, 23 Mar 2024 03:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44471C43399;
	Sat, 23 Mar 2024 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711165828;
	bh=g4wocxc6/o7/+1kXUUHeHRoXYZ5/fZMi4UFcS2oOFM0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qEiSDPqK1G0qowZ3Pk/BUnK1PcMN0TLnDkrnAOhdaOG3sS9IsU6m7Cy/uiYaBqtxR
	 mJLx/omooO3t2RMQq06llwZ38SV+K6w6THjTnsEE6ehgS5+A3rULosvhZe4mG+mzCs
	 xoiXNR+nYlcSNbkv0J1CEoJUwbbAVxplwQmqrDLsz6IPj67D9hNUkvhrg1y3PBE1s7
	 j3HdSm+0rFiH+F7YdGxz/RhhnxuaF+QepIV9Qc4EE7RvWkUHDy1l0GnGGqCUjiHWJu
	 ckDACD/pk8+5adTYmC2Ro38122KHXvhPT1CEhqTF6aMdgcDZXfdE09ItD++UHdrKLo
	 oPrDKylAss/0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3355AD8BCE5;
	Sat, 23 Mar 2024 03:50:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] bpf: verifier: reject addr_space_cast insn without
 arena
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171116582820.31313.2054096271449855670.git-patchwork-notify@kernel.org>
Date: Sat, 23 Mar 2024 03:50:28 +0000
References: <20240322153518.11555-1-puranjay12@gmail.com>
In-Reply-To: <20240322153518.11555-1-puranjay12@gmail.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 memxor@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_205032_182116_8FC1E2DD 
X-CRM114-Status: UNSURE (   8.76  )
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

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 22 Mar 2024 15:35:18 +0000 you wrote:
> The verifier allows using the addr_space_cast instruction in a program
> that doesn't have an associated arena. This was caught in the form an
> invalid memory access in do_misc_fixups() when while converting
> addr_space_cast to a normal 32-bit mov, env->prog->aux->arena was
> dereferenced to check for BPF_F_NO_USER_CONV flag.
> 
> Reject programs that include the addr_space_cast instruction but don't
> have an associated arena.
> 
> [...]

Here is the summary with links:
  - [bpf,v2] bpf: verifier: reject addr_space_cast insn without arena
    https://git.kernel.org/bpf/bpf/c/122fdbd2a030

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
