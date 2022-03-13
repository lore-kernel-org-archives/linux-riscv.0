Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D5CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Mar 2022 01:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5siYMIgsosn/XCafKqtneRxAYgEcbLp7eFsKA11IrQ=; b=KRxV+YgX7PO+bF
	Nu1jys2diXbewR1uwKKet+0AZs//Tey+h8gBH0w1Xlg4qgaE6BfVVgbNR02n6dqzcFqNPbaDvf1BP
	IR3rb8RKrBBbcCmZhqPiRtPgBYAel8Gl/6r6xuQVs45+5GGpEYpKJv86iZ8RwqmSiRhIArK/6xDjQ
	nNs+i30B8BlxOgrzxnWmMawxDx6ii0yz2BLXdxywnXkZcSz40U6nN+nW13lz6OCsc+mQ3ATldBj3i
	x7zv2POpElvbmu3JG+NDozfgD/dEExL2SMxUFSNmXjrtu1oQ3Lb1oz8vrrQFS7P3paqIZn8vt/Rkf
	xkxGk22qDIj56uylkE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTCwb-0025zS-I9; Sun, 13 Mar 2022 01:22:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTCwP-0025y2-Ov; Sun, 13 Mar 2022 01:22:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F88060DEE;
 Sun, 13 Mar 2022 01:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CFDC340EC;
 Sun, 13 Mar 2022 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647134556;
 bh=2YQxyoOOki3WVR0j2UQxO+ys6flh/Qon049D3a/0iu4=;
 h=From:To:Cc:Subject:Date:From;
 b=X8p7gwzI+mEmzlREpKziVcY64DsccPFAFM4hgwI1QNXHep1omrAqPvLt0uDzeEV2k
 que4wgyhPK2NY4Dj+CM3UDAZDPLA5n+H/349nJobRRVQhjbBzUoLcILzj977Dq2ljV
 v28IIMz2kFn4vbwfzfpb0bh3Ytmp4FjOwgs3oJmyGAd8YBNB/xMuitxgmNkaBHog7c
 f8ySilpnVPW1S97/HZORNWobKILN3ZuSn+iE2avxdH9g70BsSF15kvXeWiEHb9GR88
 XCuUluRfu+4bJ7EG2jMlJJVAF5kbYIOykB+MES5V145Mnvpp4+OrrYagW+hwZsVKNE
 pnCWpXW9Ja8dg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Guo Ren <guoren@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chris Zankel <chris@zankel.net>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH V2] arch: patch_text: Fixup last cpu should be master
Date: Sun, 13 Mar 2022 09:22:21 +0800
Message-Id: <20220313012221.1755483-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_172237_936247_19B4D923 
X-CRM114-Status: GOOD (  17.85  )
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

From: Guo Ren <guoren@linux.alibaba.com>

These patch_text implementations are using stop_machine_cpuslocked
infrastructure with atomic cpu_count. The original idea: When the
master CPU patch_text, the others should wait for it. But current
implementation is using the first CPU as master, which couldn't
guarantee the remaining CPUs are waiting. This patch changes the
last CPU as the master to solve the potential risk.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Peter Zijlstra <peterz@infradead.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Chris Zankel <chris@zankel.net>
Cc: Arnd Bergmann <arnd@arndb.de>

---
Changes in V2:
 - Fixup last cpu should be num_online_cpus() by Max Filippov
 - Fixup typos found by Max Filippov
---
 arch/arm64/kernel/patching.c      | 4 ++--
 arch/csky/kernel/probes/kprobes.c | 2 +-
 arch/riscv/kernel/patch.c         | 2 +-
 arch/xtensa/kernel/jump_label.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 771f543464e0..33e0fabc0b79 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -117,8 +117,8 @@ static int __kprobes aarch64_insn_patch_text_cb(void *arg)
 	int i, ret = 0;
 	struct aarch64_insn_patch *pp = arg;
 
-	/* The first CPU becomes master */
-	if (atomic_inc_return(&pp->cpu_count) == 1) {
+	/* The last CPU becomes master */
+	if (atomic_inc_return(&pp->cpu_count) == num_online_cpus()) {
 		for (i = 0; ret == 0 && i < pp->insn_cnt; i++)
 			ret = aarch64_insn_patch_text_nosync(pp->text_addrs[i],
 							     pp->new_insns[i]);
diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
index 42920f25e73c..34ba684d5962 100644
--- a/arch/csky/kernel/probes/kprobes.c
+++ b/arch/csky/kernel/probes/kprobes.c
@@ -30,7 +30,7 @@ static int __kprobes patch_text_cb(void *priv)
 	struct csky_insn_patch *param = priv;
 	unsigned int addr = (unsigned int)param->addr;
 
-	if (atomic_inc_return(&param->cpu_count) == 1) {
+	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
 		*(u16 *) addr = cpu_to_le16(param->opcode);
 		dcache_wb_range(addr, addr + 2);
 		atomic_inc(&param->cpu_count);
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..765004b60513 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
 	struct patch_insn *patch = data;
 	int ret = 0;
 
-	if (atomic_inc_return(&patch->cpu_count) == 1) {
+	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		ret =
 		    patch_text_nosync(patch->addr, &patch->insn,
 					    GET_INSN_LENGTH(patch->insn));
diff --git a/arch/xtensa/kernel/jump_label.c b/arch/xtensa/kernel/jump_label.c
index 61cf6497a646..b67efcd7e32c 100644
--- a/arch/xtensa/kernel/jump_label.c
+++ b/arch/xtensa/kernel/jump_label.c
@@ -40,7 +40,7 @@ static int patch_text_stop_machine(void *data)
 {
 	struct patch *patch = data;
 
-	if (atomic_inc_return(&patch->cpu_count) == 1) {
+	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		local_patch_text(patch->addr, patch->data, patch->sz);
 		atomic_inc(&patch->cpu_count);
 	} else {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
