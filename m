Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F038DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aBdr2XXNDuYqJWcN9Mhesm0TNzK4coVpZioBmBLIaM=; b=t4WNz5NO4+Yeqt
	gKYbI2ezNyHg3Q65iHJ5tPDmrPF5sM1piBI8avWMdZZunDFcDVbFE+4NGJtQ8fDFd6pm0r1peQFHm
	eYikKV1iIDiygLpQGZfkXDdaTnk2s2aVxNAaGhrdbB5z+4aKEc8tIA2W1zRvD8ORJi8iPhJ5F+ppq
	3p7HmiMq7nZ8JgGD+IiNQyb7ifSfJAzl0nRTbQokTEY+mT2qDofWkaQHk4U6vJW/aiyVo9ERP283w
	XsjVmZF/pjjl8Rg/xsTVVCcnoK8i+5UwonQ78E9XF2ZXK1jrCoCTCpFLZvrYWDb+q00JPkBgprV0X
	n2aIn69G6ME0rrNCM0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjY-001sp9-9H; Tue, 15 Feb 2022 09:02:52 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjQ-001sjE-GQ
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:45 +0000
Received: by mail-qk1-x72e.google.com with SMTP id de39so7199354qkb.13
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=saY5DtvepsvwegCELkFkB7RgpB9RohGc6lIP30RliiM=;
 b=RpittIM+xed10v1kmPiEatjI4Ljy47ofyiUgCuxFOn8ZZziqPDhh/myQGQPAINUO3i
 7GEeXm9xSQ4K+hh08Dn3UTPYEfduE5BOgAfVvPVvq+LbXefkk2PtGugKr3R7Bq5Shg3L
 l65RE8JRn7wKBMv4IP8lxJxchuM8mKVTB0BIsFhG7ycILi8fop0+wYCkNthc2VgYNRgw
 tQn1pLTVVvHwjetbNQj6m6DIUM9bOp7S0eWWgWptMrKDZfDusbJBTYSZmYdxChHCA7Mz
 o4HeBU/BOenOIGN3q92ispv9rjskiw1SJW2/aKKC901k9rXRUKbUeyIZacy31AZs+5s7
 Uc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saY5DtvepsvwegCELkFkB7RgpB9RohGc6lIP30RliiM=;
 b=RYoVWuyqy73ZrA9ljjPUKPXjjhv3K7MSI9EDXDduAmBfgqJkpPuNuoqww95rewjn81
 b2JlOxXAZqk36e18DsTzxXzXwEAvKZWJ1Fj9HULwhXxqW80XZQHZxhRQ+S5GRBsRxUtI
 sY0+X9v0WvEhkrHurrLCtUomPkerOdU+xRxrC6RTINbN+vcgpJ4ZjlMDpepMhEvvovFW
 FvFm5kfVWUqqmK2Ub960IQcU2MHg0NNNEpg+dbSX707HBx7n9XY9jdLjrf9gg+UboAM3
 O4kRSV3wAIfK8RuK5FRrLcU3dKHTsGf8tN6s0Ph4Pi2XwSCyJx1DGpI7kmc2fyhj0nOc
 X/UA==
X-Gm-Message-State: AOAM532Ry9z/OJ9dJ3D/1EmQqtuRSh/jADT6bSnYwFk4i8nMhPkU+0PU
 5b9wY/nTURtgHrBG27yeeKFr8g==
X-Google-Smtp-Source: ABdhPJzWrAWIlcNBqPobt6iH7sIMmiipfJtGTQVs0pJXyjgYHpXU1Q6z4v1B5V/bclnDc6aB03Qyrw==
X-Received: by 2002:a05:620a:2687:: with SMTP id
 c7mr1434792qkp.497.1644915762087; 
 Tue, 15 Feb 2022 01:02:42 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 6/6] RISC-V: Improve /proc/cpuinfo output for ISA extensions
Date: Tue, 15 Feb 2022 01:02:11 -0800
Message-Id: <20220215090211.911366-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010244_575507_37EEFD37 
X-CRM114-Status: GOOD (  17.53  )
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
