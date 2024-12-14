Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B30E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAU+1rWd6eOg8RIcQ3FC7AZVMot+K2JbhN42cSH2tO0=; b=dTSlLXwCoxYKco
	sEPKB0Q4RKQZdXyDERPIeUNah+GZByABwb2sZw48rshQc8c82x8Fv4TzSfSaVWtg67NVhja9FbekS
	JJ8Iy2OmJNcFUMnEcrAfFKvLmL+uux29ac/ybNncspXjUwslqjmjevHclUyIW6UPFDU59TunN+IZi
	tEv+kDisgdNpiskD/qN9BW9/GGGB7BHKhVnUsEYXz+kaMzsyeVIF7sqG6/j3zflvjJYArcYqFdOSX
	48Vb/h04cakYTc830NkRXOBNY2MrHFqvV0/fg7u43S10O+4aYHzGWsO68AuCkp2sCP2y1Lk6xUHqE
	Y9rtVVP7/godGE+gLsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQfB-00000006HEh-1lAi;
	Sat, 14 Dec 2024 11:50:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQf9-00000006HDy-2VoL
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 11:50:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734177019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qzhprNUpJd8crZLNLycupfbl2vwMD3GsAtuBolAfNoY=;
	b=juRtzyi0tetJHjKFjtFzHZG7rWMU4N8Z58M+GYecSxP5OJThN+DFmtm9cO61sR2kWiqmHQ
	aamdpY7MSgaRK0jejENepHm7pqpbIV8dXvr/b0xNRygbfKV41faD1da+0ZTkahJiz3d6Wq
	MoxS5DwJOQ65jC2q/A1LDK+Mc5Z2581zOPBbZfG3LPUewGXQt5v6A96GfZvtomJrybn2wP
	CGCB3gC00aVXPfUwJixgX/ugMNN2SxXIsBUh5dmnwAPX//dbQkAaAMJdEpdkHqSq2Cn2az
	03VLM3QxmGOrVuCg4HPkkCaAFisP9EJorj4KtmkR8sYQK/REPQTQSCDxsaRTqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734177019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qzhprNUpJd8crZLNLycupfbl2vwMD3GsAtuBolAfNoY=;
	b=/kT1pB5h9x7NYf+v7YUGm9akGgpE576x1ScHoRdyaND8OyrX8q/cgdov3dsKva4erlJZ2+
	EcwB2vgCs/C9LpAA==
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-Reply-To: <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
 <87v7vn917f.ffs@tglx>
 <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
Date: Sat, 14 Dec 2024 12:50:18 +0100
Message-ID: <87ed2a8ow5.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_035023_777482_0EB3FD17 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Alexandre observed a warning emitted from pci_msi_setup_msi_irqs() on a
RISCV platform which does not provide PCI/MSI support:

 WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_irqs+0x2c/0x32
 __pci_enable_msix_range+0x30c/0x596
 pci_msi_setup_msi_irqs+0x2c/0x32
 pci_alloc_irq_vectors_affinity+0xb8/0xe2

RISCV uses hierarchical interrupt domains and correctly does not implement
the legacy fallback. The warning triggers from the legacy fallback stub.

That warning is bogus as the PCI/MSI layer knows whether a PCI/MSI parent
domain is associated with the device or not. There is a check for MSI-X,
which has a legacy assumption. But that legacy fallback assumption is only
valid when legacy support is enabled, but otherwise the check should simply
return -ENOTSUPP.

Loongarch tripped over the same problem and blindly enabled legacy support
without implementing the legacy fallbacks. There are weak implementations
which return an error, so the problem was papered over.

Correct pci_msi_domain_supports() to evaluate the legacy mode and add
the missing supported check into the MSI enable path to complete it.

Fixes: d2a463b29741 ("PCI/MSI: Reject multi-MSI early")
Reported-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: stable@vger.kernel.org
---
 drivers/pci/msi/irqdomain.c |    7 +++++--
 drivers/pci/msi/msi.c       |    4 ++++
 2 files changed, 9 insertions(+), 2 deletions(-)

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
@@ -433,6 +433,10 @@ int __pci_enable_msi_range(struct pci_de
 	if (WARN_ON_ONCE(dev->msi_enabled))
 		return -EINVAL;
 
+	/* Test for the availability of MSI support */
+	if (!pci_msi_domain_supports(dev, 0, ALLOW_LEGACY))
+		return -ENOTSUPP;
+
 	nvec = pci_msi_vec_count(dev);
 	if (nvec < 0)
 		return nvec;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
