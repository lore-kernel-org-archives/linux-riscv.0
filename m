Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA667C41513
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4qJ0zHNO0LaWU1LoXzdRSQzSVrSkmgchi3KCgmWMKuY=; b=JJuz7cK3HLEKu4
	iQVXOrJdNxjgyHTC/TCS9nfm6lJ81F1FnkBf8VZNvEY2ROxG8vZ6VTEMwLbb2B7JWZtuZ1O+t1cHi
	WTQoc5XDSIlUREZpILGafYV7PgVMBh7aFO1c+WJlS+NldrnbClBzSHv4aii078kuts5xJVpwA00Ju
	y/fSPeCVQ2BRI72h8poR1a+Qm2F8D5dAxFK6ZfhqIJ2Ebl5D/tMN5IpTb9NH4dynBwAM7PesklgHn
	RDFM/4J5mNEGWFngEqR/k6cuUdGZ5Wcb/h6gCVgHRlVDwKh7j7T9YKCNIaBcn0NH6Wp5Lg4frKtde
	ue47ULnytVtJz40u0fbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8GMk-00000009pmB-45M2;
	Sat, 18 May 2024 09:28:34 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8GMg-00000009piL-2721
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 09:28:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VhJQr1qRsz4f3lVX
	for <linux-riscv@lists.infradead.org>; Sat, 18 May 2024 17:28:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 8AD661A0B54
	for <linux-riscv@lists.infradead.org>; Sat, 18 May 2024 17:28:14 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgBnwvWtdEhmbxE_NQ--.58131S2;
	Sat, 18 May 2024 17:28:13 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@gmail.com>
Subject: [PATCH bpf-next v2 0/3] Use bpf_prog_pack for RV64 bpf trampoline
Date: Sat, 18 May 2024 09:29:14 +0000
Message-Id: <20240518092917.2771703-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgBnwvWtdEhmbxE_NQ--.58131S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr43KF1rCFy8Ww4xtw1DZFb_yoW8GFy3pF
	43Ww13Cw1UXr9rWws3W3yUZF1Sqw48X347GrnrJ34rCF4YvFW8urnY9FWFvFyrWF95C3W0
	yr1j9Fy5u3WUZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_022830_900281_FFD50AFA 
X-CRM114-Status: UNSURE (   7.60  )
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

We used bpf_prog_pack to aggregate bpf programs into huge page to
relieve the iTLB pressure on the system. We can apply it to bpf
trampoline, as Song had been implemented it in core and x86 [0]. This
patch is going to use bpf_prog_pack to RV64 bpf trampoline. Since Song
and Puranjay have done a lot of work for bpf_prog_pack on RV64,
implementing this function will be easy. But one thing to mention is
that emit_call in RV64 will generate the maximum number of instructions
during dry run, but during real patching it may be optimized to 1
instruction due to distance. This is no problem as it does not overflow
the allocated RO image.

Tests about regular trampoline and struct_ops trampoline have passed, as
well as "test_verifier" with no failure cases.

Link: https://lore.kernel.org/all/20231206224054.492250-1-song@kernel.org [0]

v2:
- Emit max number of insns for the "im" addr during dry run to solve OOB issue. (Song)

v1: https://lore.kernel.org/all/20240123103241.2282122-1-pulehui@huaweicloud.com/

Pu Lehui (3):
  bpf: Use precise image size for struct_ops trampoline
  riscv, bpf: Fix out-of-bounds issue when preparing trampoline image
  riscv, bpf: Use bpf_prog_pack for RV64 bpf trampoline

 arch/riscv/net/bpf_jit_comp64.c | 57 +++++++++++++++++++++++----------
 kernel/bpf/bpf_struct_ops.c     |  2 +-
 2 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
