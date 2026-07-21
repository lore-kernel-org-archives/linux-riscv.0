Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EAEC44532
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Mime-Version:Cc:Message-Id:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=On3zFwdSZqOaWcmRsFytw6SnAc6Uv7OQw9JmvFxmR+U=; b=MeRERZU3kPJaUM
	tN7nlYFF/Do35/3cBMS/0wv/VfAaHqPfKSkhCg3VPwQwjMsLSgu/qhirZf2ygdgt/S1C6/DIGropG
	dAW0av0wTlc/FF+2WgZFzXn6LyvY5q2I8r8hsXsmTEvem7yyXkZCbPm4dhO6bXpt88b4WW7SAWz/e
	qru4qKLB+1i+/0woHZ3cC6ybYtKgRcLnSPwLxhiCKS3j2QQHpTAMB3ss+lggJQHkeywCec/f7m2d/
	PdRnfv26URexs9NSPjdxBwCdLpXfcp4/nRhcXu6hGrm2mzf9XactvM1c+ezWvHotEFnmML8P5ZOHa
	B4KW6OTzPjATN3D04pFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC2Q-00000009jgn-2rV4;
	Tue, 21 Jul 2026 15:05:42 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmC2N-00000009jec-3xg7
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 15:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1784646330; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gX5iLP2z4bs17qGVKXq5rYDX7dWy680RM49G92z9hH8=;
 b=XNskzERjUx+C8RthLqexr9yDzUmC8clNWWOHwT1x0+sW1FGmtKFQ5Jl/dzBE29lp/LU57l
 DP+i/kjCl3SK/X2tJIhUBiJXuhFgVEWAmItvd4Oii/P19yJhEZB4Lu2Npk61+BdFd+BQAU
 bX9tawz8iG7h0IK6izFqyhqLNIBRkKtSiwepJ4ZbLkvxJK2Uditu2hRJAtAOO/rn+SKQfI
 hjcJK2uo9AaKKcKdTvW9RRYhmL4u3/trKZyC0hP3JkhjsKO5c5SpZU8lymOMbZaiB4QQL9
 IvvufSGgUSCkMPHkb5Hj/zjPdigpszwY0/ePUBbeoqA+5Sq7Fm2tk0mrjAT6Vw==
To: <linux-riscv@lists.infradead.org>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Subject: [PATCH] riscv: hwprobe: Register unaligned probes before usermode
Message-Id: <20260721150511.1607105-1-qirui.001@bytedance.com>
Cc: "Rui Qi" <qirui.001@bytedance.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Nam Cao" <namcao@linutronix.de>, "Kees Cook" <kees@kernel.org>, 
	"Jingwei Wang" <wangjingwei@iscas.ac.cn>, 
	"open list" <linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+26a5f8ab8+000b78+lists.infradead.org+qirui.001@bytedance.com>
Mime-Version: 1.0
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Tue, 21 Jul 2026 23:05:09 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_080540_054328_B663CBAE 
X-CRM114-Status: UNSURE (   9.06  )
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

The hwprobe vDSO data is populated by the first riscv_hwprobe syscall.
Some values, such as MISALIGNED_VECTOR_PERF, may depend on the async
vector unaligned access speed probe registered by
check_unaligned_access_all_cpus().

That initcall currently runs at late_initcall level. However,
rootfs_initcall enables usermode helpers before late initcalls run, so an
early helper can execute userspace and call riscv_hwprobe first.

In that case complete_hwprobe_vdso_data() consumes the initial
pending_boot_probes reference, populates the vDSO cache, and marks it
ready before the later async probe is registered. The eventual probe
result then cannot update the already-ready cache.

Move check_unaligned_access_all_cpus() to fs_initcall_sync. This still
runs after clocksource_done_booting(), so the ktime_get_mono_fast_ns()
benchmark uses a stable clocksource, but it runs before rootfs_initcall
enables usermode helpers.

Any async hwprobe probe is therefore registered before userspace can
trigger the one-time vDSO cache population.

Fixes: 6455c6c11827 ("riscv: Clean up & optimize unaligned scalar access probe")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index bb57eb5d19df..ee2ac9972510 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -411,4 +411,10 @@ static int __init check_unaligned_access_all_cpus(void)
 	return 0;
 }
 
-late_initcall(check_unaligned_access_all_cpus);
+/*
+ * Run after clocksource_done_booting() so measure_cycles() uses a stable
+ * clocksource, but before rootfs_initcall() enables usermode helpers. Those
+ * helpers can reach hwprobe and populate the vDSO cache, so async hwprobe
+ * probes must be registered first.
+ */
+fs_initcall_sync(check_unaligned_access_all_cpus);
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
