Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A865C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TURU/fRam8tT8e6dT1JTalTtD+gtwJcPJlTZg77rQa0=; b=Hc8MTRgBqTax29
	Ctyl/jztPNnEjw7dedZH6ou+Az/XPpUNfrpOx36whe7G/YXY9m3YztM+pTJqw6JV1dxm1uOYSo4cZ
	5Jw/GqO78/4aeMLjZOMoEgd0ntVaG5M2I90ouE8pc4LRCH+KEDdPKGbRzmWaiNz7XqkFS/7Y3w4xQ
	mexVgQ+Iumg+Gx/O3b0WBzAGGEeq5VQOkimD7Fz38zHPzwMDBFDWaapNf09gKtWg2YrX48ZhMuZ5j
	zL5NBo2A80J33jWsaT+D36iw8KmTc/czzAqaDp8pK718ISGXwuQXN7WdIsQ+WpQf5tG3mmhIXbUNJ
	Htop4EH1F7pKhCM/TJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTit-00000000ZJ1-1TUL;
	Thu, 13 Aug 2026 11:35:47 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTip-00000000ZIB-0Xub
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 11:35:45 +0000
X-UUID: 1a63a56a970b11f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:34152572-762d-4210-a9b3-dafca5525e8a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:13b49416b906cdcebb694eea30640219,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a63a56a970b11f1aa26b74ffac11d73-20260813
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 193053877; Thu, 13 Aug 2026 19:35:36 +0800
Message-ID: <8e9a0272-b503-4ac6-9af3-8e5683f6b8b5@kylinos.cn>
Date: Thu, 13 Aug 2026 19:35:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/2] bpf, riscv: Add BPF stack arguments
 support for RV64 JIT
To: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, martin.lau@kernel.org, clm@meta.com
References: <20260813-bpf-riscv-stack-args-v2-1-efea8f9b3fe1@kylinos.cn>
 <b9781ebbc70ad4c748f4c08d94bbe6994b4e0fde867a8bf252b5d0f08a985dee@mail.kernel.org>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <b9781ebbc70ad4c748f4c08d94bbe6994b4e0fde867a8bf252b5d0f08a985dee@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_043544_022035_4FCA161E 
X-CRM114-Status: GOOD (  13.28  )
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

On 2026/8/13 16:25, bot+bpf-ci@kernel.org wrote:
>>     bpf, riscv: Add BPF stack arguments support for RV64 JIT
>>
>>     Add bpf_jit_supports_stack_args() for the RV64 JIT so BPF subprograms
>>     and kfuncs can receive more than 5 arguments via the stack
>>     (BPF_REG_PARAMS / r11).
>>
>>     For BPF-to-BPF calls the caller writes outgoing arguments at the
>>     bottom of its frame (SP-relative). The callee reads them with
>>     FP-relative loads. Its FP is set to the caller SP in the prologue,
>>     so the offsets match.
>>
>>     The RISC-V ABI puts arguments 6-8 in A5-A7 and arguments 9+ at
>>     SP+0. Before each kfunc call, load arguments 6-8 from the outgoing
>>     area into A5-A7 and copy any remaining arguments down so argument 9
>>     lands at SP+0.
>>
>>     A5 (BPF_REG_0), A6 (TCC) and A7 are safe to clobber here: R0 is not
>>     live before a call, TCC is backed up on the stack, and A7 is unused
>>     by the JIT.
>>
>>     Limit the existing kfunc sign-extension loop to MAX_BPF_FUNC_REG_ARGS
>>     iterations; otherwise idx >= 5 resolves to S1-S5 (BPF_R6-FP) and
>>     corrupts callee-saved registers.
>>
>>     Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> 
> This looks like a bug fix for stack argument support. The commit message
> describes how the sign-extension loop was limited to prevent corruption
> of callee-saved registers S1-S5 when idx >= 5. This fixes an issue
> introduced by commit 443574b03387 ("riscv, bpf: Fix kfunc parameters
> incompatibility between bpf and riscv abi"), which added the
> sign-extension loop without limiting it to MAX_BPF_FUNC_REG_ARGS.
> 
> Should this include:
> 
>   Fixes: 443574b03387 ("riscv, bpf: Fix kfunc parameters incompatibility between bpf and riscv abi")
> 

No Fixes: tag. When 443574b03387 added the loop, the verifier still
unconditionally rejected kfuncs with more than 5 args, so fm->nr_args
was always <= 5 and the loop never touched S1-S5. The corruption is
only reachable once this series enables stack arguments, so bounding
the loop is part of the feature, not a fix for a triggerable bug.

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/3167782391
-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
