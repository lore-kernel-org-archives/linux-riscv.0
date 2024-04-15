Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E61C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21TDMqV/sekptJo1BBdgWQxV5cqHzfiTuBRug/QjEys=; b=ljeerre4StdbNa
	a3biy3+F5wAz5/GDShstqDZcX2GW0Knc+HLt4JUWLt7yfSCKgcb6Pc8njdF5LyYRVrBwyGYCUkw5d
	hJF2ub76WV8kcL8+tdinFJBAYuck68I0bZEQZzw53f54D1amNwpFK6gws0BcOvarZHquHfV+yUOBy
	6kG/9VCrkNr9ytgcry7Zq6LQfKpY+11zFAsca8TBlIXSSB4rlfMUcQWY6X30YinAZ/Sas2zbzfhvh
	fkf7+6LN0bc/xx7v1o7rCfMz0U1kzscG1MAPntyBEfqReLERz6uBv/M0fjdXHoKzJa+bUhaK0d0OB
	j3NcrhM3SqLgVlN1wKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPmW-00000009EeS-134w;
	Mon, 15 Apr 2024 17:06:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjB-00000009C0j-1o6r
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6eff9dc1821so1050134b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200564; x=1713805364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAAOkQmqhfZx+8yFnraUuWf5SW+MXW6uPQvUnDzGd+Y=;
        b=LTJ3uXKi8pkofTRMKpcn1xNJqX5Lh9diuM9Ar1kH5aIRkWzEkNd4Zlvv7eKvWFYxif
         k9WGBI9PoZJ9rWEfo076c0dAicyDePg9zv6yu97UZIen/7yaVJJwCE1Gg16rVHRK36u2
         Tww29VdBGX3GDzuaHo5yEm2ZCyyPb78gJfzwAf5Tb3zzTCYiUbhdsWr+N21FaX3tDOpI
         KcaqIlY5G2ST3pDh36418A/vnqIfqwkPEKP/oq1dae8KfF1XK8D0gE1IW0plxV0sHFvp
         NcP2qcf3pn1kEr8x8gF961emn2odUEqjenXeZa6vDKIBmDKKDzmOUkcbwB1qwTN34t9n
         TH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200564; x=1713805364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAAOkQmqhfZx+8yFnraUuWf5SW+MXW6uPQvUnDzGd+Y=;
        b=p+rqiEBQ5rQ8NpXRsp8U/fOdV3Jlgz+E75F5ZxlkcVy72egHMG7D4soeDmMn8ERJKx
         r1lqvr8DFrJJUu5tXbOJbVyfFDq54kE1LApTgqiDjG1AvJncyepVbyOM2j462kp7JKk9
         uv63bNo9irnr5Tpcqh9hQqQkEL23zr135UyV5zR/yMUcexTNX9ZQyvxfnPm5AXzixUZj
         ltf3YuJuj/AXHY/PO4QQ284/97duGtU9J+udu60WLMREMuCStQgN5zKth7yE/NREBZSc
         Cc2VPdKn+VPQTBlFPbtPMkQg3NjabbSp8yREGP2+JF/POr1/3I0k+e7IYLfbvvcvDT65
         U5dg==
X-Forwarded-Encrypted: i=1; AJvYcCUHOKX2yjdJtAxCX2p9XMzJgxuiLeCA8qfjzsiddYZzFU40iTH0u6FQJ3A95WKWJmwSvVmK1JhE+Zg2yWo91gQEw/629bGWlr0Leh4opaqR
X-Gm-Message-State: AOJu0Yz8JyLwNS6ppB2uL9wW2cK0O85A+8hT4n5g+AovG/fuTX+G3fc8
	AK1rfKk+Owv5IX/PSgI/IkPrqyTUkWBG5euIznevjB4sadszNNQAzmfZolj81oM=
X-Google-Smtp-Source: AGHT+IG8/n77ZcwDo0dpINsAseTYN5DCCn1UfCXRDczymjXSK0MA9f3AzxnPM1y3GqoYLRAp+ADrkw==
X-Received: by 2002:a05:6a00:4686:b0:6ee:1b6e:662a with SMTP id de6-20020a056a00468600b006ee1b6e662amr7890055pfb.32.1713200564540;
        Mon, 15 Apr 2024 10:02:44 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:44 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 12/20] RISC-V: ACPI: Implement function to add implicit dependencies
Date: Mon, 15 Apr 2024 22:31:05 +0530
Message-Id: <20240415170113.662318-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100245_849220_0566BF0D 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V interrupt controllers for wired interrupts are platform devices
and hence their driver will be probed late. Also, APLIC which is one
such interrupt controller can not be probed early since it needs MSI
services. This needs a probing order between the interrupt controller
driver and the device drivers.

_DEP is typically used to indicate such dependencies. However, the
dependency may be already available like GSI mapping. Hence, instead of
an explicit _DEP, architecture can find the implicit dependencies and
add to the dependency list.

For RISC-V, add the dependencies for below use cases.

1) For devices which has IRQ resource, find out the interrupt controller
using GSI number map and add the dependency.

2) For PCI host bridges:
	a) If _PRT indicate PCI link devices, add dependency on the link
	   device.
	b) If _PRT indicates GSI, find out the interrupt controller
	   using GSI number map and add the dependency.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 132 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index de0f1ba92068..f98645461bbe 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -21,6 +21,12 @@ struct riscv_ext_intc_list {
 	struct list_head list;
 };
 
+struct acpi_irq_dep_ctx {
+	int rc;
+	unsigned int index;
+	acpi_handle handle;
+};
+
 LIST_HEAD(ext_intc_list);
 
 static int irqchip_cmp_func(const void *in0, const void *in1)
@@ -189,3 +195,129 @@ int __init riscv_acpi_init_gsi_mapping(void)
 	acpi_get_devices("RSCV0001", riscv_acpi_create_gsi_map, NULL, NULL);
 	return 0;
 }
+
+static acpi_status riscv_acpi_irq_get_parent(struct acpi_resource *ares, void *context)
+{
+	struct acpi_irq_dep_ctx *ctx = context;
+	struct acpi_resource_irq *irq;
+	struct acpi_resource_extended_irq *eirq;
+
+	switch (ares->type) {
+	case ACPI_RESOURCE_TYPE_IRQ:
+		irq = &ares->data.irq;
+		if (ctx->index >= irq->interrupt_count) {
+			ctx->index -= irq->interrupt_count;
+			return AE_OK;
+		}
+		ctx->handle = riscv_acpi_get_gsi_handle(irq->interrupts[ctx->index]);
+		return AE_CTRL_TERMINATE;
+	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
+		eirq = &ares->data.extended_irq;
+		if (eirq->producer_consumer == ACPI_PRODUCER)
+			return AE_OK;
+
+		if (ctx->index >= eirq->interrupt_count) {
+			ctx->index -= eirq->interrupt_count;
+			return AE_OK;
+		}
+
+		/* Not supported */
+		if (eirq->resource_source.string_length)
+			return AE_OK;
+
+		ctx->handle = riscv_acpi_get_gsi_handle(eirq->interrupts[ctx->index]);
+		return AE_CTRL_TERMINATE;
+	}
+
+	return AE_OK;
+}
+
+static int riscv_acpi_irq_get_dep(acpi_handle handle, unsigned int index, acpi_handle *gsi_handle)
+{
+	struct acpi_irq_dep_ctx ctx;
+
+	ctx.rc = -EINVAL;
+	ctx.index = index;
+	acpi_walk_resources(handle, METHOD_NAME__CRS, riscv_acpi_irq_get_parent, &ctx);
+	*gsi_handle = ctx.handle;
+	if (*gsi_handle)
+		return 1;
+
+	return 0;
+}
+
+static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_pci_routing_table *entry;
+	struct acpi_handle_list dep_devices;
+	acpi_handle gsi_handle;
+	acpi_handle link_handle;
+	acpi_status status;
+	u32 count = 0;
+
+	status = acpi_get_irq_routing_table(handle, &buffer);
+	if (ACPI_FAILURE(status)) {
+		kfree(buffer.pointer);
+		return 0;
+	}
+
+	entry = buffer.pointer;
+	while (entry && (entry->length > 0)) {
+		if (entry->source[0]) {
+			acpi_get_handle(handle, entry->source, &link_handle);
+			dep_devices.count = 1;
+			dep_devices.handles = kcalloc(1, sizeof(*dep_devices.handles), GFP_KERNEL);
+			if (!dep_devices.handles)
+				continue;
+
+			dep_devices.handles[0] = link_handle;
+			count += acpi_scan_add_dep(handle, &dep_devices);
+		} else {
+			gsi_handle = riscv_acpi_get_gsi_handle(entry->source_index);
+			dep_devices.count = 1;
+			dep_devices.handles = kcalloc(1, sizeof(*dep_devices.handles), GFP_KERNEL);
+			if (!dep_devices.handles)
+				continue;
+
+			dep_devices.handles[0] = gsi_handle;
+			count += acpi_scan_add_dep(handle, &dep_devices);
+		}
+
+		entry = (struct acpi_pci_routing_table *)
+			((unsigned long)entry + entry->length);
+	}
+
+	kfree(buffer.pointer);
+	return count;
+}
+
+static u32 riscv_acpi_add_irq_dep(acpi_handle handle)
+{
+	struct acpi_handle_list dep_devices;
+	acpi_handle gsi_handle;
+	u32 count = 0;
+	int i;
+
+	for (i = 0;
+	     riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
+	     i++) {
+		dep_devices.count = 1;
+		dep_devices.handles = kcalloc(1, sizeof(*dep_devices.handles), GFP_KERNEL);
+		if (!dep_devices.handles)
+			continue;
+
+		dep_devices.handles[0] = gsi_handle;
+		count += acpi_scan_add_dep(handle, &dep_devices);
+	}
+
+	return count;
+}
+
+u32 arch_acpi_add_auto_dep(acpi_handle handle)
+{
+	if (acpi_has_method(handle, "_PRT"))
+		return riscv_acpi_add_prt_dep(handle);
+
+	return riscv_acpi_add_irq_dep(handle);
+}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
