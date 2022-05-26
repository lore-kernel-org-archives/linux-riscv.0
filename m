Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE87FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSpDWTDAq7BKIys0p6wUjBfxe8ki2/uvg4HufL6ijCs=; b=TDK65HaxPD6tmwKyzQrIVYh5zR
	Tn7FUFJ/KcBVJN0/uWI8co4HQpQfAhKp2ZX27dYe+YznYngsuQ5OusXYvb+vr209cJzJuz3HwKU6P
	ti324hq+zDsjO14DfubIM91seeoT8T2H4wG7sqxmJJIebEUXWq5mIHHzX+3o7m/iWZicS5kIRe7fd
	LvM4UftDrng+OuJKjLA8/AkfDN9lYjGSSBpkMOGfCb9QEt7xcAFU8es6MNwjY9b2HYlt5g5yLpQuf
	29DUwOCa8ldELT1deYnpOWFDRKYiWkKENn199PW3Gj1bmat0XxB4yVetis/+WdhaHwmTJndZ8ZfZ/
	X/hYr6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuDLP-00F0MV-4R; Thu, 26 May 2022 13:16:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuDLI-00F0KG-Nn
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 13:16:01 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L87gT0cwkzgYD2;
	Thu, 26 May 2022 21:14:13 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 21:15:45 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 21:15:44 +0800
Subject: Re: [PATCH bpf-next v2 2/2] riscv, bpf: Support riscv jit to provide
 bpf_line_info
To: Luke Nelson <luke.r.nels@gmail.com>
CC: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
	Networking <netdev@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Xi Wang
	<xi.wang@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Song Liu
	<songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20220429014240.3434866-1-pulehui@huawei.com>
 <20220429014240.3434866-3-pulehui@huawei.com>
 <CAB-e3NRn9VgdWfakom6Cbx-3btakEzvpNVmiQw7k-h_-EtOMng@mail.gmail.com>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <522e1e15-47ee-e972-8177-579a3e44f638@huawei.com>
Date: Thu, 26 May 2022 21:15:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAB-e3NRn9VgdWfakom6Cbx-3btakEzvpNVmiQw7k-h_-EtOMng@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_061557_248679_D9F23F38 
X-CRM114-Status: GOOD (  37.03  )
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

Hi Luke,

On 2022/5/7 5:44, Luke Nelson wrote:
> Thanks for the patch! I have a couple of notes written down below.
> 
>> +               ctx->prologue_offset = ctx->ninsns;
>> ...
>> +               prologue_len = ctx->epilogue_offset - ctx->prologue_offset;
>> +               for (i = 0; i < prog->len; i++)
>> +                       ctx->offset[i] = ninsns_rvoff(prologue_len + ctx->offset[i]);
> 
> The logic looks correct to me; my only nit is that the name
> prologue_offset might be a bit confusing. The prologue is always at
> the beginning of the final JITed program, it just happens to be that
> the prologue is emitted "out of order" on the initial/internal passes
> that compute offsets.
> 
> What prologue_offset really measures in your code is the length of the
> body of the JITed program. What do you think about renaming
> prologue_offset to something like body_len? Then the line to compute
> prologue_len becomes:
> 
>          prologue_len = ctx->epilogue_offset - ctx->body_len;
> 
> This version makes more sense to me why it's correct. Curious what you think.
>

Sorry for getting back to you so late. Thanks so much for your review. 
It seems that ctx->body_len makes more sence, I will rename it.

> 
>> +               bpf_prog_fill_jited_linfo(prog, ctx->offset);
> 
> Here's a quote from the comment that documents
> bpf_prog_fill_jited_linfo in kernel/bpf/core.c:
> 
> /* The jit engine is responsible to provide an array
>   * for insn_off to the jited_off mapping (insn_to_jit_off).
> ...
>   * jited_off is the byte off to the last byte of the jited insn.
> 
> This comment says that ctx->offset (passed to this function as
> insn_to_jit_off) should map each instruction to the offset of the last
> byte of the JITed instructions, but as I understand it your patch sets
> ctx->offset[i] to be the offset _one past_ the last byte of the JITed
> instructions (i.e., the first byte of the next instruction). I'm not
> sure if this is a bug in your code, in this comment, or in my
> understanding :)
> 
> As a concrete example, suppose the BPF instruction at index 0 compiles
> to 2 (non-compressed) RISC-V instructions, or 8 bytes. Then
> ctx->offset[0] will be 2 after the initial JIT passes, and your code
> would update ctx->offset[0] to be 4*prologue_len + 8. This offset
> corresponds to the first byte of insns[1], not the last byte of
> insn[0], which would be 4*prologue_len + 7.
> 
> My guess would be that the comment is out of date and your code is
> doing the correct thing, since it seems in line with what other JITs
> are doing. If that's the case, maybe we can consider updating that
> comment at some point. I'm curious if the tests you ran would break if
> you changed your code to match what the comment says (i.e.,
> subtracting 1 byte from each element in ctx->offset before passing to
> bpf_prog_fill_jited_linfo).
> 

IIUC,ctx->offset(passed to bpf_prog_fill_jited_linfo as insn_to_jit_off)
should be the first byte of the next instruction, or the byte off to the 
end of the current instruction.

Here's the code as below
bpf_prog_fill_jited_linfo in kernel/bpf/core.c:

	jited_linfo[i] = prog->bpf_func +
		insn_to_jit_off[linfo[i].insn_off - insn_start - 1];

we can see here that "linfo[i].insn_off - insn_start - 1" refers to the 
previous instruction, and the corresponding insn_to_jit_off refers to 
the first byte of the current instruction.

It seems the following quote might make more sense
bpf_prog_fill_jited_linfo in kernel/bpf/core.c:
* jited_off is the byte off to the "end" of the jited insn.

> 
>> ./test_progs -a btf
>> #19 btf:OK
>> Summary: 1/215 PASSED, 0 SKIPPED, 0 FAILED
> 
> Last, did you have a chance to run any of the other tests with your
> change (e.g., test_verifier, test_bpf.ko, other tests in test_progs)?
> I don't expect this change to break any tests, but may as well run
> them if it's easy enough just to be sure.
> 

Yeah, "test_verifier", "test_bpf.ko" and "test_progs -a btf" all test 
pass, as well as "test_progs" with no new failure ceses. I will attach 
the test result in v3.

Thanks,
Lehui

> 
> Thanks!
> - Luke
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
