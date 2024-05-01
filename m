Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF683C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LLB6rWykjj+mZ8iBQ9DYwfgiD6xDJ89PLkxFtQ/IWI=; b=Y6kQ/WUg+8Rkbj
	MuNKLSNjO01oUL7wKVfU2kxkPb6wuVLrQAyjQxssX+yoGDhLIefhKO2DW4RpskaamjpQEELg37I5R
	rhZOFIB3M/wVG00eKX524sOrxUoOlGRtNhJ3GuTwrwVCa4a28L9xW3uoyKd2mnpqZaCXr7JuPeM77
	mY8r63jL1aXSOlWC5RBLdBv7SS9hallf5BjpIEYmZ/2glGazasaAXWkgY4+C5uxnA0SUSpQMF7RGm
	dnmmkxUpsfh6q6HeX88gfXaFpa68IZGTaop5G+Gxk+xg/6AR6yLU+ObVNYZhNAKAIyj44bW/qYYdJ
	Z2vEA5xXtXkslfF8lq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s29DO-00000009Uhf-3ClK;
	Wed, 01 May 2024 12:37:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28uy-00000009Md2-1TE3
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:18:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e65a1370b7so62843385ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565915; x=1715170715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRvT/oDJzrljnZE8hh4Mfx8UjypBfU2BU36kOdk78lo=;
        b=I6NvFdNHdJ3UDj/4OYitYVEvZseFUsP6XGwagdQrV6g8zD2m6yK7IYiSGak1gNg/gP
         g6mM+P9nfvKFn7TH5We4orPPy6wZ4elah3tKCVj8IFA5plq7WnNdx3Az4AEKBESztXOp
         x0Q2kONspiCIXyTXnODl+3YqYUnERAmmgiRUXLm1vda7yhpQIWBsCjrQnlcqgPF7N47r
         JAiCHvWVo2N7aHw5g3OyjRMGzFMrJelibW5bLXlIBXmR/9yh1JV4vGsOaz4Gct3ZPmzN
         7tFDbXx+CgKTydTuOJdwbjexeWrJeV50lqE/xDM16KJiNyKzpHWELSR0dSG7a7gW0b93
         7bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565915; x=1715170715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRvT/oDJzrljnZE8hh4Mfx8UjypBfU2BU36kOdk78lo=;
        b=ZMuEmykQtLYl//+a9WAuWa4h1q/qt3C6IlS95MdpaJnUH6y5xInB0XqUCcrH+KQMeI
         GZXnppT2GEJvgqXaJUK5+RAJq8xXgYpzuRK+lwzAJIOQYN1Q/8s+696IG/BUY1cHsA3s
         LMjN/ronQdxVwuy/I/2pQVAACga/WJinIcI4hrGzwIeY0nknTgGklYoLcJXUkEs6RlD5
         Zanj7/ZHl1vR37E7bobKeXIaTJRQ6zjMMuS7rjVlbkuedaVlx6tidA2gKoJVpq5lZJaG
         5FWoJqaqRuvAG+XIUD23TeiNwlaZr2tiegQsEiO6SuIRz+kFWYyk5UoDxn55xKwq9gRg
         YbJw==
X-Forwarded-Encrypted: i=1; AJvYcCXHvdJOGGbN3/C4Xmfl7PA3kNOXvsaDqE7L7HqRhzkt2svo9TBNqIhcLTjdZvtd6LM2G9ZFACnaXbZMto9kUzMH775fk6ERGWGS2OpiGEqW
X-Gm-Message-State: AOJu0YwKI22hEpl/iXKqxoq1pNytOg8zMXzYNbrO+MJKoLbe0IdmJFAd
	+StJdvJs5wCP4bwAQvrxtFO5UbWJq7kjjVHdhMNbIVReVfMuNyKAIHKXc0t35hg=
X-Google-Smtp-Source: AGHT+IFj7UjbvAZWh+cyRVOuEeVGC8mPfC0AaziB0MuMPmALOJzUu9Sq7LhvOrdMq5PmFj31+IKF9Q==
X-Received: by 2002:a17:902:e5c4:b0:1eb:4a72:91ff with SMTP id u4-20020a170902e5c400b001eb4a7291ffmr3011610plf.49.1714565915161;
        Wed, 01 May 2024 05:18:35 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:18:34 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 04/17] ACPI: scan: Refactor dependency creation
Date: Wed,  1 May 2024 17:47:29 +0530
Message-Id: <20240501121742.1215792-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051836_437879_2B0FFA81 
X-CRM114-Status: GOOD (  16.11  )
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
index 837b8fc89dfb..3e3320ddb3da 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2023,33 +2023,18 @@ static void acpi_scan_init_hotplug(struct acpi_device *adev)
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
@@ -2068,7 +2053,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle)
 
 		count++;
 
-		dep->supplier = dep_devices.handles[i];
+		dep->supplier = dep_devices->handles[i];
 		dep->consumer = handle;
 		dep->honor_dep = honor_dep;
 
@@ -2077,7 +2062,30 @@ static u32 acpi_scan_check_dep(acpi_handle handle)
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
