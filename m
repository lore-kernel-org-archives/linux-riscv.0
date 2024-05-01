Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9B8C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4isGbIozky8o9EsLq9ZlRIx+Bs0mSSu7QqPjT+7KjQ=; b=XycKotZDIP9lOU
	XgC9lZcnq9vX5M1DVfjlxcIupIrfLYfhF8keji7/hFzS9UkaCO6eiFajDaWQhXe6apEH5U+KYiVCY
	oodqXIVZiAeuK9LZNTXYFSlTK45ofg8ovfnRd5G9FohVgF1REC4ioXqbe6Yae7Ofq5IPpI/R151dL
	eXak+16ImA8xYOv+DF34MD3pbtszJutXVco3dFqAgACmZ9Km3hgzAhAZfqdIk34/46N2db/nYLn7c
	YSKZ5ON6Xe9YaWdyW4pZg2e34fTz4E9dtjwCORYoM/9ied20p1TmhfMmrGtIFSPtowHN329GjBkcA
	86Nno5gts66ZemUz22cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29Db-00000009Usz-1JjN;
	Wed, 01 May 2024 12:37:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28v6-00000009Miz-2PEL
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:18:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ec92e355bfso5028605ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565923; x=1715170723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNK+H7F1X6JmEpHoq/SVvyVT2dyL9n7lyqIUUwemfkM=;
        b=Vwk4Zx6O5GjkCmwl2lSCh7hjiaAe6yAsAYKkJ+kh+qYcBblewPf41/EALgrYuzcRiv
         XkepdreNWkcNQw0vO+FII7bGBsTSV35W4S52TfPpSXFwFIP7o8lDn9DkeSL+NQpqgYK4
         jeiSU21pO+V9WTP3siFTIXl5xla2WWjNnBZ+A/9CDJXKKEvme0W6PLe5/H4RPs7fxY+g
         zxpboScKU+BukDvmFpFnVYB+PIpJvC0Tsm5e30MCswz5UkKr7LuoNe5s0+O2buguaXOc
         U5pJe6PshbxCpvPKMb5KAOJlge8Ve7rFy4GhwD25eaRHyD5FCXjixojKTf0ripjsiquQ
         /Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565923; x=1715170723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNK+H7F1X6JmEpHoq/SVvyVT2dyL9n7lyqIUUwemfkM=;
        b=JVUUu5x/KbaOBAtDvp2n6i/pm9vqZh0Gv9kyGXP7GIX68Ha9TUd7cZ/+3/o2crXaHx
         DmMwxPYSY2xqzJfJdUbxTgGD5q4BcOX7m7jabxsjZhy74ozQ6xEFZbVbdbJrzgGDJzwg
         48ua31iG/2vW4s4qCcxVfJGLdPm5i5oNUDXllDih4a1hztsNOt4DvVmHVVtYFJhOA/Fx
         RY+rVbwqFnL4BH4cvEukvAVGdYpBv9If4X0yZTjc4SsVio/YqKzc3IvOy0rwv751HQ+C
         nlRxgRPGJBN3GDed9bOEDQSJwGICNsUfthizew55n+qysyx6PQWVCqMgkJRA7qQpjEal
         psug==
X-Forwarded-Encrypted: i=1; AJvYcCU47f2pWbf2GO5B4m1yjirgZvPAY/QqoTRUGstAI3ShlQILNb2EaclVvpvvevS2gsp/4jEuSNp+tQtbi8VJUoNG5+b7xZ6Fplljk//aokTj
X-Gm-Message-State: AOJu0YyKNzXOI+OE5L85/cB3qrltjxlnxERc7Gi2AudcByBCWm44S9qk
	/V6+JxI36zezs1+a2dQu6zZftdZVo7qrSjD4moS8nDtMHPQOJeuIrR2mzc1Hssw=
X-Google-Smtp-Source: AGHT+IGI5pV9TYR10/cfbIQ9JMek+r7tBzzTGhtdRl1CfIULDyfaZRTCxXSzFPv/bTagC0SBwcv3pQ==
X-Received: by 2002:a17:902:db09:b0:1ea:cc:e123 with SMTP id m9-20020a170902db0900b001ea00cce123mr2687556plx.46.1714565922763;
        Wed, 01 May 2024 05:18:42 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:18:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 05/17] ACPI: scan: Add RISC-V interrupt controllers to honor list
Date: Wed,  1 May 2024 17:47:30 +0530
Message-Id: <20240501121742.1215792-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051844_962955_B3EB327A 
X-CRM114-Status: GOOD (  10.13  )
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

RISC-V PLIC and APLIC will have dependency from devices using GSI. So, add
these devices to the honor list.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 3e3320ddb3da..beded069cb0a 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -832,6 +832,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC100A", /* IVSC (RPL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
+	"RSCV0001", /* RISC-V PLIC */
+	"RSCV0002", /* RISC-V APLIC */
 	NULL
 };
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
