Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E9FC25B7E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74cYcA7x4L4MdIo4DICsMl9ynh7Qzv6UC54lWUBSVcg=; b=APPs+A83cCXaz7
	y1z5fK1eUzf8+zDJVSETHNYALYqhXcgXsXm6+uBvpe268+232XGpOCOAzFFXLkqtSF9qLdKryPJib
	G6sJn5HEPR9TcHbprjPpOD5OdIqhrr9bK8uzhXMIkRXxN3SjVYJsq/8K0JdAzvaZwSyjWSpedg5EJ
	0o0hOQhuqZEWWtcWdfp0hj/6D1uNyIsJEGvV9XwhNytFcu4Wi1PpposWU8OrKCAMEIVPOFaLWVisj
	1nSHGwz+eguMXCgQyIVL/cNvyjY8mx8Ct7oJpIgTm8TfwveR+3JYD2PlZarNoA17Xtm4zahmmNKso
	J6KyKuY2L/ftbHF6Fsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQI0-0000000ConR-0dCN;
	Sat, 01 Jun 2024 15:05:00 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQHr-0000000Cog4-2Gq1
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:04:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-6c8c880f526so236926a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254290; x=1717859090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Jv6JEZTD9c0qG8hE1F4MREKLvC6gRJSU0R0wzEFNGA=;
        b=NLiv9jFKCdOCkfhjn6FJpwcotKzOpqGbJXJDiSR68XfpbmcXdHfrMz4aFECQ8UpA5c
         JGP1QvcO4g4/2bgmbzVqYHkEijY5WTvL5GhpyI2J7U5y1t+8/wIqExroZpvSvImR5BeS
         oa6FrilSjZHA507SakitNJ+I8jPD2eGi2+hklksrAah8DoBBGuRpH36fUrQMIxHU0LYG
         x/0pLh3kPiGHHVvi+w0nTtUiggqTlPFUTRQMTByRw91+N4YXRuS4j3uN0if2ihPne3af
         TbNWNdn5mJe658nt0Eyc7b1if5+wG9X4oHrNRoc+8BryoggWcVK28RRN3GnIZpclpBRh
         fbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254290; x=1717859090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Jv6JEZTD9c0qG8hE1F4MREKLvC6gRJSU0R0wzEFNGA=;
        b=Fzx8QUCl08c85yGRGFMOULtqYwTTFK6TKOAMLpmtXK71m4Yd1y8ugjzbW4BFgHwVRB
         ernuE4G6gsV5YH/OjdfDsv99S+3x5nh44rSZueIg23oWcUGbgtUsEc7h47TTHmNAyV2m
         8AfCKMQMrCJEdIMx+8hfmaMN19H6dCm4oIzMJkvb05dKOBWQ3nvTNbw5+5+p6iw5pfnA
         Tauj/4iGb/rYEAVhcenl4UyCJS1gZ2p6rntPTOmcF1reheuaAT7eUDtvQV/woPv8MN0A
         O0O8cQSl5wmlKq3dxy5SvrLSQiHoiiwEDERGQ49v60Fz1qs+6s5uib7gqmRoqfczsN1V
         RAJA==
X-Forwarded-Encrypted: i=1; AJvYcCV7W2BvWIgm6eFzrOdmnqiv4TwHiCAJTsY6QK9cjeH+zWhFMkTHXEYAPchrMv8wpUhAarQoTFu19xK+oO747gwnoPj5SNSCPDYtktee0tVt
X-Gm-Message-State: AOJu0YwYaAfLoaM65WFemUZ1s9Y3JECqIp0OPMrhfUQm6KcKUF/tTWuL
	xwBq72RAtSCQcw60uYDbs7Ni4frCDvOS2P53imMz9OmK96FAapjVoD9GZsdC+tE=
X-Google-Smtp-Source: AGHT+IGJ5D/8YHeQidHdEpKROK/FOw4K97CAfABtSV0CK04hYyLyYdtbkd2DgCCxUap3/7WmNzvvWg==
X-Received: by 2002:a17:90a:9a96:b0:2b1:817d:982b with SMTP id 98e67ed59e1d1-2c1dc5701fbmr4453498a91.14.1717254289850;
        Sat, 01 Jun 2024 08:04:49 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:04:49 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 04/17] ACPI: scan: Refactor dependency creation
Date: Sat,  1 Jun 2024 20:33:58 +0530
Message-Id: <20240601150411.1929783-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080451_702407_E2FCFB2E 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index b325b297bf77..66038fc731fb 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2004,6 +2004,49 @@ void acpi_scan_hotplug_enabled(struct acpi_hotplug_profile *hotplug, bool val)
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
@@ -2026,8 +2069,7 @@ static void acpi_scan_init_hotplug(struct acpi_device *adev)
 static u32 acpi_scan_check_dep(acpi_handle handle)
 {
 	struct acpi_handle_list dep_devices;
-	u32 count;
-	int i;
+	u32 count = 0;
 
 	/*
 	 * Check for _HID here to avoid deferring the enumeration of:
@@ -2036,48 +2078,14 @@ static u32 acpi_scan_check_dep(acpi_handle handle)
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
