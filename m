Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0771C04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APdHGKF1VdkcDVjvSvH/QVtmbiqE/WMoLuDlgoi5Lpk=; b=Psg7LoX57lSguy
	Qa0toRqZ+u++sQdfM1WXs2AOK7yRzN5jS1BSqOsNUNwGaJ8K8JQai5LRv1CEhqsSYg5mnsnz7omSS
	DKmDzI7PZwYZ0oMIzgZUpun/VrJQfhOHo85sH6lk8KhzAcf3Wrx04F7MkpUHL64414wkBMB96LTc3
	cJ+wfQPMg2NdgvEFhWsqgDJSIuzIuxGZFso9IoU1Ii1FMjzW6AcP2dWtsxZwSPvEZ43r4RRypL6Ns
	kryLOw6QK5cyOdH9v2KlMxunlGpUElc++RFs3Orpvr0rC5Zmswj1wPZoDcFsb73rqcyrzRwfjt/Ko
	2CrPDqTb6tQOmiff9RFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPkH-00000009Crt-1WoD;
	Mon, 15 Apr 2024 17:03:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiy-00000009BrA-1kwM
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Apr 2024 17:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W2LHe0TiKeYFnNPgLCeAe5BF4w5DQy6QPlu5Fs7U6q4=; b=l43QAGDrETEL3JFf/KwPFPI9HI
	7AU43Y76RqW4yDznuudY7Uo1dj54snCYY3P1f64EPD0yexfKsj406Eo79cLR9LM0wCTnu0jmnO/xj
	0iYSANugqrDXvVGddWbOIznPCR/gxfH8sycfOaKjxpayw+wWIAcOLAHogoGZqGHdr85RwuXd4rhOl
	+H/2zp5GAFITHR7drvgx75P0MXB8H35Cx3+bwMOp5WuyJSlw+rDF1p+DIJt+PYFHbEdHpM+61uk46
	PYsNc8qA7P77A4IvTtYUlyqy/Q5gwZiFmj+ugKG+lf/e4xrLM9G5XsXYzK39ny1Xz7536He8Z1kkr
	DkOrSbBA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPir-0000000AfTv-3cS2
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1422547b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200543; x=1713805343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2LHe0TiKeYFnNPgLCeAe5BF4w5DQy6QPlu5Fs7U6q4=;
        b=BBIpJL47RAMUntJXJPedO+QjFl+CnSzbfWh+A/gyJ22vc9ubcVu78OUu1DGQ+XwRoL
         OGHcRRCySXOKKY6T0PnkVvLBME4tct5dY18dFsykklchtZN8xfVdxbCx1aDDt/VSsuJB
         O76ASnA31ebeNJHUews2YbVGhPZ1q/eO2Q2R6ZZrTM4coipUpdU4ENkEhLXK2mrl1NgS
         YyeBSQ3c/9CYeYYzYP2SpFe73fQiHs6m7aO5wBFGaH72sHBIjjd9BPmwYate77jsH5W3
         0VrfMslxuUjmdn2Ci5nRt2+D0FiuLiw98ivjXbG5uAWa3CXXSeSRyevPVKPKORz5q0kt
         iDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200543; x=1713805343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2LHe0TiKeYFnNPgLCeAe5BF4w5DQy6QPlu5Fs7U6q4=;
        b=HgEH6wYPRa+GtXk+9NMmMoIlCuxpQRUXUteYFNgMfzfKjEJm4G8BNr9gs7dUWmOhdv
         P8e9TND796RggUGavFoID5GGkPZvtQmin5t4pdy7j6jsVuU0htDuZssAQmsyi0Mpo59z
         t6cTgrGx5B+R7CEw+PLR1klqpQKmKtN23RmEXjAKrexwxP9crg9ST+LexwEAsTgtMy/k
         9UhWH8Pawok347AC13U9PLrOkje+jzh4LOhjIENsUIVLRFs5yxUWwrbplWb3m8jVZjMo
         FDqwBHjhmjsNTxmUB2ff3CGnPqV7tNjt7ootaCU4wAhMCaqCxP0jHNpMmZJqPvUSg5cL
         Z5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXMKY+iGFF0z1mesaauBq9jGRGu4vHd8uVrrtGz7NlMonWiWOJe2skQhI3YN9ZdZgU67e6ul9NqouYqonDjEuGDyPfASKAh26yNo9FMACvt
X-Gm-Message-State: AOJu0Yw+u7Awlae4piMpm3dfKFYGhMJJB98dUA41rDv8GqV4jxBvltnO
	1XFTPNs4k+KQrcSJuK2Ij8JzBjGk0PE8gaQtjhCfGUyy1JNOzbhBxYA5s3KutFQ=
X-Google-Smtp-Source: AGHT+IHZPG6wbKkbl+YL/8OPMELdPpFA9RlWoys/7cQw/AgmouLy6gSngELWynfeqJUNk2wi6bZfdA==
X-Received: by 2002:a05:6a00:3d0f:b0:6ed:41f3:431d with SMTP id lo15-20020a056a003d0f00b006ed41f3431dmr11412835pfb.0.1713200543335;
        Mon, 15 Apr 2024 10:02:23 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:22 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 09/20] drivers/acpi/scan.c: Update _DEP honor list
Date: Mon, 15 Apr 2024 22:31:02 +0530
Message-Id: <20240415170113.662318-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_180226_144673_A31DC8E5 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V PLIC and APLIC will have _DEP from devices using GSI. So, add
these devices into the honor list.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index c8f40d81b6cb..07e91616b7d4 100644
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
