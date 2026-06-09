Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D9CD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yhOVwySPdCcvv3wd8EHLALH4o8JdaLpu7xHShGkgf8=; b=QfeLGULSPkW31s
	wTA2vWcDTBhD9tPY86DSal15Htf7tLsygasTayTSvlcTpKY75ovHU6TPA6d3R/bfsfx8bKZlIgYwP
	/SuOyvaWHOkj1hUfNaKVP8aSHqvvbB1hQDh0M12pXeZfJUFHRBGVkjlMyjRpl1BIJFWqDnQzB5bkp
	Ue1COgGic+KT9vjVzGaD6XiIoV2nTa8gZkO5Fn6It5vzij6SkKw2BXMUDzv77SRxwerFGAl3sLnPN
	/zbrRsMM/1NcUQNh1jihloMfmafskf1NDL4IyVoI20IukKJE9GjiM4Ye15Y3ywyMT7Be/fVH6GAOv
	GC+u5dhbawniZscjXveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyl-00000004rus-1ytB;
	Tue, 09 Jun 2026 06:30:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyi-00000004rtq-149t
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cs5txbx9bpKaRI7bmx5ga6+SdBKGKPqwgmoXTwT+GtE=; b=BEpZwTA/uX/XEQgyg9uTCkEOQC
	TsEHeT9cTp0XNYjKrmbgyaduGLfq2mwkcGge2Cdqx/wCCYNX7wtOwXP9n/yWO+s5ASLKZwucSmNMU
	6yhK+gbWe4pejDEXMX3tsYeI2AMAyPW6NyUBd0aLRYKooSAz/QCIo/JYhc2wvPxdIYAjVvelj/cfa
	TuvT1dvhDEMD0jp9SHpNbC3BKS96pymXNJWFcbd2Qli8XVEkRrh1dJu8sB4DanEL0prksAlhg2Ltn
	63Rp92105YHSChpyiYEr39PvQfbH+EK0PdFq99h19gSNyCTT4C72zuT917mv3fq0Vsif8qPyabk73
	yuTmiTYA==;
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpye-000000022Bz-0K1y
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780986610; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cs5txbx9bpKaRI7bmx5ga6+SdBKGKPqwgmoXTwT+GtE=;
	b=pDqbplQu5D11UzLOGC8s2Ugt449WdHKZ33TU1KOjd6NWoMpJgQpGjN3q8iCH26E7jsQuZsNi3RB12FUNAfimCW4FJn82U80eab44lrl//KU1ysmDgxG6ITtGPX5UassIht06feVyzL6PaIZDbVNV8xaaiF4PhP5ozB+MmTrdq3M=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X4VD51P_1780986607;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X4VD51P_1780986607 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 14:30:08 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3 4/8] riscv: ftrace: always preserve s0 in dynamic ftrace register frame
Date: Tue,  9 Jun 2026 14:29:55 +0800
Message-ID: <20260609063002.3943001-4-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
References: <20260528082310.1994388-1-wanghan@linux.alibaba.com> <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073020_568658_7F81D9BE 
X-CRM114-Status: UNSURE (   9.20  )
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

struct __arch_ftrace_regs declares s0 unconditionally, and both
ftrace_regs_get_frame_pointer() and ftrace_partial_regs() read it
unconditionally. But the SAVE_ABI_REGS / RESTORE_ABI_REGS macros in
mcount-dyn.S only stored s0 under HAVE_FUNCTION_GRAPH_FP_TEST
(CONFIG_FUNCTION_GRAPH_TRACER && CONFIG_FRAME_POINTER). With
CONFIG_FRAME_POINTER=n the slot held whatever was on the stack before,
so any callback going through ftrace_partial_regs() saw a garbage
regs->s0. RISC-V kernels default to FRAME_POINTER=y, which is why this
has not bitten in practice.

Save and restore s0 unconditionally in the dynamic ftrace ABI register
frame. This fixes the latent garbage-s0 case, brings the dynamic ftrace
path in line with the static _mcount path (mcount.S SAVE_ABI_STATE
already saves s0 unconditionally), and matches the frame layout already
documented in the comment above SAVE_ABI_REGS. It is also a prerequisite
for the upcoming reliable unwinder, which reads
ftrace_regs_get_frame_pointer(fregs) directly.

The cost is one extra REG_S/REG_L pair per traced call, negligible
compared to the overall ftrace cost; the existing FREGS_SIZE_ON_STACK
already reserved the slot, so no extra stack space is used.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 arch/riscv/kernel/mcount-dyn.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 082fe0b0e3c0..26c55fba8fec 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -85,9 +85,7 @@
 	addi	sp, sp, -FREGS_SIZE_ON_STACK
 	REG_S	t0,  FREGS_EPC(sp)
 	REG_S	x1,  FREGS_RA(sp)
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	REG_S	x8,  FREGS_S0(sp)
-#endif
 	REG_S	x6,  FREGS_T1(sp)
 #ifdef CONFIG_CC_IS_CLANG
 	REG_S	x7,  FREGS_T2(sp)
@@ -113,9 +111,7 @@
 	.macro RESTORE_ABI_REGS
 	REG_L	t0, FREGS_EPC(sp)
 	REG_L	x1, FREGS_RA(sp)
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	REG_L	x8, FREGS_S0(sp)
-#endif
 	REG_L	x6,  FREGS_T1(sp)
 #ifdef CONFIG_CC_IS_CLANG
 	REG_L	x7,  FREGS_T2(sp)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
