Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94630C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x56U7avXBUdkpcorWbjB0HO0DqeJJMKLAuHlDYt8T7g=; b=r4YLXJ26ph8uLg
	J+IfWHfWrk7+GVzz1Dh89yLs7ZwwLk2oRVEjr6pVGlZsN81bTQNBqPx0lir3TnP8yR5uzkORaSRWj
	THy0xxctN0qQdepjG1JNNJFESQOU6ycqRGZa+Ehy1pH+lwIiT+D05M0RqEV4WAv1o1CiSB5gDfINZ
	wE2a8JRTYDWJM04acZ/X4gsSZXv2kQ9O6sw/nW1BLXp8ETdl3I40zm1jtYXnjFi+h03G1gY7CvVp8
	RGOrUcJvaRl7ZScRAJY0TrJSUZtTD1LVksp53oVgsRSmsH30KVI4Wo9sEe3oryeP93bWJNUxf6Frt
	X/HFT4zv6eoh5pXEPvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBt-00AHNA-2L;
	Tue, 24 Oct 2023 15:19:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAe-00AG6r-2N;
	Tue, 24 Oct 2023 15:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X5Z3Nkf5E4AARS+LHoFvElPsf0E44YGYiNzXX8jAQTI=; b=KMVeJnaKKwNEXhfQUmDrES4Snp
	XVvjqbxfqo6dLoYwamROVwhdcf+ZovVQJI7nDYDGQtcNIXjfIT8e7KsFeto4CPCANkXvu4t9K4Y+g
	8EGsTU5QpumHaaHipUSZyR13cFFVehwjO/0SFEc+a9oyQs8c2MGh5V3uwAXUPf7q0fXPquP3hLEJy
	Yzqs5yQ5uo1f5zI1l2MQZ9XL7/fXlSAGmRdqC0+pVYMp1Z9i9VoONTVYY/uld4OO+hy99c97jEcyL
	Hniy37vHKdoNG4BwZgaojb/AMgXRdKgZ2qQQjWXVjYQP8wKJN0AeDHybJXL9JPfGFMLw+qJ5Nr0tt
	HjcFxc7g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57434 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAU-0004SZ-0c;
	Tue, 24 Oct 2023 16:18:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAV-00AqR4-LS; Tue, 24 Oct 2023 16:18:07 +0100
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 23/39] drivers: base: Implement weak arch_unregister_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAV-00AqR4-LS@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:07 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081816_797122_755E524E 
X-CRM114-Status: UNSURE (   9.55  )
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

From: James Morse <james.morse@arm.com>

Add arch_unregister_cpu() to allow the ACPI machinery to call
unregister_cpu(). This is enough for arm64, riscv and loongarch, but
needs to be overridden by x86 and ia64 who need to do more work.

CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v1:
 * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
Changes since RFC v2:
 * Move earlier in the series
---
 drivers/base/cpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 6c70a004c198..2b9cb2667654 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -531,7 +531,14 @@ int __weak arch_register_cpu(int cpu)
 {
 	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
 }
-#endif
+
+#ifdef CONFIG_HOTPLUG_CPU
+void __weak arch_unregister_cpu(int num)
+{
+	unregister_cpu(&per_cpu(cpu_devices, num));
+}
+#endif /* CONFIG_HOTPLUG_CPU */
+#endif /* CONFIG_GENERIC_CPU_DEVICES */
 
 static void __init cpu_dev_register_generic(void)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
