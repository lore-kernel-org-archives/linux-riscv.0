Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBD2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1b9v3ctPV8iyTs2KXaX06Z+lomUYJ8Qk3Bf91iu/DQ=; b=GGmxdoTViYBlHT
	vVGLIhmv3aZDb6YyhXaHhnaD07fD2bRxolvtpEaYIqwtqNr0gHxDlEjWBdG9cp1yRlfKLalsGF6do
	ftewBma7YUexAG4zvf2/R2Vj4PTR02EseFVCJgpZM1GSNvYh7/sJYM1Kst6ymrvERW5tuWN+Eab8z
	OMoeVNISNYKZtyWsU5D5xbyLDJBcL31H2c8X1QUchV1HfWbZEZWNCwGHu6gtPrBEz2Gpt0hQtqpMQ
	Dt/mRsYZEzgRfi9UjGHpCPZwDbMfEadfBvd+MF0HVJROSyKOBP7YvYXKKhbKSQk+64xJZ/Ld2ehZB
	rM/0k+rylp2TKs0Ony2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrTO-006p1j-Gu; Mon, 14 Mar 2022 20:39:22 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrTK-006oz2-To
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 20:39:20 +0000
Received: by mail-qk1-x72d.google.com with SMTP id z66so13858491qke.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NrEmpomOHclDV+kQuj0wjvwONyoQAm3AKPhEX1ax17s=;
 b=H5jqZD+ybOPj9jvOGT1khK8EOCXznxHjM7UW3eRCvg1JuQYYgw/3R+pQmi8EHWtWzc
 4KI9pDN1Ghpgzgglw9kOBN+tyh9VPInf28WNsFo9MJkp6FZEh4EV90UWqAixUqe5AnMZ
 1+v+ds82XgLi03xfOBbcZP9UOu/4sComMDe2Bg46lqGZvcETO8YitlTCtzcPbdFDhbQb
 J+q0GWqnlKQ8IlgA1niXGO2RItdxbWCu0XlAs0qWE1Eyg6hJSj61YiRQrW65+heH/PJp
 N6QGyveZbHaXwuxcQUa2jHIsF+4n5IsjQo/Rx8DlP92qM3JzpfdBFx/ecoLTWvDYPUH+
 zAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrEmpomOHclDV+kQuj0wjvwONyoQAm3AKPhEX1ax17s=;
 b=19Q/4APfDqjZkGLfRH+V4Lqb/V2hjcVjSGuFqO/xaRoBojmty8Ez6FpHVnh47+IzkW
 1ZpZM1HewOPtVHR+DWhOOelHUuW545Xfd3dmdeI3KvLQtaaOFCyYuCitAztV6sEpNUH2
 hreYuFjtZkDei1xNTWH8dqe1Dbip/GIS8ixqlupq/PPaDggasIMZH+sncT72wcI23Ky/
 nirnVkZ/GvN8ehwZkUjTnodVOoEQzKLFv4uapQ01jhuOC8jXMVV7l8zjy0O4Q3arFdlf
 /HYEFJs5iX6LuuCALK3oVwLrD8KPOjIN2v1gH9z/MyGKLSCLJgSGxFGoqi3yBYWZJBMD
 a7cg==
X-Gm-Message-State: AOAM530GnUfUstJMAu6h/uYd2RV0G5bZLE5RT9dMIwFESAqEgrLcsJuV
 QvvF4Mf2uaTZZgvSrJlHXCz7mw==
X-Google-Smtp-Source: ABdhPJwVXuvZmuG1IiPfArhVLDTUd60rYoPE5F9UgA8JVB+HYCUAnjh6XvDRJvRl58UiYBwc2HxQgw==
X-Received: by 2002:a05:620a:28c4:b0:67d:c400:a9d7 with SMTP id
 l4-20020a05620a28c400b0067dc400a9d7mr5186069qkp.369.1647290357916; 
 Mon, 14 Mar 2022 13:39:17 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm8597023qkb.74.2022.03.14.13.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:39:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 6/6] RISC-V: Improve /proc/cpuinfo output for ISA extensions
Date: Mon, 14 Mar 2022 13:38:45 -0700
Message-Id: <20220314203845.832648-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314203845.832648-1-atishp@rivosinc.com>
References: <20220314203845.832648-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133919_015399_A9AFF136 
X-CRM114-Status: GOOD (  19.72  )
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
Same goes for the single letter extensions as well which prints the
entire ISA string. Some of they may not be valid ISA extensions as
well (e.g 'su')

Parse only the valid & enabled ISA extension and print them.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h |  7 ++++
 arch/riscv/kernel/cpu.c        | 65 ++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

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
index ad0a7e9f828b..fc115e307ef5 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/hwcap.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
 
@@ -63,12 +64,72 @@ int riscv_of_parent_hartid(struct device_node *node)
 }
 
 #ifdef CONFIG_PROC_FS
+#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
+	{							\
+		.uprop = #UPROP,				\
+		.isa_ext_id = EXTID,				\
+	}
+/**
+ * Here are the ordering rules of extension naming defined by RISC-V
+ * specification :
+ * 1. All extensions should be separated from other multi-letter extensions
+ *    from other multi-letter extensions by an underscore.
+ * 2. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they should be ordered first
+ *    by category, then alphabetically within a category.
+ * 3. Standard supervisor-level extensions (starts with 'S') should be
+ *    listed after standard unprivileged extensions.  If multiple
+ *    supervisor-level extensions are listed, they should be ordered
+ *    alphabetically.
+ * 4. Non-standard extensions (starts with 'X') must be listed after all
+ *    standard extensions. They must be separated from other multi-letter
+ *    extensions by an underscore.
+ */
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
+	for (i = 0; i <= arr_sz; i++) {
+		edata = &isa_ext_arr[i];
+		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+			continue;
+		seq_printf(f, "_%s", edata->uprop);
+	}
+}
+
+/**
+ * These are the only valid base (single letter) ISA extensions as per the spec.
+ * It also specifies the canonical order in which it appears in the spec.
+ * Some of the extension may just be a place holder for now (B, K, P, J).
+ * This should be updated once corresponding extensions are ratified.
+ */
+static const char base_riscv_exts[13] = "imafdqcbkjpvh";
 
 static void print_isa(struct seq_file *f, const char *isa)
 {
-	/* Print the entire ISA as it is */
+	int i;
+
 	seq_puts(f, "isa\t\t: ");
-	seq_write(f, isa, strlen(isa));
+	/* Print the rv[64/32] part */
+	seq_write(f, isa, 4);
+	for (i = 0; i < sizeof(base_riscv_exts); i++) {
+		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
+			/* Print only enabled the base ISA extensions */
+			seq_write(f, &base_riscv_exts[i], 1);
+	}
+	print_isa_ext(f);
 	seq_puts(f, "\n");
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
