Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F24EC61D96
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bzr72JOsLw6zu4By7g8AZZg4251cWZHo3EyCkeVm1Io=; b=WJ7RROZIWnK7Io
	ADUZCfyB2Aa96EqaznrNbrj6aT6quecPJUArLhwynjpUCF7ZFl4AepjvbVfjDaAXhfLLarDhEVeY7
	aAw3eOU9pW1ivnADuCV3JNcVL9EIPriJWrllj3fbvNjOICX93SdNhO/yHiNET003XtUPWW8IqsDT5
	MjrIbLdwrZBg/HfaROtqlI7ktMvFb9rq72f7bZFKho3Uef+RKNsPTj1D9gAZTXb5JLMQxMdaByZC/
	qgwmtZWy5jlnXGcEzyJ/TNx3Nf9fV46CBOrP8N+pYi7L6YigoqCSrKwQX/Q7g9oT6slniHNZxfIMi
	V4DMvVZtg7DDXJMwB+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R5I-00GsZ1-0Y;
	Tue, 21 Nov 2023 13:46:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R55-00GqfJ-0W;
	Tue, 21 Nov 2023 13:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZzP1tPG+FultdpQZhQFIn0rIgoalndyB/3IndbQTgGg=; b=wGu2HH7lFk3SgutB7pSc6XZDn9
	//kXtGzYa6xPGjbiDm5vkLK/JI3sYBVMtevJADS8BsBzRjqTeOmRMUE/XrkQaSaCZVFKJJxDkfEB7
	ZDaa6DT09/vOcOx02PnzdeMyrF2UhGnvnd+bZ5FWqzdqvp8ZDUjqSh0Dnrex68xruoRhGDdTLwNYZ
	QrpUJuMJ4dne7RgfMOmbCEYTZNnoo8o/hgT+0rPw6vmO1Deiz4uCNpZZVVBr4J2i3hDdzCrCcqy0W
	Fs03q2d1EAJO1CK8iU0tTCz/aYs+mdZSavJT2r3CWwY2WCAMMbR5htMH1C/LnCCgUfSrRYLygh4LW
	UVjqMiWw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33888 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R2p-00076W-17;
	Tue, 21 Nov 2023 13:44:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R2r-00Csyh-7B; Tue, 21 Nov 2023 13:44:05 +0000
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 03/21] x86/topology: remove arch_*register_cpu() exports
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R2r-00Csyh-7B@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:44:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054623_208620_31BF4A38 
X-CRM114-Status: UNSURE (   9.53  )
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

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/x86/kernel/topology.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
index 0bab03130033..fcb62cfdf946 100644
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -45,13 +45,11 @@ int arch_register_cpu(int cpu)
 	xc->cpu.hotpluggable = cpu > 0;
 	return register_cpu(&xc->cpu, cpu);
 }
-EXPORT_SYMBOL(arch_register_cpu);
 
 void arch_unregister_cpu(int num)
 {
 	unregister_cpu(&per_cpu(cpu_devices, num).cpu);
 }
-EXPORT_SYMBOL(arch_unregister_cpu);
 #else /* CONFIG_HOTPLUG_CPU */
 
 int __init arch_register_cpu(int num)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
