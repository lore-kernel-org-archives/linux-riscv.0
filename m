Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97BC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJTtsTR/mEaD+4owORK3iaV+wc897VMS4hIbO/pIDcM=; b=jhBognrmlfk2Cw
	jn+L2TXXwHTXiDoz9Aymo8WXbZrlDWAOLUcjas57b/NIWS/mrf63LHYJOnCm009+oEfeXksB5aSJm
	titgWShNwX1i/d2PEJOKTyX0+EdAS9nk9XvxusLatfoe0IcOaeihBIk2/ZZS6f53OqO6Hat3oFEZq
	flJ5j6hHGAJq9SheSwN72ZTzl/uXHlTY7X+a2omQ2I82FkgICjSSi0/cMJpS01A0qpw895B9Us0Eo
	LK68VBG3zw5472AgGT3aKWWzvecPI/ari0whtBQy5rNhgf5GOawxb1bo2U+o+EjBwca9oTjRb0Ol2
	pzfavuqxTlPdxiio2K4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitB-00BTuG-6H; Thu, 16 Feb 2023 18:21:49 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSit7-00BTrU-U9
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:21:47 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d2so2703456pjd.5
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GipxeDCOyjMj8YF40M4Hg7LI5rDefQ4n1sWRXQ5Wf4A=;
        b=eEFXo/GfQ56r4rtPgsxzNpFtJ23EjjcqYMMKhNbgLjE2Uuuy6P1bpuyH7mca/UbFYP
         aBNx3N2EIanq/lyuvYX2QMPg6Z1XipqO6QH1D/VjXzNzHfwBixUTZ/HkyjgfC9haFo78
         Y12zsDunSkOjC4xURoqcxMZVCuD9ZLuBo70InXbPD6zU79CNTJXTYKIqcnJ1InzY+flJ
         //f7yL3N67uDxSS8o5mkf0Pe86BtKQRee5sbU4av6NbYmLZowEkxCR9khQ3johCdCu8S
         KY1xIiFS6em7YokS3n0jAZZwM4ZAuhjIaWBjjPllKiungJ3uK7QAE9DuaATKsqxVIfyc
         phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GipxeDCOyjMj8YF40M4Hg7LI5rDefQ4n1sWRXQ5Wf4A=;
        b=ymvQp3vWAz/0xRSdJRzIH/bWusQout3CmfVjnsZQvw3lsC2j63DicM7Nyx3LxE3ObX
         lTR03pmjZmizi7z2Wbb8elCPumsN43zsIxXpBm6alx1mMnOIZH55YFQ8hlp4cUQBqwkq
         aZIttC9Y8m7QzuxRDMbZ7bU9/fNvgCXyN7D6VfEbWqPgCrzMQAKm9OXSQgceAkJzbuJH
         wPkZpsl6bdHVMGKsFAUCaOnLwg/hI2nwP6ZrXbVXwmr7DkRNJhmDdh36CTG1mV6e2e8w
         uDQi1E+fx1XOYVDc9nZ194R6qEmdOIfkDoINHjIe57SCSmv+i/2dQ+9krY7w3jDJINZw
         k3tQ==
X-Gm-Message-State: AO0yUKX4UKL7qKmaStWR+1pEkzrlo41nL9Q0edfYMfRY25z1GvUj+i+c
	E/70EsemKlDjl9LQV3WR0FIFjQ==
X-Google-Smtp-Source: AK7set9k9++/QzvIRe1B3IRDZ869l6XRxNCvE+UR28XP1HGqhzjPmFL0xkUQqSpERzooLyWBhEFXjg==
X-Received: by 2002:a05:6a20:6a0c:b0:9f:3197:bfa1 with SMTP id p12-20020a056a206a0c00b0009f3197bfa1mr7989098pzk.7.1676571705447;
        Thu, 16 Feb 2023 10:21:45 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:45 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 11/21] RISC-V: ACPI: Add a function to retrieve the hartid
Date: Thu, 16 Feb 2023 23:50:33 +0530
Message-Id: <20230216182043.1946553-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102146_009662_F626EB9B 
X-CRM114-Status: GOOD (  15.00  )
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

The hartid is in the RINTC structure of the MADT table. Instead of
parsing the ACPI table every time, cache it and provide a function
to read it.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h |  8 +++++
 arch/riscv/kernel/acpi.c      | 55 +++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 3c3a8ac3b37a..b9d7b713fb43 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -67,6 +67,9 @@ int acpi_numa_get_nid(unsigned int cpu);
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 #endif /* CONFIG_ACPI_NUMA */
 
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
+
+u32 get_acpi_id_for_cpu(int cpu);
 #else
 static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 				     unsigned int cpu, const char **isa)
@@ -74,6 +77,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 	return -EINVAL;
 }
 
+static inline u32 get_acpi_id_for_cpu(int cpu)
+{
+	return -1;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 81d448c41714..13b26c87c136 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -24,6 +24,61 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
+static unsigned int intc_count;
+static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
+
+static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
+{
+	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return 0;
+
+	cpu_madt_rintc[intc_count++] = *rintc;
+
+	return 0;
+}
+
+static int acpi_init_rintc_array(void)
+{
+	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
+		return 0;
+
+	pr_info("No valid RINTC entries exist\n");
+	return -ENODEV;
+}
+
+struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
+{
+	static bool rintc_init_done;
+	unsigned int i;
+
+	if (!rintc_init_done) {
+		if (acpi_init_rintc_array()) {
+			pr_err("Failed to initialize RINTC array\n");
+			return NULL;
+		}
+		rintc_init_done = true;
+	}
+
+	for (i = 0; i < intc_count; i++) {
+		if (cpu_madt_rintc[i].hart_id == cpuid_to_hartid_map(cpu))
+			return &cpu_madt_rintc[i];
+	}
+
+	return NULL;
+}
+
+u32 get_acpi_id_for_cpu(int cpu)
+{
+	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
+
+	if (!rintc)
+		return -1;
+
+	return  rintc->uid;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
