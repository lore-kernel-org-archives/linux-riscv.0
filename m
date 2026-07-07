Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119ACC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 02:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzuBYO/QjURev7cL7ywwl1zneR6gtkvCKx7WtH54IQ0=; b=WL+EwahgFDLqJp
	L+3QuniZfSnyei6Jecviu0Km3Z/dFKBVYaNfJY0m9Hk0oZyyYXTjgfElBNLfg5RVTmqo+OUxaRbFJ
	SP3vffTPohL34PCmJq9MeGkpAGM8Ceqi3vTkIRKQ31RG5PGATeYzq8sUz3mngCgC0b/0qsUVEc70A
	KD4VJCzsrGFhtm+ajyiMT/td/FcC2kFb7exox0JZpgNKAymGnqxwA7FfoQp2+Erm2XkC89cSneCAR
	jSByR0uIooM2BPS01zufdj8OYa4Y/HOaxP1s9NJOgoE8UVk9iIIm3aUsW18mzYOkNvHVVtqFAuN4D
	daOKKuWnOtRzi4LhqlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvaS-0000000Dwfh-1nWP;
	Tue, 07 Jul 2026 02:31:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvaR-0000000Dwfb-0Wce
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Jul 2026 02:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7heSrC/IM7vJFta8mTohU08Ode+2cW0PEDQBN7m9SKM=; b=JzJdaViawKRxzRHj+ug2D/b49f
	0m8Okl3e001NgrmJEnmt0RoxFQNDd6LearX6dX+SSpwZzHi3JSHCN84kGyWb5DBYHfhYgnDteiE6Q
	CmQ7rMdzk0HKb8bFTEN43MGpwOb+FNMeSaDfPR5yZta5PwD3CT1hG+7+kxbqD0wdVEA5Nc1NYCxWm
	YKWOFL8oe22niLBt6H7SZHnpK3gP+Am2mzBxrb3bNdH6w/1NJbZtX/AMOHIykuxmybhrX3khwE9J1
	9q1FnuOOlsz5G3PyI4J1HiXg0daROijKhrXw6eTXo/8lXQ4u/Lqgev+BHFCsSqn5VEzgLqUAZ6DDT
	vcWIKiKQ==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgvaN-000000073ZB-0dwJ
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 02:31:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7heSrC/IM7vJFta8mTohU08Ode+2cW0PEDQBN7m9SKM=;
	b=3TSi2fudV+vFK8dyTFS/nc6dVlhHwt9ig4G6UYLObCbHfzLR9e35Qs5UatZbXBmhTu4R83fdE
	vcb2ZbH06KEfISowNhH8/OyAiAv0e+T8C9v7v+M3pRqyKIGBQkyLNXuZr2WRrfgJ1JXPWEI4PSs
	Z9XkVIS/izPkEP2qGYrhhVI=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gvQ200pwNzmVZt;
	Tue,  7 Jul 2026 10:20:56 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 8358A4056C;
	Tue,  7 Jul 2026 10:30:09 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 7 Jul
 2026 10:30:08 +0800
Message-ID: <fa8a040f-64c4-484f-9538-fb0ec287639f@huawei.com>
Date: Tue, 7 Jul 2026 10:30:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/3] riscv, bpf: Add support for BPF_SDIV and
 BPF_SMOD in RV32 JIT
Content-Language: en-US
To: <bot+bpf-ci@kernel.org>
CC: <visitorckw@gmail.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
	<luke.r.nels@gmail.com>, <xi.wang@gmail.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <martin.lau@linux.dev>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
	<emil@etsalapatis.com>, <alex@ghiti.fr>, <jserv@ccns.ncku.edu.tw>,
	<eleanor15x@gmail.com>, <marscheng@google.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<martin.lau@kernel.org>, <clm@meta.com>, <ihor.solodrai@linux.dev>
References: <20260706172846.3876436-2-visitorckw@gmail.com>
 <2ed385399f170538acc571665dca8036ccaa85dd1b9dfe987d8c7d566f59e8e5@mail.kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <2ed385399f170538acc571665dca8036ccaa85dd1b9dfe987d8c7d566f59e8e5@mail.kernel.org>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_033100_145994_F7F773C9 
X-CRM114-Status: UNSURE (   9.04  )
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



On 2026/7/7 2:12, bot+bpf-ci@kernel.org wrote:
>> commit c5a973b7fc82eeb9b84aaf80fc2673a94ab795b2
>> Author: Kuan-Wei Chiu <visitorckw@gmail.com>
>>
>>      riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
>>
>>      The current rv32 bpf jit compiler incorrectly treats BPF_SDIV and
>>      BPF_SMOD as unsigned operations. The BPF instruction set allows
>>      signed division and modulo by reusing the BPF_DIV and BPF_MOD opcodes
>>      with the instruction offset set to 1.
>>
>>      Update the emit_alu_r32() function to accept an 'is_sdiv' variable and
>>      emit the correct div and rem instructions when the offset is 1.
>>
>>      Before this patch:
>>      [   44.161771] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
>>      [   44.167385] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
>>      [   44.171053] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
>>      [   44.172081] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
>>
>>      After this patch:
>>      [   16.002192] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 95 PASS
>>      [   16.002983] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 1059 PASS
>>      [   16.017167] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 136 PASS
>>      [   16.023002] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 109 PASS
>>
>>      Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> This looks like a bug fix for the original RV32 BPF JIT implementation.
> Should this include:
> 
>    Fixes: 5f316b65e99f ("riscv, bpf: Add RV32G eBPF JIT")

not need to add fixes tag, as this not a bugfix

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/28811594040

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
