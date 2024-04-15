Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F39C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7Phr3+Yous8fGrUAUgA9ng6dgu/Uhu1ShcFhnwGDTc=; b=vCvn8SUw1qtKy5
	tkdJ/JumVJcT5CnAWtWBfNDFIn6vljU9S2zg9CIGVKSV0jQ+niOB3vMUaucghmsbRTd9ysA7RLoHB
	IMkmxtxWIG0/SOTdl8MpuCSXNS0+l3wEIPcOZhaOHoOhNCez2jfJ+GOo95/kr2ud7izpWvOl7SxDi
	u0Y7f/WZae0M5k2CSAWRgfNoiJbTqjkPcasmOTETjLfuRcVDwLA+9jut6rpQUSqLvGyKUs8ETMlWf
	b6Oooj7K9YwG/6D0AYU0Z8nq0fiQHBVO7dMd6ZAYvVg89KfZealIiKSVdyhMJe5cVvJLEoQb0spaR
	vpKviVSfQg8srYMHPuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPjw-00000009Cd1-2ujJ;
	Mon, 15 Apr 2024 17:03:32 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPik-00000009BmT-3LgI
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ecf3943040so2743239b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200537; x=1713805337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQjMcgzCCX1zvyyhnfJhjMc7UuQWOWfTm7mVOWGolO4=;
        b=iblOVtaB6DvGr+T0YQLc8/R21Naebi/mb7QCntIJm8rbj7niD4uVcxhmHSEMZIYd6n
         yTCPPZZ7uutZ8iA4hu1cVoa2QLjaiYu3O8RNn1Y+BCQpv44ztAevgE58ROh5c9fDI8mg
         gWjHoHoX+jWc6ubz63Co900IV8yiHjlUXq5mZzET7bn1fXexI70u7buGT+IJWhUU5p6H
         eE4RkpoW3Evg+3vyEKSto78X030qSKmBIaBlSgf7FhyDEdKEJYWOgA6qTThj17G8MLL/
         DeL35AiGEV8PrHLg2cUnaVARAPqC2eoHLf7tRjtMFX6vEjw1tLy42juZhjVt9yUln+iv
         E0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200537; x=1713805337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQjMcgzCCX1zvyyhnfJhjMc7UuQWOWfTm7mVOWGolO4=;
        b=OAUd9Y/MKmZBr0uOdoEpgnAMaT1o8ue0ZxozrPmzR9wbZfc9Z/dpC3H3kqIC3sbr6p
         o9S2crW6TZsgQIhsTIvL08Pt7Hs+5kHELqnftSplzHKyMOdFMf05pJMt4BYoqppZkR47
         6ZkGyKldPEa0Ol4jw7Inp98wdfmgI09Xw4OqSPgnB21XJ+0YX0Yn9oRBtHs5/TglPpBv
         ldGLkAyqTLewc6NhVQaRmWdtZaO5WtztlgV5TV5IwDdT6CD1UNZ7NVqNjT5cX2xfwRIH
         f53sHuIL3LzvAHrzzFFgYmPz0XqciZX+5dzIKqzxd0CHTOTA6D7BwIhFCnieWVBbrfOe
         YThA==
X-Forwarded-Encrypted: i=1; AJvYcCVMv+UtdzK7ICKjDgxHoRgoChLbet7D8BcSpU62q9lpxqjnLWT94D+CfSWzQlkXljF/Rm6lXLR7TDKW/2olYOZvF4SXuKiDxR+N4X6XPpHC
X-Gm-Message-State: AOJu0Yzsis4hzC4r5XFwYPWm7XBrinK96hQNDKieCQR5HdsKHsza2n9V
	sG6lJx6oHU/qlbG+rj+kUMmLC2F3t7xgRksgAOUQr5qhl3uS3N0YJaygz137NUI=
X-Google-Smtp-Source: AGHT+IEOKdv2GIoPVzAfszA+Mczkslu8VP2JvMat3iDp2rWUvNRo9ufo+FIpILZ6uWBafbyo9KluZw==
X-Received: by 2002:a05:6a00:2314:b0:6ec:cec1:8fe3 with SMTP id h20-20020a056a00231400b006eccec18fe3mr10562037pfh.11.1713200536823;
        Mon, 15 Apr 2024 10:02:16 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:16 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 08/20] ACPI: scan: Refactor dependency creation
Date: Mon, 15 Apr 2024 22:31:01 +0530
Message-Id: <20240415170113.662318-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100219_090705_B08FCCE5 
X-CRM114-Status: GOOD (  15.86  )
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

Some architectures like RISC-V will use implicit dependencies like GSI
map to create dependencies between interrupt controller and devices. To
support doing that, the function which creates the dependency, is
refactored bit and made public so that dependency can be added from
outside of scan.c as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c     | 48 ++++++++++++++++++++++++-----------------
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index de30a0af7a2f..c8f40d81b6cb 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2028,33 +2028,18 @@ static void acpi_scan_init_hotplug(struct acpi_device *adev)
 	}
 }
 
-static u32 acpi_scan_check_dep(acpi_handle handle)
+int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices)
 {
-	struct acpi_handle_list dep_devices;
 	u32 count;
 	int i;
 
-	/*
-	 * Check for _HID here to avoid deferring the enumeration of:
-	 * 1. PCI devices.
-	 * 2. ACPI nodes describing USB ports.
-	 * Still, checking for _HID catches more then just these cases ...
-	 */
-	if (!acpi_has_method(handle, "_DEP") || !acpi_has_method(handle, "_HID"))
-		return 0;
-
-	if (!acpi_evaluate_reference(handle, "_DEP", NULL, &dep_devices)) {
-		acpi_handle_debug(handle, "Failed to evaluate _DEP.\n");
-		return 0;
-	}
-
-	for (count = 0, i = 0; i < dep_devices.count; i++) {
+	for (count = 0, i = 0; i < dep_devices->count; i++) {
 		struct acpi_device_info *info;
 		struct acpi_dep_data *dep;
 		bool skip, honor_dep;
 		acpi_status status;
 
-		status = acpi_get_object_info(dep_devices.handles[i], &info);
+		status = acpi_get_object_info(dep_devices->handles[i], &info);
 		if (ACPI_FAILURE(status)) {
 			acpi_handle_debug(handle, "Error reading _DEP device info\n");
 			continue;
@@ -2073,7 +2058,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle)
 
 		count++;
 
-		dep->supplier = dep_devices.handles[i];
+		dep->supplier = dep_devices->handles[i];
 		dep->consumer = handle;
 		dep->honor_dep = honor_dep;
 
@@ -2082,7 +2067,30 @@ static u32 acpi_scan_check_dep(acpi_handle handle)
 		mutex_unlock(&acpi_dep_list_lock);
 	}
 
-	acpi_handle_list_free(&dep_devices);
+	acpi_handle_list_free(dep_devices);
+	return count;
+}
+
+static u32 acpi_scan_check_dep(acpi_handle handle)
+{
+	struct acpi_handle_list dep_devices;
+	u32 count = 0;
+
+	/*
+	 * Check for _HID here to avoid deferring the enumeration of:
+	 * 1. PCI devices.
+	 * 2. ACPI nodes describing USB ports.
+	 * Still, checking for _HID catches more then just these cases ...
+	 */
+	if (!acpi_has_method(handle, "_DEP") || !acpi_has_method(handle, "_HID"))
+		return count;
+
+	if (!acpi_evaluate_reference(handle, "_DEP", NULL, &dep_devices)) {
+		acpi_handle_debug(handle, "Failed to evaluate _DEP.\n");
+		return count;
+	}
+
+	count += acpi_scan_add_dep(handle, &dep_devices);
 	return count;
 }
 
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 1a4dfd7a1c4a..28a9b87c23fa 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -993,6 +993,7 @@ static inline void acpi_put_acpi_dev(struct acpi_device *adev)
 
 int acpi_wait_for_acpi_ipmi(void);
 
+int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
 #else	/* CONFIG_ACPI */
 
 static inline int register_acpi_bus_type(void *bus) { return 0; }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
