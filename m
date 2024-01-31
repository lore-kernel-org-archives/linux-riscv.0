Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24769C4828F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsGfcDGa+qhA/7QghCvlFOFSrOOrSVPsBXREYaj7tgA=; b=DuQqn/0N+Dsh8q
	pY1SCJLpMVwyi3/35xHnEOttjDi9tOKGGu47TzKWEjTAaFqzSekMg2IB0n6QLG1fW68aL+YfzEG9L
	kNwfIAaYWAlLLSH7F/WQCeVh1O1PEJYPCYzbn7GcLfH/vnqfzpI2uoTgwj2AkexDuKneCHEUnvAng
	jgsht4rgDKRjfeXNDnhqa2NXXcQ+cVi80+7c5R4Ofhqbm26A/Ji+L+oZ5dEzF38nikqUGX2DiuGkR
	+irQsCklzYGu9RH4C06bKVe5sNegYJkS8aihIY+w7y330Ns+A5SHKckU20aYalakNemhAU5e66BZY
	nUUdUVnagDqwQDb7lqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVEuE-00000004yIJ-1qzX;
	Wed, 31 Jan 2024 18:01:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDnd-00000004dzA-3o7r;
	Wed, 31 Jan 2024 16:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=OtQiZzlvgESXnaZFiubyhPVK9p2k3sfuM0t4U/MmFRM=; b=kIWNPGlipcLyCRRY8M1rSYDKC+
	SviCQmFQfxgp79vkeWiFN/AryaXyucMVFxSYRBqSL41iewWVVMtpX3kjocGKFN8yAAg8lhsv+SZcH
	cOKWF21qb38Ogs++UciU1fTN7OMJ4n+WMOJyvoqrwNaeW1x+a0o8TPgbAQjt7UQQ29rYmpuYE0TgF
	rmqjidGZKvXuBqvYL6PoSvomFdGYdnBRcXsYo7S8D3Q6HkCRpPlYh84TpAZ9pXJIWfulzN1CW8qGp
	RlJEWkj9FQhMbltiFl//WtRsrqZsl49NuAmDd4QbUlgUk8zRhcikxaW19wktwiZaIlPfU0g3e4GWL
	wblGYEpA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDnZ-0000000981e-42sh;
	Wed, 31 Jan 2024 16:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OtQiZzlvgESXnaZFiubyhPVK9p2k3sfuM0t4U/MmFRM=; b=HYq1qH8juFn3MfE+HUi+xzCQdr
	HVOvrFH+vuVnxjDu6HoqW2RGQg98XWhXG7uFXm32kNVpZkT5kv+NR27+q8At66OhL6Dm+M95oi42i
	+N2R7/yUgAdxgKfsHtUIbv13JfFkeft7kxID8nUsblxP+NCkzcPSl6Ejb3WFjrxZV9qnozNX82Czk
	LtOV7dSZ0OJrEtluWG6QKtRtLjF8/HESq8XoYmOFveHAyct/GAny+JZAYkc3ITwIhN1BDNqf0G7G2
	RXXnRupw4ZpKkAjOYLaWqvbp3YA6Ja4YaW7FiM2Eh0Y3NAsKe0Fg0VtLAfMenWjgd/4O0IkuweeBD
	aPqwfrxQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36086 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rVDnJ-0003Vs-2E;
	Wed, 31 Jan 2024 16:50:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rVDnE-0027ZI-VR; Wed, 31 Jan 2024 16:50:33 +0000
In-Reply-To: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
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
	 acpica-devel@lists.linuxfoundation.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH RFC v4 11/15] irqchip/gic-v3: Add support for ACPI's disabled
 but 'online capable' CPUs
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rVDnE-0027ZI-VR@rmk-PC.armlinux.org.uk>
Date: Wed, 31 Jan 2024 16:50:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_165054_171794_AF7E6A6E 
X-CRM114-Status: GOOD (  26.02  )
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

This means that a "usable" GIC is one that is marked as either enabled,
or online capable. Therefore, change acpi_gicc_is_usable() to check both
bits. However, we need to change the test in gic_acpi_match_gicc() back
to testing just the enabled bit so the count of enabled distributors is
correct.

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
Changes since RFC v3 (smaller series):
 * Update ACPI_MADT_GICC_CPU_CAPABLE to ACPI_MADT_GICC_ONLINE_CAPABLE as
   per Lorenzo's ACPICA pull request.
 * Move acpi_gicc_is_usable() change in gic_acpi_match_gicc() into this
   patch from the previous one, and update the commit message to
   describe this change.
---
 drivers/irqchip/irq-gic-v3.c | 21 +++++++++++++++++++--
 include/linux/acpi.h         |  3 ++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 8deb671c4ff7..6d0f98d3540e 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2370,11 +2370,25 @@ gic_acpi_parse_madt_gicc(union acpi_subtable_headers *header,
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
@@ -2420,9 +2434,12 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 
 	/*
 	 * If GICC is enabled and has valid gicr base address, then it means
-	 * GICR base is presented via GICC
+	 * GICR base is presented via GICC. The redistributor is only known to
+	 * be accessible if the GICC is marked as enabled. If this bit is not
+	 * set, we'd need to add the redistributor at runtime, which isn't
+	 * supported.
 	 */
-	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address)
+	if (gicc->flags & ACPI_MADT_ENABLED && gicc->gicr_base_address)
 		acpi_data.enabled_rdists++;
 
 	return 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 76ad43f7860b..cf018d42e632 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -239,7 +239,8 @@ void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
 
 static inline bool acpi_gicc_is_usable(struct acpi_madt_generic_interrupt *gicc)
 {
-	return gicc->flags & ACPI_MADT_ENABLED;
+	return gicc->flags & (ACPI_MADT_ENABLED |
+			      ACPI_MADT_GICC_ONLINE_CAPABLE);
 }
 
 /* the following numa functions are architecture-dependent */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
