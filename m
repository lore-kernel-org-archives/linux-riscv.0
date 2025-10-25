Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C69CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mGVp3wTlGK5B/xBz4vaGlpWV/BxEr82DS4coDK+v98=; b=cGVoXMAZGf3iEg
	aszAq+uDxth9VVCtKSH2oF/vvjIWQeL83GtNpw4b7ptKMsCVoTijjR7JjewB7DbSJPys9ma/Nw8BO
	3Q9bMjsbtg53S2+g4L0UnEq6SyOWoWcxmhAvvE+3mlA6uHJWvi3Hbs5skP30xw7/oT6Z2ngjT7efk
	EbxrRWsOSa9OyK/Caeie4dHyMdd93S632ge5v2XYCo3kCkdPb3u/Kl4W2pfFfe4MGqiQDeXJuZNWD
	ZBkpQl5OqX2EBedOKnvrB54aEtaHwm28c37VzUAIl+UcysqXY06GfE24U/4LiDgaIIa73ziGJAkH9
	+nP3dRL237hAucXOa/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6x-0000000BVNF-2sNa;
	Sat, 25 Oct 2025 16:27:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6u-0000000BVKT-1Ear
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 16:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4A8B41A72;
	Sat, 25 Oct 2025 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F71DC4CEF5;
	Sat, 25 Oct 2025 16:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409639;
	bh=BzK5MSbnikKVMVBl3CpIZyvVtiwzDtnUwx3iJLWc4o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/s+Eoq0aUEnsoC1dltYqTaorPiJ3wHMwXlfCvn4iqtOpwxndV1LFibP2BcrQi1Gg
	 YkE5cKanwGd/tH6Eym2ofnfDbwopaZ78rMJcQSYJwz2jqI1ne5bc3xAx1SEP5nW0aZ
	 dEhEcDVqkxIjxo/YPm69YcYXBsbPAcbK11yPIQlWhFLTN5n8iyiSNMsChqIxel7Y3F
	 u3abog3uOyvnTDNGnEIOEW3UUnxhevnZGOF6p4HQq9NzYF59X2m+pIdUz2IDhOs3HS
	 OKLUA2wpaB5rsFx7id4RKMbzEHE01VM3+lEtAqG2ogUaB4h/7orqtZhwcwlvv3Ny9F
	 sGHxgzNqYzTdw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] ACPI: scan: Update honor list for RPMI System MSI
Date: Sat, 25 Oct 2025 12:00:32 -0400
Message-ID: <20251025160905.3857885-401-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_092720_391198_1DA9D88D 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Sasha Levin <sashal@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, rafael@kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atishp@rivosinc.com>, linux-acpi@vger.kernel.org, palmer@dabbelt.com, Paul Walmsley <pjw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

[ Upstream commit 4215d1cf59e4b272755f4277a05cd5967935a704 ]

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
Link: https://lore.kernel.org/r/20250818040920.272664-17-apatel@ventanamicro.com
Signed-off-by: Paul Walmsley <pjw@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
**Why**
- The patch extends the `_DEP` honor list in
  `drivers/acpi/scan.c:856-866` so that ACPI dependencies pointing at
  the SBI MPXY mailbox (`RSCV0005`) and RPMI System MSI controller
  (`RSCV0006`) are actually enforced. Without these entries,
  `acpi_scan_add_dep()` never sets `dep->honor_dep` for those HIDs
  (`drivers/acpi/scan.c:2034-2049`), leaving `device->flags.honor_deps`
  clear and allowing consumers to enumerate even when their IRQ
  provider/mailbox is missing, because
  `acpi_dev_ready_for_enumeration()` only blocks devices when both
  `honor_deps` and `dep_unmet` are set
  (`drivers/acpi/scan.c:2481-2486`).
- On RISC-V ACPI systems the arch helper builds implicit dependencies
  between devices and their interrupt controllers
  (`drivers/acpi/riscv/irq.c:340-404`). GED and other consumers
  therefore get `_DEP` entries that reference the RPMI System MSI node.
  If the honor flag is missing, GED can probe before the MSI domain
  exists, causing its interrupt setup to fail.
- The RPMI System MSI driver itself requires the MPXY mailbox to be
  ready; it immediately requests a mailbox channel in probe
  (`drivers/irqchip/irq-riscv-rpmi-sysmsi.c:223-233`). A premature probe
  hits `-EPROBE_DEFER`, and without the dependency being honored the
  driver keeps churning instead of waiting for the mailbox to finish.
- Both suppliers call `acpi_dev_clear_dependencies()` once they succeed
  (`drivers/irqchip/irq-riscv-rpmi-sysmsi.c:298-303`,
  `drivers/mailbox/riscv-sbi-mpxy-mbox.c:974-979`), so honoring their
  `_DEP`s restores the intended sequencing with no behavioral change
  elsewhere.
- Change risk is minimal: it only adds two strings, matching the
  precedent already in place for other RISC-V interrupt controllers. It
  fixes a user-visible failure (missing interrupts / repeated probe
  defers) on ACPI RISC-V platforms that already shipped the new RPMI +
  MPXY support.

**Next Step**
- Boot-test on an ACPI RISC-V platform using RPMI/MPXY to confirm GED
  and dependent devices enumerate cleanly once the MSI controller and
  mailbox load.

 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a36..54181b03b345b 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
