Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A881FC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 02:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ql2RxPyQL7cEk7gxJ4cvi2CGqKHzriSVhemtdfAWrRU=; b=bzxVwfR63UKgan
	8UXyzfhBg9EXKkoB5O3/hkeLLVXbGncDPEVSRH5lyzHc0XM7+NDWlT9/0UkV/rKupDY5nGQ2mMOxk
	U1HyP+IS18CSb4jzJoktWx72YpdPw09kuvq9InoOhJ4PXShBR/oBl3qRGKm0rNYoBxtfuub/McsUv
	PmydOp1x/NlFL0KYcxIHp+wYCehc16Mrk+kasDP60nbKearX4Fc8fZsV0DHFNSI64+QXqEr2HwbcH
	EELLHzecxX4gqpoa+lnMMp14JjKvNZEWAjQEQJ4cKrq9h++7f+N3wfkmrazQ1FaykCE+CTAiPsVMs
	WWdD++cFFbybn6ReZKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqvD-00B1Lp-Nh; Sat, 11 Jun 2022 02:32:19 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqv7-00B1HK-1i
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 02:32:19 +0000
X-QQ-mid: bizesmtp64t1654914689tjsdarmm
Received: from localhost.localdomain ( [119.123.130.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Jun 2022 10:31:25 +0800 (CST)
X-QQ-SSF: 01200000002000B0L000000A0000000
X-QQ-FEAT: Or3swkal8d38dWusfdqAWatg0UskKfEkorNwBW1fwT3txOLRYbyIkGGKW1w4+
	q8YT3J1nikPznKhX6O/a9oAn9qFJioEkBpZsOJmZ4+MvWNU4mZuz9hCnro13xtKXFLtMFEj
	1TXvBhftYG8MOBSnQko94I4vSfP2qsUTx8lg6F+8zyc1tJdVKLLzmwseciZjQO8e8NOrem/
	t0bRa+L4N31hD3m8yZqI3KW2q0+zzK5kYLxdBuE3OWCdmP7TNXXXLYSxuvpVimc8Jrsvx1Y
	e5TEY5SQuexAevTfiCLMYujllQEsA+dY9HZPW+E48R8U9gN5IgMZBj75BW/uDvoTSyZxoMZ
	rlUhEUsQbZPS8PMwbU=
X-QQ-GoodBg: 0
From: Wu Zhangjin <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Zong Li <zong.li@sifive.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Wu Zhangjin <falcon@tinylab.org>
Subject: [RFC] riscv: restore the irq save/restore logic for nosync code patching
Date: Sat, 11 Jun 2022 10:31:22 +0800
Message-Id: <20220611023122.211621-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_193213_888012_1503EC56 
X-CRM114-Status: GOOD (  11.48  )
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

The commit '0ff7c3b331276f584bde3ae9a16bacd8fa3d01e6' removed the
old patch_lock together with the irq save/restore logic.

But the patching interface: patch_text_nosync() has new users like
Jump Label, which doesn't use stop_machine(), here restores the irq
save/restore logic for such users, just as the other architectures do.

Move lockdep assert to the required path too, the current stop_machine()
based ftrace implementation should use the new added patch_text_noirq()
without this lockdep assert, it has its own mutex, but not named as
text_mutex.

As the latest maillist shows, a new ftrace support without
stop_machine() is in review, which requires the nosync version with this
irq save/restore logic or the new added noirq version (as we can see it
also calls patch_insn_write) with explicit text_mutex and irq
save/restore logic.

Signed-off-by: Wu Zhangjin <falcon@tinylab.org>
---
 arch/riscv/kernel/patch.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 765004b60513..03f03832e077 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 	int ret;
 
-	/*
-	 * Before reaching here, it was expected to lock the text_mutex
-	 * already, so we don't need to give another lock here and could
-	 * ensure that it was safe between each cores.
-	 */
-	lockdep_assert_held(&text_mutex);
-
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
 
@@ -85,7 +78,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 NOKPROBE_SYMBOL(patch_insn_write);
 #endif /* CONFIG_MMU */
 
-int patch_text_nosync(void *addr, const void *insns, size_t len)
+/* For stop_machine() or the other cases which have already disabled irq and have locked among cpu cores */
+int patch_text_noirq(void *addr, const void *insns, size_t len)
 {
 	u32 *tp = addr;
 	int ret;
@@ -97,6 +91,26 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
 
 	return ret;
 }
+NOKPROBE_SYMBOL(patch_text_noirq);
+
+int patch_text_nosync(void *addr, const void *insns, size_t len)
+{
+	int ret;
+	unsigned long flags;
+
+	/*
+	 * Before reaching here, it was expected to lock the text_mutex
+	 * already, so we don't need to give another lock here and could
+	 * ensure that it was safe between each cores.
+	 */
+	lockdep_assert_held(&text_mutex);
+
+	local_irq_save(flags);
+	ret = patch_text_noirq(addr, insns, len);
+	local_irq_restore(flags);
+
+	return ret;
+}
 NOKPROBE_SYMBOL(patch_text_nosync);
 
 static int patch_text_cb(void *data)
@@ -106,7 +120,7 @@ static int patch_text_cb(void *data)
 
 	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		ret =
-		    patch_text_nosync(patch->addr, &patch->insn,
+		    patch_text_noirq(patch->addr, &patch->insn,
 					    GET_INSN_LENGTH(patch->insn));
 		atomic_inc(&patch->cpu_count);
 	} else {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
