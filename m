Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E61AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UPe/sYtyPhkHtHAluTRTA6cZ1jrIkG4XOQJ1NHfxoQ=; b=0JFmkT4OByKTQr
	R9MD6+/lCQOz61vKOAKlagLLutOo2RJsbf/ZWwWYdtw3j3pZoTcJ65x1cVFM93YOc/lVQdUPBCHYl
	71do8I4gkFcrhtDITbOr5pDvlaVxM6MOCRUT9IGgKm4TeXaTHyJfKIBxLP53xYx3jUEX2vx8b+I72
	IX7gp3OCJyC2CjRqiCT/k9E29QIz0h+lgBcT5rXKEk3GgGuOth/21Zrdt6Q4lfuXfwsB0vBARiLAk
	hj4seMNtllKSpP1NaFpfD/zykof4iLbA2JkWHpOLvpoSey5LmYBtegTfao7O0b+ZLG+F1Il8MMFjM
	02mQKKL9U95ethNVUOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHil6-00Gkhz-Ch; Wed, 09 Feb 2022 08:55:28 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHijq-00Gk7h-CY
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 08:54:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:54c7:c522:3859:290])
 by andre.telenet-ops.be with bizsmtp
 id swu32600Y4VQqf501wu3YL; Wed, 09 Feb 2022 09:54:04 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHijj-000DIj-AL; Wed, 09 Feb 2022 09:54:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHiji-00DkM0-OH; Wed, 09 Feb 2022 09:54:02 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 3/3] RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid
 ordering
Date: Wed,  9 Feb 2022 09:54:01 +0100
Message-Id: <84ee1ae4bfc0ddbafdb38a21135f67ceb121c5e1.1644396407.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644396407.git.geert@linux-m68k.org>
References: <cover.1644396407.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_005410_671495_54369AF7 
X-CRM114-Status: GOOD (  16.92  )
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

If the boot CPU does not have the lowest hartid, "hartid - hbase" can
become negative, leading to an incorrect hmask, causing userspace to
crash with SEGV.  This is observed on e.g. Starlight Beta, where cpuid 1
maps to hartid 0, and cpuid 0 maps to hartid 1.

Fix this by detecting this case, and shifting the accumulated mask and
updating hbase, if possible.

Fixes: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid bitmap")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Emil Renner Berthing <kernel@esmil.dk>
Tested-by: Atish Patra <atishp@rivosinc.com>
---
v2:
  - Add Reviewed-by, Tested-by.
---
 arch/riscv/kernel/sbi.c | 57 ++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 22444cfcd56cc646..775d3322b422fe14 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -250,7 +250,7 @@ static void __sbi_set_timer_v02(uint64_t stime_value)
 
 static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
 {
-	unsigned long hartid, cpuid, hmask = 0, hbase = 0;
+	unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
 	struct sbiret ret = {0};
 	int result;
 
@@ -259,16 +259,27 @@ static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
 
 	for_each_cpu(cpuid, cpu_mask) {
 		hartid = cpuid_to_hartid_map(cpuid);
-		if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
-			ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
-					hmask, hbase, 0, 0, 0, 0);
-			if (ret.error)
-				goto ecall_failed;
-			hmask = 0;
-			hbase = 0;
+		if (hmask) {
+			if (hartid + BITS_PER_LONG <= htop ||
+			    hbase + BITS_PER_LONG <= hartid) {
+				ret = sbi_ecall(SBI_EXT_IPI,
+						SBI_EXT_IPI_SEND_IPI, hmask,
+						hbase, 0, 0, 0, 0);
+				if (ret.error)
+					goto ecall_failed;
+				hmask = 0;
+			} else if (hartid < hbase) {
+				/* shift the mask to fit lower hartid */
+				hmask <<= hbase - hartid;
+				hbase = hartid;
+			}
 		}
-		if (!hmask)
+		if (!hmask) {
 			hbase = hartid;
+			htop = hartid;
+		} else if (hartid > htop) {
+			htop = hartid;
+		}
 		hmask |= BIT(hartid - hbase);
 	}
 
@@ -345,7 +356,7 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 			    unsigned long start, unsigned long size,
 			    unsigned long arg4, unsigned long arg5)
 {
-	unsigned long hartid, cpuid, hmask = 0, hbase = 0;
+	unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
 	int result;
 
 	if (!cpu_mask || cpumask_empty(cpu_mask))
@@ -353,16 +364,26 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 
 	for_each_cpu(cpuid, cpu_mask) {
 		hartid = cpuid_to_hartid_map(cpuid);
-		if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
-			result = __sbi_rfence_v02_call(fid, hmask, hbase,
-						       start, size, arg4, arg5);
-			if (result)
-				return result;
-			hmask = 0;
-			hbase = 0;
+		if (hmask) {
+			if (hartid + BITS_PER_LONG <= htop ||
+			    hbase + BITS_PER_LONG <= hartid) {
+				result = __sbi_rfence_v02_call(fid, hmask,
+						hbase, start, size, arg4, arg5);
+				if (result)
+					return result;
+				hmask = 0;
+			} else if (hartid < hbase) {
+				/* shift the mask to fit lower hartid */
+				hmask <<= hbase - hartid;
+				hbase = hartid;
+			}
 		}
-		if (!hmask)
+		if (!hmask) {
 			hbase = hartid;
+			htop = hartid;
+		} else if (hartid > htop) {
+			htop = hartid;
+		}
 		hmask |= BIT(hartid - hbase);
 	}
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
