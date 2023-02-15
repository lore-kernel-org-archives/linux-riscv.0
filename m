Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E40FC6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yD/x9AUdLh+js77CYwt0NA66lUeIxj1+Sdb6yZzhp0=; b=yjizgDMIHQg+V4
	wgoxm0M4ATPNp7lndc/eyDpz1UjnEjTIyf+BQG8WvwN0g3qlolpQCaa2315P3I6S6oe3Q2ni7oOtO
	i23qH9aMTPSTuUXs8R2jJNeQz/6Dde3PCUuFWvufuarc4eMrj3s6leg6tkphZGwiOt6UJSj9uuwI2
	MXbvsv5s214AwnJql3Wy5anzegVvtQAwmJE3EIkR1omf2wu12O4aqqUsaeFxAOSIiGfU9bjBOK8C2
	sX5DTAkD9iI4vzdjWU/YmuT3dLHNgsk4/HW1rXuPweY93AI2wySGYIpUF7CfT0he4maCD8MJ9C+Vm
	tYQ+qn1lDVKkXEXF8KAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIAl-0066hk-Dq; Wed, 15 Feb 2023 13:50:11 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIAe-0066Zo-89
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 13:50:07 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PGzwC0zy2z4f3jqv
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 21:49:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP1 (Coremail) with SMTP id cCh0CgDnUSz64uxjC3LEDQ--.36740S3;
	Wed, 15 Feb 2023 21:49:49 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v1 1/4] riscv: Extend patch_text for multiple instructions
Date: Wed, 15 Feb 2023 21:52:02 +0800
Message-Id: <20230215135205.1411105-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215135205.1411105-1-pulehui@huaweicloud.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnUSz64uxjC3LEDQ--.36740S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW8AFWxKw4kCr48KFy3urg_yoWrJFWxpa
	n8GwnxXFWrWFnYk343Aw4kZr1rKan093srK3yUWayftF1jyr15Jwn5tw47Ar15GF1F9r1a
	vrn0gryrua48Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHE__UUUUU
	=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_055004_691420_8149E185 
X-CRM114-Status: GOOD (  13.00  )
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

Extend patch_text for multiple instructions. This
is the preparaiton for multiple instructions text
patching in riscv bpf trampoline, and may be useful
for other scenario.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/include/asm/patch.h     |  2 +-
 arch/riscv/kernel/patch.c          | 19 ++++++++++++-------
 arch/riscv/kernel/probes/kprobes.c | 15 ++++++++-------
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
index 9a7d7346001e..f433121774c0 100644
--- a/arch/riscv/include/asm/patch.h
+++ b/arch/riscv/include/asm/patch.h
@@ -7,6 +7,6 @@
 #define _ASM_RISCV_PATCH_H
 
 int patch_text_nosync(void *addr, const void *insns, size_t len);
-int patch_text(void *addr, u32 insn);
+int patch_text(void *addr, u32 *insns, int ninsns);
 
 #endif /* _ASM_RISCV_PATCH_H */
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..8086d1a281cd 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -15,7 +15,8 @@
 
 struct patch_insn {
 	void *addr;
-	u32 insn;
+	u32 *insns;
+	int ninsns;
 	atomic_t cpu_count;
 };
 
@@ -102,12 +103,15 @@ NOKPROBE_SYMBOL(patch_text_nosync);
 static int patch_text_cb(void *data)
 {
 	struct patch_insn *patch = data;
-	int ret = 0;
+	unsigned long len;
+	int i, ret = 0;
 
 	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
-		ret =
-		    patch_text_nosync(patch->addr, &patch->insn,
-					    GET_INSN_LENGTH(patch->insn));
+		for (i = 0; ret == 0 && i < patch->ninsns; i++) {
+			len = GET_INSN_LENGTH(patch->insns[i]);
+			ret = patch_text_nosync(patch->addr + i * len,
+						&patch->insns[i], len);
+		}
 		atomic_inc(&patch->cpu_count);
 	} else {
 		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
@@ -119,11 +123,12 @@ static int patch_text_cb(void *data)
 }
 NOKPROBE_SYMBOL(patch_text_cb);
 
-int patch_text(void *addr, u32 insn)
+int patch_text(void *addr, u32 *insns, int ninsns)
 {
 	struct patch_insn patch = {
 		.addr = addr,
-		.insn = insn,
+		.insns = insns,
+		.ninsns = ninsns,
 		.cpu_count = ATOMIC_INIT(0),
 	};
 
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 41c7481afde3..ef6d6e702485 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -23,13 +23,14 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
+	u32 insn = __BUG_INSN_32;
 	unsigned long offset = GET_INSN_LENGTH(p->opcode);
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
-	patch_text(p->ainsn.api.insn, p->opcode);
+	patch_text(p->ainsn.api.insn, &p->opcode, 1);
 	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
-		   __BUG_INSN_32);
+		   &insn, 1);
 }
 
 static void __kprobes arch_prepare_simulate(struct kprobe *p)
@@ -114,16 +115,16 @@ void *alloc_insn_page(void)
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
-	if ((p->opcode & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
-		patch_text(p->addr, __BUG_INSN_32);
-	else
-		patch_text(p->addr, __BUG_INSN_16);
+	u32 insn = (p->opcode & __INSN_LENGTH_MASK) == __INSN_LENGTH_32 ?
+		   __BUG_INSN_32 : __BUG_INSN_16;
+
+	patch_text(p->addr, &insn, 1);
 }
 
 /* remove breakpoint from text */
 void __kprobes arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_text(p->addr, p->opcode);
+	patch_text(p->addr, &p->opcode, 1);
 }
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
