Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80BC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kak9EHll09kOhbhiPyDGRSSOtqIQVyBjPBkloSLePJ8=; b=iMvLU/fSSP5Wsv
	7vds+VgXGeDFp9x2Sq8LdNi1W84Hya9K/4RZXN3f2rpiOpo2VEduuzn38bffFDem98JFo+67M6a5u
	WlVWLFbuTzgXo0DX7hvdpuMFuSLeGVvLLN5B8hLme7gfmgjhoxwdiuiCFoCgXTuuRRrkJZroXhqfM
	9OAwocMvH1K2UoPLnKTYKRZLdIdWnEhEUk3RPpiTVPA1WmAcujlAN+zneYHP5tCxgKgxrN1h9lwrO
	Zr6OQC02bI3RJZP6OAN4o5mC37WVgIkpmuNUmIiOakecaLJBWE9GDvE2/m4Npiss0sUd2CR/CJjmE
	3D7m0YGY+6cE1+F21uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5av-006Szj-JN; Fri, 03 Mar 2023 13:37:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5as-006Sy2-Qh
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id i10so2646166plr.9
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T/9WMqfcgE40kVyTz05I09P0F9v/Zdvsnucdf4/Z5g=;
        b=NsVd952i/BHZBhEFqPB0CAAyWi/gm50kIMdyScloUumg7SedUmZwt9NFLFXnHXRstK
         xSS9oqI2a3GEV8qhMfvyEd2+/NW7qwvLoPj0XNSHXrPDT9E4wsGk5pV3jih95QcRlZMq
         a2YOhycG8NXvRU1jQWU3UmOrzvaRIGqGS42jrf0uNC2QGUsKgI1zTf+FzjVqolzhbuVi
         2wSCOEIgqpTAfAg8f6M6zh+chDDp2slPoCttzUnRmEVLtfahqhcOKVYL7C+YgQ0Yid3A
         3xq1z3Zy+0n8jd7leTKw3dXpLsQOsP/3WU/fWMbgxEbENIDTkPRjRsml2JeVL6CbPs3o
         6wVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T/9WMqfcgE40kVyTz05I09P0F9v/Zdvsnucdf4/Z5g=;
        b=kKBYlJTsYfPvALKgPQh9uyswbtspru8GEGSFuq89yEPAwgRglvEoSwP5N79XoUHlgE
         feYgOQ4+c+jPq/ZFfdq25KqUkTb5JWfr+fgoHSVwp3iN99THB0kCKf1HUbXw3Cp/mj3b
         qlBpIHwcT/l9v1pYlMi+2V8GXQHihHJZGMCmtmp4+9gYqnkbmSdJpt49m7s1IMQvav82
         vV/N9wZ7qpFJmI3/ojlygqumqviLUYEYb4GJDy6fS4MPhllpymP+fwcpiAgad/eCfvpf
         PKN7+qzOQyQ1azM9EttH+hzfKvh3ZXtK2yQWj86MaUF7EI7e7gxqF8FG2JcYlNoQ4Y4H
         O7bw==
X-Gm-Message-State: AO0yUKVKFWsUtfLOb8ikZ9Df/I+8JItdcJf7afop3tsjGyt0R3lEcZ2Y
	oFgEHPJiWT9kcDepmy1TkiSgoMaZsAVPyc8J
X-Google-Smtp-Source: AK7set/z+6ZDiuui1utUYmSP8L/BHBH6V9+rO88q1JXkWBvdwaOSKgOqxNmja+IPl9m9DmzFf99T8Q==
X-Received: by 2002:a17:902:c389:b0:19e:7880:a5a with SMTP id g9-20020a170902c38900b0019e78800a5amr1801585plg.39.1677850624920;
        Fri, 03 Mar 2023 05:37:04 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:04 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 02/20] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date: Fri,  3 Mar 2023 19:06:29 +0530
Message-Id: <20230303133647.845095-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053706_910391_686356AA 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, acpica-devel@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be available in the next revision of
the ACPI specification.

This patch is not yet merged in ACPICA but a PR is raised.

ACPICA PR: https://github.com/acpica/acpica/pull/804
Reference: Mantis ID: 2348

Cc: Robert Moore <robert.moore@intel.com>
Cc: acpica-devel@lists.linuxfoundation.org
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..abb700d246df 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,   /* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;  /* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE       = 0,
+	ACPI_MADT_RINTC_VERSION_V1         = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED   = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
