Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76056C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GgoAzC0hdYui/fx8WMn8RqJS8Ox7Ed7ss2+SCCIeWY=; b=3I0iN7QFT8soYY
	t2RMLdQ0FwYMSyqal7UsYtcfEcJbpWZGbec2BadZCIZFqYCcvjL69NzBU7hTfQM/j/EZlE5P1zRt3
	AMFoNZZKMyQhG/68B93/mQCxweYqvlmFdYlzfmV/wX50oHRnDl3rFd4f10fV0wpcQ0jxB6CE9Dz5C
	XRirkP2XKK9HJ9771amydjKSA2VnqgWW+cv+jynnqeUqWZsoJGjTU35cpeH6gsbvX5UUlKn3wl9yg
	IwRjlpfgJ7UmSWi1+SF8k/Md7z8ght+rXnsfVrbh8o5+beh1hISM9d9cf2yNkFkRUvpGSCAqG57mT
	n7q6ehkiqW00MrGn6j/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSish-00BTYB-Lv; Thu, 16 Feb 2023 18:21:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSisf-00BTWS-ES
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id ja21so2897153plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRX9Rh9lefADAfWYEbY0yIAAiynI9MZaTYH+yetjREM=;
        b=IaeR6uCOYqxkxcPO2OyZK+7eC6B5XWUpETzkV429cXcAgdslHLazNahirlmg6GJ8nt
         ZxrE9y/gCeS9R3rDQdwL6ajjbBDd26jf7ah+E/ozJpUScU2Hs+caXXwpejxxCR18bBU5
         QNKpQffB0OL67KNEN3pFW1lBC/gH9rY9bKHvtpm6/Plg4D4UklunHYOF9ee3xh/FJ8fg
         YWtE0U1o4BV11Ioa48QOdk/Y5DLLCGTR9ZcNpwCOm0D6MtRbodmOEuxChDMNlSDPHFN5
         VLFqJLp/kX3fdGCWO4vPoek08/oItOINvIreIDT7iodgxsdmmImQdjNXsthZ5FVMYJ15
         EWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRX9Rh9lefADAfWYEbY0yIAAiynI9MZaTYH+yetjREM=;
        b=AnQt3XYfA+bm+UPftQ7CjpbwKtmi+iPSIajnegD5zg34qVkIg8u0YZpMNXV81naCcK
         v8S2uHbaP2qyX71eGlPw+eT9sW+Q+Bfbl7lQ7b263XQ//fyol87ITfoKmWSkAUzc1vWu
         chDcpk872LNJDB1JwmExVlzt66zxaDrD8WJ12cih1os5O2QU7S1uM2OPSj0QaIAjTSFG
         uyoC7m5gvygLI2sIQczkOR7whFXIuVH8XYTyHyGgikJ6gsswZhC6jZUE+waCC3/LphMQ
         OxHRnWVAWUCq5ivvXIIE1AL1n89OOmCqZYWB24m2C9H7RYqnPYjYDtfpMvEeTFcNhXHc
         20Yg==
X-Gm-Message-State: AO0yUKVBTb/FaUXOrVVdc1E6ywmMErzzdZNN8ZL3fLHgxpKNaJPw70HU
	KRZdvK+fhKHpkIvBU5cdqgonuQ==
X-Google-Smtp-Source: AK7set8xLrx+1PXJVXcHl9Dg9zSUmVDJVoqpG5XSTjL+yDDVADutOhkLtType5mYRLOojwQIa6F3zw==
X-Received: by 2002:a05:6a20:3d0c:b0:bc:61d5:7bf2 with SMTP id y12-20020a056a203d0c00b000bc61d57bf2mr7783217pzi.34.1676571676972;
        Thu, 16 Feb 2023 10:21:16 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:16 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 05/21] ACPI: Kconfig: Enable ACPI_PROCESSOR for RISC-V
Date: Thu, 16 Feb 2023 23:50:27 +0530
Message-Id: <20230216182043.1946553-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102117_509263_4191EB5C 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the ACPI processor driver for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..b44ac8e55b54 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || IA64 || ARM64 || LOONGARCH
+	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
 	select THERMAL
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
