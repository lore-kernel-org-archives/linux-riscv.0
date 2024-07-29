Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AAAC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY7LyOLW+S99EgIV764DXtWByZSYjwLOlGDemtluiLg=; b=GRsP4tqvmRASdg
	F1HVdYA47kLpDXHmwKyY97wxDSffxzTticjD7Fmy4osF8CURxmBpsLWqf0HjboUOpx9DndjLwJ90R
	f3//FfGyxmNSkkCoTZDq7vzZllZMNgFpIXmqxjDjuDaPwIQJKU6gERuna33VEUuDOoRcvljkjYL0B
	tBVnGz2kwy8cBtVgTug+euXaOnZNp3KwB0qKSJ1QkKrg6QkiaseI9+y+m1VTZ5oNDu0ufmIwHEIub
	5SynR34sqcDrSjo20LPuU9gyHlgK/qnSXvjpQUmkj6Sgugz1fJ4aImrSezq98kkLF5BfzHrlruosi
	BcwH5YGoUPStWrAcPV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRWr-0000000BfdI-0y66;
	Mon, 29 Jul 2024 14:39:13 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHH-0000000BYWC-2UgC
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fd65aaac27so19278945ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722262986; x=1722867786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1v7P8DgVWEOiQraKJZCp7Th7levU77nqOCGgGfYFy3k=;
        b=PkoDwsu0vP8cpQRm4FgQpLnjY5tj1+0BEIEn0RfnY6T/Lv+o5MeygjY0/0+Nzzu+h4
         bsZmsoca49OgM3MoRiJrmfA7KpG67FwzcBfsm36IfwSNWh1c3NcSMfjWE3ffCgt3xrAY
         LqrbMGQ7zwq3yscoefTf9+uOcnmPq1DxYvwkOTn9EMUkMpgpaKLntppb94d+5bc7c3wc
         gTeycSYBOUJAuZIqcCccesObqHgt9tF2GajYeoQg4R97UD4A48sc2tBIYpgs6dLCll9B
         BxKHAhKCOX6EXn+ZAFui7B6hQgo6FDi3ihtNpFpOCbwvIFCd5KowYqNmW8qWlb3IJirM
         2tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262986; x=1722867786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v7P8DgVWEOiQraKJZCp7Th7levU77nqOCGgGfYFy3k=;
        b=iVASTejcwg8RUjG1bW0z5s37/cGw+GvkLK2ag8SVS+j7+q8z1OKJBmKNfDIA1p2/Fa
         w2jP/jdld2pQzQKOgsbHRSk+WzT1JVMe0htnwnfP6N1wjOtj8yrwsYXsYIkEYxOdtP0q
         H2vAWCDIHaX6FhxOuDPJQxFxDrOiUMFJHB1I+IBaFoiAZ7fNv4a5AOefcm3PtB0vy7Dy
         5Efdupxuzw8gSMdn3sZ71e7sm3T1i8x5OQiAkhyN+gOnrOVr9ImZGhyZpxYyckeDRiKw
         WdMOxRd0jsZa3ZqLzHZ2HEFn3IZKwqBuLaGp3qMLsXe9rKncMnXhw9PT5xYWGGqGZwkK
         oDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFa6UbRGEDYsO4txdbjRJhJGy0cqZ9qNFx7VLJHmc3V8KJTE6xp5+Hu58OTk5GQxfdOhMWT3O+uQCha6EqYMN7FkXXEU+CayoptkyonZnn
X-Gm-Message-State: AOJu0YxqckREJP1k0srE7rkolrK7yvja5Kmdv9l7RampKIzBXAXKmmzy
	ArzbN94vSETaa+ZZmdyybqQ0BMUZBbLCMqSnEg9JIsRTQYMhflumdG2pHisdSxc=
X-Google-Smtp-Source: AGHT+IH0i4SJoksic7K7uCsgqP3M+9IpULgJ5o8eJTMb+FKn2Lo8UBe751+qjL2E7UCdZzZIpyOlyw==
X-Received: by 2002:a17:902:d4c8:b0:1fd:6f24:efad with SMTP id d9443c01a7336-1ff04b01aebmr124703345ad.26.1722262986279;
        Mon, 29 Jul 2024 07:23:06 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 02/17] ACPI: scan: Add a weak function to reorder the IRQCHIP probe
Date: Mon, 29 Jul 2024 19:52:24 +0530
Message-ID: <20240729142241.733357-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072307_659942_851FD566 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index 59771412686b..52a9dfc8e18c 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2755,6 +2755,8 @@ static int __init acpi_match_madt(union acpi_subtable_headers *header,
 	return 0;
 }
 
+void __weak arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr) { }
+
 int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 {
 	int count = 0;
@@ -2763,6 +2765,7 @@ int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 		return 0;
 
 	mutex_lock(&acpi_probe_mutex);
+	arch_sort_irqchip_probe(ap_head, nr);
 	for (ape = ap_head; nr; ape++, nr--) {
 		if (ACPI_COMPARE_NAMESEG(ACPI_SIG_MADT, ape->id)) {
 			acpi_probe_count = 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 0687a442fec7..3fff86f95c2f 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1343,6 +1343,8 @@ struct acpi_probe_entry {
 	kernel_ulong_t driver_data;
 };
 
+void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr);
+
 #define ACPI_DECLARE_PROBE_ENTRY(table, name, table_id, subtable,	\
 				 valid, data, fn)			\
 	static const struct acpi_probe_entry __acpi_probe_##name	\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
