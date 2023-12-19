Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C694FC46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrAp8Gf8JAdE6eboyFaT1nfo4eyjj1xO+zRY4/0QZwk=; b=2mptMrceMLSp7a
	StSJWRkkMYQcAALyjuNsSvN1XwG0Jl8Ngju1Zu6J37Qk/6K028J8Jf3CZAMiO4tLc0+SrxncGZ/QG
	dL6g6v4f2+xRZeuNXE2wmjKKKich6k0H2YR4v1wEEWP2Fntivxs3EY0ZZuih/grlJhiQQpz8RZCcP
	1/eStcCim29EzPiWhIyT3PJOL9UGJVH+BBHRzp1FYvdwzqnI89sk6r+6jS0XPO74dLwt4VsfTuyiF
	mZ903MM51BZcx+W6dJYAMj+oO/AdpV7tU3mckT27uDWkIeZxKSgbsMktEfgRbK6o7Cs0XpFSR3Tve
	k15sEqAs3/UDfenCW1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeCa-00F2bc-0J;
	Tue, 19 Dec 2023 17:48:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeBT-00F1fA-1j
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:47:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d3aa0321b5so25339725ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703008031; x=1703612831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiwIpb7xuTq5TPRrwpmxnXk+wGzqHEHNo03fDZVsc7I=;
        b=Jrk8rZnsncI6n9qbUvCpgsCExNWnTLYD7ozdFJtQPk+zCWi4ftBED5nNnJypY4Wkts
         0Icu4giPHuIL2sde3A3SftNJ+vBfT3bVtM+bnHv0+gdFEvejbkebZOhKaKuHYQxTgr2P
         M5XXJ/3Eh/emwZCiufKuJTmoU9FeYzW1xV9W0UeQGh5tXsebV+fvGcG7O/j+0qGymAYm
         jyqQYBuhkEyHE+26o35j3Gly2RreSAOwT0yZEi1dJ4N002vj1YLM/Di4rCJUCoH9Qrf8
         NLdwUB36mUaRBuRF8fbgycwoEI9EYnUle/CgDNlg/rg6kM+Urgy7yUh65BhgHVLX+h7n
         j+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008031; x=1703612831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiwIpb7xuTq5TPRrwpmxnXk+wGzqHEHNo03fDZVsc7I=;
        b=dP2OuUx2aykbzKZ9O7Ew6qRF9FpXP8dSDq5OUO8S2gxjCEt7bP2e+coIhehB3X3Kkd
         Zi4lAXiiMNkVUIuJ/Ua3qFosO0RYINc2vQ8pqS96Cpya5r0tAfyALgukIfkVdJqL/6bd
         rPoUr/kc9zmoO7MBCkRTy5Rlu71Dn+S+kN+a1+nMTVoMx/8zw2nEezCEr/1PmfGaaygv
         xzrB001VQeWXeoTa8u+pgCbzswMhsid0uxHW68rAx6Zs1pXzz1OsE/vKrHd55pnp039y
         5jdaZYrAIjxYDq2H5gyntmYunHCwVWMmw/RU/4r0gEL8WhacIiM4YIhKw3wey2sXQXZt
         U9sA==
X-Gm-Message-State: AOJu0YyCAW/FZxNagE6BNh9rpAg/5cs4gTX6Di96tgNAdr7ydGYDFSLA
	SaZiUAxcw6BeayXmGU4HFKXcew==
X-Google-Smtp-Source: AGHT+IEpUAW94l/bQ8GlpoYTs7IixfBFrUs4h8FHwGSRGLIfpQTk5UlG5GMDzC6dri1oqSEP3DUUjQ==
X-Received: by 2002:a17:902:ec85:b0:1d3:ab39:abe2 with SMTP id x5-20020a170902ec8500b001d3ab39abe2mr5002223plg.14.1703008030730;
        Tue, 19 Dec 2023 09:47:10 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:47:10 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 17/17] irqchip: riscv-intc: Set ACPI irqmodel
Date: Tue, 19 Dec 2023 23:15:26 +0530
Message-Id: <20231219174526.2235150-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094711_634859_AF492641 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

INTC being the root interrupt controller, set the ACPI irqmodel with
callback function to get the GSI domain id.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h     | 13 +------------
 drivers/irqchip/irq-riscv-intc.c |  1 +
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b14f3ebe242..9c2bdf4bd880 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -22,18 +22,7 @@
 #define APLIC_PLIC_ID(x) ((x) >> 24)
 #define IDC_CONTEXT_ID(x) ((x) & 0x0000ffff)
 
-#ifdef CONFIG_RISCV_APLIC
-struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi);
-#else
-static inline struct fwnode_handle *aplic_get_gsi_domain_id(u32 gsi) { return NULL; }
-#endif
-
-#ifdef CONFIG_SIFIVE_PLIC
-struct fwnode_handle *plic_get_gsi_domain_id(u32 gsi);
-#else
-static inline struct fwnode_handle *plic_get_gsi_domain_id(u32 gsi) { return NULL; }
-#endif
-
+struct fwnode_handle *ext_entc_get_gsi_domain_id(u32 gsi);
 int __init acpi_get_intc_index_hartid(u32 index, unsigned long *hartid);
 int acpi_get_ext_intc_parent_hartid(u8 id, u32 idx, unsigned long *hartid);
 void acpi_get_plic_nr_contexts(u8 id, int *nr_contexts);
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 24bbc5bfc30f..bddfe47df27b 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -311,6 +311,7 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
 		return rc;
 	}
 
+	acpi_set_irq_model(ACPI_IRQ_MODEL_RINTC, ext_entc_get_gsi_domain_id);
 	return 0;
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
