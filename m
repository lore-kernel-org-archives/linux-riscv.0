Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0825C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KBMbvaTM6PlkF2LwSt25V7uJv+TYJ0hq4FGGDBus54=; b=b2vD6YWnTKtg80
	Vz96XV+g8vJwAAiWb6lbb3bzHg/LEp1aEWMY4KSk/yrw6rNRGCXZWgf6amzKU5sulrPKX57Z4jrEm
	NnZE2IsU9BUBun4H4EawcyGWgCL5CrvDarTkrzOZx/OkeNpeUhNuVrbRuGXVi5Gthwfn19mDmKyG+
	M0l6mPQBQG5Q26BTtjpX7fTa3TRbZhLhwsyYIPa3sNT+PPwKNR7fWt/RZySqOmrcqXjEMdhPrVEx9
	72BJ2HPKbuYtJHcrlpt7WzP2uY32KmfLjV7XbYSP9cIECBT1h2nGDxZR8nRHuTs95TyJ67l5zt/fz
	Km5QUdotJPmUHcnzipSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccm-00AUwU-32;
	Thu, 03 Aug 2023 18:00:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcck-00AUuY-29
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686ba97e4feso1110602b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085634; x=1691690434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQhuhHdTYaoWEXKHMdQb/AIiT1M0AyktuFOnKoEYTGc=;
        b=InAgb86bmzIXD9aMahgzQO9of8OqAMtZa6GKa8YVTVY7PzoIGrnFhABT5iR9yUDpdb
         eldlLfYqaIJZ0JqKhkz88GT1tI9U1PbaGlbsR4bWfCh1DfbR0ACTXckiDCh17sNzcRLf
         f2WV3qxyJ/rWBuGW2ue4ffM6KV/QUAchCeozTJs9q5S/XcNQOsvfIpSb1jVFwiZ6oFq3
         jlj10cncisuVGqqhaz2WZx3F8TaIGK9I5NjfThtEaXa1XobxVSAqQwN9SPkmA39vlFlT
         61lNiezvzG66VfjvuK2JSEbbCShorb/rqB7QdxU1TuTKXQUwQJNjJ66LD7fLCbx8z4t0
         5PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085634; x=1691690434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQhuhHdTYaoWEXKHMdQb/AIiT1M0AyktuFOnKoEYTGc=;
        b=I1xO2FnOSgMqeWFbelag9dEn3RpTmoxRjdG/4G7cmleeRzMqDC75NeYdaoNtbozp1B
         vtXh0EHR2AIN6NO1nfzdpwyDDPzy+nt/MC7pJ3zJWdNfaIgvU2vk31eeUKQOlcnyNeLv
         u99IZnp7fTtpHs+6PfByTsJnzrTJ3hJ22CQemOoOaJc0tIV5jdMKhwb0UfW09r6x8jo6
         7H2/BZKT4ZqsEoins91WAE2D6mYkLie9p/huFfocsvgd2I9muX+qXxGHq3/7Y4wU5KXb
         Ms5/aycoYaHNfTrQ6/fzqAyDcJFne1/22B+1cW8EiaBkOXI56cWMpHRi2LHRmOd18uNe
         ux/g==
X-Gm-Message-State: ABy/qLYFe40LcLy0CLumC00gbYZQ7kXyccm/0G8K3SeW31jbsb1HMjqK
	EY3FrnB26QvL65O7osJx1N5+tA==
X-Google-Smtp-Source: APBJJlFH8jQEzxXg6hi15nylBcj+0LbOiklmHj6H9WKQlfFcoVNBUAfYIpWWjK+zKN9M7HAojMJwCw==
X-Received: by 2002:a05:6a21:6d95:b0:134:4f86:7966 with SMTP id wl21-20020a056a216d9500b001344f867966mr25365705pzb.9.1691085634213;
        Thu, 03 Aug 2023 11:00:34 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:33 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 08/21] RISC-V: ACPI: RHCT: Add function to get CBO block sizes
Date: Thu,  3 Aug 2023 23:29:03 +0530
Message-Id: <20230803175916.3174453-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110034_715969_76E0A847 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CBO related block size in ACPI is provided by RHCT. Add
support to read the CMO node in RHCT to get this information.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  9 ++++++
 drivers/acpi/riscv/rhct.c     | 61 +++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index d5604d2073bc..0c4e8b35103e 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -66,6 +66,8 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
 
 static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+int acpi_get_cbo_block_size(struct acpi_table_header *table, unsigned int cpu, u32 *cbom_size,
+			    u32 *cboz_size, u32 *cbop_size);
 #else
 static inline void acpi_init_rintc_map(void) { }
 static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
@@ -79,6 +81,13 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
 	return -EINVAL;
 }
 
+static inline int acpi_get_cbo_block_size(struct acpi_table_header *table,
+					  unsigned int cpu, u32 *cbom_size,
+					  u32 *cboz_size, u32 *cbop_size)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /*_ASM_ACPI_H*/
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index b280b3e9c7d9..07309525f277 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -81,3 +81,64 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 
 	return -1;
 }
+
+/*
+ * During early boot, the caller should call acpi_get_table() and pass its pointer to
+ * these functions(and free up later). At run time, since this table can be used
+ * multiple times, pass NULL so that the table remains in memory
+ */
+int acpi_get_cbo_block_size(struct acpi_table_header *table, unsigned int cpu,
+			    u32 *cbom_size, u32 *cboz_size, u32 *cbop_size)
+{
+	struct acpi_rhct_node_header *node, *ref_node, *end;
+	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
+	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
+	struct acpi_rhct_hart_info *hart_info;
+	struct acpi_rhct_cmo_node *cmo_node;
+	struct acpi_table_rhct *rhct;
+	u32 *hart_info_node_offset;
+	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+
+	BUG_ON(acpi_disabled);
+
+	if (!table) {
+		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		if (!rhct)
+			return -ENOENT;
+	} else {
+		rhct = (struct acpi_table_rhct *)table;
+	}
+
+	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
+
+	for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
+	     node < end;
+	     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length)) {
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
+			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
+			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
+			if (acpi_cpu_id != hart_info->uid)
+				continue;
+
+			for (int i = 0; i < hart_info->num_offsets; i++) {
+				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
+							rhct, hart_info_node_offset[i]);
+				if (ref_node->type == ACPI_RHCT_NODE_TYPE_CMO) {
+					cmo_node = ACPI_ADD_PTR(struct acpi_rhct_cmo_node,
+								ref_node, size_hdr);
+					if (cbom_size)
+						*cbom_size = 1 << cmo_node->cbom_size;
+
+					if (cboz_size)
+						*cboz_size = 1 << cmo_node->cboz_size;
+
+					if (cbop_size)
+						*cbop_size = 1 << cmo_node->cbop_size;
+					return 0;
+				}
+			}
+		}
+	}
+
+	return -ENOENT;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
