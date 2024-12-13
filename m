Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB246E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCVOeK4Yflug/vYNqPcWsMpeKOCXhp6n8f0L0q83Z98=; b=TbCY9HO79/MMSB
	thJL9iJ+309KXekQMbkjuMbzAfmUbJeh2R+lC/98S8xliH2xS0HMueb11UOdzRIEPHuj01VqVeOFN
	ZjCByNPKBsd60l5uwPOY5qgZ7RzNPuzKSrgppZ8uGuwVWBIvMuV87KPrNEAySGw+W37lo8XFznmlH
	GqggZP584uYvVJ/POiSi3yZhk6HRUMGGZQRyaKxoVZ7Mfd7Fjlv+8Z/1QwT9dnjV1BJwcM8mzciZe
	cx/YW3v6Fc5YwI2lRRUieIqAPvlB7bPp66tiHJLtZKVTfJCSrJ9EBXsC58fHW408DRplWG0v4SFPJ
	X4UqIo6YD69q8SGbFiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5Sk-00000003nXp-2FQR;
	Fri, 13 Dec 2024 13:12:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5Si-00000003nWN-0Nru
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 13:12:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734095525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lE2poo2GMB98M3DjQRZUTgVcvXIDD7PPRxrzMRG9oM=;
	b=HEoStFZJ5EfQAolr9+hEMAnBOKOo2iMkTXBWt8foCfFSMDcHnFPVKA50yTBJyla3fdGosl
	HOJKQ1wi9Mku9Z3l2DzecaiWIIvkVzh2Rf3FRa1airQEh5s6XIIM4b8VqHz7tBbtvbkb4w
	QTKYsjqQz5v7Q0y62btYk6qsrYq/Wgemhc47UNqoV6eVMzXHvdjCieiL38PAcvCyroAlI7
	5aEj6yz9cLa/w2jz9eS8D/jQxV0sMjkdX52qTZrMFwVVyEkcYkdcxd8SCsC3OacvBE4AiM
	kDEX58aR11BlyQCe7by/JHzfoVjmYzarlt6e0mwTS9b/Rf/NKt4Z833QByE3NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734095525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lE2poo2GMB98M3DjQRZUTgVcvXIDD7PPRxrzMRG9oM=;
	b=Esrj5StdaxwMDaPAcLNiXxAYNk9ctiiAfaJHXgTof+7R9B9+OYlpsjSDVrNs80W/Mjxkva
	xu8P/0iPq9mWBqAA==
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Anup
 Patel <anup@brainfault.org>, Sunil V L <sunilvl@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [RFC PATCH] riscv: Fix PCI warning by enabling
 PCI_MSI_ARCH_FALLBACKS
In-Reply-To: <20241213115704.353665-1-alexghiti@rivosinc.com>
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
Date: Fri, 13 Dec 2024 14:12:04 +0100
Message-ID: <87v7vn917f.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_051208_264947_FA6D33A0 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Dec 13 2024 at 12:57, Alexandre Ghiti wrote:
> When the interrupt controller is not using the IMSIC and ACPI is enabled,
> the following warning appears:
>
> [    0.866401] WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_irqs+0x2c/0x32
> [    0.867071] Modules linked in:
> [    0.867389] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2-00001-g795582ce7e24-dirty #44
> [    0.867538] Hardware name: QEMU QEMU Virtual Machine, BIOS
> [    0.867672] epc : pci_msi_setup_msi_irqs+0x2c/0x32
> [    0.867738]  ra : __pci_enable_msix_range+0x30c/0x596

Removing a ton of badly formatted stack trace:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages

>
> So enable PCI_MSI_ARCH_FALLBACKS to get rid of this.

No. PCI_MSI_ARCH_FALLBACKS is really only meant for architectures which
implement the legacy fallbacks and not to paper over the underlying
logic bug in the pci/msi code. Of course the loongson folks ran into the
same problem two years ago and went for the sloppy fix without talking
to anyone...

Thanks for bringing it up instead of silently slapping it into the RISCV
tree !

The uncompiled patch below should fix this for real.

Thanks,

        tglx
---
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -185,7 +185,6 @@ config LOONGARCH
 	select PCI_DOMAINS_GENERIC
 	select PCI_ECAM if ACPI
 	select PCI_LOONGSON
-	select PCI_MSI_ARCH_FALLBACKS
 	select PCI_QUIRKS
 	select PERF_USE_VMALLOC
 	select RTC_LIB
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -350,8 +350,11 @@ bool pci_msi_domain_supports(struct pci_
 
 	domain = dev_get_msi_domain(&pdev->dev);
 
-	if (!domain || !irq_domain_is_hierarchy(domain))
-		return mode == ALLOW_LEGACY;
+	if (!domain || !irq_domain_is_hierarchy(domain)) {
+		if (IS_ENABLED(CONFIG_PCI_MSI_ARCH_FALLBACKS))
+			return mode == ALLOW_LEGACY;
+		return false;
+	}
 
 	if (!irq_domain_is_msi_parent(domain)) {
 		/*
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -442,6 +442,10 @@ int __pci_enable_msi_range(struct pci_de
 	if (nvec > maxvec)
 		nvec = maxvec;
 
+	/* Test for the availability of MSI support */
+	if (!pci_msi_domain_supports(dev, 0, ALLOW_LEGACY))
+		return -ENOTSUPP;
+
 	rc = pci_setup_msi_context(dev);
 	if (rc)
 		return rc;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
