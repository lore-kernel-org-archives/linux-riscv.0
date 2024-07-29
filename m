Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E896C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhriiV+j974agBSyZNhPKC8XAd1jamG92aPju/2k/dk=; b=kjotltvg1JqA9o
	q8LiS63uQFsjLvKDMaAsGnCs9Cq+nr2/k9ofMhXMYuGekqwxZSAFnu2uXQ20kiCNPTh4+LHnLzBAi
	eWljYsKZ1nd8HiMnuf/qRnOGhsONWKtH61J4AgmfIZXd+thk1jHi84yXIYQrjqBrguKC6T0SpiksS
	2bDrRiG00PdK40mWb8fnLXo/PEe0eic/JjJFayahSxpHKQRyGd6xt80WjpNcFbFhQV2SaBqxLadH4
	IeeaGxnHFOZ/CL9CX3TFdetmQuOnb35VOPtBaRAbVvSIVS8dJIHJJtnqQNbbwjZyg8feLJ2nAi810
	IGLUb99tNL3XujoX+2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRXM-0000000BfqH-1pZO;
	Mon, 29 Jul 2024 14:39:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHY-0000000BYgZ-2hDB
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fd70ba6a15so19915905ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263003; x=1722867803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKYwRAs6GZjX8rwxqPz6RZqcRKMFxP3sTbkHp6BG6OY=;
        b=ZYr12WgbFSzx1ff87/M/HP/DVpEdfY/Z3bGkAkksmDsJZSVXq9pA5Xmc7ZiXaUlbbw
         PAqaPk6F4blOvTnQVa6QYlU4LIaHfPU+Ey1lzyQZ5LQtB9JQR/v9mmZjycuCTBM42UiY
         tQstnCxXJJPZDWt7JHIHP1t+dTnyzY9X9TIYym88Nhc9tkBgoGOWPfpplMtrMAN6e0eu
         Dvfbjp/J9RO1NGelYkej5APbGNB3nXXByPPOlBIW1g8sFMwOA6FADuDwy3NV0tedshrx
         SlIq7WTOGbF8Qvzshs5qx6CBS8r7wjeU8YFffuZkb9mxyv0HdyiBGS3eezBGqEezmw+Q
         DnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263003; x=1722867803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKYwRAs6GZjX8rwxqPz6RZqcRKMFxP3sTbkHp6BG6OY=;
        b=bWX5QpU9YmoBwPOSYkmBTAitiXax9Vxlte5CcfHogprEkg5PV3m1KwxtzD0SlAgrcU
         nFL21DxCpwqvAlg6WlItuKFw2JDStekFvF/aIr+u/sQL9qPCo7cwYAXopbMvVp8HCh30
         CeHj7xwcADqgCiigDDCWumL2N6g49ItfpXgI19SN0lLSQSOq55SClATP0sNJkEHCPuiT
         2CKYqBXaCgHOTRT2gComOVbRUGMlZ3WVR5Ek2B4dTdgiHuJao8D9JWPvkgTtYduF2lfV
         mHh9HK9awlFJyULKCCP5OpitS7FJNHwzoM+caNZwMBozadaIBzlrkZnvQG4mdXZUdYDj
         Ep4g==
X-Forwarded-Encrypted: i=1; AJvYcCU7Zsd40q5jkOG9BHV07w5uqm9bg5wwEas9Qi7FjUjJ6jHKUwTSp1QbFu+ntwPIW+l8bglrnkOP5vb3XYPpaeB56hMgZoAQEhjHIwhOKdXQ
X-Gm-Message-State: AOJu0YzzK742enI6YuYNePdo6kUOjRviD95mKIl9BZHGl654XIOGAX1N
	F1ghjVlgJ/f0mxKnf9TZ7x0ZF8Ag7L9J9CLJVa/xoS+M9/3juL9KNgVvOiJ4Gfg=
X-Google-Smtp-Source: AGHT+IHlmBVDHSe6PUvNsr600YNWcBMY907Dx80p++dt4s49fUoZ70tkMwcDAnmuTUCJtN3oxZs+cQ==
X-Received: by 2002:a17:903:191:b0:1fc:6b8b:4918 with SMTP id d9443c01a7336-1ff048e1db3mr52120535ad.41.1722263003482;
        Mon, 29 Jul 2024 07:23:23 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:22 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 05/17] ACPI: scan: Add RISC-V interrupt controllers to honor list
Date: Mon, 29 Jul 2024 19:52:27 +0530
Message-ID: <20240729142241.733357-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072324_867442_4B889C42 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

RISC-V PLIC and APLIC will have dependency from devices using GSI. So, add
these devices to the honor list.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 374cae4aef78..39b3ccae9f79 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -861,6 +861,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC100A", /* IVSC (RPL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
+	"RSCV0001", /* RISC-V PLIC */
+	"RSCV0002", /* RISC-V APLIC */
 	NULL
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
