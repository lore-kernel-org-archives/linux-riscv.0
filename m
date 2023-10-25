Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E4C25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Royg2Ti27wrMGo/h+opX5xPmq7ZJw0/VB2xrRekQgok=; b=nBqru5mJ6kOi+r
	hflBuM0eHfEfT3LB3MT6FMfH60PLR3EQR4JXuD3WbNksDx8PINCY3Phdtr2MCMKjwKjtwWxSoBfOm
	KIfSXsJzGqco2lmemy/xvqts1GSKnzCSLZ3hOkvxjgSwDP6H/N4R6J+pS0FBdPTTorsJIen88IPls
	sIxXFMuaqjwBNU4Esu2I/Weu/nSpD1hED1aAibukNV8RvYBgmjx/hRWAgIaRcDRPdDQKlY/yIVi5r
	0DuDfDfUQJcSKMuRSRo8JnWrvoyReuGQlN7teo9Plue6Nntil8Y6kyrKO15LTW4JtyKjiKMx7cy4v
	VlgRkBcg6ZXjnvyya1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkSU-00D4B3-0q;
	Wed, 25 Oct 2023 20:26:30 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkRo-00D3ZA-1B
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:25:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b36e1fcee9so130330b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265548; x=1698870348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cuOe+AU3MQZSBvbMUo9B/kQ2SYr1hcMCXHjeEaDcfY=;
        b=ILJXTrwwbM9vI39bd0izuXhxAeGVzYFxdwpooRyqOU4T/4Y/BKAS1M467mavQAan6p
         ywneRfxHhkklagjDXcfapMxE2zXJ8ngyTi0BUmCxLSMCkzr5VCeTBOySVF7xhLv5KAxD
         54bPWDt2t271rUSehBQpQ2IBqIDgnudH24y7ukslNl6Nbzh1O+IKEqoFQ8oze17fjzM/
         QOrKOd6TpNyeV2987HidnIjrD6iq6h4ygN1CCVunFnXgK1aPXGP7wbAzRMnErvnMDED4
         YKmpnmGFzi9QRQfCmaryc0L7+zzKAU2GFAf0IgXdgQmTMq0/QJgDx/hg7CEDPwmZcqyz
         CQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265548; x=1698870348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cuOe+AU3MQZSBvbMUo9B/kQ2SYr1hcMCXHjeEaDcfY=;
        b=WP+ijenExm+HHne2Lwm/36wkY0rK4FzOzXcwymr33i7lNprh0v+yVNv0kOF/o0EtSw
         loFA+OLpTeDODKdYPFGZ6qCUUCfveHI+/TyRNP4c0tCJvt/LKwYl8pfEg1Zd4N3Lc0AX
         0mkflhiPJgFVt6Ddk/DAmjjVHqruKC5BPVlMIGbr1KcKwlgNhNC770Mue7dudc0kpI6t
         3VdmsLrQz6HElYuTCvck1IFYm9xAfkWgmHtOSv3e/NAHgJKqOBTN8QKF2JVr2fdyFy6b
         wBq7CuJiYQPcayfmyEmWY5HKqM+x8x/7MchHUMjKdykqRADlPO6eCPChN8EXG9zmF2GU
         itOA==
X-Gm-Message-State: AOJu0YyZ814d4+pGAuEd6dENGks6Ry+dHBGamUtulgivhc8f/p8wBIqH
	v9vMhiXQbA+y+gBWq0enki5LJA==
X-Google-Smtp-Source: AGHT+IEhemy4634FjVGt90Fqrc/7Er8LwdUnaKYZ7F/EhXxC4jPWbW3jfNiUW2TVJUJPoCyPB2P5Hw==
X-Received: by 2002:a05:6a21:78a3:b0:17a:eddb:acc2 with SMTP id bf35-20020a056a2178a300b0017aeddbacc2mr8715766pzc.46.1698265547753;
        Wed, 25 Oct 2023 13:25:47 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:25:47 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 17/21] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Thu, 26 Oct 2023 01:53:40 +0530
Message-Id: <20231025202344.581132-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132548_434359_3217662D 
X-CRM114-Status: GOOD (  10.97  )
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

Add the IRQ model for RISC-V INTC so that acpi_set_irq_model can use this
for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index a4aa53b7e2bb..9eace6c7042e 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1158,6 +1158,9 @@ static int __init acpi_bus_init_irq(void)
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
index 4ad256a0039c..19c3dda9c2ed 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -95,6 +95,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
+	ACPI_IRQ_MODEL_RINTC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
