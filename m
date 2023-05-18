Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC315C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8U/IMhYHK/Jj8wdHBAEMxiRWvuJdtVwDg7NGSscdoE=; b=IHDs7i5pPJGe18
	fMvKEO5dPaL2rF6eeVudZHdPAhgeGW7Mwre8eVutwnsNbbbjS6dek23zPHaT6T78RJghO4lv90s7l
	45JQIVl4OqJNeuskkr+0PChNAbBeX0E1KReoIbVQ8zyy0MQ2QDq06zRkk3TuaWLYPL5saDkYVfZZz
	+NQq4h2gNAyNT0DmkgHHTs5vvepvJZSdiQ6ZnH2jBtAZdnxv/rWWY6CuSG+XRtEkw8d2hRmGAvEoO
	8rShxdqDDW4NTfD0RwV3Hu3gtDKc/X7e00FIXOqG54ngR1cvmKjeR0ZWKOblmftmMJjEaEJR4RYUo
	jORW4eIarVGUrE8iDlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQQ-00D2KL-3C;
	Thu, 18 May 2023 13:12:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQN-00D2Il-2t
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:12:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63D2564F4A;
	Thu, 18 May 2023 13:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFD7C433D2;
	Thu, 18 May 2023 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415526;
	bh=2yJXkd2hwfR0ToSY6iQDYPlEkk80m0hSWx77JwFLWNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHiXdUubawrcsGRCSebfkII36mJn6Bezsg4mGrpfXAfcUI8FC+UTxqM0kKMt86Aij
	 w5MZIrc8ft6FKEJJPKNUHDBPEx/bnBYOKLK0q07NGMaQ5L/t95TMQS6BfbfSdpRHSI
	 r3cMD/7LIKmJD21+KeM0lnmwFGVLf5Qm6JUgg1czx+jn/rzlTLfjvAL/kZ4IPGHRat
	 gJcf73V5ZGJXJnUH2nRrtJqreD3LwAhzyxGTJgbDa5v0UPb+4g2DDQKZQcpNShtL09
	 TXBs8g7irmjfnnEbOWpWcM0znHPzfZeg59rnaK3TnYI+BMSIKpLCPEh9htVrmP/5R4
	 AGAv/8A32cLtA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 07/22] riscv: s64ilp32: Add sbi support
Date: Thu, 18 May 2023 09:09:58 -0400
Message-Id: <20230518131013.3366406-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061208_015648_632D7285 
X-CRM114-Status: GOOD (  13.88  )
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

The sbi uses xlen as base argument elements to connect m-mode and
s-mode. The previous implementation assumes sizeof(xlen_t) =
sizeof(long), but the s64ilp32's are different. So modify the sbi code
suitable with the s64ilp32 change.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cpu_ops_sbi.h |  4 ++--
 arch/riscv/include/asm/sbi.h         | 24 ++++++++++++------------
 arch/riscv/kernel/cpu_ops_sbi.c      |  4 ++--
 arch/riscv/kernel/sbi.c              | 24 ++++++++++++------------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
index d6e4665b3195..d967adad6b48 100644
--- a/arch/riscv/include/asm/cpu_ops_sbi.h
+++ b/arch/riscv/include/asm/cpu_ops_sbi.h
@@ -19,8 +19,8 @@ extern const struct cpu_operations cpu_ops_sbi;
  * @stack_ptr: A pointer to the hart specific sp
  */
 struct sbi_hart_boot_data {
-	void *task_ptr;
-	void *stack_ptr;
+	xlen_t task_ptr;
+	xlen_t stack_ptr;
 };
 #endif
 
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 945b7be249c1..d31135715f0e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -123,16 +123,16 @@ enum sbi_ext_pmu_fid {
 };
 
 union sbi_pmu_ctr_info {
-	unsigned long value;
+	xlen_t value;
 	struct {
-		unsigned long csr:12;
-		unsigned long width:6;
+		xlen_t csr:12;
+		xlen_t width:6;
 #if __riscv_xlen == 32
-		unsigned long reserved:13;
+		xlen_t reserved:13;
 #else
-		unsigned long reserved:45;
+		xlen_t reserved:45;
 #endif
-		unsigned long type:1;
+		xlen_t type:1;
 	};
 };
 
@@ -254,15 +254,15 @@ enum sbi_pmu_ctr_type {
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-	long error;
-	long value;
+	xlen_t error;
+	xlen_t value;
 };
 
 void sbi_init(void);
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5);
+struct sbiret sbi_ecall(int ext, int fid, xlen_t arg0,
+			xlen_t arg1, xlen_t arg2,
+			xlen_t arg3, xlen_t arg4,
+			xlen_t arg5);
 
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index efa0f0816634..01a1e270ec1d 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -71,8 +71,8 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 
 	/* Make sure tidle is updated */
 	smp_mb();
-	bdata->task_ptr = tidle;
-	bdata->stack_ptr = task_stack_page(tidle) + THREAD_SIZE;
+	bdata->task_ptr = (ulong)tidle;
+	bdata->stack_ptr = (ulong)task_stack_page(tidle) + THREAD_SIZE;
 	/* Make sure boot data is updated */
 	smp_mb();
 	hsm_data = __pa(bdata);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..b649562aff61 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -22,21 +22,21 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
 			   unsigned long start, unsigned long size,
 			   unsigned long arg4, unsigned long arg5) __ro_after_init;
 
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5)
+struct sbiret sbi_ecall(int ext, int fid, xlen_t arg0,
+			xlen_t arg1, xlen_t arg2,
+			xlen_t arg3, xlen_t arg4,
+			xlen_t arg5)
 {
 	struct sbiret ret;
 
-	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
-	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
-	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
-	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
-	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
-	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
-	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
-	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
+	register xlen_t a0 asm ("a0") = arg0;
+	register xlen_t a1 asm ("a1") = arg1;
+	register xlen_t a2 asm ("a2") = arg2;
+	register xlen_t a3 asm ("a3") = arg3;
+	register xlen_t a4 asm ("a4") = arg4;
+	register xlen_t a5 asm ("a5") = arg5;
+	register xlen_t a6 asm ("a6") = fid;
+	register xlen_t a7 asm ("a7") = ext;
 	asm volatile ("ecall"
 		      : "+r" (a0), "+r" (a1)
 		      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
