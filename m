Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998BDC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NXZivih5/7HaHv5SSWtlD1KAYnjGOFFBws1X9l/nVQ=; b=YqohhW4NyBPuwZ
	VtpPXpwb/9O7jj6ADWEQckgcW8cFy4MNlgLu1nuAwiZfO4z5mpAgCEcrECRDB6pUNM9sGHnwydrj7
	48PoYV7y69JpMCbBXg3+zzhDelhPTCFHek0Lc1Mq2LmESGGCWtvw+Z3zO7yXpgqqZdB6qcts+PUF8
	AhidptJe/1z4YmGQ/QU8GuI4X3pcPEfILpI8+3+yarXKGFS10T/IakQIZpEY+PY1TmTDjiJGeBe86
	QNmGcZA3gGTI1K02130/6Scrjh3jTkYoH1nfzeJOIKxm34C1/7mPoFT8oVnC9hxRkp3pG66grenao
	9LsXhi/2eCybyGFbSClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2AHU-00000009iWi-0SnE;
	Wed, 01 May 2024 13:45:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28vK-00000009MrH-3hpP
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:19:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso651045ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565938; x=1715170738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOIqEzOMfBRaM7n+Lh1Tvfg7gL7m541laQZW313gOHY=;
        b=n08oqRkdgPWF0uNG0SW6DPRcKhwcE4VcrryhGUOXXqKeT+qUVCI2V9Zd0h7y15Vb8Z
         dribaCIUjFjybtN1+d8lQ+j91n1ArUpUE7P55xqvVmxd/OwdS3D8k5oOeR3wHFg9jGzy
         edzZjQ3UpZDtJmIx5CsdK/EGJltkHaBMXBTQqZx7KJ8Ko0ysskoACFzsuXdhcYPdUzNs
         +TRMlnVI3NyHReC/+hI2RxfxayrFTUaKgl3h0lsv6IigfiVXgLujmWVwt6Kyfym9q5QV
         QL+UKZV/75EH0HO49ghez8qbIiTlgUphJgGYWgcm5eALIHXe01BCjzuKIa8C0CAQIAfw
         4TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565938; x=1715170738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOIqEzOMfBRaM7n+Lh1Tvfg7gL7m541laQZW313gOHY=;
        b=dWNyD4GSrO6jLhQKw/RxJy5iZplLCeHMsJDrJQmiC+IFa7IMp8P3mB5s/UVlc0X0Fp
         BHsSnwBpJOAOx1OzDeAJWkTa7cPwWYrx7ktSk8Gap4Ak6ykXxHd65UYd6K+JUOBgxrbM
         wymxaXOovG/oefQvJmSI9aPzhEAMuD98O1kDHqzyveM7Yy+w+Kcgo1+/kINQXN0OGutx
         nEfi5vBIr/9AwsWf3V9VVpc50tO6P9atemWUtWwVI2YKAh85pypEbEChGF2eFUt62N45
         d85JqGDuP0qdEFcsp3u64ZQAiPCi3EjQkZOuAyQ2uCi32g85M29m13PEeNotKS98rVzi
         35jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVufIhQA7UvpRQoKiZNCAu7mY4Pgq2+aE/htV1SJ1eBblD9oHHVXkyhHq/FxsVaaLCaQ0XKUnEaXCLmFeW7WEPAsQ+an6G4KrvXjtfq+jHy
X-Gm-Message-State: AOJu0YzlPa+vj05ExLH6FxcNGCF6P8M5P/ZV5LoDshIvDbGe/o3ThoiP
	C4XCD4KX4MwYFPTryjBZcjmLrLHRMZnvqDCx42b16geO2OCDEPNu3A2oIf/q3/E=
X-Google-Smtp-Source: AGHT+IGEfdWve8EtzQpflTL0dKP3MQxp+brvZfzYZ/NVGRzicQEMono2Ofsx4PyPFbkYzH1s9yqSdg==
X-Received: by 2002:a17:903:496:b0:1e1:a54:1fe8 with SMTP id jj22-20020a170903049600b001e10a541fe8mr1877916plb.53.1714565938389;
        Wed, 01 May 2024 05:18:58 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:18:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 07/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Wed,  1 May 2024 17:47:32 +0530
Message-Id: <20240501121742.1215792-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051858_943095_CAFF6D71 
X-CRM114-Status: GOOD (  10.77  )
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

Add the IRQ model for RISC-V INTC so that acpi_set_irq_model can use this
for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 17ee483c3bf4..6739db258a95 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1190,6 +1190,9 @@ static int __init acpi_bus_init_irq(void)
 	case ACPI_IRQ_MODEL_LPIC:
 		message = "LPIC";
 		break;
+	case ACPI_IRQ_MODEL_RINTC:
+		message = "RINTC";
+		break;
 	default:
 		pr_info("Unknown interrupt routing model\n");
 		return -ENODEV;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 846a4001b5e0..c1a01fd02873 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -107,6 +107,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
+	ACPI_IRQ_MODEL_RINTC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
