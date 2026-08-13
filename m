Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12111C5DF64
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 07:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BVWdoK7UJpCKkBf47BMVAyGID3UzJKNESLtRujtW1gI=; b=zkq5mn+4V0lxBU
	E0PlZtT4uCaW+W7ATuICVRFLTHD7b4HxxjXi/EhYXHEcaul53dLcShT0vPX9xE/oYiKkkXRcdvYKA
	YJoErQqMkEemwQ7elOhYLPe/dWkf9LacqoRut7djAi2MSCcR1pS3bACOLveKLErKYVsOi4Tbnc+DB
	rT7BASDIQcFT/OsOgZUg2Ku8bsvJ73lUNtk6NgsWAKLKdJty9KnUj78uo5nVex4oUR3GfNYotKGtX
	iM3St28G9HREoOfEb773Ou4RsWlK7aVZL95n2hDIoTj7hYM0CtSs1UTDgplH+8q8XlYvePXDvUWWq
	d64ceFyAyOrH/zPTOQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPig-0000000HaGE-1Veq;
	Thu, 13 Aug 2026 07:19:18 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPia-0000000Ha7y-2IoJ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 07:19:15 +0000
X-UUID: 42fea39a96e711f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:dd3d0fa6-05d4-4335-91f5-8acd60f9a65b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7e3bd00aa8c0169534ba9e0b3707b2b6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 42fea39a96e711f1aa26b74ffac11d73-20260813
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1969336531; Thu, 13 Aug 2026 15:19:03 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH bpf-next v2 0/2] bpf, riscv: Add BPF stack arguments
 support for RV64 JIT
Date: Thu, 13 Aug 2026 07:18:41 +0000
Message-Id: <20260813-bpf-riscv-stack-args-v2-0-efea8f9b3fe1@kylinos.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANFvfWoC/22NQQ6CMBBFr0Jm7Zi2SgFX3sOwKHWABlNIhzQQw
 t2tXbt8+XnvH8AUHDE8igMCRcdu9gnUpQA7Gj8QundiUEJpUakau6XH4NhG5NXYCU0YGPWtFG+
 htZHUQFKXQL3bcvYFP8PTtkKbltHxOoc9/0WZ95yupfqfjhIF6qpTd10LTWXznPaP8zNfrYf2P
 M8vaECiVsMAAAA=
X-Change-ID: 20260728-bpf-riscv-stack-args-6350d066a1e9
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 llvm@lists.linux.dev, Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_001913_445595_851C86D2 
X-CRM114-Status: UNSURE (   6.82  )
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

Port the BPF stack argument feature (BPF_REG_PARAMS / r11) to the
RV64 JIT, matching what x86 and arm64 already do.

BPF-to-BPF calls keep all extra arguments on the stack.  For kfunc
calls, the JIT loads arguments 6-8 into A5-A7 at the call site to
satisfy the RISC-V C calling convention.

Tested on riscv64 QEMU with LLVM main [1]; BPF-to-BPF and kfunc
selftests pass.

[1] https://github.com/llvm/llvm-project/pull/189060

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
Changes in v2:
- Sign-extend 32-bit kfunc arguments passed on the stack (args 9+),
  matching the register path and the RISC-V psABI. (Sashiko)
- Restrict the riscv selftest guard to __riscv_xlen == 64 so the
  tests are not enabled on RV32. (Sashiko)
- Link to v1: https://lore.kernel.org/r/20260812-bpf-riscv-stack-args-v1-0-67b246806e59@kylinos.cn

---
Feng Jiang (2):
      bpf, riscv: Add BPF stack arguments support for RV64 JIT
      selftests/bpf: Enable stack argument tests for RV64

 arch/riscv/net/bpf_jit.h                           |  1 +
 arch/riscv/net/bpf_jit_comp64.c                    | 79 +++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c                      |  4 ++
 .../selftests/bpf/progs/btf__stack_arg_precision.c |  3 +-
 .../bpf/progs/btf__verifier_stack_arg_order.c      |  3 +-
 tools/testing/selftests/bpf/progs/exceptions.c     |  5 +-
 tools/testing/selftests/bpf/progs/stack_arg.c      |  3 +-
 .../testing/selftests/bpf/progs/stack_arg_kfunc.c  |  3 +-
 .../selftests/bpf/progs/stack_arg_precision.c      |  3 +-
 .../selftests/bpf/progs/verifier_stack_arg.c       |  3 +-
 .../selftests/bpf/progs/verifier_stack_arg_order.c |  3 +-
 11 files changed, 98 insertions(+), 12 deletions(-)
---
base-commit: d114bb98936770c501c958bf2bc5fb6b7c0bad7b
change-id: 20260728-bpf-riscv-stack-args-6350d066a1e9

Best regards,
-- 
Feng Jiang <jiangfeng@kylinos.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
