Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEF1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aBdr2XXNDuYqJWcN9Mhesm0TNzK4coVpZioBmBLIaM=; b=QggRjiJ77xxEs8
	ZLPiQ4efBMkFIcxBB4bxHa84T3wDuY68OuGoAWUeLZL6AQlE6r4MJLZZhdChS26KAZKZ3qhfUZp9s
	QJYxeXlsZk0a3Nsux6iONP9Ww6BbLwj2FTddjNczWocI6WpzBQjxe5Cz2fDMaJ6G9wXG18a0SVvv0
	IGtKvEg9RxAJOSgG50LbaF09MimjPmvS0vOYhb70msxlqSsp8ZhBLWULtRSXgwrNLrEBT6dxnWObq
	8fnzN8bpMmVX5YGZTcc+TVe/5O7ExZJbb1haTcGw3l2WW2xTCVsLzc0l6xGRV0baXAYF5xnlj8IbH
	9puQSnBVltjYnqkhH/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHBJ-004xLl-1f; Thu, 10 Feb 2022 21:40:49 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB9-004xDx-Bn
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:40 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so8036227ooi.7
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=saY5DtvepsvwegCELkFkB7RgpB9RohGc6lIP30RliiM=;
 b=46zfGr3Kc5ND2ogjveHMMDJajmm20RjiQ5jLchAHKSOeQKPxbVdIY+oOIVYm/iux6G
 ZW7C8F9MHh0yrmBybRjiWtF0Xu0TFxrjlGVldYLEb13JSmAp10UwNlCF/RQs3NzeLRRw
 2fy36iHMRabUOaLns1XyogS6wb2Zks+GqSdmRph/bI6MJPxl0saHoEkNH7YyzZQ4fId2
 +pOuGvF2Q4fzB5TYRyebqrzn4PKDTXp8IVhCjORaAesIgT4iGxFQTo0yXwp2hn40ig2y
 16NA6FAr6bH+/4dUQKItEPAZiRomvHhNA/crV+uSdzIGkPshdjxQ0yAaA8xLgSiwIjNe
 ZXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saY5DtvepsvwegCELkFkB7RgpB9RohGc6lIP30RliiM=;
 b=AqIbqsPAoSBFqP707i1Fd8r8Mwn++sggoXKqmQqs2tvVD0KIE2UA7EZJ8+/PYhXmvD
 pjIu31jtDHQtt3urqqiU0ia0m/ab8y2Iz5le+GCGPpneUv4Lru8cCPrljC1tcc7bLAW5
 1n4rKIriy/uscfGTRaVvc8BYDcUYR2cSRHdOuB5Sut63g1xzPD/G6G9ru9TtUIHQSxlj
 WQ3xLUGulIjyNTLfgFyufAmihwTPgDCPDswA79KDjkX8QHhwXU3qDtUrNo29RpIYYgu2
 rOR8+lkQ/NrO47ivtHKgxViFw2T6uhUYePsAgEsp8W1r2TiGfV1bkcpgjXxMOFiAntAM
 gFUQ==
X-Gm-Message-State: AOAM533IBX2+FByTdi74vHBfyp8mSpmoMDkjdY8wv7y+ruo0WJMUI9t0
 6yMA8378l4fxddDbIujw4f550g==
X-Google-Smtp-Source: ABdhPJwjL2U7/u0jBP7WaACxI4KC0/AXyKMGE0aYyO5DPcLm++C2In2k7oqNhs9hXD+RC9AH2QAtbA==
X-Received: by 2002:a05:6870:e3c6:: with SMTP id
 y6mr1357918oad.200.1644529238281; 
 Thu, 10 Feb 2022 13:40:38 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 6/6] RISC-V: Improve /proc/cpuinfo output for ISA extensions
Date: Thu, 10 Feb 2022 13:40:18 -0800
Message-Id: <20220210214018.55739-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210214018.55739-1-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134039_450072_800F8098 
X-CRM114-Status: GOOD (  17.35  )
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
