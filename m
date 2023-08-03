Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA1FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EXi0mv16EJ15iT0A0SeATracMd3QKYyp77dD4rQkno=; b=Z7DgYoLu59b4TC
	nvh2hMFtPNejD+vRuRkkcgyQcPlrilp5bf26xmzSLr9G7t8KYel4TxTA9FYVVjnL8uoA74ky8HSFs
	ejcdiMhV7RpM4UCyMMUDdU0Z+PNMeByqz/yellMQatTYgf14WRaDOaRdrGgc6dpzsB5r2MzmWUB9J
	pUTHRDNw1igfwNMq/t2M6ylWznNTDCU9Nz6fQQYCMWNA2ABym4QOy0BUasBn1dPrGSwXaackGj+9x
	ynOI8OlojwX7kL+HTEcf4DhP0iJ7H25VyRetGrjqHZYeIj6xrRG2P46CgzxJsiY9IKT4xg4Me3hrH
	2KL8hgigJEN5Jps7bTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccg-00AUqi-0q;
	Thu, 03 Aug 2023 18:00:30 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccd-00AUng-1N
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:28 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so868669b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085627; x=1691690427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB8h6dbqqCupn7mkThrMa44SDq8B8ddxZkj2FYKCJmg=;
        b=fgyTbFbSIA6WSJCx4y2YtZADUaRILhcOrq5BNe2S+JpaMMQ0Ar3+k0o7cWkjb5+Oph
         qgBwyGFPlW+7v51hDt9HQ+dtrg7U22mFpAu7AGnL5fuAFB8QL03bAsAKMo6sSfAAj9tO
         jDdTdbrk/xdtviUz8UQl6ciPU76HpqnEIzJeAn4Agqnq3ujBJaj6eWmT8346PeO5SvSe
         cfJeGA9L8Wkm3G2l4Ck34rZn0TOgsv9hlv86jHG53oUiopUDnXtQHXBZXzHV+0bItKrF
         EgPUIJwUqxHZV8Ws7XnyrnBbcjoxrzadVdmuq6TIh/vwPYyDsB1PIbLGFdMcXITCD8J5
         Hw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085627; x=1691690427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jB8h6dbqqCupn7mkThrMa44SDq8B8ddxZkj2FYKCJmg=;
        b=FyZY/Atqd5iKfVQAHxewb24Kpw225EB/0AVKn0eFuafv0iVPCgkUSDrIF6FMgwjk6y
         b//jrZjfxFNriDqe/WLJ4b+2+/9u+fuuHksiZxtSXSnLoBnR7xOgt6j2ABnpJifoffC1
         O5tdRRGdqDFudQraqOU11206jvVieyMRkxIAhaoW7b+SR6ylvvzfHWmQQKq++QIi90wR
         8Y2yQjI9s6CFZNDL4OnmTqsV+iom3iMZxCUDPa1aVGHVsOU3deb0EOoodn6sPKqoIzdH
         J/oZVrq+CaxsiXZ0cv06s4Hp9DJwKh7CNd1568pGAo4e4GROjkjh7k6L/iYPCrO6MKQb
         ci2w==
X-Gm-Message-State: ABy/qLbZRqRgW2weYosLlLJhsy2WHRQvbdaSUEFpanxwMbzuji9gFBt4
	cZbuNhZus46k0JPg57iPqnw/rw==
X-Google-Smtp-Source: APBJJlE5KEYBYCnrIQPqtzpicNM/OpO1N7fddfHFqyd3fUnS/DPSYBFhYR3yrvZPJTarCbPDg4LDUQ==
X-Received: by 2002:a05:6a00:2e8d:b0:667:d0ff:6a0f with SMTP id fd13-20020a056a002e8d00b00667d0ff6a0fmr24530632pfb.5.1691085626970;
        Thu, 03 Aug 2023 11:00:26 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 07/21] RISC-V: Kconfig: Select ECAM and MCFG
Date: Thu,  3 Aug 2023 23:29:02 +0530
Message-Id: <20230803175916.3174453-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110027_484540_86CF30DF 
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable ECAM and MCFG to support PCIe on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e19f32c12a68..79dc35e89d5f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
@@ -147,6 +148,7 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
+	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
