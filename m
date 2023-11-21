Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5FCC61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQAGr89qVnFF3ge85coO43Ed34PU1NKdWzQaeQKSrJk=; b=cvvuKFaxAh0cMe
	vOs2XdUCy78xv58xwHMZSWkts5DQ/8MBNfSbJIy1cbct5tZotacQsBmnX/wK8Um9U+cRzcdTCv0VY
	ttUJfVvM6VobFieB3dt7YhmgKGV+qH4BZkrZtbYuiFYIP2cI0KSLUdaS0IyQpDUpCZyAtd4MNdcjU
	aw5nf815gsCGfL+mSKvbRX+kium8E5VD0bklKkVAubBZ6jzybJTLh41BQQcfSTu2Cc0R2FwnVSPyW
	XkEDe875AS2GpaElSY52FlM/HOnMcByMkWxRvgH/iwJUs2hdjO+VTyoP3fS19cXZ+RSTKS8H1F5ac
	CX/EKQ/UoN87BwDUwXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5S1A-00H4Br-2Q;
	Tue, 21 Nov 2023 14:46:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R4K-00Grfr-1h;
	Tue, 21 Nov 2023 13:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+z5XQz9hkPdS0YKuNfOGCu3IbWCtcbacoD2q0D9vrOw=; b=nqEI3WAYyZJxyF64IPxHkEcmAY
	0zHoBuLtkhuFbNVcphsa3DR1CeqPZB8OSJMxCewkeWa+3r2aRJsHBifLQNzcf7MdKmzS1irlVZkYc
	brexTxcjHljrYi9MqZlt5qPB0WZSIyTye8i3BP0Zsn2z3KX0mr0Gn5Tcy8sDo7ivRPUFHcyhdHmZI
	xY5m6A2RKQWhX7ADcpvQEAebkLT7S173hXa0lfCHHX101Jmg8lcPJghMpq/+37DDamUSLgZ0cIKEW
	orniAC8aOnbU5vGiNE6gevFXQqqcprYTUH/S//Uj72YUyJ3jSj49RkNbty3y/3+ePbiMNEMbtbVJ8
	YShdbryA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32984 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R49-0007BM-2B;
	Tue, 21 Nov 2023 13:45:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R4B-00Ct0G-Kk; Tue, 21 Nov 2023 13:45:27 +0000
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 19/21] LoongArch: convert to use arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R4B-00Ct0G-Kk@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:45:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054536_581314_3FDD35B3 
X-CRM114-Status: UNSURE (   8.85  )
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

Convert loongarch to use the arch_cpu_is_hotpluggable() helper rather
than arch_register_cpu(). Also remove the export as nothing should be
using arch_register_cpu() outside of the core kernel/acpi code.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/loongarch/kernel/topology.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
index 866c2c9ef6ab..75d5c51a7cd3 100644
--- a/arch/loongarch/kernel/topology.c
+++ b/arch/loongarch/kernel/topology.c
@@ -11,11 +11,8 @@
 #include <acpi/processor.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
-int arch_register_cpu(int cpu)
+bool arch_cpu_is_hotpluggable(int cpu)
 {
-	struct cpu *c = &per_cpu(cpu_devices, cpu);
-
-	c->hotpluggable = !io_master(cpu);
-	return register_cpu(c, cpu);
+	return !io_master(cpu);
 }
 #endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
