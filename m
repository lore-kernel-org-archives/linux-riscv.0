Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3742C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 02:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtbS3j42O2o2pl1+lMYwd+Hdoqaah2br+SoRM4VuZE0=; b=2+jhe8RGqavPlq
	bZL3UDWLQsSEoWiNpwrfDRkX8/TUdfqavw5D9djM5zqKDTxGGQixl/8wOvgP0x1FXiGIxO9nOqT4V
	GxAs70kjxS+TJQypyEK55qpVcv+woLHJ8K38Fy1nLuqY1U2naFbCYVQCE6dRbM5+++zMSTd1efMK7
	Kk1R0JFHrSEvzzHvifIBp3ipRmAXSylxKLxs1GSzJLC2bIeXe1k/PJl6fbUDWriigtnmTAmm+3JZO
	Xizm+POdj5cGlXIS7wfPNNyR+n1aDTOPQd7eWqIxJtfOdgX7M+SWwS9hzp+oG4o3WFFNyZDNfSqyH
	0N96WCR/HyexuNtRhUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT1T-0000000Al8r-2I4u;
	Tue, 14 Jul 2026 02:37:27 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT1Q-0000000Al8G-10pQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 02:37:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xxaMPpKGBoyUhiBOOpGG/Nc0N/n7BrdLavegstx8CJw=;
	b=M8kQfk8UblWW5eFdQyQaVxRqv0UUgN+anqWkoZsoqu1e1dBCUp26UMQBu2GcodHEsLSCnqDhf
	kVyKVNTSpLh8SzqpXMwMm/GShJ4tYwj4f1Cju9j3/n9ZT/ATr6Vcnu9bpLEJJfawA1s8mN/iTiT
	9viDiQs08Xz8U0zxT+txH8A=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gzjrP3bsxz12LGB;
	Tue, 14 Jul 2026 10:27:33 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 0422C40537;
	Tue, 14 Jul 2026 10:37:12 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Jul
 2026 10:37:11 +0800
Message-ID: <66bbcfac-7fe8-4823-bf30-dccd8adbe2f4@huawei.com>
Date: Tue, 14 Jul 2026 10:37:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 0/3] riscv, bpf: Add support for signed
 operations and 32-bit atomics
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<jolsa@kernel.org>, <emil@etsalapatis.com>, <alex@ghiti.fr>,
	<jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>, <marscheng@google.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260714002451.4091139-1-visitorckw@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260714002451.4091139-1-visitorckw@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_193724_439450_0A06714A 
X-CRM114-Status: GOOD (  11.15  )
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


On 2026/7/14 8:24, Kuan-Wei Chiu wrote:
> Add support for missing signed operations and 32-bit atomics in the
> RV32 BPF JIT compiler.
> 
> The current implementation lacks support for BPF_SDIV, BPF_SMOD, and
> BPF_MOVSX, ignoring the instruction offset field and treating them as
> unsigned or zero-extended. Introduce support for these operations by
> checking the offset field and emitting the corresponding instructions.
> 
> Additionally, we leverage the mandatory A extension to natively support
> 32-bit BPF atomics (and, or, xor, xchg) by mapping them directly to
> amo*.w instructions. BPF_CMPXCHG continues to fall back to the
> interpreter.
> 
> As a result, test_bpf.ko now runs with 0 failures, and the total number
> of successfully JIT'ed test cases increases from 843 to 902.
> ---
> Changes in v4:
> - Add a 'dst' param to emit_bpf_atomic().
> 
> Changes in v3:
> - Pass insn directly to emit_alu_r32().
> - Remove the Fixes: tag and update title.
> - Consolidate size, mode, and off into insn for emit_store_r64().
> 
> Changes in v2:
> - Add missing Fixes tags.
> - Fix memory ordering by emitting aq=1, rl=1
> 
> Kuan-Wei Chiu (3):
>    riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
>    riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
>    riscv, bpf: Add 32 bit atomic operations to RV32 JIT
> 
>   arch/riscv/net/bpf_jit_comp32.c | 111 +++++++++++++++++++++++++++-----
>   1 file changed, 95 insertions(+), 16 deletions(-)
> 

before:
test_bpf: Summary: 846 PASSED, 216 FAILED, [847/847 JIT'ed]

after:
test_bpf: Summary: 918 PASSED, 144 FAILED, [906/906 JIT'ed]


Tested-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
