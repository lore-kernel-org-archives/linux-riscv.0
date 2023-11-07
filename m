Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB277C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8V9dqh1SEORXVpp781Q/cpS31XQWsFAHVETs2FziyH4=; b=PtHZFH1hyf91fh
	PPmYTr4c4T/QH5UIJsg2YM2mi5479VMG4PKjE7NXLrYG+HoDzTrb27vK03IluyR7lzu0Rw/HnoJR5
	igdHWHqLQu49ZkpDI1KLA9DRee1ttFllfxNUtt3DAn70u/QGXkf1q47Mz2o3cly0uf06fhq4jWWHP
	azIc17CEn7ksAIHceOktoineWeWcLVRs6YeImq5dgF0mgH3aLxd5JOxfD8TAqDcT2OAMve5T+LmXw
	ZEePD8ssVTwWdD1LksAOo5wS+8QYIAuTZ+ET2fMB4P23+kk1SOUS2DM9VK+wCjT3Z9mdCwq80qVt8
	RP1O70RQLzUGP2TXwyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLR-00137U-03;
	Tue, 07 Nov 2023 10:30:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLM-00133R-02;
	Tue, 07 Nov 2023 10:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ymhMaSvMofm90G1QC0+Bk+EZYUKPJWwSUrR+22r+cnI=; b=mJdGHCO4tSOxNLtVU8QoDd8g+o
	UTuROwad1MObnaW0PjPOAGzEUKYkozosiQdKeiL/dhdUfLIa3xZ2gym4U6WEDMoktEcxWjZ6TfajG
	qevUxIqKD6l1SAC0O9IH5zWeOkgs1bwyF+7yCI3I7eiXOQ2mw5k2yqBijjtkcaAPrxk8ZDsuZG0u+
	s26wco/TRicUiRz2sclMHwtaOZp/JkqwZkxLHzUPuh2raOGF1DHq0DqV84O2SQjHU948cfVGBRavU
	Y8GIhDqqPU38lw3xybHvcjAWUtKTmv+46vHr1g2FjLEbNC1jPrHxAHcWI+V1mu+FayTve6ezOc1Hy
	NpPdcRNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54716 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JKu-0000E2-0H;
	Tue, 07 Nov 2023 10:29:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JKv-00CTwf-R9; Tue, 07 Nov 2023 10:29:33 +0000
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
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RFC 03/22] x86/topology: remove arch_*register_cpu() exports
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JKv-00CTwf-R9@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:29:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_023000_050023_4FEC0B93 
X-CRM114-Status: UNSURE (   9.14  )
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
