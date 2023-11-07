Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB210C4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jfs76RjFFRN/w3HbalfnSeIlXAz7rBEod03aQtTOXEU=; b=nXXdi+MMcgTmB+
	rYUdFVAzlKW48W6E6khySN0gmCfBdJ1eH506ui7uh+DVCD/RNvfxOG58WsO+rI2BKuc6ARSOMgxOf
	yovnQhwNmx77KtFswFxqdAX1ejVw26GVvxJjSk3MOWyajWpZQ+pRaEmzEEXpKrVRafN6JijKUxeUK
	ayfWbSKcXlJMd35C8zak1p6ON+IjHNFhCUakSHMIZTJACqLmmGhs5vEiYwPDmX1ToO+7f+WOp2dfO
	413L2dpQAQG2MitN/QKN0oi+ffiwVicJyhttAx39l1+jU0ab8R4dX9eQEuZNiyoYqZKynbFTHbJ3j
	Z9NkgB8LtLfiure9mn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLV-0013B8-17;
	Tue, 07 Nov 2023 10:30:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLR-00133v-2w;
	Tue, 07 Nov 2023 10:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k001Y0HNcuzUMO9PpBpBC5MY+V+GfJ89AzcoCw+2U8g=; b=bavolUUVWJJ+JrwViNlWUJGFZG
	yEG3eu5aiS/5IAtLJ2AF1IrIbMgWCIxn4s58cABXCaYHrTOxE4oFQpnCSyhBaDL1Aub3ieslIfQlr
	WmburAj8ubzr205HsDIViyzzg4MBsdkx+sdlfKyik70SxJWXfCTQnRjFGnEYKjrIORI+fm9GdapWT
	hK0sajp/QbZeWswzEMXM0fObTVsth74LYNseX9zPgh6iK5/ffLBaIZM1pdtmqrPSVk4jJX62//gvA
	+moKoyUd5ZdbAcEMRPF2jlcxzOkrBuL9i8E6fp9M2e5N6eAQ8+kExMpXyOr/XOj/A67g5XqPMSWby
	ownOkLlA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49884 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JKz-0000EI-0j;
	Tue, 07 Nov 2023 10:29:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JL0-00CTwm-VX; Tue, 07 Nov 2023 10:29:39 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
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
Subject: [PATCH RFC 04/22] Loongarch: remove arch_*register_cpu() exports
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JL0-00CTwm-VX@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:29:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_023005_975272_990C8F55 
X-CRM114-Status: UNSURE (   8.57  )
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

arch_register_cpu() and arch_unregister_cpu() are not used by anything
that can be a module - they are used by drivers/base/cpu.c and
drivers/acpi/acpi_processor.c, neither of which can be a module.

Remove the exports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/loongarch/kernel/topology.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
index 3fd166006698..ae860fe81536 100644
--- a/arch/loongarch/kernel/topology.c
+++ b/arch/loongarch/kernel/topology.c
@@ -25,7 +25,6 @@ int arch_register_cpu(int cpu)
 
 	return ret;
 }
-EXPORT_SYMBOL(arch_register_cpu);
 
 void arch_unregister_cpu(int cpu)
 {
@@ -34,7 +33,6 @@ void arch_unregister_cpu(int cpu)
 	c->hotpluggable = 0;
 	unregister_cpu(c);
 }
-EXPORT_SYMBOL(arch_unregister_cpu);
 #endif
 
 static int __init topology_init(void)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
