Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62108C531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJU6VKLuWTrAZy3RGrtFKtz+9m3UO9jhWt3mHTtYDtM=; b=3kR2657fBQsj96
	yvO6Ddpd8Ve+jMk0w9u7XnGHn35fdjk4Yxvsy11OWLY3S6xd8kBdqhDYYa0EmoKq86uxBB4b6iCCp
	m2NtOF5XFW9gTSqMg7uCm7Lqt0n7jtQvX8V4ZAyFFBST9Zi480VFRUpkPHv8X1fbM07Ymo2wW1Ik9
	8nQs60m/JBp2r7cFsn8lhAdXr8ivSg+sFKwgYFBeH+lsuUN5B/MUSJz5ZUuAYFOXBXpdoVYtxitfP
	npsV8c/3d6NCAC8YEqxyJJluleLLzaDci86wrTvWhgg/IcC/H+fIEfgK5qeAi0aoCBsN71AnDWXAt
	UQOLwES9q9F47D8j498Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqUD-0000000E09Q-0dMx;
	Thu, 23 Jul 2026 10:17:05 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqUA-0000000E08t-3BvM
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 10:17:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dUFTOvgZ/NRiie8IA2L45PJfQB6b+Osy4helS/3oESs=;
	b=EZBGNbQ3nFpV8CvS+pgqGoiyuepQ3JsA2FK9chOK3W+yWhYCqozMwNRB+EZqNuqIaXyA7l8s1
	FYs2phNai77DJr3QVA/lZ7Z7NnRXULvZ5+zIR4zoRrnkzFl9xo293UhrNqB9Yu6wPlVsBvxEyxm
	4BqkDnPz5etgaTjLXZn+NY8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h5Rcz1W3cz1T4Lb;
	Thu, 23 Jul 2026 18:07:31 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C76940561;
	Thu, 23 Jul 2026 18:16:53 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 23 Jul
 2026 18:16:52 +0800
Message-ID: <aa2c4ede-234d-4cb7-8ff1-163f1495bafc@huawei.com>
Date: Thu, 23 Jul 2026 18:16:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 0/3] bpf, riscv: add timed may_goto support
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Ihor Solodrai
	<ihor.solodrai@linux.dev>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_031703_122621_24B5FE26 
X-CRM114-Status: GOOD (  15.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2026/7/23 13:41, Feng Jiang wrote:
> This series adds RISC-V JIT support for the timed may_goto loop bound.
> 
> Patch 1 implements arch_bpf_timed_may_goto() and enables
> bpf_jit_supports_timed_may_goto() so the verifier uses the timed
> expansion path.
> 
> Patch 2 adds a test that checks R0-R5 are preserved across
> arch_bpf_timed_may_goto() calls.
> 
> Patch 3 enables the verifier_may_goto_1, stream_cond_break, and
> may_goto_interaction fastcall tests on riscv64.
> 
> Tested on riscv64 QEMU (rva23s64): may_goto programs load and JIT
> correctly, and the 250ms timeout path works as expected.
> 
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

For this series:

Tested-by: Pu Lehui <pulehui@huawei.com>

> ---
> Changes in v5:
> - Use REG_S/REG_L/SZREG in arch_bpf_timed_may_goto assembly. (Pu Lehui)
> - Add __arch_s390x to the timed_may_goto_preserves_regs test. (Pu Lehui)
> - Switch the preserves-regs test to SEC("syscall") to fix
>    bpf_prog_test_run() EINVAL.
> - Link to v4: https://lore.kernel.org/r/20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn
> 
> Changes in v4:
> - Add 'bpf-next' prefix to match the BPF kernel tree workflow.
> - Add a test checking that R0-R5 are preserved across
>    arch_bpf_timed_may_goto() calls. Use bpf_get_prandom_u32() to
>    prevent the verifier from removing the checks via DCE.
> - Rename may_goto_interaction_arm64() to may_goto_interaction().
> - Wrap the arch_bpf_timed_may_goto address check to a single line.
> - Link to v3: https://lore.kernel.org/r/20260715-riscv-bpf-timed-may-goto-v3-0-cf2a9c3d843f@kylinos.cn
> 
> Changes in v3:
> - Set up the frame pointer in arch_bpf_timed_may_goto() so the function
>    does not break stack unwinding under CONFIG_FRAME_POINTER.
> 
> Changes in v2:
> - Fix BPF_REG_0 being clobbered after arch_bpf_timed_may_goto() calls.
> - Enable the may_goto_interaction fastcall test on riscv64.
> 
> ---
> Feng Jiang (3):
>        bpf, riscv: add support for timed may_goto
>        selftests/bpf: test timed may_goto preserves R0-R5
>        selftests/bpf: enable timed may_goto tests for riscv64
> 
>   arch/riscv/net/Makefile                            |  2 +-
>   arch/riscv/net/bpf_jit_comp64.c                    | 12 ++++-
>   arch/riscv/net/bpf_timed_may_goto.S                | 47 ++++++++++++++++
>   tools/testing/selftests/bpf/progs/stream.c         |  1 +
>   .../selftests/bpf/progs/verifier_bpf_fastcall.c    |  3 +-
>   .../selftests/bpf/progs/verifier_may_goto_1.c      | 62 ++++++++++++++++++++++
>   6 files changed, 124 insertions(+), 3 deletions(-)
> ---
> base-commit: a23a71823352e2d792dcaae25f1ebb744acbfc0b
> change-id: 20260710-riscv-bpf-timed-may-goto-0dce564985af
> 
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
