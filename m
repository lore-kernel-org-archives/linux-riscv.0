Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DD1C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cOmjJZqTmL8IJd5l7xXykqIYvh7Jcb0WdwSRk6KIQA=; b=0PyI9gkgEZGya1
	Ml7rJjgcH0jeqViAtJB2RJz0vG2jPWFw7mkfrveHfRwQcX0eaLb7WYbXcqJ3Pfe6g2TmgGQZlL13E
	y6YjKlqd97e0cRZZf+YXmpcTx+V2e07IUhSgtVrtLYXDH6a0L2sxDzrdF6e20+asCRq5FvaXbf4p3
	pQaHQGzFKA74EXLrxqS7A8jD+FJeDZkUaJ192nLb3JPdnUGicOb/alyMGxjM8qRPKYL8wmjq9nx0m
	6TD1syjYKruZXmNvWE9EVrA6mvR/wS8pNHzZSYGhy94IUheGm6gI6zKqrwH1xFkJDzd7w1SVSBw+M
	eGSVcLMoQWeMSB9IHh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhZ-00EfC1-1F;
	Wed, 13 Dec 2023 12:51:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhH-00EetU-2w;
	Wed, 13 Dec 2023 12:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=CzUDlXDbVRENX5I3t4jDtWhqIqX9ckshZ8M9DQwNtkI=; b=pHtbl7iOqeqwD2XFf/yKviGOKH
	9+7d8rF0+El1Ez9w2bGm4bnOP6+lkE/ijmC6UQfypuCbmPGFJkc17Ne9QJqsJ811oOEYdwLUbRq+s
	jMO8AoqXBK/0UsGwTdXcnuceXNDFBC90POSsUL7jJ5V6yWqpbP0AcV4w+OdN8OMBTBS4ibqVqKjOu
	yEXuVsVHNy81/HfwuOo/25mQ2vpz8elNOcQN4gSxLZ0tAmxwhDajTy4kbQ8wDz76nAuW2jfHTgQO0
	i8eTy8a4uu3g7WgAMoB4eYbmtNFEl/8ChTL59Bq1cNNhsc8c639nqpIEYFSUwJOtGmwTMc6jrTWBz
	8DLX5NIA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhD-009663-2Y;
	Wed, 13 Dec 2023 12:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CzUDlXDbVRENX5I3t4jDtWhqIqX9ckshZ8M9DQwNtkI=; b=ryyhQHuRHb7agprV7SzAPCOWs7
	+KSXGolWfQxBz68idh9LhxWZ4JzZ71clasxJMQDmclWim/lWLX+Gb1xqGHQ9n3UU4aTI4I9d13qgo
	hj4BIus5sr1uZgPAKqSg5BR+qboNz0g2L0iDXYBeGJ7lvBRoed+H+5R2YFjK8ueU93g8YItCdFaeb
	fxbImF1Xl0TwiBldiAdAMRv9Tgek/TNe6QoJrV9pJFFkVccAuQ3oipJY0EaPDNElQ4hd2UdXqoxdp
	PQJmrKVqAhtuUZLhBMQbgjSydQTFhRQyXfg22Jx79LASfFaMpnGo14mdNGw9zQWMI8ZnrjSj92Dyh
	1BXBKHfg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50070 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOh5-0008Gu-1L;
	Wed, 13 Dec 2023 12:50:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOh7-00Dvl7-LR; Wed, 13 Dec 2023 12:50:33 +0000
In-Reply-To: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
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
	acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: [PATCH RFC v3 16/21] arm64: psci: Ignore DENIED CPUs
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOh7-00Dvl7-LR@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:50:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_125040_109194_74C3D8A7 
X-CRM114-Status: GOOD (  12.94  )
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
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2
 * Add specification reference
 * Use EPERM rather than EPROBE_DEFER
Changes since RFC v3:
 * Use EPERM everywhere
 * Drop unnecessary changes to drivers/firmware/psci/psci.c
---
 arch/arm64/kernel/psci.c | 2 +-
 arch/arm64/kernel/smp.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
index 29a8e444db83..fabd732d0a2d 100644
--- a/arch/arm64/kernel/psci.c
+++ b/arch/arm64/kernel/psci.c
@@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
 {
 	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
 	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
-	if (err)
+	if (err && err != -EPERM)
 		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
 
 	return err;
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index defbab84e9e5..6bc9094feb19 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -132,7 +132,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
 	if (ret) {
-		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
+		if (ret != -EPERM)
+			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
 		return ret;
 	}
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
