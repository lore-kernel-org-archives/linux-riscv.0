Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B75DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aBdr2XXNDuYqJWcN9Mhesm0TNzK4coVpZioBmBLIaM=; b=1JLrK/aDq5fB5+
	y1W9YnstGXItoxUOxd/O4RDfUyg3L7rTar0KgofmNZkKoSjNx4NGZrKnos6MJH86vWo2MpLC2u5Ta
	DLGUlLByt5rkmMLJGkwRTBaxhccEPIfF1c+hD1ykiXSpVOgf3vGQ9S0ZY1vZFbZKVwDPmmVJm/1WD
	Je6HKbkXx7BmOwOhPSGWNx6APHJvA0NHOSuPCKKgF2FrU6KxFaw9anIgfh2iQYrcKpb0InXqbj93s
	O8NWSstdOjcVhI85k8NBoWH/VgEVGPYQUrQV+WIcZ4a4gNMU9W4ZtemrGSu9OA8gSpQYlDLupbY/g
	6EwWEUsfcvu7xSeTOowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CS-005462-LM; Wed, 16 Feb 2022 00:29:40 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CK-0053zr-Q9
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:34 +0000
Received: by mail-qk1-x731.google.com with SMTP id b22so348027qkk.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=saY5DtvepsvwegCELkFkB7RgpB9RohGc6lIP30RliiM=;
 b=WeZDZR/wgQ3HJBPaI1lbXHd1ymtPQLDkS89Y+hauG1FO7BiVnsUlJENU/aTTHJpzEc
 froSAw9Ech0bJ+/c1Eraap/5RgylGvP7owPvkrrM6DFIeriyFvDtSEYJItciK+P4Q+a4
 ZP5M4HEm1g7/v2Ef94+/nNSZaRNRm8L84VFyZ6sXbTE9YoJyfSqPFlpxEIik7YVM+TbG
 N8fGGs4RzKaRlfIuJqT0RWYV9frhIGhYUyECWmefGtcKfY7AIBCPxirqDhAOIxi/Bpbz
 kEwPGV+cemQeaXAUaJayW4Hiez9IXaR63DTPml67Vo00MLrsCxo9jgVcVldPNI7DRUsX
 0VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saY5DtvepsvwegCELkFkB7RgpB9RohGc6lIP30RliiM=;
 b=rlIKMjEu3G/KdCxgZZxUZt977UN1xU/c+w9DM7duWpIXFg7l7K57ey+LKlkXFGgJNA
 sldxN5MrFxGKstnS4nxOUPhs9okGsJnztsJ7ImGkuQLsvNi0Y8c6jJ6QOeX3eaAExEWR
 15VpaQlXZJPF58/BiwO4UeQLgG3/eREV2IJwPO+OYbCH8g+pmMHocBaYPLngDmN8ZH6W
 3L83k2mT542hHSIXmVNsYDWa+sQCigsmc6d+fuFKrtsYwiHa8E8KPb8WAQ2sKRCcjy50
 obgXcW0PznaWIb6QZxzNhZsRqrmf2nLKiIbFA3tEo2GCwOAEO+SDNJGQqdxUeyJNx30x
 85aQ==
X-Gm-Message-State: AOAM533nPJ+ynjeDgmQbMnJNUORcRdAWkmn6JbZ2A4dvKUNXiDWmZaAv
 fVxqnItmFbOfad67FESnXcYPBg==
X-Google-Smtp-Source: ABdhPJxgLsfYpRA+QvmhMNAXVF99c28x84OUD52yELKhbQvJUdEA4sPu3mofe6wteSIvVcp8Ebs2nQ==
X-Received: by 2002:a37:d2c7:0:b0:47b:4cd8:5dbc with SMTP id
 f190-20020a37d2c7000000b0047b4cd85dbcmr187629qkj.567.1644971371452; 
 Tue, 15 Feb 2022 16:29:31 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, heiko@sntech.de,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 6/6] RISC-V: Improve /proc/cpuinfo output for ISA extensions
Date: Tue, 15 Feb 2022 16:29:11 -0800
Message-Id: <20220216002911.1219593-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162932_875371_CF8F7E85 
X-CRM114-Status: GOOD (  17.44  )
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

Currently, the /proc/cpuinfo outputs the entire riscv,isa string which
is not ideal when we have multiple ISA extensions present in the ISA
string. Some of them may not be enabled in kernel as well.

Parse only the enabled ISA extension and print them in a separate row.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h |  7 ++++++
 arch/riscv/kernel/cpu.c        | 44 ++++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 170bd80da520..691fc9c8099b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -54,6 +54,13 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
+struct riscv_isa_ext_data {
+	/* Name of the extension displayed to userspace via /proc/cpuinfo */
+	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
+	/* The logical ISA extension ID */
+	unsigned int isa_ext_id;
+};
+
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
 #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ad0a7e9f828b..ced7e5be8641 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/hwcap.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
 
@@ -63,12 +64,50 @@ int riscv_of_parent_hartid(struct device_node *node)
 }
 
 #ifdef CONFIG_PROC_FS
+#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
+	{							\
+		.uprop = #UPROP,				\
+		.isa_ext_id = EXTID,				\
+	}
+
+static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
+};
+
+static void print_isa_ext(struct seq_file *f)
+{
+	struct riscv_isa_ext_data *edata;
+	int i = 0, arr_sz;
+
+	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
+
+	/* No extension support available */
+	if (arr_sz <= 0)
+		return;
+
+	seq_puts(f, "isa-ext\t\t: ");
+	for (i = 0; i <= arr_sz; i++) {
+		edata = &isa_ext_arr[i];
+		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+			continue;
+		seq_printf(f, "%s ", edata->uprop);
+	}
+	seq_puts(f, "\n");
+}
 
 static void print_isa(struct seq_file *f, const char *isa)
 {
-	/* Print the entire ISA as it is */
+	char *ext_start;
+	int isa_len = strlen(isa);
+	int base_isa_len = isa_len;
+
+	ext_start = strnchr(isa, isa_len, '_');
+	if (ext_start)
+		base_isa_len = isa_len - strlen(ext_start);
+
+	/* Print only the base ISA as it is */
 	seq_puts(f, "isa\t\t: ");
-	seq_write(f, isa, strlen(isa));
+	seq_write(f, isa, base_isa_len);
 	seq_puts(f, "\n");
 }
 
@@ -115,6 +154,7 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
+	print_isa_ext(m);
 	print_mmu(m);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
