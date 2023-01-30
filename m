Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F19C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGR4t+xHOrjwfnOWcqDCqN4uFxYdHEI413hdUns0xI0=; b=A6riewy4T7iXXd
	FLKnx65uYnax5YvWYA+6wCBJQ8uy/+Jvsr/y5pmHtSegz8dwy+wGvm94q2bIWuXjLlhWhkUO1Z1nk
	uqSwDRhybE09Gf1IrtH/Oe4JfF2qqMFxKYuTN35GnUfTGJYZUlwFdkCslheshgGHqB/dWEjO2oexP
	/WoizmYDv4Lj5lT11JXbNSxvrCg7EazttVIdme6KCIHoFLLEvKQVXn02o45p5Z1BV/VPwRnVprezH
	y/NqvHDpGaTrql/6h40aTfsvIFPNzwrZSkm97OmZMLKwo+w0Av2eh9NFbQYE3aYs2SELxf5iLr5/x
	5toO3nxHtttW2wJs2zkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYrF-004ygy-EJ; Mon, 30 Jan 2023 18:26:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYod-004xCQ-Tr
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so11966180pjb.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoNsoxjlD8YqMSH0pVqFEhvuCFLj9XoDBF5p4r2NIfw=;
        b=iDP9c7ApKkeB+Xt1IY5/R1iq7FKDBdju6Gcvu0MaOJbVMwIYqvi+FcQp3Rhci/cc5J
         KoQD04jyy6VO99ZWoK4TcBtQinWwKlBtUXVq3L7bE9PuU/ZVfJG9ZCmXLl+WB4X4i4VW
         BQpf68cV9//tP+mZrgsx+74mDrgOxMSmF+WLXD/OqoqKebupmq+dwbG9DqtQJs/RxbTS
         8jSuMpnxiU8ENHw7dfJQKKAbDN77oYx8eR8SpY8zpqyoTO6+8cAjE6RwhM5HRoLPSZFa
         LiT0HjazTXTYtwFYqfZkPowj9WignKTXYrWH5vPlbv3ghQ6swvcBM1zRLcTrjOuNKGfX
         v3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoNsoxjlD8YqMSH0pVqFEhvuCFLj9XoDBF5p4r2NIfw=;
        b=t470OdMgf5Wv1PnhveIvEgmEZvlWqaNM6N/kqnBIlPgVBi0N/7n7Z/3ZTCuuhYiZ9+
         iEkvXFjrWPwO+1kidje637KAmQOoEQv3+DjFDITmilHelJoFAwKp4CmSZAJl/COtwVay
         G33+HgBr1razo8ieL5OnlFY7de0gREq14Ee45bOYH6DjR/EEjMFb706pKuKh0jPY2wXV
         qUY/AaLV6lfvgjNYI+C3IQBmV/Qzipq19cJ9yJMpSHe02eXDnEQ7UAvQrPH4Kk+kCf/I
         lBdis1kfsTJfm1YXO5bnLQcz8VdBmjLAt++ktA3GfNDSs4Dfa9SgmtK7wWP8PtdrA/yK
         Otrw==
X-Gm-Message-State: AFqh2kppjHvCxQCm7cU+tH6HMfUTC/5h3Up486kfXqAZRZRxeOvHfNLM
	Mt7R445sh+WngDE6mCPvztzBxA==
X-Google-Smtp-Source: AMrXdXsri6EFFpQDUL2InJo9z3j/bCDEJMfcZoHWyztBdQ136ASsttq8Z8Ti99sjosyysKb91k/I5w==
X-Received: by 2002:a05:6a20:8f02:b0:af:c871:bf4b with SMTP id b2-20020a056a208f0200b000afc871bf4bmr70215553pzk.26.1675103018053;
        Mon, 30 Jan 2023 10:23:38 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:37 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 14/24] RISC-V: ACPI: smpboot: Add function to retrieve the hartid
Date: Mon, 30 Jan 2023 23:52:15 +0530
Message-Id: <20230130182225.2471414-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102340_029331_3D285AFF 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

hartid is in RINTC structuire in MADT table. Instead of parsing
the ACPI table every time we need for a cpu, cache it and provide
a function to read it.

This is similar to acpi_get_madt_gicc() in arm64.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h | 14 +++++++++++++-
 arch/riscv/kernel/smpboot.c   | 21 +++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index d1f1e53ec657..69a880b7257a 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -65,6 +65,18 @@ int acpi_numa_get_nid(unsigned int cpu);
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 #endif /* CONFIG_ACPI_NUMA */
 
-#endif
+struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu);
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+static inline u32 get_acpi_id_for_cpu(int cpu)
+{
+	return	acpi_cpu_get_madt_rintc(cpu)->uid;
+}
+#else
+static inline u32 get_acpi_id_for_cpu(int cpu)
+{
+	return -1;
+}
+
+#endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index e48cf88d0bc1..3a8b7a9eb5ac 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -73,6 +73,25 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 
 #ifdef CONFIG_ACPI
 static unsigned int cpu_count = 1;
+static unsigned int intc_count;
+static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+
+struct acpi_madt_rintc *acpi_get_madt_rintc(int cpu)
+{
+	return &cpu_madt_rintc[cpu];
+}
+
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	int i;
+
+	for (i = 0; i < NR_CPUS; i++) {
+		if (riscv_hartid_to_cpuid(cpu_madt_rintc[i].hart_id) == cpu)
+			return &cpu_madt_rintc[i];
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_rintc);
 
 static int __init
 acpi_parse_rintc(union acpi_subtable_headers *header,
@@ -92,6 +111,8 @@ acpi_parse_rintc(union acpi_subtable_headers *header,
 	hart = processor->hart_id;
 	if (hart < 0)
 		return 0;
+
+	cpu_madt_rintc[intc_count++] = *processor;
 	if (hart == cpuid_to_hartid_map(0)) {
 		BUG_ON(found_boot_cpu);
 		found_boot_cpu = 1;
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
