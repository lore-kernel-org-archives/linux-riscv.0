Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159EC25B7E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYx/p9sbYg9EDfqMzM4KkKqK2a+pYwuqpWnn8Q7imh0=; b=TZH/cA5qJMcF8j
	2akXXGkQRvmdcXDOhA0N/9CAFS5OStcLH8DxYtgi2cFVQ3B4yvgszVKgmJraMHe/ex5jXf/EtzRAv
	jczVUNPj+Xtya2hctdjoXNwpK2bs1LiI9GvYDF+8oCIRPE25kAyvZ0nQMV2nF6QiO6ZR92HTAbChQ
	w8g7EPI1fGTVVQmmQFXhCB+3bNoOaOcNq8EsUR41+jQk1WHR/+foyXBnvLsoSax2/pBdgdJ6Uyikm
	ZQL0mmtgrtfw66JvTw+UHQaNOECe4F4hGEB+U/8buD2/MVmcmJs7Db3Y7i2lZd39kPrBo7ufotqAq
	a73D39glZL8UQ5Z9V/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQHg-0000000CoYW-32ip;
	Sat, 01 Jun 2024 15:04:40 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQHd-0000000CoVx-20GN
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:04:39 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5ba090b0336so914828eaf.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254276; x=1717859076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2w7EI3TeN2iCf/DRtg4G2EgwNqxdEr1hmfQbDfWRcM=;
        b=X1mJtZL2mwL99dIZ+q+tQbFLLM3omKTgoL6TJQvmAwMA5o5SQNAVdhi82OmJvT52zX
         YvB9LxmH1wRT2wsQjBLpbyANh70Xx9IFjzdaGANhdXTwO73wK7A+pw0v/57hcvpWyVdO
         rDG0cAazwY76iEkWspgKtC8XKZakVnehrDSP8+A1uXfOjZrsecRdU8ARpEluK8Pq7ljJ
         c5KpknzX8v9aGA6frP/pw+kRx6Xtr/tgiBwMRVZMP4OINv/B8DXSvWy5el+nDUFLIz4U
         nglsWjJcdANm+TFANjadH8M8a6ZPH0DqBk85NZdpoyhUm5pgJH+khFoiz6I4r7Bmdl/o
         DFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254276; x=1717859076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2w7EI3TeN2iCf/DRtg4G2EgwNqxdEr1hmfQbDfWRcM=;
        b=Os8y0454p9+Hs4qK6DkgaC6lO8ErIzEaxHZElFsFZWDWZiD0QgDUDJuaCVxh0HS/mJ
         n+OP1f22kmHcsL4Bsn6LimAZIdzFiNo/gHa0skN8y2dMMVb8KG0VdpftXaTSVlsoIa9b
         kwBE0iW81xPBAS12AD5QeD6iz3Qf87f8XCLytFNxndN5aiXpHH+nyUuyQBV/3ZzitcES
         Fl5+Kq5E/MDY75zwZcESA7njdmGIQrF80wCbL8ZBlyFclc05XFav242OA32uCIVlcst1
         D/nzKMgyNjrgDXpndYQha23G0SXu47rOJ2Uitm5IJleObG/x6G9Y50cIN1cwm4igMQAz
         QZYA==
X-Forwarded-Encrypted: i=1; AJvYcCUXOpoL0EvQMvQ5aB4D/qRkF+Q360rLIgk9SM7WzqhQIrihWo257CNHWcy+a7UBPDuUiC60v+UW8mSxSrulGXWdeIxxBJKrbDKDCpw2AM6n
X-Gm-Message-State: AOJu0YwZ+61+iGs0KHJYP2g/oqyPMpvGhma2oJagLG1N9Lcn1koKu9JM
	v9zVhssbbaxQNNzup9t/ci3tlAV7sHytG7FQ1Zn+Vtr5w0rZHqYj2F9YPYbFkfQ=
X-Google-Smtp-Source: AGHT+IGJwcsK8POtH2BMJmphYPRD+c46tpmn1qQdcpXrg0lGYUhORZGvMPcRjxjR7R/vaRNToWclfw==
X-Received: by 2002:a05:6358:7601:b0:19b:8988:4f48 with SMTP id e5c5f4694b2df-19b898851f3mr287174455d.21.1717254275702;
        Sat, 01 Jun 2024 08:04:35 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:04:35 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 02/17] ACPI: scan: Add a weak function to reorder the IRQCHIP probe
Date: Sat,  1 Jun 2024 20:33:56 +0530
Message-Id: <20240601150411.1929783-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080437_773328_85A602DE 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Unlike OF framework, the irqchip probe using IRQCHIP_ACPI_DECLARE has no
order defined. Depending on the Makefile is not a good idea. So,
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
index 503773707e01..b325b297bf77 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2744,6 +2744,8 @@ static int __init acpi_match_madt(union acpi_subtable_headers *header,
 	return 0;
 }
 
+void __weak arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr) { }
+
 int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 {
 	int count = 0;
@@ -2752,6 +2754,7 @@ int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 		return 0;
 
 	mutex_lock(&acpi_probe_mutex);
+	arch_sort_irqchip_probe(ap_head, nr);
 	for (ape = ap_head; nr; ape++, nr--) {
 		if (ACPI_COMPARE_NAMESEG(ACPI_SIG_MADT, ape->id)) {
 			acpi_probe_count = 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 28c3fb2bef0d..ab3f2880d209 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1332,6 +1332,8 @@ struct acpi_probe_entry {
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
