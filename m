Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204AEC00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uORbSAOXkuOMHM/4Pn0OIwnacvpwuakY4iVNf6/N4xk=; b=1jhdF2/kTheePS
	ndqnJKYPohLiHiTpDh0Mgzk1MMHFYhJTB8F4DvkSeYdCFYQIoDB3WbaQERTpfjc12O9B4CYw0qOBt
	lrfjEqjXCOsYaCWAPopKpaSEHQiUWIlpRK/pA6oxChZcGUtEjNPbmEvdF8pU7bvZwZ/dnd3aOYBoD
	NJ5WYQ2V6X9epOcJcivsO5Tc8ejmKrgA5SNPcit2kuWlNfWn0dVEZSmHC1rmTlOWyXkRlkQO56fua
	GHImlnA+HaVSQBkwty6BOhQGepiraxMWvy4FVbH3mkU9eD+DNoy0EAa7lZCGvWzyvVxOh4ih7hbZI
	5cSSDH5iia8FLyiVaKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJDz-00AJ7r-22;
	Tue, 24 Oct 2023 15:21:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBY-00AGzH-18;
	Tue, 24 Oct 2023 15:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=IvdCyZ69JqjCqU2UCE2N7kgvodoHzzbAeaFJb32wt6M=; b=OuWXw0zEgb1blVrrpc9FGD9du8
	k9IxF3tqjwpXCtnbko7UcRMD1e9EqE9DXUT2js5cxv0aBO2HTIZaIuZY6u/aHM6USNV/6Ehvz1A2u
	aZQ9/jTwGO7kFZPbxgS8Ni5pOSCVMHjb0sXWswAWK8LPaEOs6TLo+IvhM+Nyh+QxBVEJibXBSc3Rc
	rxenFoWqql7bWeJ+ciZcfNd0xUqHeAlKUOs0OylB2b0Z1KjgZJYbs5tcbZiI3z5NA575N6iNwfAhG
	tC0EVLTW8I5sH3DT4T1BgK5DuZaMy2vu6cst45KfCN3Pgo4HniS/wfMU+IsDFXWukWEr4wGT6p7I7
	aIGNfzdA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBU-00FbKY-1j;
	Tue, 24 Oct 2023 15:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IvdCyZ69JqjCqU2UCE2N7kgvodoHzzbAeaFJb32wt6M=; b=HXBUATQVBdjMZPY0yc6gM7kPy3
	G3hrUbLBAVOLWAfhp7RSpQyTDo7kR93WiMzdV7a87uv35WPsIqru3D1uZ6uAi2zfLpa6dfU3h5pv8
	vzi3dl9isG3GGh3n5k2W4XJe0ogrjaGhQ5L55rpGmsONgDHpsUuhQ355rEY2hf+9Lg9SqilZSMfZX
	Ye7Y/qNvdVEdWIgCGh36o2wQflsQPjVxaUPt/A2I4YhimpoM+vFFnMib/ZXWdF85xUHJuFLIFlF3S
	e8ajQ1VQuoclimJYrm4GDa0mWAJKt6BniECMV5SPpDQwXY0VqweTrf/JA0Zs+Jbxda2NjqyCiiVCk
	CdBVe8Jw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46022 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJBJ-0004Vr-2J;
	Tue, 24 Oct 2023 16:18:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJBL-00AqS2-3S; Tue, 24 Oct 2023 16:18:59 +0100
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
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Subject: [PATCH 33/39] irqchip/gic-v3: Add support for ACPI's disabled but
 'online capable' CPUs
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJBL-00AqS2-3S@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161908_710197_5E64E323 
X-CRM114-Status: GOOD (  19.83  )
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

To support virtual CPU hotplug, ACPI has added an 'online capable' bit
to the MADT GICC entries. This indicates a disabled CPU entry may not
be possible to online via PSCI until firmware has set enabled bit in
_STA.

What about the redistributor in the GICC entry? ACPI doesn't want to say.
Assume the worst: When a redistributor is described in the GICC entry,
but the entry is marked as disabled at boot, assume the redistributor
is inaccessible.

The GICv3 driver doesn't support late online of redistributors, so this
means the corresponding CPU can't be brought online either. Clear the
possible and present bits.

Systems that want CPU hotplug in a VM can ensure their redistributors
are always-on, and describe them that way with a GICR entry in the MADT.

When mapping redistributors found via GICC entries, handle the case
where the arch code believes the CPU is present and possible, but it
does not have an accessible redistributor. Print a warning and clear
the present and possible bits.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
----
Disabled but online-capable CPUs cause this message to be printed
if their redistributors are described via GICC:
| GICv3: CPU 3's redistributor is inaccessible: this CPU can't be brought online

If ACPI's _STA tries to make the cpu present later, this message is printed:
| Changing CPU present bit is not supported

Changes since RFC v2:
 * use gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_CPU_CAPABLE)
---
 drivers/irqchip/irq-gic-v3.c | 14 ++++++++++++++
 include/linux/acpi.h         |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index e787e7bbb5a2..8a89b853a5b9 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2378,11 +2378,25 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
 				(struct acpi_madt_generic_interrupt *)header;
 	u32 reg = readl_relaxed(acpi_data.dist_base + GICD_PIDR2) & GIC_PIDR2_ARCH_MASK;
 	u32 size = reg == GIC_PIDR2_ARCH_GICv4 ? SZ_64K * 4 : SZ_64K * 2;
+	int cpu = get_cpu_for_acpi_id(gicc->uid);
 	void __iomem *redist_base;
 
 	if (!acpi_gicc_is_usable(gicc))
 		return 0;
 
+	/*
+	 * Capable but disabled CPUs can be brought online later. What about
+	 * the redistributor? ACPI doesn't want to say!
+	 * Virtual hotplug systems can use the MADT's "always-on" GICR entries.
+	 * Otherwise, prevent such CPUs from being brought online.
+	 */
+	if (!(gicc->flags & ACPI_MADT_ENABLED)) {
+		pr_warn_once("CPU %u's redistributor is inaccessible: this CPU can't be brought online\n", cpu);
+		set_cpu_present(cpu, false);
+		set_cpu_possible(cpu, false);
+		return 0;
+	}
+
 	redist_base = ioremap(gicc->gicr_base_address, size);
 	if (!redist_base)
 		return -ENOMEM;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 3672312e15eb..ed1ef5d8687f 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -258,7 +258,7 @@ void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
 
 static inline bool acpi_gicc_is_usable(struct acpi_madt_generic_interrupt *gicc)
 {
-	return gicc->flags & ACPI_MADT_ENABLED;
+	return gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_CPU_CAPABLE);
 }
 
 /* the following numa functions are architecture-dependent */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
