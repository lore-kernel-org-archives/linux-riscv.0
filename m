Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85347C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LopfdhdBewttzv4KtScR31Byo4JeYVTZ6a/A9PjB/F0=; b=uwiwlOKHIdMKlqbnmHnds9RreL
	CLwBqLsF7VzKfvvJDZKC9K3BPeGgY+3D9mU/SfkO5Wax/mj0o5YMoQ1coC0Mk7iBcGF2MRSSj3/Xq
	sCUsuSSmS6E1gTlta1G4ENvf8a1FexhfoJRciW3b4dHLahZ8gIY8MuIxsdZORdkS2L3rjxVhDrlAY
	ijeaqtpTXBpeHpo9CDJr8QIM6XZ2nbcmO5dTZifBXS2rg2T2FSWe3dWK+EtA5+q23tZJZp6hfmyPu
	+CKLo0YMJz+p9H9dDzyv/GKLcyHyB4y65yG90TM01eCpmNljVardFoReso+SygB3ieb7C52nyovhq
	cSwDiA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsW6-00000005dsa-3o2t;
	Mon, 17 Aug 2026 08:16:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsW5-00000005dsK-1sfK
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 08:16:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A1540696;
	Mon, 17 Aug 2026 08:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABC21F000E9;
	Mon, 17 Aug 2026 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786954580;
	bh=F2jpUDK2vjCL/A1outTMoBzvGSnEUDAg5YzlVyq4zi8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=kf5bYs7RrU8xwQA4bmH6sEwol0nMSrgaDJSu6fNWmircc2WaiN8QmH5/djLQQAP1Y
	 6gXXmfv2H5aLukQi528Z/SCD5WrY3JQNbgbvxGvyk2sStDFM1bWLjcTrtgbJPdKIAZ
	 Yji/pP9VvP/333VEwnpVgwQODW0DLg4UwY6cw5m5doEkA9nS8H5OOWlJjc/jqf5DBd
	 8B7cdCP3+kC9TSSfBFSL2HJhV5yeywzsNxj8Ho/5tCsK364PbmIuvslIOdcEmDLkUb
	 o9HFSw98/Yx2597jiK9oUHHdTvICHklLoT53HChsdYSyf7/zn3wjMqx0iLXtovmk2O
	 8aywfUDYyrivw==
Content-Type: multipart/mixed; boundary="===============0242543682247471042=="
MIME-Version: 1.0
Message-Id: <8e479d7398bdae62e6cd8433c941e4a4a6cc086fc7c42b77b0a08ec730ac3473@mail.kernel.org>
In-Reply-To: <3445fb0231f9c72496ae840e9dca675b15899433.1786708960.git.cp0613@linux.alibaba.com>
References: <3445fb0231f9c72496ae840e9dca675b15899433.1786708960.git.cp0613@linux.alibaba.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, riscv: Add support for signed arena loads
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,shuah@kernel.org,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 17 Aug 2026 08:16:19 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0242543682247471042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>     bpf, riscv: Add support for signed arena loads
>
>     Signed loads from arena memory are currently rejected on riscv64, as
>     bpf_jit_supports_insn() refuses BPF_MEMSX loads when in_arena is set,
>     while x86 and arm64 gained support for them in v6.18. Compilers such
>     as GCC-14 are free to generate signed loads into arena memory, which
>     breaks loading of otherwise valid BPF programs on riscv64.
>
>     Implement BPF_PROBE_MEM32SX support in the RV64 JIT by reusing the
>     existing arena handling: the arena base (RV_REG_ARENA) is added to
>     the source register and the load is emitted with sign extension
>     (lb/lh/lw). Add BPF_PROBE_MEM32SX to the add_exception_handler()
>     mode gate so that faulting loads get an exception table entry which
>     clears the destination register and resumes execution.
>
>     Verified by running the arena LDSX selftests (arena_ldsx_disasm,
>     arena_ldsx_exception, arena_ldsx_s8/s16/s32) on riscv64 QEMU, all
>     passing.
>
>     Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

This looks like a bug fix for incomplete arena support added by commit
fb7cefabae81. Should this include:

  Fixes: fb7cefabae81 ("riscv, bpf: Add support arena atomics for RV64")


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32007452800
--===============0242543682247471042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0242543682247471042==--

