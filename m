Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC32C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cacbrgkQnMIzHxckpgVfvoEA767pfzQV+l/gJZbH+eM=; b=uSBn31iDaOeLKr
	FXJHQ/S0gGjy54G3NPz34Tqg3U+jzs0Wq7BTsdod7Tx6b0+ZKVBK7/BY8KDZX4sAoEnFqLA+yNVac
	qOys4576MfA7xiMxZ6H0qO8ONFazzKSdPMOHcOn7CWiIhid9lYHWARria+8VF4h784rvUhS+o+Ika
	MAMBYvhnvqxDyeMELfRZBUWRcRdSx6qbC9Xa+0kNjq1kXi9r26AbXVD0iAdp0h/82HB+MNhhYFPXK
	wydY0DHWL1gztDi+DVxcU0ptj4DrtPrx3KEEgWASlBkGNHMXs4C1ryY7ValyGJ9+IASiqzH+LOdSJ
	C5kwvCAH/yJuXTI6K21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwjO6-009El2-Gt; Mon, 13 Dec 2021 11:20:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwjO1-009EiW-Lv
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 11:20:55 +0000
Received: from p5b127e39.dip0.t-ipconnect.de ([91.18.126.57]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mwjNs-0001Dm-Q5; Mon, 13 Dec 2021 12:20:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: atishp@atishpatra.org, anup@brainfault.org, jszhang@kernel.org,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] riscv: prevent null-pointer dereference with
 sbi_remote_fence_i
Date: Mon, 13 Dec 2021 12:20:33 +0100
Message-Id: <20211213112034.2896536-1-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_032053_741103_2D301C3B 
X-CRM114-Status: GOOD (  16.71  )
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

The callback used inside sbi_remote_fence_i is set at sbi probe time
to the needed variant. Before that it is a NULL pointer.

The selection between using sbi_remote_fence_i or ipi_remote_fence_i
right now is solely done on the presence of the RISCV_SBI config option.

On a multiplatform kernel, SBI will probably always be built in, but
in the future not all machines using that kernel may have SBI
on them, so in some cases this setup can lead to NULL pointer dereferences.

Also if in future one of the flush_icache_all / flush_icache_mm functions
gets called earlier in the boot process - before sbi_init - this would
trigger the issue.

To prevent this, add a default __sbi_rfence_none returning an error code
and adapt the callers to check for an error from the remote fence
to then fall back to the other method.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/sbi.c    | 10 +++++++++-
 arch/riscv/mm/cacheflush.c | 25 +++++++++++++++++--------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 7402a417f38e..69d0a96b97d0 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -14,11 +14,19 @@
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
 
+static int __sbi_rfence_none(int fid, const unsigned long *hart_mask,
+			     unsigned long start, unsigned long size,
+			     unsigned long arg4, unsigned long arg5)
+{
+	return -EOPNOTSUPP;
+}
+
 static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
 static int (*__sbi_send_ipi)(const unsigned long *hart_mask) __ro_after_init;
 static int (*__sbi_rfence)(int fid, const unsigned long *hart_mask,
 			   unsigned long start, unsigned long size,
-			   unsigned long arg4, unsigned long arg5) __ro_after_init;
+			   unsigned long arg4, unsigned long arg5)
+			   __ro_after_init = __sbi_rfence_none;
 
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 89f81067e09e..128e23c094ea 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -16,11 +16,15 @@ static void ipi_remote_fence_i(void *info)
 
 void flush_icache_all(void)
 {
+	int ret = -EINVAL;
+
 	local_flush_icache_all();
 
 	if (IS_ENABLED(CONFIG_RISCV_SBI))
-		sbi_remote_fence_i(NULL);
-	else
+		ret = sbi_remote_fence_i(NULL);
+
+	/* fall back to ipi_remote_fence_i if sbi failed or not available */
+	if (ret)
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
 }
 EXPORT_SYMBOL(flush_icache_all);
@@ -66,13 +70,18 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
-		cpumask_t hartid_mask;
-
-		riscv_cpuid_to_hartid_mask(&others, &hartid_mask);
-		sbi_remote_fence_i(cpumask_bits(&hartid_mask));
 	} else {
-		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
+		int ret = -EINVAL;
+
+		if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+			cpumask_t hartid_mask;
+
+			riscv_cpuid_to_hartid_mask(&others, &hartid_mask);
+			ret = sbi_remote_fence_i(cpumask_bits(&hartid_mask));
+		}
+
+		if (ret)
+			on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
 	}
 
 	preempt_enable();
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
