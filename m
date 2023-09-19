Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043ABCD54AF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s03U+Bla2qRM8UTjGm+uuam8HkgjM97MHy2KeOcZ844=; b=fTDCHlQmH3D7Wx
	oJRid845jw72Kc8E+2YOQFQi0wL0eESwaR1C27EmzrFad2lFNb5gnSM/vPEsCSPZ5HKQJ+wmUaDXf
	o7jO/FXekcNEMB6iJr+4rrWujLmnKSVjg2jHOgukQ/pLhrt+mBLWDRm3IOXpFvpTFecWiwKs2/k5z
	qaZtuLQIDevclV4H3DSSnfnk90FiSeaQPbMHdLlayXEYAnJlkNeqVRIU8HahgEzzMqEexLfiOlaaq
	8c36/7SG2Syd0dqwol8jkGXdXsbSWfjjy7rgZBKoEpJUj+PdxJibZrF8YqZvvfxwMj61+1Z2NZsAX
	hAB//VJiqalI/q0CYepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYp7-000HFe-1e;
	Tue, 19 Sep 2023 11:23:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYp2-000HDw-1G
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 11:23:19 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RqfMv5MWtzVl1f;
	Tue, 19 Sep 2023 19:20:11 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 19 Sep 2023 19:23:07 +0800
Message-ID: <8ebbd85d-857a-432b-be56-1f8f425b979d@huawei.com>
Date: Tue, 19 Sep 2023 19:23:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <20230919-4734211982e4e411a93650a7@fedora>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230919-4734211982e4e411a93650a7@fedora>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_042316_629561_6C6CFD59 
X-CRM114-Status: GOOD (  11.69  )
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



On 2023/9/19 18:04, Conor Dooley wrote:
> On Tue, Sep 19, 2023 at 11:57:11AM +0800, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> In the current RV64 JIT, if we just don't initialize the TCC in subprog,
>> the TCC can be propagated from the parent process to the subprocess, but
>> the TCC of the parent process cannot be restored when the subprocess
>> exits. Since the RV64 TCC is initialized before saving the callee saved
>> registers into the stack, we cannot use the callee saved register to
>> pass the TCC, otherwise the original value of the callee saved register
>> will be destroyed. So we implemented mixing bpf2bpf and tailcalls
>> similar to x86_64, i.e. using a non-callee saved register to transfer
>> the TCC between functions, and saving that register to the stack to
>> protect the TCC value. At the same time, we also consider the scenario
>> of mixing trampoline.
>>
>> Tests test_bpf.ko and test_verifier have passed, as well as the relative
>> testcases of test_progs*.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> 
> Breaks the build:
> ../arch/riscv/net/bpf_jit_comp64.c:846:14: error: use of undeclared identifier 'BPF_TRAMP_F_TAIL_CALL_CTX'
> 

Hi Conor,

BPF_TRAMP_F_TAIL_CALL_CTX rely on commit [0], and it has been merged 
into bpf-next tree.

Link: 
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=2b5dcb31a19a2e0acd869b12c9db9b2d696ef544 
[0]

> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
