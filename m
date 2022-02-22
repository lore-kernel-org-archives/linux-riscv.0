Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C07C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFnlHo+WDbmWlj2CkHcIQ+hluVpxFXEgHF7p2DQEa9o=; b=Ra32qfjSofAFY9
	FV+07H1gcw/CyGzJcpcr+++WooLD86jnmzRg8N8Tsc8VGvCAnnPyXWxBCm83eOI4kX1etS2dbMCyc
	4TGMSKQXg1MR+TNGn/zh+tuCsurgg5iP+QP4cMJ6hqSzhb7Q8gPNSl5Q32qgMGdoSCAujCkAEGpX0
	NBkKP31iS/nX1NXIc3EY9iEB9Q1U3afPiv8je+q54ExjWGXPUOcz3Fe+FV9PXbCG8Y9K4M2CwfuCb
	8OAvmBbegqIT+OpQEMnAR07EewXTw2YTzu4NC3Mo75e2lcKPwGWVWhWV96JobccxpoAglLBps+AzX
	VaV9UiPcBsJQtT6pn1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc5S-00BZiD-RT; Tue, 22 Feb 2022 20:48:42 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc5L-00BZc8-Ft
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:48:37 +0000
Received: by mail-oi1-x22e.google.com with SMTP id j24so13769794oii.11
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8URXe1loYhEkYqA2mgPstYxk0kAqAk7osNiGz1KzfP4=;
 b=tkekYg+ui1gZE9tvXRPYNaXdnHSqvcZXJR3E2Vm5fQodbde1h2KEXdYVPBeSbBJrKE
 tZITXpUaJDk67Z/a7izDd9M3gsdIhhNTMcdTj6S8CxQsNWqSdzP/jKbyNPXB2oJu3avO
 3Zk4Jzm23rDMqdxFIbyWksIRJgMYHe95vMZ4pU0NzJ4BWBMvSQ1mHfq53uAu7WYa6PEM
 +utp42+TYOdOY+tnl0KO6BUIuJx91baW39b4LLo7XR8xTBndLIkdHIwQHVU5hXpmXZsc
 ZJOLoy8uvivgGGcYyqXtIuEtIJ/Cze3eAL876RuQ9h20mvCPEdnfU11wF41bvhGTyTig
 senQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8URXe1loYhEkYqA2mgPstYxk0kAqAk7osNiGz1KzfP4=;
 b=6eO1yv2gZ4FUOgxLmgEO3YF0TD5wN9eDYc/efM75SfuG202JBU9XtZ6gHfKzB1c3Mb
 4Yn6czaQxs8TuEmk3Zf5m89RQjeUKENO8VmQBqWH9a0PG5WgFfKK7kN/HAQJ3C+S8qp2
 KEH1YuFY/zDLDBbmr9SrTAcmvqSlpkTfzBiCVthrYcQtIJWG5CUmqjbkBpmBgUb4eBoL
 GZ0HpnyG/uCvv0eZqQ5IpuTptwmubXvH1aul7hY+AIU0GgrPuWadtcs4MmUd9sj5t9M7
 7nqlpxPQ8jQFt8J0efYSSAcHF7mNKteVmY7QdzYKx8QO817lkNEagPmyhlMWDKtJhW/D
 T8dg==
X-Gm-Message-State: AOAM530rBlAvbqo3s2Zd/Y8d4WRfeDZScfhsjUMxIBZyW16oy1aaMMKW
 tC2cqS/uXNFBJKTb8zh/H3ms1g==
X-Google-Smtp-Source: ABdhPJwB9rW8JuhYMN3o1Zy+a756u4qrYvSc4u5fAhxI6ME+4kF0AoSQeiNHi0jhT+ZAJKpoKp4vFQ==
X-Received: by 2002:aca:5b85:0:b0:2d3:fe13:177f with SMTP id
 p127-20020aca5b85000000b002d3fe13177fmr2847716oib.59.1645562913488; 
 Tue, 22 Feb 2022 12:48:33 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o14sm16508197oaq.37.2022.02.22.12.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:48:33 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 6/6] RISC-V: Improve /proc/cpuinfo output for ISA extensions
Date: Tue, 22 Feb 2022 12:48:11 -0800
Message-Id: <20220222204811.2281949-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222204811.2281949-1-atishp@rivosinc.com>
References: <20220222204811.2281949-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_124835_593222_13875F8F 
X-CRM114-Status: GOOD (  19.23  )
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
 arch/riscv/include/asm/hwcap.h |  7 +++++
 arch/riscv/kernel/cpu.c        | 51 ++++++++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 2 deletions(-)

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
index ad0a7e9f828b..031ad15a059f 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/hwcap.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
 
@@ -63,12 +64,57 @@ int riscv_of_parent_hartid(struct device_node *node)
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
 	seq_puts(f, "\n");
 }
 
@@ -115,6 +161,7 @@ static int c_show(struct seq_file *m, void *v)
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
