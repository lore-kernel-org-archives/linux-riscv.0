Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C2C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2M3E5w97S0GDcJ1q0/pdfM/ZFqa6U3eHaRVrsXpt8E=; b=iHoiyFPIs0YRxs
	ZGLztTILCRlvSorIN05eEkU6lwOESvkhTEAUSJGX5MFmAFulCSxuOeDqjZfvW0rd0nzFxthf3xqoc
	7+hnGeqian42p0RzCmECG8ua/nzsubhmZCeOM1lAxwS8XdXqV1wFhibaKFCz1sFKYM9C35xAd3QUA
	GcyQDcWUxG9k8GZTAEt7stveZUqBUz3GKQZ7sHayqmV0aWfvTWUS59usYTtSW9K5oBJZSGzRZTvID
	AMyUuOprzO2nsJLit3tCBmUy0g7qnmihQvBTI/yx6YTOPfy+1H/ReMEZ3Fk4FyDGC18vAih9e5FxK
	mwbcFxvC8ELThf0PSOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRX1-0000000BfhI-3zfm;
	Mon, 29 Jul 2024 14:39:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHS-0000000BYdC-1czQ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc60c3ead4so18740175ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722262998; x=1722867798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQDYeCPMpR4X4S963fAEbe/mK838iVz52tFUEQviIac=;
        b=URMlvFH5QHlxR8f9eVjNNE0GGH1sA2/5DVodbKBoo8PdO5jnbpR91aXYnmbMplLkW3
         Pkjt0P+of+nrAJhv4XcK5g8SufUGIX6yKK7sNXmmi1oKuXshsIP/W21j3J3+IipveC0i
         gb8NWhXUqlzIP7iByWCRahOmxPhJK9S/xeubuMX//sUMl1tI0uPyCEtCnAGjtcwAYwLG
         g9duJt64sEuD0W+cGf7Xnf1zN+0MWrytX1RTvKJKSkiZuTNUBXU2yCbjlM1VEgj10t9t
         nk3jHDWgSG/FGexT4aUQMCMn32rnATNGBb2UdnmyIW03dnxD2+F3ZIS9eJv3N4sE1rGg
         4kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262998; x=1722867798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQDYeCPMpR4X4S963fAEbe/mK838iVz52tFUEQviIac=;
        b=oc1rsAzUe08HLxizp4QVaMOB9BEoIlKho4yy98hByLX1e+uFgWZBdP06OSxepxCa0l
         blWPkwhtS8J3CDIYcHl4V1HbTd6tCci9q+NvmTp9Rnk/DODacb0smyPfe6pG7w/9vJHZ
         ltuu754ro8AdzMaUn3s2iGNikzjUZobskjubukKy8OT91uBuu7oJ5ycMb84EcXQSfVP+
         tWw8H62Nk38aZ6lFNuvulH3tfQQ1qpIPzL/z0htWkOBpWheJwqDj96GxKIe4KRDq32H5
         SC/dmuId+sMjbC0TBYkoa/tZqWiB4AnyUrpOEOYNipMxM4SBWMowYjLDGVwEWs7hd6gy
         8hRA==
X-Forwarded-Encrypted: i=1; AJvYcCWLa/PFHyOIhEEIjHKJXWJlKHFANcSwOb9xmVyKCnp3E6SePT/1EkFBOmnX0y9neDZTznlX6OkUH+khvjq0dJhmNTfNF2qs4DcnyZo5oC0C
X-Gm-Message-State: AOJu0Yw78+cBeOjVewYBPfXndUpnWNENKbzX0m3+0oflSnGQjNzeB9nh
	z/PRglxfTjdJrkNgtqyj/SqgUhNNvwcib0MoP0Al9VX95E91AlVtUL7dE7zC9FE=
X-Google-Smtp-Source: AGHT+IHRfKhuOi58y2gNq6JrnPRM6LI4wl21FmFrPGpsAor4rfs3r540grBj2gDL5SzyBewH4Ncnbw==
X-Received: by 2002:a17:903:189:b0:1fc:4197:d786 with SMTP id d9443c01a7336-1ff048434bcmr60175465ad.30.1722262997684;
        Mon, 29 Jul 2024 07:23:17 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:16 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 04/17] ACPI: scan: Refactor dependency creation
Date: Mon, 29 Jul 2024 19:52:26 +0530
Message-ID: <20240729142241.733357-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072318_480155_075E2F3E 
X-CRM114-Status: GOOD (  15.36  )
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

Some architectures like RISC-V will use implicit dependencies like GSI
map to create dependencies between interrupt controller and devices. To
support doing that, the function which creates the dependency, is
refactored bit and made public so that dependency can be added from
outside of scan.c as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c     | 86 ++++++++++++++++++++++-------------------
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 52a9dfc8e18c..374cae4aef78 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2013,6 +2013,49 @@ void acpi_scan_hotplug_enabled(struct acpi_hotplug_profile *hotplug, bool val)
 	mutex_unlock(&acpi_scan_lock);
 }
 
+int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices)
+{
+	u32 count;
+	int i;
+
+	for (count = 0, i = 0; i < dep_devices->count; i++) {
+		struct acpi_device_info *info;
+		struct acpi_dep_data *dep;
+		bool skip, honor_dep;
+		acpi_status status;
+
+		status = acpi_get_object_info(dep_devices->handles[i], &info);
+		if (ACPI_FAILURE(status)) {
+			acpi_handle_debug(handle, "Error reading _DEP device info\n");
+			continue;
+		}
+
+		skip = acpi_info_matches_ids(info, acpi_ignore_dep_ids);
+		honor_dep = acpi_info_matches_ids(info, acpi_honor_dep_ids);
+		kfree(info);
+
+		if (skip)
+			continue;
+
+		dep = kzalloc(sizeof(*dep), GFP_KERNEL);
+		if (!dep)
+			continue;
+
+		count++;
+
+		dep->supplier = dep_devices->handles[i];
+		dep->consumer = handle;
+		dep->honor_dep = honor_dep;
+
+		mutex_lock(&acpi_dep_list_lock);
+		list_add_tail(&dep->node, &acpi_dep_list);
+		mutex_unlock(&acpi_dep_list_lock);
+	}
+
+	acpi_handle_list_free(dep_devices);
+	return count;
+}
+
 static void acpi_scan_init_hotplug(struct acpi_device *adev)
 {
 	struct acpi_hardware_id *hwid;
@@ -2035,8 +2078,7 @@ static void acpi_scan_init_hotplug(struct acpi_device *adev)
 static u32 acpi_scan_check_dep(acpi_handle handle)
 {
 	struct acpi_handle_list dep_devices;
-	u32 count;
-	int i;
+	u32 count = 0;
 
 	/*
 	 * Check for _HID here to avoid deferring the enumeration of:
@@ -2045,48 +2087,14 @@ static u32 acpi_scan_check_dep(acpi_handle handle)
 	 * Still, checking for _HID catches more then just these cases ...
 	 */
 	if (!acpi_has_method(handle, "_DEP") || !acpi_has_method(handle, "_HID"))
-		return 0;
+		return count;
 
 	if (!acpi_evaluate_reference(handle, "_DEP", NULL, &dep_devices)) {
 		acpi_handle_debug(handle, "Failed to evaluate _DEP.\n");
-		return 0;
+		return count;
 	}
 
-	for (count = 0, i = 0; i < dep_devices.count; i++) {
-		struct acpi_device_info *info;
-		struct acpi_dep_data *dep;
-		bool skip, honor_dep;
-		acpi_status status;
-
-		status = acpi_get_object_info(dep_devices.handles[i], &info);
-		if (ACPI_FAILURE(status)) {
-			acpi_handle_debug(handle, "Error reading _DEP device info\n");
-			continue;
-		}
-
-		skip = acpi_info_matches_ids(info, acpi_ignore_dep_ids);
-		honor_dep = acpi_info_matches_ids(info, acpi_honor_dep_ids);
-		kfree(info);
-
-		if (skip)
-			continue;
-
-		dep = kzalloc(sizeof(*dep), GFP_KERNEL);
-		if (!dep)
-			continue;
-
-		count++;
-
-		dep->supplier = dep_devices.handles[i];
-		dep->consumer = handle;
-		dep->honor_dep = honor_dep;
-
-		mutex_lock(&acpi_dep_list_lock);
-		list_add_tail(&dep->node , &acpi_dep_list);
-		mutex_unlock(&acpi_dep_list_lock);
-	}
-
-	acpi_handle_list_free(&dep_devices);
+	count += acpi_scan_add_dep(handle, &dep_devices);
 	return count;
 }
 
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 8db5bd382915..d6a4dd58e36f 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -993,6 +993,7 @@ static inline void acpi_put_acpi_dev(struct acpi_device *adev)
 
 int acpi_wait_for_acpi_ipmi(void);
 
+int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
 #else	/* CONFIG_ACPI */
 
 static inline int register_acpi_bus_type(void *bus) { return 0; }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
