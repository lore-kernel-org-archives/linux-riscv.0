Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1990C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWl/KtAdp6TcdBp82cehY5CcIUdk4tRDywWGR4IzRII=; b=xZT93l5DyRpQHN
	CwZDzyuCC6tNh3F2pV9DcmsVReKsJ2sZGHtpatm7yDwGYG0DTiv5e1aHmFCmn6yH4NhsUehmatoOq
	ShcSolZnf57uhFXOcZ0LaiPf18f4ylFUnoQzsroNxla750hl6/tsJ1rRz7HCSnkWEkcaDjHS3keUP
	Rq9t7cnEhCtvf8hEnqVYmOsMQgn2fmadIpghJrt+HKK7Pt3RkYGrgZKpMqWLCvD3QdXkoB89OFU7w
	VR5phFd9xAd51GW1o5jOKd5Eab2CB6Bh3UYMSl3BL6B5lAvatNiyEoyVK9lfEh6WM1y/ZtpZX/ec9
	sL/6dlMGuNFA2oYZ1UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KWN-001MD1-1g;
	Tue, 07 Nov 2023 11:45:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLi-0013HK-1e;
	Tue, 07 Nov 2023 10:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q80acMOYYyCsBO4DF+q5UzwIza1MpFhs36lmqhGxrto=; b=uYWeT36tOVZqQLHW8tNA+MO8rE
	NiPMKiW9gaelNRus/s5Ndwtp0uSmK/lvfdHkfE4QcP/onqrPhkLvgI35Ka5HmjSXEMAvbiYgMQVrl
	+R1eLD7PmsVjOI1TNlTNJRTsoWihSZNGPC8J/VQBlPMIKcPEChGWuQz77MLr+t/Uf5ufYUqvafSN0
	7bG6U12ZWtCSTuitSJr5zW6rpcvmvn/XnQxS0bVmGJ5oE34UB2knVJ9Qi+6Hm9JyKYkj3TtsoxQ3H
	CuMUVTUeU2RvU6pywO/4Kxgjk0b+YaN9BUYz70gksgowZhGLmvsIhHdh7ATzTnUC7vy/yOGwcGPKT
	kUW8Cxeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41338 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLN-0000F3-0m;
	Tue, 07 Nov 2023 10:30:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JLG-00CTx8-CG; Tue, 07 Nov 2023 10:29:54 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 07/22] drivers: base: Allow parts of GENERIC_CPU_DEVICES
 to be overridden
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JLG-00CTx8-CG@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:29:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_023022_582703_DA18E599 
X-CRM114-Status: GOOD (  12.76  )
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

From: James Morse <james.morse@arm.com>

Architectures often have extra per-cpu work that needs doing
before a CPU is registered, often to determine if a CPU is
hotpluggable.

To allow the ACPI architectures to use GENERIC_CPU_DEVICES, move
the cpu_register() call into arch_register_cpu(), which is made __weak
so architectures with extra work can override it.
This aligns with the way x86, ia64 and loongarch register hotplug CPUs
when they become present.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC:
 * Dropped __init from x86/ia64 arch_register_cpu()
Changes since RFC v2:
 * Dropped unnecessary Loongarch asm/cpu.h changes
---
 drivers/base/cpu.c  | 14 ++++++++++----
 include/linux/cpu.h |  4 ++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 34b48f660b6b..579064fda97b 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -525,19 +525,25 @@ bool cpu_is_hotpluggable(unsigned int cpu)
 EXPORT_SYMBOL_GPL(cpu_is_hotpluggable);
 
 #ifdef CONFIG_GENERIC_CPU_DEVICES
-static DEFINE_PER_CPU(struct cpu, cpu_devices);
+DEFINE_PER_CPU(struct cpu, cpu_devices);
+
+int __weak arch_register_cpu(int cpu)
+{
+	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
+}
 #endif
 
 static void __init cpu_dev_register_generic(void)
 {
-#ifdef CONFIG_GENERIC_CPU_DEVICES
 	int i;
 
+	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
+		return;
+
 	for_each_present_cpu(i) {
-		if (register_cpu(&per_cpu(cpu_devices, i), i))
+		if (arch_register_cpu(i))
 			panic("Failed to register CPU device");
 	}
-#endif
 }
 
 #ifdef CONFIG_GENERIC_CPU_VULNERABILITIES
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index fc8094419084..1e982d63eae8 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -88,6 +88,10 @@ extern ssize_t arch_cpu_probe(const char *, size_t);
 extern ssize_t arch_cpu_release(const char *, size_t);
 #endif
 
+#ifdef CONFIG_GENERIC_CPU_DEVICES
+DECLARE_PER_CPU(struct cpu, cpu_devices);
+#endif
+
 /*
  * These states are not related to the core CPU hotplug mechanism. They are
  * used by various (sub)architectures to track internal state
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
