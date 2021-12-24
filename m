Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFE7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qO6I2xnFz7Q9uBu6WGxjyLXcL8RvxkNVb6csRj6fmD8=; b=mC01PaAC6Lo0/g
	rRzrT7YGQTNFVDmFN5F5GoYizORQAQGl3yP8xJuXC/hVljJW+UngXIyXxgOGhDF/vcP/LyiVlQzk6
	6hpxTnzTVGG+ItOOg6jpBT5a1yiUBbz9iUu4LlT4UYKd2mzXyKNzOenZb/L9BuNe5BA+YFy8AghFg
	ZPgsFCk/6d/o69cJGswaMhLO6ix8YHPjKL3XDgHXDEt9HWgbdZVXd4KR+iBDrHCwYJqdEYAIMI0bJ
	QRS293wDdf9sKSTzLSoAEq+0vNIVgiMDu0tYe0cV4OdWLGda1BkTFVWBrYTDRSTgdnHlfAGUpaHGk
	tkT7RYJOEF+9UQtM/Tlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0rvp-00EU1X-T6; Fri, 24 Dec 2021 21:16:53 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0rvk-00ETzx-O0
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 21:16:50 +0000
Received: by mail-qk1-x72b.google.com with SMTP id 202so5454050qkg.13
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 13:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+k6g6JlrIfcxxWMuQQr33x18oCFILLAWvp8/ErctMA=;
 b=jv9t5FIyUfMOde3o1YlP5JI0fJI79OjfQY6RgskRZByIg45qlPTah/xoqym6gz//Fx
 rojQ0u3cE/Nq5ZEjzBy6tizapzsKqLwXlcioNoprBMVDBMBwlNCfGDKhUwRiqK9++yDK
 mmqB8Zi7q7F6j/RXM2CaBAEBA4PnYB3fnPsWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+k6g6JlrIfcxxWMuQQr33x18oCFILLAWvp8/ErctMA=;
 b=RLXamQj+pZRJHQbR8MzIFACb3CJ+O93RIKqow4/bQjOzI+TC3RkHKlf/W/LCprC4Zx
 6fPHfWzWoECCoxhSCCREMM0Bd3nOMSwV68l1acefH+TqHocouJ0iaOzUvZM1alEaMxAi
 38qWBYnxtqvrdH4RqFp26KUIZXyjGfmhhBgKGoqfjxzS9vxvdF15y0I9da4ESKJnyCZP
 8gsSNZGJMpS7ZN81HDnzK7QUy4PCPqzugqOhzxyv4G3624CIG07Ocz/ImuVICA1qqpEx
 ptAyojFGCQpGGed8/o1pPM/oD/1RexutA2/p17f5Oqdhu4LNkmZIzQc2+hqj+IZuVjKE
 laGg==
X-Gm-Message-State: AOAM530MFf2gaC1uWmmFNNJB7+eNVMoyEzy4A05m6ogej5I0U+igQbo3
 Oake50ACFP4JCV1UvG1oKfvt
X-Google-Smtp-Source: ABdhPJykMDrDOSXKAI7A/D9ajai9cdjvdmm61Wa+ZPCMv3KaLxq1QxD00vvNiQNHHjPVr9XWxH3Ehg==
X-Received: by 2002:a37:2dc4:: with SMTP id t187mr5930769qkh.208.1640380607131; 
 Fri, 24 Dec 2021 13:16:47 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id m15sm7661069qkp.76.2021.12.24.13.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 13:16:46 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 1/2] RISC-V: Provide a framework for parsing multi-letter
 ISA extensions
Date: Fri, 24 Dec 2021 13:16:31 -0800
Message-Id: <20211224211632.1698523-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211224211632.1698523-1-atishp@rivosinc.com>
References: <20211224211632.1698523-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_131648_811585_2EF98F4D 
X-CRM114-Status: GOOD (  20.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Recently, there were 15 specifications/40 ISA extensions were ratified.
Except hypervisor ('H') extension, all of them are multi-letter extensions.
Going forward, there will be more number of multi-letter extensions as
well. Parsing all of these extensions from ISA string is not scalable.
Thus, this patch provides a DT based framework to for easy parsing and
querying of any ISA extensions. It facilitates custom user visible strings
for the ISA extensions via /proc/cpuinfo as well.

Currently, there are no platforms with heterogeneous Linux capable harts.
That's why, this patch supports only a single DT node which can only work
for systems with homogeneous harts. To support heterogeneous systems, this
cpu node must be a subnode for each cpu.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 31 ++++++++++++++++++
 arch/riscv/kernel/cpu.c        | 16 ++++++++++
 arch/riscv/kernel/cpufeature.c | 58 +++++++++++++++++++++++++++++++++-
 3 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5ce50468aff1..368ab0f330c8 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -34,7 +34,36 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
 
+/*
+ * Increse this to higher value as kernel support more ISA extensions.
+ */
 #define RISCV_ISA_EXT_MAX	64
+#define RISCV_ISA_EXT_NAME_LEN_MAX 32
+/* The base ID for multi-letter ISA extensions */
+#define RISCV_ISA_EXT_BASE 26
+
+/*
+ * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
+ * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
+ * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
+ * extensions while all the multi-letter extensions should define the next
+ * available logical extension id.
+ */
+enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
+};
+
+struct riscv_isa_ext_data {
+	struct list_head node;
+	/* Name of the extension property in DT */
+	char dtprop[RISCV_ISA_EXT_NAME_LEN_MAX];
+	/* Name of the extension displayed to userspace via /proc/cpuinfo */
+	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
+	/* The logical ISA extension ID */
+	unsigned int isa_ext_id;
+};
+
+extern struct list_head riscv_isa_ext_list;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
@@ -44,6 +73,8 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
+int riscv_isa_ext_list_add(struct riscv_isa_ext_data *edata);
+
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f13b2c9ea912..dad95bdd3cca 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -71,6 +71,21 @@ static void print_isa(struct seq_file *f, const char *isa)
 	seq_puts(f, "\n");
 }
 
+static void print_isa_ext(struct seq_file *f)
+{
+	struct riscv_isa_ext_data *edata;
+	int count = 0;
+
+	seq_puts(f, "isa-ext\t\t: ");
+	list_for_each_entry(edata, &riscv_isa_ext_list, node) {
+		if (count)
+			seq_puts(f, ",");
+		seq_write(f, edata->uprop, strnlen(edata->uprop, RISCV_ISA_EXT_NAME_LEN_MAX));
+		count++;
+	}
+	seq_puts(f, "\n");
+}
+
 static void print_mmu(struct seq_file *f, const char *mmu_type)
 {
 #if defined(CONFIG_32BIT)
@@ -113,6 +128,7 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
+	print_isa_ext(m);
 	if (!of_property_read_string(node, "mmu-type", &mmu))
 		print_mmu(m, mmu);
 	if (!of_property_read_string(node, "compatible", &compat)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..c70eeec17f5b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/list.h>
+#include <linux/slab.h>
 #include <linux/of.h>
 #include <asm/processor.h>
 #include <asm/hwcap.h>
@@ -18,6 +20,8 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+LIST_HEAD(riscv_isa_ext_list);
+
 #ifdef CONFIG_FPU
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
@@ -59,12 +63,60 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+#define __RISCV_ISA_EXT_DATA(DTPROP, UPROP, EXTID) \
+	{							\
+		.dtprop = #DTPROP,				\
+		.uprop = #UPROP,				\
+		.isa_ext_id = EXTID,				\
+	}
+
+static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA("", "", RISCV_ISA_EXT_MAX),
+};
+
+int riscv_isa_ext_list_add(struct riscv_isa_ext_data *edata)
+{
+	struct device_node *node, *enode;
+	int eid;
+
+	if (!edata || !edata->dtprop)
+		return -EINVAL;
+
+	node = of_find_node_by_path("/cpus");
+	if (!node) {
+		pr_err("No CPU information found in DT\n");
+		return -ENOENT;
+	}
+
+	enode = of_get_child_by_name(node, "riscv,isa-ext");
+	if (!enode) {
+		pr_err("No riscv-isa-ext found in DT\n");
+		return -ENOENT;
+	}
+
+	eid = edata->isa_ext_id;
+	if (eid < RISCV_ISA_EXT_BASE || eid >= RISCV_ISA_EXT_MAX)
+		return -EINVAL;
+
+	if (!of_property_read_bool(enode, edata->dtprop)) {
+		pr_err("The ISA extension %s is not present in DT\n", edata->dtprop);
+		return -ENODEV;
+	}
+
+	/* Enable the extension id in the riscv_isa for easier probing */
+	riscv_isa[0] |= 1 << eid;
+	list_add(&edata->node, &riscv_isa_ext_list);
+	pr_info("RISC-V ISA extension '%s' available\n", edata->uprop);
+
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
 	char print_str[BITS_PER_LONG + 1];
-	size_t i, j, isa_len;
+	size_t i, j, isa_len, ext_arr_sz;
 	static unsigned long isa2hwcap[256] = {0};
 
 	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
@@ -148,4 +200,8 @@ void __init riscv_fill_hwcap(void)
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		static_branch_enable(&cpu_hwcap_fpu);
 #endif
+
+	ext_arr_sz = ARRAY_SIZE(isa_ext_arr);
+	for (i = 0; i < ext_arr_sz - 1; i++)
+		riscv_isa_ext_list_add(&isa_ext_arr[i]);
 }
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
