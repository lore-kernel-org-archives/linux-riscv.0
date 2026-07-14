Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD49C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/PkzNkUXkcceuwE6xa7gT46fIY/rPjeUbFEyPHfGZY4=; b=jeKWQiXkSnCIBH
	ifVq1xCLXDoXooecVLoDfvTN0UBwHmee3V6FMlzDSUzaAJhkBNLMKes86OGqrsqo1eBmyIdtHwbvR
	LO69FG9vmoV/sThPbGmGYjy2S+TkKOoNS7UKP/pz1+6yPQ28nPX4dy5pLNYS5YSAgBF8Aqzq+oGNs
	Ev1mZHe5TQBsHBgec17vhzuOLgXFDkGPI375Mltm5R8/uLMJl1K564Q77XGamIA47Fd6JC05EbBgz
	uOM7FYbRzsMJikvUNN6d22yBDQb3TGLsRolEimSHn6WZ/3AIpsqaqyPC/YHFzVrDcmA5oTVbH6pic
	uIJ9QrWDowAEDETF3sOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjc3o-0000000Bt7T-40d4;
	Tue, 14 Jul 2026 12:16:28 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjc3m-0000000Bt6X-0mbJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:16:28 +0000
X-UUID: d30591827f7d11f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:65e49d9b-65f5-41a1-a931-ce6cdd9a7377,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f2db2523097771b0a60b2a2a278609e7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d30591827f7d11f1aa26b74ffac11d73-20260714
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 620455899; Tue, 14 Jul 2026 20:16:21 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH v2 0/2] bpf, riscv: add timed may_goto support
Date: Tue, 14 Jul 2026 20:16:14 +0800
Message-Id: <20260714-riscv-bpf-timed-may-goto-v2-0-eeb6201aedcc@kylinos.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI4oVmoC/x3MTQqAIBBA4avErBswKfu5SrQwHW0WZWhEEd09a
 fkt3nsgUWRKMBQPRDo5cdgyZFmAWfTmCdlmgxRSibYSGDmZE+fd4cErWVz1jT4cAYU11Ki67xr
 tIOd7JMfXvx6n9/0AABaH+2oAAAA=
X-Change-ID: 20260710-riscv-bpf-timed-may-goto-0dce564985af
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_051626_538637_0C183C9F 
X-CRM114-Status: UNSURE (   7.58  )
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

This series adds RISC-V JIT support for the timed may_goto loop bound.

Patch 1 implements arch_bpf_timed_may_goto() and enables
bpf_jit_supports_timed_may_goto() so the verifier uses the timed
expansion path.

Patch 2 enables the verifier_may_goto_1, stream_cond_break, and
may_goto_interaction fastcall tests on riscv64.

Tested on riscv64 QEMU (rva23s64): may_goto programs load and JIT
correctly, and the 250ms timeout path works as expected.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
Changes in v2:
- Fix BPF_REG_0 being clobbered after arch_bpf_timed_may_goto() calls.
- Enable the may_goto_interaction fastcall test on riscv64.

---
Feng Jiang (2):
      bpf, riscv: add support for timed may_goto
      selftests/bpf: enable timed may_goto tests for riscv64

 arch/riscv/net/Makefile                            |  2 +-
 arch/riscv/net/bpf_jit_comp64.c                    | 13 ++++++-
 arch/riscv/net/bpf_timed_may_goto.S                | 44 ++++++++++++++++++++++
 tools/testing/selftests/bpf/progs/stream.c         |  1 +
 .../selftests/bpf/progs/verifier_bpf_fastcall.c    |  1 +
 .../selftests/bpf/progs/verifier_may_goto_1.c      |  4 ++
 6 files changed, 63 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260710-riscv-bpf-timed-may-goto-0dce564985af

Best regards,
-- 
Feng Jiang <jiangfeng@kylinos.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
