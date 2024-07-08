Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED78C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGfUyZXl/G1iweT4IsBooQuETcGsrJx7+U3belVd8VQ=; b=FhZUtYpEWOzk0+
	cADwBNAUL/RXOqFxm93PjfcaGjZBiBgHZzUiu+jqOuEXDBNvuQ7iOCtzFSLNk1nrCIYn+R6LvmpfZ
	dkg+2S2pYsfGSR9pBHAEMMSbl3SOBTwHeEBYcVeODhO1zlyWvv92BPcV5m7g5/giEEsQcD+zWo2Aa
	pkTG7R5/eTkiQsNWgiKAw1XmihDVU5FvfQ8ScHyQBq2mmWZqLXfasC227DDJr3GUkku+WJQIBFGLe
	+ct+yt/Z/Lktia/uXuTYwK/NOv+3H1znp67cEMNLnmjeGVC+M59EzxspV2mCBYPOr/r4Kj4IFfmey
	wjCUCH6CFRiIc4FqC5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQmqv-00000003dFx-2l0R;
	Mon, 08 Jul 2024 11:48:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQmqs-00000003dFI-1fqF
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 11:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C55260ACD;
	Mon,  8 Jul 2024 11:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB1C3277B;
	Mon,  8 Jul 2024 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720439293;
	bh=i5ILsQ9VoVlBo8l39ZX3010d75/Wg1BHVm9GReTAJtc=;
	h=From:To:Subject:Date:From;
	b=mmQl/e1REfBdTnDJ7gFM+PDLEOQN7XIWFhY4QuDQxRro6Qm3MqA7xLpfL/KVXc6kb
	 3J43StFsu22DFaNUb7OQeT1Zxyd5XE4cZpiikOjgvEu8CwHM9fvGS6A1raSmL3Cacr
	 YgsNHkV8Vt2FRt6cuGdxEniYCAw3AypKV27wTSTpS0SjvGek3kbt6sGi+Xeb1zHraA
	 0y4jkTCNmymZBY0n3m8KVNzGFyGWwQLtS/Hyu+oz8yUY8AJNYpT7h2XVOoXb9DeDVR
	 3eGtIzIpCAmpf2i+CIoB4sgYhS5JWCJxo13b0yANfNo1Z9iJxylAVFdR2nqyYHFBYF
	 9W/pCY/LCQ19g==
From: Puranjay Mohan <puranjay@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] riscv, bpf: Optimize stack usage of trampoline
Date: Mon,  8 Jul 2024 11:47:58 +0000
Message-Id: <20240708114758.64414-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_044815_557206_FE0C4BDC 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When BPF_TRAMP_F_CALL_ORIG is not set, stack space for passing arguments
on stack doesn't need to be reserved because the original function is
not called.

Only reserve space for stacked arguments when BPF_TRAMP_F_CALL_ORIG is
set.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/riscv/net/bpf_jit_comp64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 685c7389ae7e..0795efdd3519 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -892,7 +892,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	stack_size += 8;
 	sreg_off = stack_size;
 
-	if (nr_arg_slots - RV_MAX_REG_ARGS > 0)
+	if ((flags & BPF_TRAMP_F_CALL_ORIG) && (nr_arg_slots - RV_MAX_REG_ARGS > 0))
 		stack_size += (nr_arg_slots - RV_MAX_REG_ARGS) * 8;
 
 	stack_size = round_up(stack_size, STACK_ALIGN);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
