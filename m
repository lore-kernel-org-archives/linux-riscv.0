Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A61DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xhhm7k7eP9OPWQoCPQrTBspW3lymypBTaTei1yHSVAE=; b=byOtoUImWjvps+
	IrfCx/bZO5l+smG+vBpABKGfwIKmzsBF9JSdGk8SjYPIffF8VpAaWhqDehPJPABCA7WZv6/uawMk4
	dXod1PKPGKFw/NznO6mDlhvaY1b873oZANPDe8oL335EZqa/WX+0AMju09cig/+JZPjUtrYI7My5y
	Sl/JZpsfiN4Mb0MLhYWH2VL+GOQsNSf+LNUq7lG45awU4exaEZP5Gel8GdM769oL6mywVjZ38bWjd
	mCyqvKAyNuz6QOVZHoe3G0AEb6wiL71FXJhag18dUjcv0cnQfsYmLX9gTeCH6MwmFEJnaJxSTWWPR
	gL/TnZ2ZA+mJANHseuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHil0-00Gkel-By; Wed, 09 Feb 2022 08:55:22 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHijq-00Gk7l-9Z
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 08:54:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:54c7:c522:3859:290])
 by xavier.telenet-ops.be with bizsmtp
 id swu42600U4VQqf501wu4nW; Wed, 09 Feb 2022 09:54:05 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHijj-000DIi-Lv; Wed, 09 Feb 2022 09:54:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHiji-00DkLs-NX; Wed, 09 Feb 2022 09:54:02 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 2/3] RISC-V: Fix handling of empty cpu masks
Date: Wed,  9 Feb 2022 09:54:00 +0100
Message-Id: <e9ffcdc6569cdeb294675905c731cfd89ce17d96.1644396407.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644396407.git.geert@linux-m68k.org>
References: <cover.1644396407.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_005410_544227_81A3A46F 
X-CRM114-Status: GOOD (  10.61  )
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

The cpumask rework slightly changed the behavior of the code.  Fix this
by treating an empty cpumask as meaning all online CPUs.

Extracted from a patch by Atish Patra <atishp@rivosinc.com>.

Reported-by: Jessica Clarke <jrtc27@jrtc27.com>
Fixes: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid bitmap")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Emil Renner Berthing <kernel@esmil.dk>
---
v2:
  - Add Reviewed-by, Tested-by.
---
 arch/riscv/kernel/sbi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f93bc75f2bc43c8e..22444cfcd56cc646 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -161,7 +161,7 @@ static int __sbi_send_ipi_v01(const struct cpumask *cpu_mask)
 {
 	unsigned long hart_mask;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 	hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
 
@@ -177,7 +177,7 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 	int result = 0;
 	unsigned long hart_mask;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 	hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
 
@@ -254,7 +254,7 @@ static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
 	struct sbiret ret = {0};
 	int result;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 
 	for_each_cpu(cpuid, cpu_mask) {
@@ -348,7 +348,7 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	unsigned long hartid, cpuid, hmask = 0, hbase = 0;
 	int result;
 
-	if (!cpu_mask)
+	if (!cpu_mask || cpumask_empty(cpu_mask))
 		cpu_mask = cpu_online_mask;
 
 	for_each_cpu(cpuid, cpu_mask) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
