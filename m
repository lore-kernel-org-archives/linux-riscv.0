Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBF7C4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 11:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnkCMPMStVqaS8FeMYU8vnoo3rpyqGHhVlgWhTtYRpQ=; b=OS4dfpS4quoTXi
	Sg73/ag3gPhtYlti7oSnyn/egbDANYJ0b7dbiSFC17N1rXIWbBFYQa64ryqZSBT2fsH1HYXeP2C+u
	PvGZvaN4M5Ft3UVPVlMyGCAfs60jxhgoSevgxq0+r+vZunF0nT2Dm14eEmw9Ttng0uw7mDnLqBH8d
	qQet30En5BvSqHcqKNV31jBvAdD28ST+R7zN5p9844SRkFFGxQXS30fuhFdayBf8TX40XzkYfd+4j
	J5zStu8dgtKb5h8QY95TcP4/nCe0zF95tAma2N2nct+al/Ornc2DSthHsbPp0uW7+ugk1DOwcmrGp
	/kRSZC1duaN56JX9c7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KWM-001MCc-1L;
	Tue, 07 Nov 2023 11:45:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLi-0013HE-1e;
	Tue, 07 Nov 2023 10:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L39JlpOE9/9CplZsg27RCjms0dZNEQGXOpabTHId0/o=; b=aROF6+R2XtK3lBysJONjCeHJu/
	U0NNYX04FcX0h+nxoECSlL4SEsjkNfvaaw4xMTtERNmuCQcpXy3lBZ/p1C2gXp2DLEUA3AGPzAike
	GCMpQ66isY1S/EnSFhbj1irjZ5gi9Xhf3leVSG/I+988BPorw6vc2a/CHcZ7T08ZLnczR+jG805aN
	jqer8K6Kevg8fYCGX6w8iTSJwDDXUf308eYJXMQ5ExiLUAwfJ4Un0bsKtRNXKblwQgzQj7MO8zdLW
	jm21TPrOpkGvDW8oDhwIfnl7LetnsISGkqxbTU5KYqBO/J9vHp40UnF0UVjYTs8giDbilGTvza3Y1
	6sknCDGg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54884 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLQ-0000FU-0r;
	Tue, 07 Nov 2023 10:30:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JLQ-00CTxK-Ln; Tue, 07 Nov 2023 10:30:04 +0000
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 09/22] drivers: base: add arch_cpu_is_hotpluggable()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JLQ-00CTxK-Ln@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_023022_564783_7C2DE908 
X-CRM114-Status: GOOD (  11.45  )
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

The differences between architecture specific implementations of
arch_register_cpu() are down to whether the CPU is hotpluggable or not.
Rather than overriding the weak version of arch_register_cpu(), provide
a function that can be used to provide this detail instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/cpu.c  | 11 ++++++++++-
 include/linux/cpu.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 58bb86091b34..221ffbeb1c9b 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -527,9 +527,18 @@ EXPORT_SYMBOL_GPL(cpu_is_hotpluggable);
 #ifdef CONFIG_GENERIC_CPU_DEVICES
 DEFINE_PER_CPU(struct cpu, cpu_devices);
 
+bool __weak arch_cpu_is_hotpluggable(int cpu)
+{
+	return false;
+}
+
 int __weak arch_register_cpu(int cpu)
 {
-	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
+	struct cpu *c = &per_cpu(cpu_devices, cpu);
+
+	c->hotpluggable = arch_cpu_is_hotpluggable(cpu);
+
+	return register_cpu(c, cpu);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 1e982d63eae8..dcb89c987164 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -80,6 +80,7 @@ extern __printf(4, 5)
 struct device *cpu_device_create(struct device *parent, void *drvdata,
 				 const struct attribute_group **groups,
 				 const char *fmt, ...);
+extern bool arch_cpu_is_hotpluggable(int cpu);
 extern int arch_register_cpu(int cpu);
 extern void arch_unregister_cpu(int cpu);
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
