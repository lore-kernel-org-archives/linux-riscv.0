Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42283C04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUEaS01YSO4Ss2b5TjPbS8aP5SQQpgaf+eEzC7K1D5s=; b=TVHOtKOy4caIl3
	gKuyMyvTuowmofuTPEcMGtOki2XUlQcRDcwf0AqqchpYsBbbij4ravwI2Z7zNWwAP0/nmSJ3AugWP
	5ea/t1Nq9DlB/7BAY0ouq/97aPr/LsVKlOA54siAt4uZG6D2IDD3f3JdJwnnHDyYUctpqkKY8EJ6n
	50UIgb5J/9HUimT4JsRVoXAMrFKh492wK5NcUW7Fqo21yquzDvn04GCp8J8rIoNh9jUNFn6+yd73F
	wy1vEJdF7Q0FPZKWtr3+dpHzDeMNXRuqGVRHP6etVBaOnb13eVAbchLHTJLiB3RaaCEeOl1gdamKM
	2ENFBf9UcBICceWsZwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPkU-00000009D2d-2NeC;
	Mon, 15 Apr 2024 17:04:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPj4-00000009BvE-3o4Q
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed627829e6so3793131b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200558; x=1713805358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1X7evQ35uoewh1RNAGJwcs/iaU3rzDK4qB90vlKVhs=;
        b=TVAvIrfMtQduvk8zQ40e/OYjUGhMHJKGQ2zUVoNQVPGbvqTUBCTa+WQAv3nXzOMqtj
         Af7MQ0ElKh/vJfTdwMo6ppGoVSJ5bFFU+s6bOA7ym+MYLgDJEjk4vGMHQxvroSWeQQAj
         aufJUtspWr/lYWGgYuzEY1go+yUG/UNG6S6dgn76rNFEME49K7kbSxUC2aXLFF+hYhkw
         uQtBy/yBRPMk8/nNjF81v+HbkPa1Y3GFKs5+ijF7meQtD8duDHL+S5dXEWVwmB7QUlSx
         b0kcXnxZ4jK/PDajEyE8FKzJu18Hrb2Tif9sMrioNOdPjUQCsTi06uPz0r8Q2bd0BuCb
         dWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200558; x=1713805358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1X7evQ35uoewh1RNAGJwcs/iaU3rzDK4qB90vlKVhs=;
        b=PRgN3YwQOWXCOfhVvv2hVB1EWCeXXXb4U7UW4h9PBppYgteJ3Nw6uNEP4v4W6fwWEq
         qwnrgPFzkSoPejiSG4cRbo/eMuwo3isbOhpV7WYyWzbHpGoQoJb9o6Z50sHUd4kpZt8N
         aDNZtbFQAHmwTc3GMCSDY0kY8Oxlv687d9KwNJniKTIVSk1kpLABaEddA+2vaXeamhKy
         5vTFWT3jvmtDOvKlNdujxLmqnHKMOX/uAZL3/aausK33jeEJaSTLc7z3oGPlnvb8Gv8J
         dpfChzfTFCfN2vv/EzLMv+1luFawowx6MWUz1+g98U4pYu0/MAOeReHafFow8dW/MNRa
         69jw==
X-Forwarded-Encrypted: i=1; AJvYcCUxZaaX5HA8iY1ZDj8LQS9Q4V5Ewh/LpGedmOA201scFeSBZVdKky/dTmVe6WZaFncmq6ErhqTQIA6L52tBFbXSQSWBx5b7jgYYgDy/9BTi
X-Gm-Message-State: AOJu0YzsUQAZxB3CoOxdDe7UQd3rRSNsk7pQq9oikQ2hgFYqGPp695/b
	2MNFisKy74zBohzpWlub4MapmCzdVJqpMwVyCuWYzOwme4EzBqBtKmhGpiQj1Uw=
X-Google-Smtp-Source: AGHT+IHP5Rv0C3YxWinnwyj54lMdddb7BaD0yQpP0Yg8Qswii7cMjohW9Wcp53K9v1it+Ov4jHo51g==
X-Received: by 2002:a05:6a00:181d:b0:6ec:fe26:4ec1 with SMTP id y29-20020a056a00181d00b006ecfe264ec1mr12412388pfa.22.1713200558011;
        Mon, 15 Apr 2024 10:02:38 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:36 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 11/20] ACPI: scan.c: Define weak function to populate dependencies
Date: Mon, 15 Apr 2024 22:31:04 +0530
Message-Id: <20240415170113.662318-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100239_219065_B0E9BEDD 
X-CRM114-Status: GOOD (  12.90  )
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

Some architectures like RISC-V need to add dependencies without explicit
_DEP. Define a weak function which can be implemented by the architecture.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c     | 11 +++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 07e91616b7d4..8e23b9508716 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -2073,11 +2073,22 @@ int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices)
 	return count;
 }
 
+u32 __weak arch_acpi_add_auto_dep(acpi_handle handle) { return 0; }
+
 static u32 acpi_scan_check_dep(acpi_handle handle)
 {
 	struct acpi_handle_list dep_devices;
 	u32 count = 0;
 
+	/*
+	 * Some architectures like RISC-V need to add dependencies for
+	 * all devices which use GSI to the interrupt controller so that
+	 * interrupt controller is probed before any of those devices.
+	 * Instead of mandating _DEP on all the devices, detect the
+	 * dependency and add automatically.
+	 */
+	count += arch_acpi_add_auto_dep(handle);
+
 	/*
 	 * Check for _HID here to avoid deferring the enumeration of:
 	 * 1. PCI devices.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 28a9b87c23fa..5fba4075d764 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -994,6 +994,7 @@ static inline void acpi_put_acpi_dev(struct acpi_device *adev)
 int acpi_wait_for_acpi_ipmi(void);
 
 int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
+u32 arch_acpi_add_auto_dep(acpi_handle handle);
 #else	/* CONFIG_ACPI */
 
 static inline int register_acpi_bus_type(void *bus) { return 0; }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
