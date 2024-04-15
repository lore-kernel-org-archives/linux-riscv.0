Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798A2C04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GDz8PL7+eTA3H+USu8RaHPVbfuolw8k6JGQdGBjg0g=; b=i2QfCXdlzgRt2t
	Hu9yaL8UtZuysXqJTnqfnUVxOUyXIctokVxNrFPrBHmM2ePrK3361tnbbXnBM7SIBuV+KKCBtc9jF
	NSKpqEH8fA87qA7dpOKMwhMbRMqnkab5ttAcFBf8jbCnm2z+yHjbdiW/ms8F5Ih0eMhAbGLDTb+CL
	G+5vPK/64flutWhp4oe5ANKT2hWWf9+XY4OhUro1464YsrTUjAH1T1Z5ZRqMispBT7TgD4kuK1/Kb
	mMM2JXa2IOgNc71XvZSL+d7ocsof5id7MBhPNAnJ8Pb51HSZEwPzBKkS0Jn2Yn8RNF8MQLRF60hr4
	ma33Upz8OZ2cIeDH8m9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPlz-00000009EHR-07Pv;
	Mon, 15 Apr 2024 17:05:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjv-00000009Caf-11B7
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Apr 2024 17:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tgBDpDYGQ0glprRFD8yP0RdoCRZMFoPF1RZGUEi3Dy4=; b=S7bVLR5YE2xLi6/xPJkQrDbgl1
	L3VebR9MwwYto1nMkRRJOk9VTd1kEBgfHSzsKGcqdBi2YfHeqG5t6KUejsuEm7RhSvdxtc5yBF/pS
	7xmXybjVXsDxVvnDJ4YtDD8QgRbZdiOxmJBPv7ltICCQwTgTBZv8XGpybI9XngR/kTKGBDGFFM4O9
	tcjMKIahPh/B05uAptbfGTpm0HD2PO6WeuS6BC7f/WW+J2dAfiXmW6TIaBunwXkY4fPJMSmmTgLMx
	ki/uzHXXR0o92LEAeLUT+VoKofMHNhl4hNi0cPvluc91Xl1O24qB1JkHKUTAvNQnU5Wtiwt/Ngz5Q
	mLkPhW6g==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjp-0000000Afb8-2VFo
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:03:29 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecee1f325bso3227438b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200604; x=1713805404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgBDpDYGQ0glprRFD8yP0RdoCRZMFoPF1RZGUEi3Dy4=;
        b=gkPRUWGsdiyyJ8X+Y/YomrWGhsDJyhFZ5w6lCPZcJH/obPJx121ZqIb2HKUi/mbI6d
         8VBoAbjlvCwIFyDU9q7lBKThepDOXzi0IjJLbHcxrY33Yb7R6lD3C+GyvBGuOSIbmL6R
         7cqrvCSPVlLHu66HjE3SmmnvkKhFXSS+qCG/XsdGSno2vUD7YbyNpLQgWMmk/WbbwraT
         LQndydE0Z1uCbO2b84/eY/8GHH96XtNNrgCNYBdi8P/Y+H/CMncbPT+PjXbX+1K7ZeJp
         yif42xWemK2EhHXOR7dgJdV7WEYe9UxEXazOnLRjvz12Vpb67QvqJa0tOPe65PsxPpXM
         6evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200604; x=1713805404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgBDpDYGQ0glprRFD8yP0RdoCRZMFoPF1RZGUEi3Dy4=;
        b=N464y6ddXtCgKynoRwX8d4IgRMwlPeezO5v0k3o4Edobvz2xiVuI27jyL8dpcweQFP
         uB4AKRZf9pawfe1H5GJDrUBEXknEMRLcCqfGP4k9LGukpyd8qwPN6bpPdH+iyUCKKdiA
         Dgbz1mhYoEU3Fl02yeKJ0SqpOTdC6h+iCN+gfmP5Go88CQyw3ojKAwR3mY8g7B9OJcB3
         He8UrQ1ByLkRPKWBU4wyWuUg0OKr4u0iEl6EzmEu6NPnrYxCQqHZZa9e20eBBHctw9mE
         dtDYv44ni0izfGEv8ENPcbIhch3O4f3F5nWiUxu8xiRs3Cc3kKLw1NYlWEm2w8PTWOaa
         /4DA==
X-Forwarded-Encrypted: i=1; AJvYcCU0fpuPMxNGa+KxNIkXqdS9m/56c0mf5kCpGD+cKO0RJ3aNbXX/4X5qTouHJ6Fxk3s8RAR+z0BOIu9p2JTZ6XyCUxgJ2ZiCmufN33SQ/Ylx
X-Gm-Message-State: AOJu0YxwTn5r3XxcCdKBaTMjbBVpEj9HB7w3MYZz4YlreDFelMHTPBz6
	YQzTJofCqN+HyF/vcf4aaoBkleybET8ZzqfoseogGkJzFJQCrxdii2K7BwQyLsb6Da3R7mgdj+N
	aVQQ=
X-Google-Smtp-Source: AGHT+IGfV3g4HnB1SEs58HPZghQyLF4oCdd9NUua8vNYxrzLQb9woMp8qFN8pqykKJDwEhBAY0XH6Q==
X-Received: by 2002:a05:6a00:23cc:b0:6e7:29dd:84db with SMTP id g12-20020a056a0023cc00b006e729dd84dbmr14671886pfc.31.1713200604137;
        Mon, 15 Apr 2024 10:03:24 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:03:23 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 18/20] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Mon, 15 Apr 2024 22:31:11 +0530
Message-Id: <20240415170113.662318-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_180325_982915_FBE8DD37 
X-CRM114-Status: GOOD (  10.43  )
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
index f8f92aaf97ad..c4b6d5c3aaed 100644
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
