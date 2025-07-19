Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0390EC83F27
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 03:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hUHIlOSRG2AyeF6yKY7RwlEEywMnJNm5SqrcdPucFHo=; b=D2qZvem6Yc3aOj
	xFUA6QJ/CWQ4XAy74RWPTL5PBs6Tbox3Y4tMKwzEVrW/lQmnPEwDwYk480Zqs3Qs0KjBfjKPO2CBz
	4OoENyykhnEuG2USg2+dKVRMmSViL0LCt+2SKWqrk2rqTnT41mcOFkJFOSRH+g8orfYYINAA6EQHs
	5KNul4d7px3Z54eiIe2bbotPMGR3S42wP5F0qbbxyoUoqi5DVK1rbXURwStw17NfRPES87/KXfZWZ
	28o/7oAclvoksgaQIo3yI36Dd3AWlNIlifnzV14Dap3hxRsH77xt99UGhi8kG6zPJjDmfJQCxDDF3
	BBpm0StJfK3qp3jxxdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyRn-0000000DoYb-0hdd;
	Sat, 19 Jul 2025 03:41:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyRk-0000000DoXq-2z3a
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 03:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64400A575D0;
	Sat, 19 Jul 2025 03:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68234C4CEE3;
	Sat, 19 Jul 2025 03:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752896470;
	bh=vNKzp08fR6rGe3dowzaw73p6nSns3OGxHIzWfBKeCoc=;
	h=From:To:Cc:Subject:Date:From;
	b=ICxRnPSScuwdp+SZOPuNnTuroZxiNahWtbCQm7rdVOpcYHcYGPDTbISINBzBw7WYp
	 Htwfy3yVBSSDXPYhv+SuiGJXRquuMAH8407oTxNCnNlN3ONhFLj7HrVOFT2dCAHgGk
	 WDEdjp5zG5hbJVXVcuVnRBVN36fyo242jaUShPKyBSObrjD/i6EOnlegzlYiL0VOna
	 KTqtwC/9c+IHx6fuhLhpTzMDyPmHgI1AY8BfbYNgx4bNJVgtRY2TcGFibEuiluYQhK
	 Z9MXY+APLPoTPvAkNqAoIvLaAD5NBE1IA4Gjj4VVpjAomrdB9mkjftB4FB7r2bqJLZ
	 gycCfC/rVZghQ==
From: Drew Fustini <fustini@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <fustini@kernel.org>
Subject: [PATCH] riscv: Add sysctl to control discard of vstate during syscall
Date: Fri, 18 Jul 2025 20:39:13 -0700
Message-Id: <20250719033912.1313955-1-fustini@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_204112_891717_D10508B2 
X-CRM114-Status: GOOD (  19.09  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Clobbering the vector registers can significantly increase system call
latency for some implementations. To mitigate this performance impact, a
policy mechanism is provided to administrators, distro maintainers, and
developers to control vector state discard in the form of a sysctl knob:

/proc/sys/abi/riscv_v_vstate_discard

Valid values are:

0: Do not discard vector state during syscall
1: Discard vector state during syscall

The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.

Fixes: 9657e9b7d253 ("riscv: Discard vector state on syscalls")
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 Documentation/arch/riscv/vector.rst | 15 +++++++++++++++
 arch/riscv/Kconfig                  | 10 ++++++++++
 arch/riscv/include/asm/vector.h     |  4 ++++
 arch/riscv/kernel/vector.c          | 16 +++++++++++++++-
 4 files changed, 44 insertions(+), 1 deletion(-)

I've tested the impact of riscv_v_vstate_discard() on the SiFive X280
cores [1] in the Tenstorrent Blackhole SoC [2]. The results from the
Blackhole P100 [3] card show that discarding the vector registers
increases null syscall latency by 25%.

The null syscall program [4] executes vsetvli and then calls getppid()
in a loop. The average duration of getppid() is 198 ns when registers
are clobbered in riscv_v_vstate_discard(). The average duration drops
to 149 ns when riscv_v_vstate_discard() skips clobbering the registers
as result of riscv_v_vstate_discard being set to 0.

$ sudo sysctl abi.riscv_v_vstate_discard=1
abi.riscv_v_vstate_discard = 1

$ ./null_syscall --vsetvli
vsetvli complete
 iterations: 1000000000
   duration: 198 seconds
avg latency: 198.73 ns

$ sudo sysctl abi.riscv_v_vstate_discard=0
abi.riscv_v_vstate_discard = 0

$ ./null_syscall --vsetvli
vsetvli complete
 iterations: 1000000000
   duration: 149 seconds
avg latency: 149.89 ns

I'm testing on the tt-blackhole-v6.16-rc1_vstate_discard [5] branch that
has 13 patches, including this one, on top of v6.16-rc1. Most are simple
yaml patches for dt bindings along with dts files and a bespoke network
driver. I don't think the other patches are relevant to this discussion.

This patch applies clean on its own to riscv/for-next and next-20250718.

[1] https://www.sifive.com/cores/intelligence-x200-series
[2] https://tenstorrent.com/en/hardware/blackhole
[3] https://github.com/tenstorrent/tt-bh-linux
[4] https://gist.github.com/tt-fustini/ab9b217756912ce75522b3cce11d0d58
[5] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1_vstate_discard

diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
index 3987f5f76a9d..1edbce436015 100644
--- a/Documentation/arch/riscv/vector.rst
+++ b/Documentation/arch/riscv/vector.rst
@@ -137,4 +137,19 @@ processes in form of sysctl knob:
 As indicated by version 1.0 of the V extension [1], vector registers are
 clobbered by system calls.
 
+Clobbering the vector registers can significantly increase system call latency
+for some implementations. To mitigate the performance impact, a policy mechanism
+is provided to the administrators, distro maintainers, and developers to control
+the vstate discard in the form of a sysctl knob:
+
+* /proc/sys/abi/riscv_v_vstate_discard
+
+    Valid values are:
+
+    * 0: Do not discard vector state during syscall
+    * 1: Discard vector state during syscall
+
+    Reading this file returns the current discard behavior. The initial state is
+    controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
+
 1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0aeee50da016..c0039f21d1f0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -655,6 +655,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_VSTATE_DISCARD
+	bool "Enable Vector state discard by default"
+	depends on RISCV_ISA_V
+	default n
+	help
+	  Say Y here if you want to enable Vector state discard on syscall.
+	  Otherwise, userspace has to enable it via the sysctl interface.
+
+	  If you don't know what to do here, say N.
+
 config RISCV_ISA_V_UCOPY_THRESHOLD
 	int "Threshold size for vectorized user copies"
 	depends on RISCV_ISA_V
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 45c9b426fcc5..77991013216b 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -40,6 +40,7 @@
 	_res;								\
 })
 
+extern bool riscv_v_vstate_discard_ctl;
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -270,6 +271,9 @@ static inline void __riscv_v_vstate_discard(void)
 {
 	unsigned long vl, vtype_inval = 1UL << (BITS_PER_LONG - 1);
 
+	if (READ_ONCE(riscv_v_vstate_discard_ctl) == 0)
+		return;
+
 	riscv_v_enable();
 	if (has_xtheadvector())
 		asm volatile (THEAD_VSETVLI_T4X0E8M8D1 : : : "t4");
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 184f780c932d..7a4c209ad337 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -26,6 +26,7 @@ static struct kmem_cache *riscv_v_user_cachep;
 static struct kmem_cache *riscv_v_kernel_cachep;
 #endif
 
+bool riscv_v_vstate_discard_ctl = IS_ENABLED(CONFIG_RISCV_ISA_V_VSTATE_DISCARD);
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
 
@@ -307,11 +308,24 @@ static const struct ctl_table riscv_v_default_vstate_table[] = {
 	},
 };
 
+static const struct ctl_table riscv_v_vstate_discard_table[] = {
+	{
+		.procname       = "riscv_v_vstate_discard",
+		.data           = &riscv_v_vstate_discard_ctl,
+		.maxlen         = sizeof(riscv_v_vstate_discard_ctl),
+		.mode           = 0644,
+		.proc_handler   = proc_dobool,
+	},
+};
+
 static int __init riscv_v_sysctl_init(void)
 {
-	if (has_vector() || has_xtheadvector())
+	if (has_vector() || has_xtheadvector()) {
 		if (!register_sysctl("abi", riscv_v_default_vstate_table))
 			return -EINVAL;
+		if (!register_sysctl("abi", riscv_v_vstate_discard_table))
+			return -EINVAL;
+	}
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
