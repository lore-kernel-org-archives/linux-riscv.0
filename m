Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A78C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 02:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KMOB6nRaklDlkFlAErwSEtSRjKTzeR+Yzi9kPyJbgU=; b=CBCs2iEJkv0XIM
	hLhHhIZ6P//Sxszb9K3gwA9OlQy0sfoI1SFNCR+tVEWZQq9wbqQqDtw5ZmP5gC3jaScqCG8NUveC2
	bVLbPEKABeTy2aplZshkbWMEtUay0QsEYx2DHP8CaRHIq/XNmwXfV/eOGWvFzr12zUY5Dr5ZEzLam
	NNZD+ipw4CS/Obq227pbENXaI1r0+VqFuZsrmGgcm+csjWvZHXzYkehAN+JSb6f68vgX9mkaM+wyo
	P8hTtNQVoG5tonL+OFGCbaPSslCxPg4PYFFwI6I10tOZ310d7SNfpL26V/yPfS6VSjHmINcTaPSEU
	LenBlICABhzE3i236zzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7SBZ-006yWU-ES; Tue, 20 Dec 2022 02:16:53 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7SBT-006yLX-Oz
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 02:16:49 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NbgDp25p5z4f3mVg
	for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 10:16:42 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgAHAiALG6FjbzqlAA--.4009S2;
	Tue, 20 Dec 2022 10:16:45 +0800 (CST)
Message-ID: <2509f619-15a4-84d6-d199-12e4526bf30e@huaweicloud.com>
Date: Tue, 20 Dec 2022 10:16:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH bpf-next 0/4] Support bpf trampoline for RV64
Content-Language: en-US
To: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Pu Lehui <pulehui@huawei.com>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20221219133736.1387008-1-pulehui@huaweicloud.com>
X-CM-TRANSID: _Ch0CgAHAiALG6FjbzqlAA--.4009S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW8WrWkGFWkJry5XF48Crg_yoW8XrWxpa
	y8Kry3ur1vqFy7CwnIq3WUXF1Fvr4kX3W3Gw13J3yxC3WYqry7Jr1Fgay3A3s5AF93ua4U
	tr4YvFn0kw1DAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvSb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU13rcDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_181648_242573_E0DF3B9D 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2022/12/19 21:37, Pu Lehui wrote:
> BPF trampoline is the critical infrastructure of the bpf
> subsystem, acting as a mediator between kernel functions
> and BPF programs. Numerous important features, such as
> using ebpf program for zero overhead kernel introspection,
> rely on this key component. We can't wait to support bpf
> trampoline on RV64. The implementation of bpf trampoline
> was closely to x86 and arm64 for future development.
> 
> As most of riscv cpu support unaligned memory accesses,
> we temporarily use patch [1] to facilitate testing. The
> test results are as follow, and test_verifier with no
> new failure ceses.
> 
> - fexit_test:OK
> - fentry_test:OK
> - fentry_fexit:OK
> - fexit_stress:OK
> - fexit_bpf2bpf:OK
> - dummy_st_ops:OK
> - modify_return:OK
> - get_func_ip_test:OK
> - get_func_args_test:OK
> - trampoline_count:OK
> 
> [1] https://lore.kernel.org/linux-riscv/20210916130855.4054926-2-chenhuang5@huawei.com/
> 
> Pu Lehui (4):
>    bpf: Rollback to text_poke when arch not supported ftrace direct call
>    riscv, bpf: Factor out emit_call for kernel and bpf context
>    riscv, bpf: Add bpf_arch_text_poke support for RV64
>    riscv, bpf: Add bpf trampoline support for RV64
> 
>   arch/riscv/net/bpf_jit.h        |   5 +
>   arch/riscv/net/bpf_jit_comp64.c | 484 ++++++++++++++++++++++++++++++--
>   kernel/bpf/trampoline.c         |   8 +-
>   3 files changed, 472 insertions(+), 25 deletions(-)
> 

sorry, small problem of this patchset, have been resend.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
