Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2240C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjTpr+7zHKOo6Y3p8agFRCNoG/prNKVv89Wi0vTc1q4=; b=nsLHIFNGvkTOmn
	jyAeoU3jej4+8V3jHaBx4Qv0zdYIwoJIG/bdwZBf5Yi75Ka35cqlLbVizdjvsfZHHzi1JOf02pO2V
	tBYUus5yE1UDK+4rFOb0ReO8Y4gUmQTbvVey7bLiDtJVgJxWX91HCsbrtfShYqk9jPlCGcU7DBpz1
	xVuR3gltKRESUG5xf8eA2sE2uwlGk8OhWv2HUVw2hLdrghqfy1iQApjn2F4IwZ2wZpWLhXK6qJmWq
	8k8qFvjXpS7WefGlzQdMEaegNtBRaB6wrP7R8C8y0t9kvsNIy3TyKEXE/DE4qs+w1Ygi2bk5JSsjx
	cESVciLGfUC3VY73bITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPj8-00000009Bz5-3R5S;
	Mon, 15 Apr 2024 17:02:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiI-00000009BVw-3gr9
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so3648733b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200510; x=1713805310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV0OeA3LqOjcEQwVzmEUb3l+O0qMWG2Q7MAVkkjj25w=;
        b=X8Br2pRkM/7jqPlK5wz6N9SDWMNdd8oWsepSZbNWp4FWFlRNs/a4OW1Np/na3hzZo5
         m0md+724GDlPTtnH1pDDL+wX9iVLymjriz5qzTs108gaVHtxtQS0L0ccXaBS7H4Z+2sV
         GVzStudlaxDUnC71IuICiwwIp8O7LFcDcm/PhoyGxxn+1l/cnQ188744lX+cFQTdb6qh
         OEv9MgIV2zg7u6uZJAiPTOq3YYsd84FxW2AiSJp6St0oK9uPW/6uw+gh/YF9eMh45SSK
         euYSom/EHajNo7Ss9aOrJ6yBePRQbgEOrEYw5HwxrxGFhmT1K8k1SkTTTA+b26nvFL/i
         8+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200510; x=1713805310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NV0OeA3LqOjcEQwVzmEUb3l+O0qMWG2Q7MAVkkjj25w=;
        b=qUsUQPE4fGSozM+w0LZjQxIc6iF5QrXZ2bLKVuS34PPeogWVGu91y6k7NIyXN/99cJ
         yiMM4NsXoifvYjQz/bSx7HVa8Bq6BANRWynqgpMkhIpk4Z0t3ff4w9vYHmgo3dAs6CoP
         AKIMuJFL4JL8muTJIhhHj0rZdusGdIuiAGjwoAWVyFg2yQPBg1VGz/MPU/wJ2baTZtOX
         B2wt1lhS9UJhpITzf1dhMXK3FkrLLPANb8y62hsvIojKDrHFgifozdb8zfOYXv8YRdHK
         1p+3pBBbIVkl6m3sxKdLxodWXEIFVCiz3ayfi4pUnlUcxfR+7OzaPiAikxsmsH1zlECT
         a8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWFgIFdbCFYK6NAkL9iOsic4HJ/N33znU9RX07yUsI8AgvhGUY/TRmkh0HSTNpZF8LyWIDjcaLJ8R6ABF2WZaJN8jx1+xbzXpQdyX0bldNE
X-Gm-Message-State: AOJu0Yx2/vkbng/XljfcslcPxp2kTojY6qeesuedLN/i6epMTpw7Va/t
	UB+EYCa8KLChPH3r21Xunh7rqExlhQmSacHlajiQaeACnCtqHdHmHSSJxVkVZiU=
X-Google-Smtp-Source: AGHT+IGvmjYeaJvV6Cs9b+D8sHsU8MJVs6hR0ePtYiL5D9g9wvurdSLwMSWttPbHZlSkX+z1czGUNQ==
X-Received: by 2002:a05:6a00:21d0:b0:6ed:de6f:d738 with SMTP id t16-20020a056a0021d000b006edde6fd738mr13801645pfj.9.1713200510295;
        Mon, 15 Apr 2024 10:01:50 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:01:49 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 04/20] ACPI: scan.c: Add weak arch specific function to reorder the IRQCHIP probe
Date: Mon, 15 Apr 2024 22:30:57 +0530
Message-Id: <20240415170113.662318-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100150_972904_188964F0 
X-CRM114-Status: GOOD (  13.44  )
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

Unlike OF framework, the irqchip probe using IRQCHIP_ACPI_DECLARE has no
order defined. Depending on the driver Makefile is not a good idea. So,
usually it is worked around by mandating only root interrupt controller
probed using IRQCHIP_ACPI_DECLARE and other interrupt controllers are
probed via cascade mechanism.

However, this is also not a clean solution because if there are multiple
root controllers (ex: RINTC in RISC-V which is per CPU) which need to be
probed first, then the cascade will happen for every root controller.
So, introduce a architecture specific weak function to order the probing
of the interrupt controllers which can be implemented by different
architectures as per their interrupt controller hierarchy.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c  | 3 +++
 include/linux/acpi.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 68f101323f53..de30a0af7a2f 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2749,6 +2749,8 @@ static int __init acpi_match_madt(union acpi_subtable_headers *header,
 	return 0;
 }
 
+void __weak arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr) { }
+
 int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 {
 	int count = 0;
@@ -2757,6 +2759,7 @@ int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 		return 0;
 
 	mutex_lock(&acpi_probe_mutex);
+	arch_sort_irqchip_probe(ap_head, nr);
 	for (ape = ap_head; nr; ape++, nr--) {
 		if (ACPI_COMPARE_NAMESEG(ACPI_SIG_MADT, ape->id)) {
 			acpi_probe_count = 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 168201e4c782..914ecd22ba64 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1337,6 +1337,8 @@ struct acpi_probe_entry {
 	kernel_ulong_t driver_data;
 };
 
+void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr);
+
 #define ACPI_DECLARE_PROBE_ENTRY(table, name, table_id, subtable,	\
 				 valid, data, fn)			\
 	static const struct acpi_probe_entry __acpi_probe_##name	\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
