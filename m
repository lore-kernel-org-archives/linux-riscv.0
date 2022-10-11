Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F7FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 23:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rp/ONlwcetdl5P2BTOhSKCNb6rwxn1feDbeonDn0Cf4=; b=aS4PS7lvSMVXTF
	1qtKhEJRu0bbJfIz7wrTClhKCTiL9WLXiFjStkhrikG1CHq74ccQhwwRxwf54XKdVPBwzShSlNLwB
	qFbSvBJ8TbYg/MMo9lxBTaQpxooYWFzV2IXXnj0GqTjuhLnJ52s1DWJ95KQsXam258FNYLzFq38nt
	ah4VQ+JhRJNEs4eW2kSNbFERV+n4eYZKvm8BQQ6rVpQSBb6PwV3Z+M5VQSuTZItsa9ufXKio+KxMm
	KYMeeFQvGbZK5to5PWWa+A6O8FYzDhHpfVN3/JiRJUj55aut38QgKtorrUqVNTlFgR+yXRvAbBIMc
	lnw96mpeau0t3yPTpanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiOaK-006B0F-D2; Tue, 11 Oct 2022 23:22:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiOWV-0069Ag-01
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 23:18:56 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oiOWK-0003i7-GH; Wed, 12 Oct 2022 01:18:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: atishp@atishpatra.org,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com,
	samuel@sholland.org,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 1/2] RISC-V: Cache SBI vendor values
Date: Wed, 12 Oct 2022 01:18:40 +0200
Message-Id: <20221011231841.2951264-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221011231841.2951264-1-heiko@sntech.de>
References: <20221011231841.2951264-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_161855_073958_5346F38C 
X-CRM114-Status: GOOD (  13.90  )
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

sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
called multiple times, though the values of these CSRs should not change
during the runtime of a specific machine.

Though the values can be different depending on which hart of the system
they get called. So hook into the newly introduced cpuinfo struct to allow
retrieving these cached values via new functions.

Also use arch_initcall for the cpuinfo setup instead, as that now clearly
is "architecture specific initialization" and also makes these information
available slightly earlier.

[caching vendor ids]
Suggested-by: Atish Patra <atishp@atishpatra.org>
[using cpuinfo struct as cache]
Suggested-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/sbi.h |  5 +++++
 arch/riscv/kernel/cpu.c      | 30 +++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 2a0ef738695e..4ca7fbacff42 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -327,4 +327,9 @@ int sbi_err_map_linux_errno(int err);
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
 static inline void sbi_init(void) {}
 #endif /* CONFIG_RISCV_SBI */
+
+unsigned long riscv_cached_mvendorid(unsigned int cpu_id);
+unsigned long riscv_cached_marchid(unsigned int cpu_id);
+unsigned long riscv_cached_mimpid(unsigned int cpu_id);
+
 #endif /* _ASM_RISCV_SBI_H */
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 250220e2cceb..2c40763e1cc8 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -70,8 +70,6 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
-#ifdef CONFIG_PROC_FS
-
 struct riscv_cpuinfo {
 	unsigned long mvendorid;
 	unsigned long marchid;
@@ -79,6 +77,30 @@ struct riscv_cpuinfo {
 };
 static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
+unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
+{
+	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+
+	return ci->mvendorid;
+}
+EXPORT_SYMBOL(riscv_cached_mvendorid);
+
+unsigned long riscv_cached_marchid(unsigned int cpu_id)
+{
+	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+
+	return ci->marchid;
+}
+EXPORT_SYMBOL(riscv_cached_marchid);
+
+unsigned long riscv_cached_mimpid(unsigned int cpu_id)
+{
+	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
+
+	return ci->mimpid;
+}
+EXPORT_SYMBOL(riscv_cached_mimpid);
+
 static int riscv_cpuinfo_starting(unsigned int cpu)
 {
 	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
@@ -113,7 +135,9 @@ static int __init riscv_cpuinfo_init(void)
 
 	return 0;
 }
-device_initcall(riscv_cpuinfo_init);
+arch_initcall(riscv_cpuinfo_init);
+
+#ifdef CONFIG_PROC_FS
 
 #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
 	{							\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
