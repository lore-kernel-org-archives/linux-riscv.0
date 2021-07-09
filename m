Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C92EC07E96
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 03:13:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 051CA61421
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 03:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 051CA61421
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUf1CcrS/9MRLb0G/2pfy0/ZsxDffYAUpKgQhxF9YA8=; b=UGST8VSX/Bcbxy
	IIrTnytyCVvEL1wevERSZ539KacsPXAeQlcPwNiDRC3qwfPdE4x1mwEYVyJE2PHxtze0ehV8+ITRt
	+tP+y48gh/OeoWWkp/DjtarY4KSsO/GCbkrdqwybb9OZkXv8G2502YeXp6vEfoG2fHYZvXudyaGCW
	m9Vuj1A5cqU1NZsFqGzvSabeRUMgVDUDjeEdkFNKOvoSEfttpX3CM/ZmCv/bSyai8gMBVDZHUv4XG
	fRNpULEe1SSWF96VNR6hDMyxE0NDmbY8GvmJ0246JZHFvpnS6734+HdKL2XkifAJHr/R0ZfVMlLOB
	LnGJUbiZ9vi+vibwynMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1gwa-000fsW-MF; Fri, 09 Jul 2021 03:12:48 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1gwQ-000frx-60
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 03:12:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id w15so8501624pgk.13
 for <linux-riscv@lists.infradead.org>; Thu, 08 Jul 2021 20:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=GJXAkY1T7qwEfj/VjG3iKpdTfNla3V+nWKACeLScyJE=;
 b=QWw2vunBs8Mo3KcvP1emM+4EwzubeJyptcROzLSbszQhmmQ784bGRxQXaRsn/MQi3l
 WiJKJmGoCVjOG//5c+Vp1FHitn3IbzZL80YKL5d2cePFMDk6NCSCyUhS0m67SKB3pyxx
 yusfknyo7HznTSUtRbG6mleAkOT/64ZwcqFpOCalZX4qiZzZ/3z0pUc9wg1AzyOkWvln
 bK4Ho3cxIx02iGf2grZEhLZGG3kmYmSW7a+WF9CkUBGTIBtJ+N21f5+rZ6TNxImgPf60
 TxLdnyo0FSgi4MoCJ8/QuDaURfZgEmVwJW3xszOUNfz1fVo22tQmPa14ICK8gn7h3PEF
 6uwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GJXAkY1T7qwEfj/VjG3iKpdTfNla3V+nWKACeLScyJE=;
 b=rd2rtyOZSdLRhF+EcD+76RtDmuN+iEKKPucZ+5iDsYTxezvw7rFkOGMv+ppoOPUk4h
 +BDOfoctHvt5AxKNcihVdeLNrffB4V3i4sDHOArL9fiWIweYObgAMTILc8RK8VzRn46G
 isVpQHG6kXWZPlYnu99NZWzO+mf/FOdM+QhyuzsCTIaM6rQEfySfM5hbeJyNvyakeIcr
 rvoxuWMmYT74WoJLnLk8S2EClwc5m9mgTVkfzvZqB4cwdo9A8k7LctKsNpnWbCIHTBb7
 sk99JUgE1NH+N9EJghRURsGDFnCR22a3Tfln3wKpT7SNiVmnBqd0QO7vx9eBx+XGt7vt
 KbUw==
X-Gm-Message-State: AOAM533n0ZTqYNDHJmtDYss2+A+M/o127v7G4tSDsCDZMO89N4UNzaUI
 S5iLyWD4Rce8Kg7urEB1U9B3VTwPOkN02w==
X-Google-Smtp-Source: ABdhPJwQJuq/iMvm3vk8l4PYMdEblmID7MA7rsoDPNx1LJLumfnSoF8HJkjrNJfxD+lDCBuQkGKLTg==
X-Received: by 2002:a63:170a:: with SMTP id x10mr8652388pgl.305.1625800356474; 
 Thu, 08 Jul 2021 20:12:36 -0700 (PDT)
Received: from localhost.localdomain (111-243-35-231.dynamic-ip.hinet.net.
 [111.243.35.231])
 by smtp.gmail.com with ESMTPSA id j3sm39642pfc.10.2021.07.08.20.12.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 20:12:36 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC PATCH] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI is
 enabled
Date: Fri,  9 Jul 2021 11:12:32 +0800
Message-Id: <1625800352-17846-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_201238_299970_1BB474BF 
X-CRM114-Status: GOOD (  22.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
enables a device to generate an interrupt using an inbound Memory Write
on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
needs support from the PCI controller or generic interrupt controller and
the corresponding software driver.

The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
may not have any function to deal with the MSI from PCI devices. When this
case happens, it leads to the following warning message displayed in
booting a v5.10~v5.12 kernel.

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at include/linux/msi.h:219 __pci_enable_msix_range+0x4b6/0x50e
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.34 #76
epc: ffffffe0004fa1e0 ra : ffffffe0004fa02e sp : ffffffe07fea7920
 gp : ffffffe0010e25c0 tp : ffffffe07fea8000 t0 : ffffffe0808c3180
 t1 : ffffffd000239000 t2 : 0000000000000400 s0 : ffffffe07fea79e0
 s1 : ffffffe080803000 a0 : 0000000000000000 a1 : ffffffe080803210
 a2 : ffffffe0808c30c0 a3 : 0000000000000101 a4 : ffffffe0808c30c0
 a5 : 0000000000000010 a6 : ffffffe0004dcf98 a7 : ffffffe07fe0f010
 s2 : 0000000000000002 s3 : 0000000000000014 s4 : 0000000000000000
 s5 : ffffffe080803210 s6 : 0000000000000000 s7 : ffffffe0808c3120
 s8 : ffffffe0808c30c0 s9 : 0000000000000000 s10: 0000000000000002
 s11: ffffffe0808030b0 t3 : 0000000000001000 t4 : 0000000000001000
 t5 : ffffffd040239000 t6 : ffffffe07ff8b2c0
status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003

A simple reproduce way is to use defconfig to configure the 64-bit riscv
v5.10 ~ v5.12 kernel but disable CONFIG_PCIE_XILINX, and then booting this
kernel on the QEMU virt platform with virtio-mouse-pci.

ARM's implementation may be a good sample for this case. Its Kconfig file
does not select CONFIG_PCI_MSI. Instead, It makes the selection of
CONFIG_PCI_MSI depends on the capability of the interrupt controller. This
way seems to be more straightforward. Therefore, this patch follows the
same way to remove the dependency between CONFIG_PCI and CONFIG_PCI_MSI
from Kconfig, which allows users to enable or disable CONFIG_PCI_MSI
according to the capabilities of the platform.

(note) Why does this warning message only happen in the v5.10 to v5.12 kernel?
When the kernel wants to register the MSI ID of the first PCI device, if
the PCI device does not belong to any MSI domain and there is no valid
arch_setup_msi_irqs() defined by architecture or PCI controller, the
generic arch_setup_msi_irqs() will be called to display this warning
message. However, before v5.10, this flow is different. A valid and weak
arch_setup_msi_irqs() is defined in driver/pci/msi.c. The kernel can use
this arch_setup_msi_irqs() to set up the MSI. Therefore, it will not
encounter any problems even if the architecture and PCI controller does
not define it. After v5.13, the kernel uses the MSI domain to deal with
all the setup of MSI issues. Only some old PCI controller still uses
arch_setup_msi_irqs(). Through the hierarchy of the MSI domain, the kernel
can know the bus used by the PCI device has MSI support or not before
doing the MSI setup. In this condition, the kernel will return early before
calling the generic arch_setup_msi_irqs(), which will trigger the warning
message.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 469a70bd8da6..563d550cb682 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -97,7 +97,6 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
-	select PCI_MSI if PCI
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
 	select SPARSE_IRQ
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
