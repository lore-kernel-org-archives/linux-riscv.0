Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351BC4829B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 03:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Upx/odMyGs+5YSpl9GETv9+lyaD9hyjb+itiMNF8wt8=; b=z2moND8E9c2DmK
	IeLauAA75L4CThur6oquMH7HseUQcRtNK0VyhH/QcmmJVO1dDMy4Efj7b+L41xrJpYIcNebFMAORz
	GJzYM5m95qTzXW1cm2mr5HciOx4c/bPpmjUiU1V8V9Vup8k+huDAyvZspzoj2F1T9njvMmbebF7pF
	Z83a5g7Z4ClI/AD4fRrm2huekAwqPbCbd1tmdfWprx659yE3ltiWhiMvUrLZqBEfWLm+3UWIZLj+f
	4AJp1yNUpyksEDe9b4kjDnSV0yBso0IXxoHOI3Mi5rxL782lLczmJR6V+nH22t78tf43g3EYFM5GU
	3A1TFjUbg73V3VhHmvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvL8-0000000CZW0-0e25;
	Thu, 08 Feb 2024 03:44:42 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvL5-0000000CZUf-1Mrk
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 03:44:40 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-204235d0913so778681fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 19:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707363877; x=1707968677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yizVqarSWst4aU/Dh5XxoRIOdJJxEsR3ATXXBPWi+lw=;
        b=MmyWRy7yVD33cRTzvjCka66l/ieUEscC7zO2OmAq0nsKj6xQzYphYQdgiWVevvYZUz
         nNrFnuJJwRL5SEl2pqxfqH85S9i+Sv0ZoClfqp9365NND0amN7idkFWTaOev43YkGyq3
         wohrNfZdH1tIP5wtBVYF0Q7iQUQF8YkjJYWqNhBfXPS5pgb3IxtYjT7sdQhbv+7JL3TI
         5OX4C8RD0xTdLZd+wCzVQWOVpdgcoS8vtw7jHDeJjOJGR8zefMjVJ/5whogLTORLSw9K
         4UqtPwszQm+TbA3PTbjjlZzm/I5LcPJZUOHygure0fSJTrJz7ZSEAQA2maq25Kvk4NGA
         OA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707363877; x=1707968677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yizVqarSWst4aU/Dh5XxoRIOdJJxEsR3ATXXBPWi+lw=;
        b=iJJJj13ADOHh01XeieI7ARRJbKZpKT3Lxqh53U0BwX5U45zvsXAurgeAWvHvisv5MI
         RpEUW4/k+Y+Q4OTDbDRWHzHdnhPBwj+pIZb9egvL/48e6L5DDAfsrMp/cxFI0bM7W8pO
         7TelfCDr0x9zrqjWzk2hQHOjD/1rBuLKjTVF4mC+tmx5iX+4+p8aeioob/ANuKOqqOlP
         goG0GNUBovThxLXY7Tt4XzZLln7q+sNWx/EcO3YO88mvn7nJs1g5aYbT0jHQ9EWhPk6w
         Ineci+5yhqXYdOT57s2XeYt2n89V3UFfyZfaYyjmy7BSQUNPhzFeKS8+6MhZ2rm3Q6rt
         CAVA==
X-Gm-Message-State: AOJu0YylURiIF4gwlfmi9fmX1kMW8h+V3pHvlZcP/6HnqdAYcJysAjwd
	3Pptfa6p099+XybqKln0chl8iBxwqieheDiHTAKx7kmp8ITeKaXd/qBsgkIpkJPcwEfW26FMmIK
	7ibg=
X-Google-Smtp-Source: AGHT+IFOtpxyVrCmmf5j/9YheBJxdbKCH0Y2umngPfrW1aFy9KUJdJOkdmzNUcIURse5wbX8fsh1xQ==
X-Received: by 2002:a05:6870:1681:b0:214:269d:785a with SMTP id j1-20020a056870168100b00214269d785amr8743371oae.53.1707363877181;
        Wed, 07 Feb 2024 19:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWn8ZEOAjgnL+Jx4yBkYXCD5ALrkdT7ucfJBWU9DaGB2ywmBZjUnJW6ow7WqR3G5rX3vuzL+eJ3RulTStUSDcL6jTeGuOk3FAVNlVnC0cHJTRByIsx6ubfO/gOQZMro5pxY51D8WO++N/TlH4xtf6GZXlM9Gf918L6ENzgiQLyRny4viixyAPlBjxsHJhUAv0Piws3gr0ZQW9i59dTiUNVeyppZzrAk8QVeI7WGKSJifX9yCAMtJHGbo2VLVAojonpd6MgisF8Z5E9IzHJzW+dhkdwmd6QYg2A//29RZOG1h2iccMu5ipJIdI53iunhTFmAoqliiCsh1GE/HZw/by+qJK5lNPuWPMAa9JRdOt13fgFESIsvB0mUnrVa5rAciBlKP7ZYVbJlNXcTyUUa13pQUuEXUArgsWwcCT2jalgwb9YH2imqeDU0D76YTcY2hNgj0KYf
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id g10-20020a056830160a00b006ddbfc37c87sm443595otr.49.2024.02.07.19.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:44:36 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 -next 2/3] cpufreq: Move CPPC configs to common Kconfig and add RISC-V
Date: Thu,  8 Feb 2024 09:14:13 +0530
Message-Id: <20240208034414.22579-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_194439_402178_551A349A 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CPPC related config options are currently defined only in ARM specific
file. However, they are required for RISC-V as well. Instead of creating
a new Kconfig.riscv file and duplicating them, move them to the common
Kconfig file and enable RISC-V too.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/cpufreq/Kconfig     | 29 +++++++++++++++++++++++++++++
 drivers/cpufreq/Kconfig.arm | 26 --------------------------
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 35efb53d5492..94e55c40970a 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -302,4 +302,33 @@ config QORIQ_CPUFREQ
 	  which are capable of changing the CPU's frequency dynamically.
 
 endif
+
+config ACPI_CPPC_CPUFREQ
+	tristate "CPUFreq driver based on the ACPI CPPC spec"
+	depends on ACPI_PROCESSOR
+	depends on ARM || ARM64 || RISCV
+	select ACPI_CPPC_LIB
+	help
+	  This adds a CPUFreq driver which uses CPPC methods
+	  as described in the ACPIv5.1 spec. CPPC stands for
+	  Collaborative Processor Performance Controls. It
+	  is based on an abstract continuous scale of CPU
+	  performance values which allows the remote power
+	  processor to flexibly optimize for power and
+	  performance. CPPC relies on power management firmware
+	  support for its operation.
+
+	  If in doubt, say N.
+
+config ACPI_CPPC_CPUFREQ_FIE
+	bool "Frequency Invariance support for CPPC cpufreq driver"
+	depends on ACPI_CPPC_CPUFREQ && GENERIC_ARCH_TOPOLOGY
+	depends on ARM || ARM64 || RISCV
+	default y
+	help
+	  This extends frequency invariance support in the CPPC cpufreq driver,
+	  by using CPPC delivered and reference performance counters.
+
+	  If in doubt, say N.
+
 endmenu
diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index f911606897b8..987b3d900a89 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -3,32 +3,6 @@
 # ARM CPU Frequency scaling drivers
 #
 
-config ACPI_CPPC_CPUFREQ
-	tristate "CPUFreq driver based on the ACPI CPPC spec"
-	depends on ACPI_PROCESSOR
-	select ACPI_CPPC_LIB
-	help
-	  This adds a CPUFreq driver which uses CPPC methods
-	  as described in the ACPIv5.1 spec. CPPC stands for
-	  Collaborative Processor Performance Controls. It
-	  is based on an abstract continuous scale of CPU
-	  performance values which allows the remote power
-	  processor to flexibly optimize for power and
-	  performance. CPPC relies on power management firmware
-	  support for its operation.
-
-	  If in doubt, say N.
-
-config ACPI_CPPC_CPUFREQ_FIE
-	bool "Frequency Invariance support for CPPC cpufreq driver"
-	depends on ACPI_CPPC_CPUFREQ && GENERIC_ARCH_TOPOLOGY
-	default y
-	help
-	  This extends frequency invariance support in the CPPC cpufreq driver,
-	  by using CPPC delivered and reference performance counters.
-
-	  If in doubt, say N.
-
 config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
 	tristate "Allwinner nvmem based SUN50I CPUFreq driver"
 	depends on ARCH_SUNXI
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
