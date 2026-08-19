Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49BDC5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSErmfIAC/YvM1seNwE2CqGvPZP9vPpdGjGZ/9Dlbgs=; b=IxGWkPI6MA+PVo
	OCtdf+zcPWLHPzy2sHB5PCxRH3/rxRG2bZFTHmwHiEZSBegJwl7z+y3LHoZtBEYxksvROq9SM0ih2
	akmFT3+nmwOwa410ZRMcsBvzBUOrVLQZ6f6Xz80TUH//dPqLNi+Q4w+O2f3mTKVHBcNM8+y03oczb
	Vo0u9PW5UksEMGype+wR85lWG+1GNG9YHsUmRbfhZFbT+n4gXpqsanJ8bspMct41hKivad+ivgYkc
	3eutW4XY6Jz6ojfS3sXXaegIVEfhD4xOqejWcukZhKV/BNndjfN4Sua+XYs/5EXjfqdp01B1Ca1fm
	70IyljD4IdBiNHZ6HJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbaX-00000009It2-2389;
	Wed, 19 Aug 2026 08:23:57 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbaU-00000009IsY-2DBz
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787127828; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=o0sqmDLy0vpj/KvGkon3LG48honRgsuUlMQByXc6VPY=;
	b=iBMsmniIo+CfkOK3pewTz5bm/z0oQmvaXfdg4H7b4oM/cuvJNAXS2uNZtHyH0sHtnt8rVprZF6ZGS3fi7NpPJH7LTXOydydKEOEOSjgcXJ1Teg9JIsEb8sPieKdCO45cAIcnRiQswXajtZ//latoB0jGvevk9qW3CGG6rauKToU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X9G44Qo_1787127821;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9G44Qo_1787127821 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 16:23:47 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf, riscv: Add support for signed arena loads
Date: Wed, 19 Aug 2026 16:23:33 +0800
Message-ID: <reply-pulehui-arena-ldsx-fix-20260819@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4ba94268-cd39-438c-a788-a5b75cfd8813@huawei.com>
References: <cover.1786708960.git.cp0613@linux.alibaba.com> <3445fb0231f9c72496ae840e9dca675b15899433.1786708960.git.cp0613@linux.alibaba.com> <c5441b7e-3d20-4e4e-a225-7478f7fb9d6d@huawei.com> <4ba94268-cd39-438c-a788-a5b75cfd8813@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_012354_895220_C20E05E0 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Lehui,

Thanks a lot for testing and catching this!

On 2026/8/19 11:41, Pu Lehui wrote:
> oops
> 
> need to revert this reviewed-by
> 
> [...]
> 
> Hi Chen Pei,
> 
> It's happy for the verifier_ldsx, but it not happy for the other test,
> pls take a look.
> 
> [2026-08-19 11:33:21]  [   35.541573] WARNING:
> arch/riscv/net/bpf_jit_comp64.c:915 at add_exception_handler+0xce/0xf0,
> CPU#0: test_progs/122

I reproduced it locally with arena_atomics on riscv64 QEMU and found the
root cause. It is indeed a bug introduced by this patch.

BPF_PROBE_MEM32SX is defined as 0xc0, which collides with the mode bits
of BPF_ATOMIC (also 0xc0). The riscv add_exception_handler() gates only
on BPF_MODE(), so adding BPF_PROBE_MEM32SX to that gate lets every plain
STX atomic insn (including on-stack atomics, whose JIT emit path also
sets ex_insn_off) pass the gate and register an exception table entry.
That overflows aux->num_exentries, triggers the WARN you saw and fails
the JIT pass with -ENOTSUPP.

Since BPF_PROBE_MEM32SX only exists for loads, the fix is to restrict
the PROBE_MEM32SX check in the gate to the LDX class, so that plain
atomic insns are filtered out again.

I have fixed and verified it locally on riscv64 QEMU: arena_atomics now
loads all ten programs cleanly with no warnings, and all five
arena_ldsx tests still pass. The fix will be included in v2, which I
will send shortly. Thanks again for the review and the report!

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
