Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C9FB3D02
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wu1JLgfqUkES817KrjH5D7QrL3/e7JIy1R6GNroVkyY=; b=chy1E7OVwEV63U
	VuAhPU7OknowDjNb798v75dBJSaAGrQzAf1RF6h223IYpOxCTfxOokLRsOoyql8iyjpKCzZomVuza
	FEgl3rrkPT+pv78da+RSTmSSMoXJT8CqiqopWtjTxnsQZ34JdOhoDn69ShhYXPSq7YJnUZvzyfJ40
	gJ5Vz/upbGB6vRymRL6Kbt1PDi1WTGhFekPlJsqcsLGhwSJqtxjI0wTogzgU+KOBLpGEGMhBJ7Abe
	mUhXtsVFXdcGUmwTSH2czUNferKl5ytrKCs/cofRwWpwbk5qJntPTn3LQRConTkVLgZBbj3YkMHQ1
	IoRJg2hIkDPqmtb+Rzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rk-0000000B3XV-03FO;
	Mon, 30 Mar 2026 10:29:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79ri-0000000B3WW-0Q8u
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 10:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qLYpkIYnM6NpUf/oPjUjQtQPpzaeCdb83tDS6KnBKvI=; b=FD7o3R9wj6KdbDxYOCBPVDudeo
	v/NQz3qyvaZxdaWf08Vif8h11fldi/99IEkR8xcBtodANqMuOZei3wn0nOYFrwmbj04z9UvkER1T0
	v5lxAVUigpWDSAnvugtYgF6D4qqETVgc9t9HM2hw3afs8SXiF1+oR9yimpgPGZUc+HZGwVUHsOh4v
	MAvhfMn7+drw02GI1pUWcyH2Yw5eKBk5/COwRMc6MpYFoDWilt2nOEnbdMR0G/N8V6xz31L3nmnQ7
	KEH+Dr0/RwRvDevifGp/Kr0HXC8yHJ3qlQ2Z/1HDfQeI/z8C5kydvT6NZh2nIc3+6MBODWFaR6xC+
	JJeD7BUA==;
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79rd-0000000DZsC-1L4m
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:29:00 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 62UAS8LP038225;
	Mon, 30 Mar 2026 18:28:08 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 18:28:07 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <geert+renesas@glider.be>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <magnus.damm@gmail.com>,
        <ben717@andestech.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jonathan.cameron@huawei.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC: <tim609@andestech.com>, <alex749@andestech.com>, <az70021@gmail.com>,
        "Hui
 Min Mina Chou" <minachou@andestech.com>,
        Leo Yu-Chi Liang
	<ycliang@andestech.com>
Subject: [PATCH 3/7] cache: andes_llcache: improve performance of LLC operation
Date: Mon, 30 Mar 2026 18:27:20 +0800
Message-ID: <20260330102724.1012470-4-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330102724.1012470-1-minachou@andestech.com>
References: <20260330102724.1012470-1-minachou@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 62UAS8LP038225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_112858_203923_6F99C68C 
X-CRM114-Status: GOOD (  11.51  )
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

Eliminate get_cpu() on !CONFIG_SMP and switch readl/writel to their
relaxed variants to remove unnecessary fence instructions on I/O
memory access. The platform specification defines all I/O regions are
on channel 0 (point-to-point strongly ordered), so explicit fences are
not required [1][2][3]. Explicit memory barriers (mb) are added before
and after the CCTL loop to ensure overall memory consistency.

Also fix hart ID mapping by switching to cpuid_to_hartid_map() instead
of using the logical CPU ID directly. In AMP setups (e.g. Linux on
Hart 1, RTOS on Hart 0), Linux sees itself as CPU 0 but must access
Hart 1's CCTL registers, so using the logical ID would cause accidental
interference with other cores.

[1] platform spec 2.1.1: https://github.com/riscvarchive/riscv-platform-specs/blob/main/riscv-platform-spec.adoc?plain=1#L169
[2] privileged spec 3.6.5: https://github.com/riscv/riscv-isa-manual/blob/main/src/machine.adoc?plain=1#L2835
[3] riscv: asm/mmio.h: https://gitea.andestech.com/RD-SW/linux/src/branch/ast-v5_4_0-branch/arch/riscv/include/asm/mmio.h#L105

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index d318b8009f7f..57f666bc537a 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -66,7 +66,7 @@ static struct andes_priv andes_priv;
 /* LLC operations */
 static inline uint32_t andes_cpu_llc_get_cctl_status(void)
 {
-	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
+	return readl_relaxed(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
 
 static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
@@ -74,16 +74,22 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
-	int mhartid = smp_processor_id();
 	unsigned long pa;
+	int mhartid = 0;
 
+	if (IS_ENABLED(CONFIG_SMP))
+		mhartid = cpuid_to_hartid_map(get_cpu());
+	else
+		mhartid = cpuid_to_hartid_map(0);
+
+	mb(); /* complete earlier memory accesses before the cache flush */
 	while (end > start) {
 		csr_write(CSR_UCCTLBEGINADDR, start);
 		csr_write(CSR_UCCTLCOMMAND, l1_op);
 
 		pa = virt_to_phys((void *)start);
-		writel(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
-		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
+		writel_relaxed(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
+		writel_relaxed(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
 		while ((andes_cpu_llc_get_cctl_status() &
 			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
 			ANDES_LLC_CCTL_STATUS_IDLE)
@@ -91,6 +97,10 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 
 		start += line_size;
 	}
+	mb(); /* issue later memory accesses after the cache flush */
+
+	if (IS_ENABLED(CONFIG_SMP))
+		put_cpu();
 }
 
 /* Write-back L1 and LLC entry */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
