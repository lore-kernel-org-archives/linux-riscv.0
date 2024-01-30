Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE28C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 04:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pDPe2OulkTwRmQzXsHeGMKfMoM2MaCZOma3/L7f5YjI=; b=4A+mWy+JkoByPP
	nfLsq+M9hHQP7kCLbSMI1r0FdZ6w2JfqpJfMC9xIQNqIeRrPjuaZLfjPdJuYteUoNgKVkLA20fexb
	EiiQ8AbPHGWG/zoQ6TfW2lQppfJ9haOL7mfV4eWtU0BH40FO8tuSujOVechkoTiBwVHvHYYzNnegf
	HF9TE+vz9UA8c3EB0t8vaXs+BwleUcpYqQ/+zTHj+aX7q9JfPa0jRcMPV0g63SSBdeSoAdbN9DNzt
	+Shcq4TBDNrClpvRWlYFcdxFOeeMyklfJ2gYhw654WT65BnwMjnSMZvmegxSKE6C8rClXjVHxfki5
	gdi3t93ClOcmdstMs/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfRE-0000000FDJW-24bK;
	Tue, 30 Jan 2024 04:09:32 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfR7-0000000FDFe-09Ba
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 04:09:28 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TPBW45WXQz4f3m7f
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 12:09:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 3DB1E1A0172
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 12:09:11 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgCHqg1ldrhlqljQCQ--.26624S2;
	Tue, 30 Jan 2024 12:09:09 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Song Liu <song@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 0/4] Mixing bpf2bpf and tailcalls for RV64
Date: Tue, 30 Jan 2024 04:09:54 +0000
Message-Id: <20240130040958.230673-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCHqg1ldrhlqljQCQ--.26624S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1kKFyrCF4DGF15ZFWrKrg_yoW8Wry3pa
	y3Ww13Gr1kXryxCw42ya18Ja4rGF4fA3W3Ar13tr1Fya1rCFyqgF1xGFWFqFyUAFZ2934j
	vF4Utan8CayUZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1
	22NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_200925_453745_01038562 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Pu Lehui <pulehui@huawei.com>

In the current RV64 JIT, if we just don't initialize the TCC in subprog,
the TCC can be propagated from the parent process to the subprocess, but
the TCC of the parent process cannot be restored when the subprocess
exits. Since the RV64 TCC is initialized before saving the callee saved
registers into the stack, we cannot use the callee saved register to
pass the TCC, otherwise the original value of the callee saved register
will be destroyed. So we implemented mixing bpf2bpf and tailcalls
similar to x86_64, i.e. using a non-callee saved register to transfer
the TCC between functions, and saving that register to the stack to
protect the TCC value. At the same time, we also consider the scenario
of mixing trampoline.

In addition, some code cleans are also attached to this patchset.

Tests test_bpf.ko and test_verifier have passed, as well as the relative
testcases of test_progs*.

v2:
- Fix emit restore RV_REG_TCC double times when `flags & BPF_TRAMP_F_CALL_ORIG`
- Use bpf_is_subprog helper

v1: https://lore.kernel.org/bpf/20230919035711.3297256-1-pulehui@huaweicloud.com

Pu Lehui (4):
  riscv, bpf: Remove redundant ctx->offset initialization
  riscv, bpf: Using kvcalloc to allocate cache buffer
  riscv, bpf: Add RV_TAILCALL_OFFSET macro to format tailcall offset
  riscv, bpf: Mixing bpf2bpf and tailcalls

 arch/riscv/net/bpf_jit.h        |   1 +
 arch/riscv/net/bpf_jit_comp64.c | 102 ++++++++++++++------------------
 arch/riscv/net/bpf_jit_core.c   |   9 +--
 3 files changed, 46 insertions(+), 66 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
