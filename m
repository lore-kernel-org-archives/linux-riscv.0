Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3ABC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qi1+aNNtSXaJjK4Wo80PZoy5XLyEQgF4lwtA2R57xdk=; b=zAWOaJs2dVejb2
	paow3yDJctLTTUxSWhSUc/Z21/019act1FERpFdSnSPps/hp/ECe2QECDswALz20yGECAsfekKnm9
	E+0gcR/wawi1CdDUZLJY2JVttZCvek7p00Yfn1RIye/i+2j25hlFx+4/9s4vZjzFy7Nnua6cvvPCz
	fOn+lOemhe1d8qlA7BC6tVFSKZnw8ZTwpxUOwmuHPpt1mq7JCFSdsdRReRT934Em0pv/03f/1ESwj
	ebER8kFrBPk6EgrY8MCikWXF2rc3QNnp/3Vtqk9vFH4I8QS4A7HfoQTY/LhwDsJoCZtnQbQHqvDYE
	Vl5ZNoOiHrkBrOLnePaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkTB-00D4mb-0x;
	Wed, 25 Oct 2023 20:27:13 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkSB-00D3uA-26
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:26:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so130541b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265571; x=1698870371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0XhMD4JA6OaCaDrqm344212wQ/hTWt0yHku4ySQPd8=;
        b=mEziefqPS7NYoSxZARQpH4xrzO+F0qS2g0dW9P09+W9r021cTvqvKPyvUi6MbHXxn8
         TEy+X+T+lKGwHKcjCF2EiTrjVkhEbI55rfwJ/+ClDGVTCE64e3YuhHB80qnt03GwmDP+
         64zZHJnboBydV6vFVoyUolzdGtVh279zhPQig84zc9+G07IchM8kB53XderDTtXdVVEx
         O/ibnjXjz7TFvawZ/IJ6MUvf99701WLzOZQX31XjNMKZR0bHPTFQhGZQxEf4BqJYJSDI
         VSSjtc5i7+R8SxPnNm0QYUkpQmc3IsSEXTq1BLxh0IN5Wf5gwowqLkbpsftsQkFAO6e/
         zFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265571; x=1698870371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0XhMD4JA6OaCaDrqm344212wQ/hTWt0yHku4ySQPd8=;
        b=KrBBP22SON1xQyyhGnv8f9i5cmpdVhDm6RtyCe4m+2THJq+9myTjwfovYE6piMYVEP
         u9PiTCjynWrluYzhPMj2SDSAUoLI2Vqvwgjnvb9IjpA9C8UV0pkAbq/HMC5AEgdwjzna
         ARO6MPBqD6C4DdwKp9y+8b1Z2tYwylD5jafQ/5pZU1rD/NSRV4ua5gmL8Ff7O2sYKUTY
         IHkaItsgn7GC8dMCkv4fyp0gV4wBZeg8sswSx0Z8momRnDIZiRcrZknBc/5O1XG5UH9A
         U7jraNGUJDVAz8U71dfIVjilVhKojgVXAfIJvw6k5jqGh+p0WbG2epl0t41AGRuFcOoH
         g+1Q==
X-Gm-Message-State: AOJu0Yw2c59Lep7bnSmgBdpQx1leYxT/VhcfIM5DOvjn3yUEYBP39dRQ
	vfrEtv+zukuyG/yJUIZgyKtg9Q==
X-Google-Smtp-Source: AGHT+IFjlmAHmkBC51cPzJaQWPRY6g5oe+6V9CmrTCMV9Y5zgvaJjhr+jA6O8yL6wxa5uTMIhaBuRw==
X-Received: by 2002:a05:6a00:15cf:b0:6b1:b5c4:a8b0 with SMTP id o15-20020a056a0015cf00b006b1b5c4a8b0mr19858459pfu.23.1698265570741;
        Wed, 25 Oct 2023 13:26:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:26:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 21/21] ACPI: RISC-V: Create PLIC platform device
Date: Thu, 26 Oct 2023 01:53:44 +0530
Message-Id: <20231025202344.581132-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132611_764014_BCFB1B22 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since PLIC needs to be a platform device, probe the MADT and create
platform devices for each PLIC in the system.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/init.c |  1 +
 drivers/acpi/riscv/init.h |  1 +
 drivers/acpi/riscv/irq.c  | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index e7eff7ab1474..c6fd4097e8ae 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -11,4 +11,5 @@
 void __init acpi_riscv_init(void)
 {
 	riscv_acpi_aplic_platform_init();
+	riscv_acpi_plic_platform_init();
 }
diff --git a/drivers/acpi/riscv/init.h b/drivers/acpi/riscv/init.h
index 17bcf0baaadb..b4b305d83b3a 100644
--- a/drivers/acpi/riscv/init.h
+++ b/drivers/acpi/riscv/init.h
@@ -3,3 +3,4 @@
 
 void __init riscv_acpi_imsic_platform_init(void);
 void __init riscv_acpi_aplic_platform_init(void);
+void __init riscv_acpi_plic_platform_init(void);
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index fbccecdcbf8b..90b0738e2b9f 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -104,3 +104,17 @@ void __init riscv_acpi_aplic_platform_init(void)
 {
 	acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0);
 }
+
+static int __init plic_parse_madt(union acpi_subtable_headers *header,
+				  const unsigned long end)
+{
+	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
+
+	return irqchip_add_platform_device("riscv-plic", plic->id, plic->base_addr,
+					   plic->size, header);
+}
+
+void __init riscv_acpi_plic_platform_init(void)
+{
+	acpi_table_parse_madt(ACPI_MADT_TYPE_PLIC, plic_parse_madt, 0);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
