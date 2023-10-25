Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22691C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbxSXnajHtHREEfVKYUGIvXyVPyMQEDL6eykiYUdHuc=; b=BeOqk/YDprYoYo
	E/EhbHhmLni/coaN05b/Tzkj8gUyo04XAkWbVfm6Y+8mXF937jxUAH/iCyHtCs2IPc+KGgkUEvU5R
	yvrcOot35W2sBfkwZrv5UmLnbhZXB2K3cZdxB1ayrjBBV2PIiuxSYECq2Ds0jSPskPXywF9nQTqT+
	dbnO+hpo0KcmqgNMgOEoagGQ5SLoC69BYoqMD5pbtKTCP2qc3YAw+VaFNBEO65ulA8/UU3D/fEThZ
	HH51f++i5Z6WxagaA+SB2abQZSPUZWe8SxWjcawCgjrtf8CGz4da8HODzx6LkQUeFKiXjRDp1yCv7
	jbeZRKdq3nIUuPHuMkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRT-00D3HP-1e;
	Wed, 25 Oct 2023 20:25:27 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkR5-00D2wo-0v
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:04 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so177259a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265501; x=1698870301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTitWHvbkwllUIYzM7TBpB/hreitIS32ztyb9Cf5EZw=;
        b=QXiH+HBdXGIuTZzwTcDHVhJpgCSYl/WFMXosmOQEJZQHw8REUx/xYML70KmfYE0rXS
         wuzsZGPmXe7RHDnNY//HWCvHdBaTendtiNvMJl1lt6KDQ34QE/X8VAdvDBGFsScdwq43
         nm0oEBY+b+1pudlS746gkBZagMGpfdaI5U38d6d/FuLBwM1xS6hoDp6UQRNIM5rDl/sb
         +LqnJtclZR4P/hs/ZFAWzHn2WdxvYJMdWUpdV+eHIQZsKoaMlTSAO/70ssFiL3euqBrS
         VzUYQLsfIFhjKaVlyjjGdbPxjHFIiWvSdKzeCP9P47aNCi04JLm2BPGv25MOVopV8oRI
         Jy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265501; x=1698870301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTitWHvbkwllUIYzM7TBpB/hreitIS32ztyb9Cf5EZw=;
        b=BnTBIGR6qxU6wc/JnlUxg39ixQx/6DNlT7d6Gs/pImoeTl/EKZi1oJcYrJ9AqY4wgP
         KQ6ot9xacU0MtAUZ+COyttHUhg7E9Qt45zVs14G3FqGmSYgzezgsSCFPfWh0afjx18Ho
         0wdjLJxUUhyU8AUJEDCkw25NKoDtZTgjb/M3Urk+nl/t3316wG8qu2XXeQojtmJqp3ha
         z4wWKftDSZMIjIFmlLFssFVVQA3R0mo4snqZHb795vJqO5mUKvoi7t1RUpjDy2GzCuad
         DWb803vp6s25b4WbqIABYBmP0xPzaDGjEHYGvG+FNk8aaD2sMCAp4DIbW1syWbAeEU/u
         E7+g==
X-Gm-Message-State: AOJu0YyCf7QKbekOcGUiCyxI29GttjDZswkqHMedEnberbs9CWhrqIW5
	eg7Ia35r/xqj2jjziaN8+hBy7Q==
X-Google-Smtp-Source: AGHT+IFxa1VnMrjTGhwV07IKwl5LjRCiwN2wledHcfI6/uXGW7IWW0Iy/XFASuJINb+BuyvT7MzlLA==
X-Received: by 2002:a05:6a20:244d:b0:17a:d560:5d13 with SMTP id t13-20020a056a20244d00b0017ad5605d13mr7578124pzc.22.1698265501053;
        Wed, 25 Oct 2023 13:25:01 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:00 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 09/21] ACPI: scan.c: Add weak arch specific function to reorder the IRQCHIP probe
Date: Thu, 26 Oct 2023 01:53:32 +0530
Message-Id: <20231025202344.581132-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132503_336230_48E90F89 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index afd94c9b8b8a..4ad256a0039c 100644
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
