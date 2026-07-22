Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CFEC44512
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 04:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1GsKOhPyyKRDBodj1TSp0khED3NN3DCf93jcY1pgbVo=; b=XBz7fDJduv05xf
	LzVTD83xMggypfOgWiqHDabR283OxUYkT+J35WdAtQb4B2vK8VTFY0BNpUqwYsW86N1+cZ7gO0x6x
	bizYmPYqnNWdTBtYuOnxp7LRN34VAsBc2GQR5K4FeoddU7YB5ZUtje8Vi31R3T5ovSvZfLhJoMubH
	NvYLqbM3oQRh3fyLt2/epjQTW8UQiGvCZELBBEXiprIeS3W3bj7ZfLe5lqVapSOuVx8LvUfIfagTN
	I7TqnTsu5J9rpzydMOrEKfa1JvEPfRVKJUg5s1LEEPcxlVJXXP2Y8Psd8D0JBiIeiq7veGa39QkeP
	GWztbg/2eB+96CwqYlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOTf-0000000AsVK-3qrv;
	Wed, 22 Jul 2026 04:22:39 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOTZ-0000000AsRV-0Arn
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 04:22:35 +0000
X-UUID: ed0af8d0858411f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5d92c429-5465-4ab4-8a8b-8fa8adf55d60,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:38b6ac61c8f95797365616dffae84f27,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ed0af8d0858411f1aa26b74ffac11d73-20260722
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 222012023; Wed, 22 Jul 2026 12:22:18 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH bpf-next v4 0/3] bpf, riscv: add timed may_goto support
Date: Wed, 22 Jul 2026 04:21:24 +0000
Message-Id: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAERFYGoC/3WNyw6CMBREf4XctddUCgiu/A/DovYBN0pL2qaBE
 P7dSty6nJyZMxsE7UkHuBUbeJ0okLM5VKcC5CjsoJFUzlCysmHXC0NPQSZ8zgYjTVrhJFYcXHT
 IlNR1U3VtLQzk+ey1oeVQP+Dbt3qJ0GcyUojOr8dn4gf/6ev/+sSRoTSl6CRXbcXN/bW+ybpwl
 hb6fd8/BKUuDMsAAAA=
X-Change-ID: 20260710-riscv-bpf-timed-may-goto-0dce564985af
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_212233_394729_9B3ABB05 
X-CRM114-Status: GOOD (  10.81  )
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

Patch 2 adds a test that checks R0-R5 are preserved across
arch_bpf_timed_may_goto() calls.

Patch 3 enables the verifier_may_goto_1, stream_cond_break, and
may_goto_interaction fastcall tests on riscv64.

Tested on riscv64 QEMU (rva23s64): may_goto programs load and JIT
correctly, and the 250ms timeout path works as expected.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
Changes in v4:
- Add 'bpf-next' prefix to match the BPF kernel tree workflow.
- Add a test checking that R0-R5 are preserved across
  arch_bpf_timed_may_goto() calls. Use bpf_get_prandom_u32() to
  prevent the verifier from removing the checks via DCE.
- Rename may_goto_interaction_arm64() to may_goto_interaction().
- Wrap the arch_bpf_timed_may_goto address check to a single line.
- Link to v3: https://lore.kernel.org/r/20260715-riscv-bpf-timed-may-goto-v3-0-cf2a9c3d843f@kylinos.cn

Changes in v3:
- Set up the frame pointer in arch_bpf_timed_may_goto() so the function
  does not break stack unwinding under CONFIG_FRAME_POINTER.

Changes in v2:
- Fix BPF_REG_0 being clobbered after arch_bpf_timed_may_goto() calls.
- Enable the may_goto_interaction fastcall test on riscv64.

---
Feng Jiang (3):
      bpf, riscv: add support for timed may_goto
      selftests/bpf: test timed may_goto preserves R0-R5
      selftests/bpf: enable timed may_goto tests for riscv64

 arch/riscv/net/Makefile                            |  2 +-
 arch/riscv/net/bpf_jit_comp64.c                    | 12 ++++-
 arch/riscv/net/bpf_timed_may_goto.S                | 47 +++++++++++++++++
 tools/testing/selftests/bpf/progs/stream.c         |  1 +
 .../selftests/bpf/progs/verifier_bpf_fastcall.c    |  3 +-
 .../selftests/bpf/progs/verifier_may_goto_1.c      | 61 ++++++++++++++++++++++
 6 files changed, 123 insertions(+), 3 deletions(-)
---
base-commit: a23a71823352e2d792dcaae25f1ebb744acbfc0b
change-id: 20260710-riscv-bpf-timed-may-goto-0dce564985af

Best regards,
-- 
Feng Jiang <jiangfeng@kylinos.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
