Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEBAC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBlHHNxIG9BTbuG47kGOc9x+5hj9u+ZkueAMfBbTfUk=; b=srZ9HCMRAL9J6C
	RZ7j4L5n4afROrCo5y1KXmVg54OrWSxNqIC1F+9QsqvBH6mJUubaqShUuWMW+djutQG5EqRf/7dFF
	1rdZJaQLGaeNwnhKLxUlkXhvC1JaIHLk5FfsR9d1AsQRzBNRCib6ZzPk5gRVjrWzO0SZVkeXnAIJH
	idMeBvWHXrV3zcU0nMCgKCRcURg1tZpT9Dz6vzJ2eews7ky9GKGSLmjZ8AL08N9cWNQVBnhF/Obr9
	B5L50vwLGnLQ9SYh+AL37b9j6ZVaVdJTJjtgL3KlF7NATuyZU0iTKXMUNaiAoXkQWWffsC93jVw6B
	f7teujVCVeXyRSEaB0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29DE-00000009UaL-2YH0;
	Wed, 01 May 2024 12:37:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28ui-00000009MUE-3PaB
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:18:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ec5387aed9so13688085ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565900; x=1715170700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U21IbVpVYWuDXnfpPitFjz/aLJhntW1ExhoP7hEzCc=;
        b=pR9bxwsq9Zmon7c2d1rrCGADzjiNkbJ7NJEM4wWVC9pUscHpgokcSF5Eo6U58AdMAl
         GR90Qno8S/poFKemvPhsF8eIAyGjPviYj4hQzIdvgSxls5QzNHaD2+gWPNUsOwMJyc4k
         FWl0eNavbENwn9MnyslODVdB9aZye1zUMBIZZyAMSz0PI7wY49N4N7RExWG2l9I0tj1T
         QILS54coW7EGcU6+WTlZ+7EuFQRrlwiFt6fmqC4ptuPl3aHnTpDeb6hOomsLG7nF8gGI
         LV3HzQMy/eNnc40HzcLqTFt6UzOyU3s+tvSB3fkW6zgfHecgG37CHe+WwZNaSzDyfjZP
         J81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565900; x=1715170700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2U21IbVpVYWuDXnfpPitFjz/aLJhntW1ExhoP7hEzCc=;
        b=YOacFZlhpWAnimk0DOfou3a1xtebE0pU1DPfksYSUChiryp5J3tZJL4bVQVj3sPsg7
         4Mu5sMGf5u+4GmJ1uXg1GG/0jHXnVZc8+Fyl3kla5ASpCtTU5JAY2r1wOC7mUeqhcYDU
         ArmTQqqJo+M4R+KAQl23cRIPkT0WCd1MhK2bW+jSfKtRy81aJbTVnXRWdZ9HZFbZ1sGb
         FlO5olQWJj/Brq58JjCiJIgaOZeTsbaKkeCqi2Ak8Nc8o5p8TmPXEYrSJXGl+QJAmxwU
         tQfKbPrzPr6jDmuAFrhmzGjzwfnip3DBZ3E3f3q8/MlGMvi3aGZs53QbIuRwO74UWdH6
         8yjg==
X-Forwarded-Encrypted: i=1; AJvYcCV5GT11UpUdz5QCJFg3vXKFfTLwPlZSHVOsBTNYzQLyPvUluJ+Gg/TqVQ9+6sCnEfA4IHQQA0U942dYJGqk5OHgAUc4CdTUrnHwi+ODha9j
X-Gm-Message-State: AOJu0YxZNO37Bz+MOqt4oIzuSC92p/k6m+vFd/KsNRuSAKq4n4NXIlOW
	sWr8kktgsYcOn9cBG2vYcEOLZWeR4QCkZPrx3PSb3K+2D0GBv4G9r2l4bar2y80=
X-Google-Smtp-Source: AGHT+IEhKN1Gue1zmrkCOUBSqcJjzhxCt/OVWXcOEWxant109xhmvof+8Br6KhAL2UNxeD7n9gvBjw==
X-Received: by 2002:a17:903:11ce:b0:1e4:9c2f:d343 with SMTP id q14-20020a17090311ce00b001e49c2fd343mr2700552plh.7.1714565899631;
        Wed, 01 May 2024 05:18:19 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:18:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 02/17] ACPI: scan: Add a weak function to reorder the IRQCHIP probe
Date: Wed,  1 May 2024 17:47:27 +0530
Message-Id: <20240501121742.1215792-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051820_888477_F15F648F 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
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
index 4804a2ad1578..837b8fc89dfb 100644
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
index c2ae33b8dbb6..1afa289f1f4e 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1339,6 +1339,8 @@ struct acpi_probe_entry {
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
