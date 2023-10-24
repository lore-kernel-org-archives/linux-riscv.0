Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C6C25B48
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoReVx4hLRoidh02kWQ6h79cYTjNBeFKwrgMh8Eh6bc=; b=VYnMO/FzaY2q1q
	BvugZGcQhlcJTPoU5iBIBSlzkEE99rxgU8mcTXuxXAUA3wX5p50thKGgnmi5ESjBmdBOKMFZtI3Kv
	SLTlXqm+nFGkGJgU2CejVBH+SkYRsePHuBycKwFLr2i/y4QW17dm0HaSoibmuqbHawVS2PTWUN9i0
	MCa65/x9+ldPSeEibHk2CvfsVWO+RKBcOCgQajLhVH0P6FsLxrsjXHbKFH6yuyjYL6YSPakS94mnc
	Ai6KDzudH0ayXfgf2KuceBm2++ljkaBz/fC5XOyWlVUfMUOMoVOgidxT+o3SmrgtahsVVsZtLMeGc
	5OGQiJzOUE8hp9f1CN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJEF-00AJL7-2j;
	Tue, 24 Oct 2023 15:21:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBe-00AH52-0e;
	Tue, 24 Oct 2023 15:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=wObq1ZtL38GoyXrpykUfQ+L3NY/VXeUmDZFIelovoYM=; b=NNnAzcP1BMNnTfm8Tohd+SA/E8
	xt6zq74XxbpqiMc+T+S0H5fGxKeZa7hsmdF1PSOerzYnuI9o9H6qaXQy6ugK9AzlGX2GO+f7QyoYu
	XFF7ux2XnQjdxD5NeC4InkDF66hQHlxVQjKNiRBB80UsEn+UnSguq0Yc9rVho4a7pXWCT+I59wwb8
	4J8G3Qfz6WfVCCc2GZSm6M8sTFVPsrd/XqfmwnXJIJrKBSWLunGVuBY/P0bxbSfE50FLOm64cmEKT
	N0PakH1Uo3AZEel8k0AgeV5ALLz/WqmP6ZjQw/0I4ppxAwKyS2ehaEzc2CJuVIDhF0elGgSEVOhkY
	WPQXyr0w==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBa-00FbKu-1o;
	Tue, 24 Oct 2023 15:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wObq1ZtL38GoyXrpykUfQ+L3NY/VXeUmDZFIelovoYM=; b=FZDrLbP5QGr0Bfm6ivhiO1LbjQ
	Y4iafTUgbHLhkHP38WYvvVy6wgsx3XPMAkOraEF/gFnmpk/e9X8NZoY39Fs82GsEQOi/AN3hzJ2z/
	AKclEoxu7/BMPGlEBiHrVD+WGnT9K6F7yHYlIdOhSJ2tG/uPgN7TE9h8GpOG9WAE91evCIgpZBP3I
	fNhegreY0+W0QGkObxdbNBGb1DIqOBJzYV1rmlxYQLBApbk5ERid6ZuTH8skj0JKRp7i3gwXyHFeE
	sSLJw4ITb6s22exlxYg9WpCPCaWm2XP1LB3GblSxuM+VwsqI4Bu6lJ4uGAL4IC/+A7rVLNhjbUQUr
	pajifeoQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46028 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJBO-0004WC-2a;
	Tue, 24 Oct 2023 16:19:03 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJBQ-00AqS8-8B; Tue, 24 Oct 2023 16:19:04 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 34/39] arm64: psci: Ignore DENIED CPUs
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJBQ-00AqS8-8B@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:19:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161914_861346_5ABE02C0 
X-CRM114-Status: GOOD (  14.21  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a CPU is marked as disabled, but online capable in the MADT, PSCI
applies some firmware policy to control when it can be brought online.
PSCI returns DENIED to a CPU_ON request if this is not currently
permitted. The OS can learn the current policy from the _STA enabled bit.

Handle the PSCI DENIED return code gracefully instead of printing an
error.

See https://developer.arm.com/documentation/den0022/f/?lang=en page 58.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
[ morse: Rewrote commit message ]
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2
 * Add specification reference
 * Use EPERM rather than EPROBE_DEFER
---
 arch/arm64/kernel/psci.c     | 2 +-
 arch/arm64/kernel/smp.c      | 3 ++-
 drivers/firmware/psci/psci.c | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 29a8e444db83..4fcc0cdd757b 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
 {
 	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
 	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
-	if (err)
+	if (err && err != -EPROBE_DEFER)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
 
 	return err;
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 8c8f55721786..68ec7fbe166f 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -124,7 +124,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
 	if (ret) {
-		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
+		if (ret != -EPERM)
+			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
 		return ret;
 	}
 
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index d9629ff87861..ee82e7880d8c 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -218,6 +218,8 @@ static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
 	int err;
 
 	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
+	if (err == PSCI_RET_DENIED)
+		return -EPERM;
 	return psci_to_linux_errno(err);
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
