Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC81C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAgCb943OvR4jRxG+SKEnl9Nu6TdqXEXGuys7eh03FU=; b=nJlMX2NTXFS3F0
	X7lEXIYs0vUbW2Q2W+dRTMSFGFpkRUUuJZdhpSRLAlagojQD72LMBiE828k+DVIyXHItYLmiB64hY
	llHL8YGmbTDkXHyKp6o2iX4yXfC2jFwt2qbUMWUOn6YGBcOdbtPB6S1KPKkVoZoBB7GvMirueiypE
	09BODsN1NuW7m6OVNvJd+pS4MV/cEbRWa9Wi2QQ0BsJhDGifvPXwnYxzobWuKUds7PykU//uzMkSa
	juX7aR3Y5At2gSaUR2QrIqwSYgqjmypG95cDdQWzCAhK1V2rrKWksAJQ632441FHDxgQJ4R+fOoun
	flzooV7PVTYN1SdE2URw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR76-0010IV-21;
	Mon, 15 May 2023 05:51:16 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR73-0010GA-1K
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:51:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-52c6f8ba7e3so11276950a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129872; x=1686721872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWBNL8Yoxn6F5OA39mGQO+nKX7WWRbncPVBB9F2/Cag=;
        b=P5iXY6lKg2w2zAPzFqWsqzcPgrUcluhvD0qbjWlme23GRx5MQJkTL9q0qRcC1v366q
         hsHnCTsBwmZ8Ba+Cz99o2bUFiSrJEyjXoTt7DFhUiX8a26ecgDs3bQzU9I9E0Iav07EE
         Pe37wzQNFZwo+1/roBpAaaet/ssTvRyB7HOFU0gv0P5P6uwTlo/ZPfcsVL2iMTtKp9U3
         gTx3ebHH5xr4VkkEXDqjzyaTGeMqPmZEJdkkK3g3oVQjDMPthuIQYYGMnpQ05LivQrXK
         QfbnvcxaooHEfzjBfzEAGKne+mz+w2/I6TlIoxdhMRcwGZc51Qrlkfe+CzSpfJGr1Puz
         DhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129872; x=1686721872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWBNL8Yoxn6F5OA39mGQO+nKX7WWRbncPVBB9F2/Cag=;
        b=b4eTvbwF0eAc2o9tpvvTbnm82GiFTJJOA8LnfgqmWUsVkFtvqpFyaidDTpjbw3Ehf4
         YAJbKnMAwz8U8Gn06KKFc6Ydcl3K1N6FNXYvrJ4uQVw2/pvZPtbOFrtz82XIHxpaRzJQ
         WbGegdSndBAlRv886kecV0O7GVB19QU5Sy9/E/6NkOJYLFQG3d8lI/toF0v321YttFow
         aAaN2R7tngjaGfb0rL0k66xJL/ltlmQXdcZkl5UBWN75imejiDkFZgfBNTdkHq7oQZZd
         wbZ0kkuWBqRP2TiIqt3dz/GUMfa0+Ehi/I6hTXfSgv8YPchUiswmmDqxWHva1h4ytjRM
         IVRw==
X-Gm-Message-State: AC+VfDzwKyoXsKKHwFEwbIfGU7UbhH5EfOFtTtpy1UVwl4OR7eU6hKsl
	0ym2jiKwH4g+5tVP1eZy/1pv5Q==
X-Google-Smtp-Source: ACHHUZ4jYf4/QP9L3KSs4U0vKc8qwWvbMuz+31XECBf+Fvr/sjS5ltK2iCuZknMrrPIPjb8hjIs41g==
X-Received: by 2002:a17:902:e882:b0:1aa:f3c4:74e5 with SMTP id w2-20020a170902e88200b001aaf3c474e5mr40753396plg.0.1684129872331;
        Sun, 14 May 2023 22:51:12 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:11 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 14/21] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
Date: Mon, 15 May 2023 11:19:21 +0530
Message-Id: <20230515054928.2079268-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225113_445215_A05295F2 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On ACPI based systems, the information about the hart
like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
Enable filling up hwcap structure based on the information in RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c607db2c842c..6ba8e20c5346 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/log2.h>
@@ -13,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -100,6 +102,8 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
+	struct acpi_table_header *rhct;
+	acpi_status status;
 	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
@@ -113,22 +117,36 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
+		if (ACPI_FAILURE(status))
+			return;
+	}
+
 	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		node = of_cpu_device_node_get(cpu);
-		if (!node) {
-			pr_warn("Unable to find cpu node\n");
-			continue;
-		}
+		if (acpi_disabled) {
+			node = of_cpu_device_node_get(cpu);
+			if (!node) {
+				pr_warn("Unable to find cpu node\n");
+				continue;
+			}
 
-		rc = of_property_read_string(node, "riscv,isa", &isa);
-		of_node_put(node);
-		if (rc) {
-			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-			continue;
+			rc = of_property_read_string(node, "riscv,isa", &isa);
+			of_node_put(node);
+			if (rc) {
+				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+				continue;
+			}
+		} else {
+			rc = acpi_get_riscv_isa(rhct, cpu, &isa);
+			if (rc < 0) {
+				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
+				continue;
+			}
 		}
 
 		temp = isa;
@@ -265,6 +283,9 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
+	if (!acpi_disabled && rhct)
+		acpi_put_table((struct acpi_table_header *)rhct);
+
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
