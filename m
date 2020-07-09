Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF44C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 02:22:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE660206F6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 02:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eBJdiJCK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zur6KN/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE660206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZU2HtMT2Igm6uQphEU9fJ7e1DB6Aec5djNT0MFtLas=; b=eBJdiJCKITNm7zS3CH+DMRHaeF
	Xkc79PN1IammRbSQm/4OkXn4yHXqsR5Hfw1L2bGuEoUmeSg3YCXE+e7075Tu8Pgwh8Qn9l2d+XuR8
	jEbt77j6xisL/FMxLO1uV3NyazeX7vUPtxQBI20yIsq8GtX8S1xP5BXqPS/+4Kltq9bDAQ1j3CqlF
	n5tWz+PO0b0MIDMouXWFSkYWlCA8+x3xaeKxtXRCHiOp37r948RJy3Jo9tgoiFSpnSu9pa6R0n3ds
	Mcf1+JY/BmopAfx21HCgRqfJ8zJSDS1+2GKjlS024YF1bH2Zst7+t6zRzCIyibhHgotNDbBqaA+Yp
	KJq+D7Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtMCW-0008WU-Jy; Thu, 09 Jul 2020 02:22:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtMCU-0008Vv-E3
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 02:22:15 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 407A0206F6;
 Thu,  9 Jul 2020 02:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594261333;
 bh=IjdtSlJXRmG6r+nd+2Dh8aAjMl93vMm0DifIAImCrMM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zur6KN/NoD/YfRFtXQdAXninSb8vMUy5xTzvky1bdLa7/5GSWlLIKib6uyw6lTqNi
 qKibIDAjkXFWl5PA3UB+ptR1Z3P8lubuDW1RidMpBi8J13Ay2xc24ggypgihLDDp5P
 MwvLkLGnemHSPXdK3kTowUyVmU4nuDUtmJV4NHjM=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, me@packi.ch,
 bjorn.topel@gmail.com, atish.patra@wdc.com, penberg@kernel.org,
 mhiramat@kernel.org
Subject: [PATCH v2 1/6] riscv: Fixup __vdso_gettimeofday broke dynamic ftrace
Date: Thu,  9 Jul 2020 02:19:09 +0000
Message-Id: <1594261154-69745-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594261154-69745-1-git-send-email-guoren@kernel.org>
References: <1594261154-69745-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_222214_643616_38191915 
X-CRM114-Status: GOOD (  10.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Vincent Chen <vincent.chen@sifive.com>, guoren@kernel.org,
 Greentime Hu <green.hu@gmail.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

For linux-5.8-rc1, enable ftrace of riscv will cause boot panic:

[    2.388980] Run /sbin/init as init process
[    2.529938] init[39]: unhandled signal 4 code 0x1 at 0x0000003ff449e000
[    2.531078] CPU: 0 PID: 39 Comm: init Not tainted 5.8.0-rc1-dirty #13
[    2.532719] epc: 0000003ff449e000 ra : 0000003ff449e954 sp : 0000003fffedb900
[    2.534005]  gp : 00000000000e8528 tp : 0000003ff449d800 t0 : 000000000000001e
[    2.534965]  t1 : 000000000000000a t2 : 0000003fffedb89e s0 : 0000003fffedb920
[    2.536279]  s1 : 0000003fffedb940 a0 : 0000003ff43d4b2c a1 : 0000000000000000
[    2.537334]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : fffffffffbad8000
[    2.538466]  a5 : 0000003ff449e93a a6 : 0000000000000000 a7 : 0000000000000000
[    2.539511]  s2 : 0000000000000000 s3 : 0000003ff448412c s4 : 0000000000000010
[    2.541260]  s5 : 0000000000000016 s6 : 00000000000d0a30 s7 : 0000003fffedba70
[    2.542152]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000003fffedb960
[    2.543335]  s11: 0000000000000000 t3 : 0000000000000000 t4 : 0000003fffedb8a0
[    2.544471]  t5 : 0000000000000000 t6 : 0000000000000000
[    2.545730] status: 0000000000004020 badaddr: 00000000464c457f cause: 0000000000000002
[    2.549867] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
[    2.551267] CPU: 0 PID: 1 Comm: init Not tainted 5.8.0-rc1-dirty #13
[    2.552061] Call Trace:
[    2.552626] [<ffffffe00020374a>] walk_stackframe+0x0/0xc4
[    2.553486] [<ffffffe0002039f4>] show_stack+0x40/0x4c
[    2.553995] [<ffffffe00054a6ae>] dump_stack+0x7a/0x98
[    2.554615] [<ffffffe00020b9b8>] panic+0x114/0x2f4
[    2.555395] [<ffffffe00020ebd6>] do_exit+0x89c/0x8c2
[    2.555949] [<ffffffe00020f930>] do_group_exit+0x3a/0x90
[    2.556715] [<ffffffe000219e08>] get_signal+0xe2/0x6e6
[    2.557388] [<ffffffe000202d72>] do_notify_resume+0x6a/0x37a
[    2.558089] [<ffffffe000201c16>] ret_from_exception+0x0/0xc

"ra:0x3ff449e954" is the return address of "call _mcount" in the
prologue of __vdso_gettimeofday(). Without proper relocate, pc jmp
to 0x0000003ff449e000 (vdso map base) with a illegal instruction
trap.

The solution comes from arch/arm64/kernel/vdso/Makefile:

CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS)

 - CC_FLAGS_SCS is ShadowCallStack feature in Clang and only
   implemented for arm64, no use for riscv.

The bug comes from the following commit:

ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Pekka Enberg <penberg@kernel.org>
Cc: Vincent Chen <vincent.chen@sifive.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <green.hu@gmail.com>
---
 arch/riscv/kernel/vdso/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 38ba55b..3079935 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -27,6 +27,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 obj-y += vdso.o vdso-syms.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
+# Disable -pg to prevent insert call site
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
+
 # Disable gcov profiling for VDSO code
 GCOV_PROFILE := n
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
