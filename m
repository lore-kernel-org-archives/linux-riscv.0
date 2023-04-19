Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2591C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=168o51THYW3bEtvqjsr8ApLNm9UI5TIS1Mr6/r1fTm0=; b=NB6aRboFvDp4ft
	hZleL5heWvHp11uwdyUATRQPYMQTSev/uY9nYtOYJ7fvDIAaNQb/M6iZePbk4I+ZiHDa5N4fYAPh8
	sJRR+rIi5iHosWCZ72hcAn5WlXSIykPUjF28WJ/GhFtgYGTjNFmv2OkCdpB947a40xYEwrOQLyQNs
	6zbVxo2/qwXSqft4tL39SaxyCA1cZ59nkv0WkyHL+lUPQ52c0YPI+A7rhs0DuxO1PpD82ezD1YeY5
	cCFP408m4vLVL+l1f3FDDqdvCgkCY2g2gAzwc9s3lmyzck4JqYF5NklbdQczgkcKbBLxXCtr4RQHI
	MgexzHig3jhJWzQgrBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGmf-006a8K-1G;
	Wed, 19 Apr 2023 23:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGlz-006Zbz-38
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=joeGaZNojBtAEH48oFyXyXsTdXyxZ+syATM0NtCwkJg=; b=RuMtDFX8GnL6K6Zpet1XjkQo7h
	1wSk6DGXh9ShDL7SSDdt13hHW/8KhsJqurHYotnYgrW6ECkU3SbXxEjlDuoe+W3dmf0hp/M3pc+bs
	sQXAFi+doc8v/qZZvqPBROIrA7GHZbBNk0kjhB1bZ6ttHi3AQdr53P2NuRFa4Z6/gw51mnxG7H728
	WPTs7FfuUw0SAk4BGnvXQmfsXa+wxRE7Wf+s/+tKEUgRFRNqj1Et4zwhxOwa34i2PiCC9xXhVWxCr
	1UvRdxZVuZ6jp0M4GdRny3uDCFh/c+EWcHQvzzdWqIlmUBSARTaqsTcIypQErz5MiXFr+mzcnRwk5
	gEfgSTVg==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDv-0021gV-18
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:26:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a6817adde4so5472365ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943061; x=1684535061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joeGaZNojBtAEH48oFyXyXsTdXyxZ+syATM0NtCwkJg=;
        b=Hy5Vjaj1GFlfqXFgFU4Wk7wYhL+AdW+GISShF7pbpQzBCAzoyX06mKj9riDONUvoTu
         KJygh5nscsoyPvItPChqrHSXQPxDp5bYRAnKsEvFqcmijRhCw38xeSwetTsF9AvkbUYf
         hVmE7FSAH4Q4wrzRD6pw23VK9AaSnKgovUSlZ9QXs++6xGQZcPVEtNzbYKNpDmb7ydxL
         pihm7AbjTblUz+nkMI32xYxKW27gseqDrV0RGKN4T43bczPSmCXLp3fRh/utmO9YHtoB
         Sey/VFplr9PE2lySTaLRpT3t0lbZnm/yfBcOsJhGI8vtN1zAVWuoZu9OzywwnPC3RL4n
         V1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943061; x=1684535061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joeGaZNojBtAEH48oFyXyXsTdXyxZ+syATM0NtCwkJg=;
        b=gBjkH+A8yVRujOu9uVH3EEyQE8omoHfXUjHcBG+xnR0Z3iUYK9No36DvEff+t0W06x
         cFeTwHqTvZDWB1+rF+2JtR2WdVx3R+wA1+TdgPRJNWzhTtAOhRXU1gwUILLZTryA80yl
         xV4PUu50AuLyo4s7BlH4UZzOzA8adGIKWfFC9Ne3zq3b8QGMQpkBRkOG6XWvlvTaAXqo
         zFZcGf8Z2mhq0DZKdwPD4Yk9ZqzF/Z3nUH0jwe4KMXIRiJ4rCToCCWv0Ic0ADcVUk43P
         6gznSTGZ2X34x7w4HIIG7MTCbFCq84wgd/axdIFYiz6ED3KsT49uHHX08OqkzMznf7Zg
         E3tw==
X-Gm-Message-State: AAQBX9f/2rkhyjchGXG6vLLLKqqX6F+nK/mui9NYNpkXMSSCCW0F5+PN
	80TBXn2oCpImDc2ItRLBqUGWaQ==
X-Google-Smtp-Source: AKy350bpDV/yb/MMXonhLvjhCzwnd1ozKuOFojavKdcbbpka5zKY4L/5Rw/zrIiOtje9GuJuXPaRMw==
X-Received: by 2002:a17:902:7891:b0:1a1:bf22:2b6e with SMTP id q17-20020a170902789100b001a1bf222b6emr6634040pll.43.1681943060762;
        Wed, 19 Apr 2023 15:24:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 10/10] riscv: cove: Don't emit interrupt_map for pci devices in fdt.
Date: Wed, 19 Apr 2023 15:23:50 -0700
Message-Id: <20230419222350.3604274-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_232623_921438_4073E012 
X-CRM114-Status: GOOD (  16.08  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

CoVE VMs don't support pin based interrupts yet as APLIC isn't
supported.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/fdt.c                  |  2 +-
 riscv/include/kvm/kvm-arch.h |  2 +-
 riscv/pci.c                  | 83 +++++++++++++++++++-----------------
 3 files changed, 46 insertions(+), 41 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index a7d32b3..115ae17 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -232,7 +232,7 @@ static int setup_fdt(struct kvm *kvm)
 	}
 
 	/* PCI host controller */
-	pci__generate_fdt_nodes(fdt);
+	pci__generate_fdt_nodes(fdt, kvm);
 
 	_FDT(fdt_end_node(fdt));
 
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index 08ac54a..9f6967f 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -104,7 +104,7 @@ void aia__create(struct kvm *kvm);
 
 void plic__create(struct kvm *kvm);
 
-void pci__generate_fdt_nodes(void *fdt);
+void pci__generate_fdt_nodes(void *fdt, struct kvm *kvm);
 
 int riscv__add_irqfd(struct kvm *kvm, unsigned int gsi, int trigger_fd,
 		     int resample_fd);
diff --git a/riscv/pci.c b/riscv/pci.c
index 9760ca3..31ea286 100644
--- a/riscv/pci.c
+++ b/riscv/pci.c
@@ -17,7 +17,7 @@ struct of_interrupt_map_entry {
 	u32				irqchip_sense;
 } __attribute__((packed));
 
-void pci__generate_fdt_nodes(void *fdt)
+void pci__generate_fdt_nodes(void *fdt, struct kvm *kvm)
 {
 	struct device_header *dev_hdr;
 	struct of_interrupt_map_entry irq_map[OF_PCI_IRQ_MAP_MAX];
@@ -67,51 +67,56 @@ void pci__generate_fdt_nodes(void *fdt)
 	_FDT(fdt_property(fdt, "reg", &cfg_reg_prop, sizeof(cfg_reg_prop)));
 	_FDT(fdt_property(fdt, "ranges", ranges, sizeof(ranges)));
 
-	/* Generate the interrupt map ... */
-	dev_hdr = device__first_dev(DEVICE_BUS_PCI);
-	while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
-		struct of_interrupt_map_entry *entry;
-		struct pci_device_header *pci_hdr = dev_hdr->data;
-		u8 dev_num = dev_hdr->dev_num;
-		u8 pin = pci_hdr->irq_pin;
-		u8 irq = pci_hdr->irq_line;
+	/* CoVE VMs do not support pin based interrupts yet as APLIC isn't
+	 * supported.
+	 */
+	if (!kvm->cfg.arch.cove_vm) {
+		/* Generate the interrupt map ... */
+		dev_hdr = device__first_dev(DEVICE_BUS_PCI);
+		while (dev_hdr && nentries < ARRAY_SIZE(irq_map)) {
+			struct of_interrupt_map_entry *entry;
+			struct pci_device_header *pci_hdr = dev_hdr->data;
+			u8 dev_num = dev_hdr->dev_num;
+			u8 pin = pci_hdr->irq_pin;
+			u8 irq = pci_hdr->irq_line;
 
-		entry = ((void *)irq_map) + (nsize * nentries);
-		*entry = (struct of_interrupt_map_entry) {
-			.pci_irq_mask = {
-				.pci_addr = {
-					.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
-					.mid	= 0,
-					.lo	= 0,
+			entry = ((void *)irq_map) + (nsize * nentries);
+			*entry = (struct of_interrupt_map_entry) {
+				.pci_irq_mask = {
+					.pci_addr = {
+						.hi	= cpu_to_fdt32(of_pci_b_ddddd(dev_num)),
+						.mid	= 0,
+						.lo	= 0,
+					},
+					.pci_pin	= cpu_to_fdt32(pin),
 				},
-				.pci_pin	= cpu_to_fdt32(pin),
-			},
-			.irqchip_phandle	= cpu_to_fdt32(riscv_irqchip_phandle),
-			.irqchip_line		= cpu_to_fdt32(irq),
-		};
+				.irqchip_phandle	= cpu_to_fdt32(riscv_irqchip_phandle),
+				.irqchip_line		= cpu_to_fdt32(irq),
+			};
 
-		if (riscv_irqchip_line_sensing)
-			entry->irqchip_sense = cpu_to_fdt32(IRQ_TYPE_LEVEL_HIGH);
+			if (riscv_irqchip_line_sensing)
+				entry->irqchip_sense = cpu_to_fdt32(IRQ_TYPE_LEVEL_HIGH);
 
-		nentries++;
-		dev_hdr = device__next_dev(dev_hdr);
-	}
+			nentries++;
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 
-	_FDT(fdt_property(fdt, "interrupt-map", irq_map, nsize * nentries));
+		_FDT(fdt_property(fdt, "interrupt-map", irq_map, nsize * nentries));
 
-	/* ... and the corresponding mask. */
-	if (nentries) {
-		struct of_pci_irq_mask irq_mask = {
-			.pci_addr = {
-				.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
-				.mid	= 0,
-				.lo	= 0,
-			},
-			.pci_pin	= cpu_to_fdt32(7),
-		};
+		/* ... and the corresponding mask. */
+		if (nentries) {
+			struct of_pci_irq_mask irq_mask = {
+				.pci_addr = {
+					.hi	= cpu_to_fdt32(of_pci_b_ddddd(-1)),
+					.mid	= 0,
+					.lo	= 0,
+				},
+				.pci_pin	= cpu_to_fdt32(7),
+			};
 
-		_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
-				  sizeof(irq_mask)));
+			_FDT(fdt_property(fdt, "interrupt-map-mask", &irq_mask,
+					  sizeof(irq_mask)));
+		}
 	}
 
 	/* Set MSI parent if available */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
