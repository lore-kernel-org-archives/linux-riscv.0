Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB182C46CCD
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+JyaWU8u2TiIn9i5Ur7WeNUlyP2vvFBfHN1NCfJHcE=; b=Z74mq3/qmeg1oy
	qkWdVtxOQS48WhVp34xZFXOwUTuPKTGeZlpkwAczMhupGoRJX4NFofoSX0+yA63pJxlBqsjl7EF3d
	1yre0yRDiv4z1RS5UiAddowirOz0mm7U9Me8SpEvuk1CHYK8hdS1Gm3IcvyWqFUUraGb9rEQLKLWd
	D9cgtZK0duBDCs04g48fRajrvHMDQPrTMy+1RsyMSzpVai9hA+pnWmnEr/M/eFIdqPr8S9jgJ0UYd
	2jRZtMi/dbkkBR4WjXfqTVPn+TRgoknmlqAYWYzDPfpzWJ6njwMna911mEhpAmnZUQKziILOMhOIv
	QSry0REj62HbOdFSbOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAr-00F13h-2G;
	Tue, 19 Dec 2023 17:46:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAb-00F0ng-1M
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6d77c6437f0so1646039b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007974; x=1703612774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXn1vXDcIcY9aE9ZluWKdogaSHoQIJLjYHgL6fRVi5k=;
        b=cJh7sgLpf3nNW6rBKB+KKcwVgHw/6QsThkRdQc9sBZUcrDl8a239Chm75ZQRKgSBk4
         uzvM/e9D+xG5g3rRht65jTLK5a+usqZU9FLC6g334iqloQKCdC9+hQNggWHvgVaq5udV
         v29rygC9HdO5r8b46rhwCsNei8tNmztIxfuiSJscMx/1OMVXCFC1YpY0C+gyZy4i9JQB
         2f+LxBPG4d6EXIHVSt3oQeSO+LdVXeOXtRGgDh2OzuLTW7t/z1JdfyciWlN5a2fOli06
         JEeEeb4Xld8G5VhIwgRuHXxNQiO0tLdOLicGnmCHFalVRvz4OHLD1rPZkSuO63txOStx
         w1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007974; x=1703612774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXn1vXDcIcY9aE9ZluWKdogaSHoQIJLjYHgL6fRVi5k=;
        b=gMhYmntKdYRiSWCUCZ23GcmnBZoi7YU+rU98pjoSpWWwd0AI5BFq+k0UHBc61mZmdT
         JE3UWqnqFZcpYS2NJXDqioOH8LfuWLexStFDaotOJ8Z2HdyeRw0FVbK8TZQLekoOYb08
         aViUPDRpCxwza6quoaqxIR3eWXtMxJeYM2ok0HqnFarSb0QAt6kRDmqtHBNbyipTYDiA
         lJJdWhujMDslQB80j4mWQeT2JKmg2JmQaVdJyc0Jml5Yl3BJVdTM8CJC7lnOvlEGCJSQ
         cKm3rsN5FdDVyFVWXfisR8C6x9A6Aj6BVY3muqIJp0SGTpBx0ZPE69adOH6tA1LE1XKQ
         vGxg==
X-Gm-Message-State: AOJu0YwA0jNQjol3GhDF4ekebujwLsMf5eQ4MtunH5Nlik/xBdeZwozi
	IViM1HX08Lx3X2/2kKZT+WO8WQ==
X-Google-Smtp-Source: AGHT+IEyMcGZ8gZDustI/NrEk9p7KXDerpeWb1pADnYIYBEjwIh1UqME5pxQY3avzxvrA+zMIvUqTw==
X-Received: by 2002:a17:902:ab84:b0:1d0:6ffe:1e6d with SMTP id f4-20020a170902ab8400b001d06ffe1e6dmr8678824plr.80.1703007974481;
        Tue, 19 Dec 2023 09:46:14 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:14 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 07/17] ACPI: scan.c: Add weak arch specific function to reorder the IRQCHIP probe
Date: Tue, 19 Dec 2023 23:15:16 +0530
Message-Id: <20231219174526.2235150-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094617_482319_DF288293 
X-CRM114-Status: GOOD (  13.15  )
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
index 691d4b7686ee..87f4baebd497 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2685,6 +2685,8 @@ static int __init acpi_match_madt(union acpi_subtable_headers *header,
 	return 0;
 }
 
+void __weak arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr) { }
+
 int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 {
 	int count = 0;
@@ -2693,6 +2695,7 @@ int __init __acpi_probe_device_table(struct acpi_probe_entry *ap_head, int nr)
 		return 0;
 
 	mutex_lock(&acpi_probe_mutex);
+	arch_sort_irqchip_probe(ap_head, nr);
 	for (ape = ap_head; nr; ape++, nr--) {
 		if (ACPI_COMPARE_NAMESEG(ACPI_SIG_MADT, ape->id)) {
 			acpi_probe_count = 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index e9a9659314f2..ae045e14126b 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1338,6 +1338,8 @@ struct acpi_probe_entry {
 	kernel_ulong_t driver_data;
 };
 
+void arch_sort_irqchip_probe(struct acpi_probe_entry *ap_head, int nr);
+
 #define ACPI_DECLARE_PROBE_ENTRY(table, name, table_id, subtable,	\
 				 valid, data, fn)			\
 	static const struct acpi_probe_entry __acpi_probe_##name	\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
