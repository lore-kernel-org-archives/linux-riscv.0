Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD9C04E69
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUCDUcq+0J09wwCff6vyjfu979CwBC/vpTipANVDyBc=; b=XGl4+w2ybbJGFU
	4kCy6eBUOjG2Gippxq008mIMdN29H4CJY0VBoK6ZRL62QjEtSmcnHadtnPqBXtCTWh2Gj7G734HHV
	MIAxJOjKOYjnFFyQ0WFyyBwWYuuwgt2CO3jubqZJIpb/jKwJZ5tdTZd/hXT50VsXdD6wJJHvAUpMy
	X0QpI1EzZyNFCj3aL+kYyZQkBILy0NdBa8jp+qUGQC8sUM2WqnIwrtBN7bjIjcXqxMW2ZfSCGssw1
	L97Rp0a5Li1R7CcGGPWWCABStK2dqc5MHx4mBlw/vgPE8D/RdrkbNf6pRqqsOG7uvzNvBq44/puEd
	vkqAlj56upeOeZ+JxrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccZ-00AUhz-0d;
	Thu, 03 Aug 2023 18:00:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccW-00AUfR-0Q
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686ba97e4feso1110357b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085619; x=1691690419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mbYpJBEy7QtZn0rLm+Z46rszMOgig5KvbO250k7OII=;
        b=YfGQrWrqKxoHHrzv18a348oKjGYv1gGQ4cGmgyQBPY/sWq0LFcGm3LxWdqhhJX9N9s
         kBW3WG3VU+N9md0iX82nHkzuBp2q4t7soDxrCACNYYUFhcdhqpGhV2tZlHEQyVp7yC3I
         x3MZPiXRWfo/DCgcuqSvtbtyM5q1vXWl9zSat0C7GiPgfaHAdZmmf9DiiUkALXzC3yVv
         lSUTih5Yk/drJWTl6Lrv8KwxCFUZRYPN1Z/RXZ1bregl5jLq9/rXwM4R/ZO28pBL35/9
         Tkint7JkljbwD6bJlr3TRUg/dGfiJuJLTrbOaZxni/zO2Vd+5zxHdGnGLPVhestQq1s9
         FtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085619; x=1691690419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mbYpJBEy7QtZn0rLm+Z46rszMOgig5KvbO250k7OII=;
        b=PYJOCdsA0t8t9+iwQwz6+6tNRqrKXOuAwaPW92nVTBGMdwXDTHCCew1XFlV5G9kIdx
         Rn4hMSxuCtYc/2Ngr6DeirfN2+tVwyMqg/Wl8q0O+3sFDjjvxycld8Y0ca/SpKJ68DU6
         4QY6L9aI1uiT3HlJMAXhwLprzCFnuEoa1yuERdn1aYrSsYBvC2891oLPceFfaBShuwrs
         Z+h75SZ2c3i3MlHgMZAEjjkZmPKSG27ywvwxsRYC6w/LqwvMxa9iYJLYdFKBOHvJPMgB
         sdO65tkyxBvgA3BSpag3P3w6JVl/RD+0d3vggxRpgvrlcyODiqAzVDnvC6hQEXKkyHUs
         aZGw==
X-Gm-Message-State: ABy/qLbTMIwNcSRg9JK48LBKQhQbl2qfQO8ecUiRjUNw3xwBUU/V71Wt
	sGORpoaKVQIC7p38P/eHj+X4DQ==
X-Google-Smtp-Source: APBJJlEzbrnno8tMNvQ3OeUKWzuED/8IeQRaqcQag7dwUOCCbEcY3VwgrJDme+hmO3Kc0CFMYucNRA==
X-Received: by 2002:a05:6a21:718b:b0:134:b28f:b581 with SMTP id wq11-20020a056a21718b00b00134b28fb581mr20904425pzb.28.1691085619659;
        Thu, 03 Aug 2023 11:00:19 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 06/21] RISC-V: ACPI: Implement PCI related functionality
Date: Thu,  3 Aug 2023 23:29:01 +0530
Message-Id: <20230803175916.3174453-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110020_168962_0B480EE7 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Replace the dummy implementation for PCI related functions
with actual implementation.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/acpi.c | 32 +++++++++++++++-----------------
 drivers/pci/pci-acpi.c   |  2 +-
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index aa4433bca6d9..01022c5802ec 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -307,29 +307,27 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 #ifdef CONFIG_PCI
 
 /*
- * These interfaces are defined just to enable building ACPI core.
- * TODO: Update it with actual implementation when external interrupt
- * controller support is added in RISC-V ACPI.
+ * raw_pci_read/write - Platform-specific PCI config space access.
  */
-int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn,
-		 int reg, int len, u32 *val)
+int raw_pci_read(unsigned int domain, unsigned int bus,
+		 unsigned int devfn, int reg, int len, u32 *val)
 {
-	return PCIBIOS_DEVICE_NOT_FOUND;
-}
+	struct pci_bus *b = pci_find_bus(domain, bus);
 
-int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devfn,
-		  int reg, int len, u32 val)
-{
-	return PCIBIOS_DEVICE_NOT_FOUND;
-}
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
 
-int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
-{
-	return -1;
+	return b->ops->read(b, devfn, reg, len, val);
 }
 
-struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
+int raw_pci_write(unsigned int domain, unsigned int bus,
+		  unsigned int devfn, int reg, int len, u32 val)
 {
-	return NULL;
+	struct pci_bus *b = pci_find_bus(domain, bus);
+
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return b->ops->write(b, devfn, reg, len, val);
 }
 #endif	/* CONFIG_PCI */
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index d6b2d64b8237..5af6188cdbe0 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1521,7 +1521,7 @@ static int __init acpi_pci_init(void)
 
 arch_initcall(acpi_pci_init);
 
-#if defined(CONFIG_ARM64)
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /*
  * Try to assign the IRQ number when probing a new device
  */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
