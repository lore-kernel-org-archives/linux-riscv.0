Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E230C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAmmyx09tR6BbPkfvU0bsuMxAQ2uWmfGCa+tVvrxtR0=; b=bZHN2xLj045BMs
	CVNhYvVbUUcFIapwL1jDglTEmcPuNPzZ1yWtf+Er15z81wk9bwpyC146QP2Tsr9fjF/dc2h5l90WC
	cccvhf9FPv5kIiVyJ7iixkgbPpC6R1YHAS6zleOcLHKXLnGpI+qxVQmHCKQ7jMhyBN6Qct2409YFl
	R/B5XOlXld1D6apPk7KH4lOA8Li85Kwl+PxY87AxRo2lAfeCtGWoFevxJcvvkmpTvxIz1ZbAnbNCS
	yPlCnumh8HHcAGa26nTGAy5dbHlJuJr/4ATXzanV/tNDQddIZKlUsZ5ebc4sbLJZvOQiFh1OlpxPy
	OEwb2/65urGk9MMrNR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhO-00Ef0v-2g;
	Wed, 13 Dec 2023 12:50:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhF-00Eeqm-0C;
	Wed, 13 Dec 2023 12:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=DnFY2Lrn3laRjR0dFD9DsIQAz620A4pU6zpNT78Use8=; b=Z/YHxhjFjIG628REu/2ZHWz5OM
	XYctAIdQAfk9oDirh95kcT6IUgxAKejLNwwY+6Jp5QGF+n8puhSz7zwE2AZ7PmF0REVZJba5LL3gq
	VwCPd1LfLFf4UaABjGnSIomoCRgqmMLajBDo5f9YSR7fl1kfqZvnPEr1BhKyb0XOGrCTZr1p/rS1T
	da/nA31XJJWBcHftJvUSJE9Cue3PNY5f7auUUwpRgb1JnT4qawe4AHtQqFmlq8KeNKtx6tdU1vt2q
	R2uMx3xxt7W0PtKP1WiFhCJjxcQdSUuv/zHTOLZmfz35ofouoLKLbdEpxwAOI5ZKBFgV5ImEwax7T
	kXbERvJg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOh9-00964K-1m;
	Wed, 13 Dec 2023 12:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DnFY2Lrn3laRjR0dFD9DsIQAz620A4pU6zpNT78Use8=; b=AsjeyEgF6qrzJzab3wkGeZcEwz
	rQbT8Tw9ttXnjWwBGSCpduVsdyCslNTtuX0uB4lOWLn2A4DQGf8kQ54y0eQssun1EYJVaEjWIl9+m
	pSqtSsZYzlpMk6x1cEk4OonnO/nvQhZCTzAnt6bk8eG11xPN/bKHuFd3QTGhNZKj9fdYNDgvvT6j5
	KjXoS4SJ3GKYkLPAF7X0EkDMoJdVgIbwj0bsR13/aGe4cetcTaI0cBPZMSGQ+V25Klu4Ppx6urvC/
	eKcbFBSHX4L8zY9q6CIQ36XIHBJPW92Q1bOt1cleQ9a1mRdmlhqi3jF3ZqX8pqXPmBYM0zM3WXTb5
	2ou+awpw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33732 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOgp-0008Fs-39;
	Wed, 13 Dec 2023 12:50:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOgs-00Dvko-6t; Wed, 13 Dec 2023 12:50:18 +0000
In-Reply-To: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
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
	James Morse <james.morse@arm.com>
Subject: [PATCH RFC v3 13/21] ACPICA: Add new MADT GICC flags fields
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOgs-00Dvko-6t@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:50:18 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_125035_789042_E8556319 
X-CRM114-Status: GOOD (  10.27  )
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

Add the new flag field to the MADT's GICC structure.

'Online Capable' indicates a disabled CPU can be enabled later. See
ACPI specification 6.5 Tabel 5.37: GICC CPU Interface Flags.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
This patch probably needs to go via the upstream acpica project,
but is included here so the feature can be tested.

If the ACPICA header files are updated before merging this patch set,
this patch will need to be dropped.

Changes since RFC v2:
 * Add ACPI specification reference.
---
 include/acpi/actbl2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index 3751ae69432f..c433a079d8e1 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -1046,6 +1046,7 @@ struct acpi_madt_generic_interrupt {
 /* ACPI_MADT_ENABLED                    (1)      Processor is usable if set */
 #define ACPI_MADT_PERFORMANCE_IRQ_MODE  (1<<1)	/* 01: Performance Interrupt Mode */
 #define ACPI_MADT_VGIC_IRQ_MODE         (1<<2)	/* 02: VGIC Maintenance Interrupt mode */
+#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3)	/* 03: CPU is online capable */
 
 /* 12: Generic Distributor (ACPI 5.0 + ACPI 6.0 changes) */
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
