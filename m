Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8388AC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjpkMxwC2UoN4SPNwdMe+H0CoR34GZFgcZqgnh0gs9w=; b=bcnKd6EmYLh3XD
	UB3bL3c6BzoNYD9QH/QfmLjvjgQ99aDhQKBNIUrzkyWIawejnK/v8tXt4JZkFIUg9aIEXwZwS7fsh
	bagWsltVbe1pziYd1k91fIqpLWdmEvhU2qjjehSJ1enFwoLkfBEsRuWkVMqSoVFXFmqR9BE7L/GCp
	9fOO341kqsHpxpWiSa4ch2RlY6MX1H60jpvbRtjw8qu+JrDpt4trfPhMQBr7TuiiJfJS6Dghkv0jQ
	Skt1Rsnga1t3HSPLh4W2winNfaG16pYghXVfFYeeHXfdfZQvT2xtzbh8C68Y9m0zOl6QyYvIfru6/
	bLxpdbgtS92Wsm/Wy+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHM-002TqH-2H;
	Tue, 04 Apr 2023 18:21:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHJ-002Tp1-1j
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:21:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id fb38so22063359pfb.7
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3qZ67y38AFkmcquwwQ+jCEdL0KsuQFOs2StQrvk1r4=;
        b=XNL5wXfoQpA8JsGSjQuuq5wSUIpDur/gFmvmgAhrVBcqxN0sZ7ILN08tIz7feSsspz
         ZgbCYW7Oj5TG/XPo/GlGOOTCVPQvrVI4DQ8lbbTyKz6HIn2aemsBMb+T0hx87Cei4nl8
         Rew1Fs1jNngJ2L3xig4oSohNtjluWLOjVmYvF4Un2Goahq3aSJc6R6M3UdIPShqpaUoc
         GqVXWXy1n48x/C3ZJx6nlep571O9amcOnmFi7AWFmX9T3hkv1aGeV00MMWvyTruilF+0
         u0dFJpxCaJt00eocdVaREbn90Dn/FqHHxy7PX/33GkL/I8OH2YaG61/S4jJz2NN6hOSn
         kktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3qZ67y38AFkmcquwwQ+jCEdL0KsuQFOs2StQrvk1r4=;
        b=kh1yxjhGXREhN0xnYHEg2FvjbfpSFIw4WczbI8LbmYytnslPepzO0lkuguXyT9WYcI
         TJjh357d6/eSxenhbi3uR4Ts8QwI48l9PM5UtmOMUnGD7RQlHhS/JWvodj7WjN/m9NOd
         vL3xyMPA4XE0bN+4AGaGp9nsS9gk2Q1SXT1K7vudK0F0NBpkl8avq8cvewclXquFZt7w
         1sv2IJGr79EO0FwMUVDU+BhzAZVbenTyfZqaec146YmNGmewRJ7BabL2vKx0chTLl4cW
         uLLX8/BL3Zl61Ki4EKSRnlG1HNDbdBfragP4KBlokACVmiy3k5Em+NAu52wEld0rj3YG
         IoTw==
X-Gm-Message-State: AAQBX9er4QV83o+IaO3yKCDJLPljYs0E1n7u6m3KfTkGAr9rPv0hzreb
	PW0QsEWOzinMQD2Ffvng8GVQXg==
X-Google-Smtp-Source: AKy350aJ11cfvfuinWgzemdLN2e0YGrThp1w/tWD+sQXOlzKFnn6WTki0m658NPy4mdIa7czviajYw==
X-Received: by 2002:aa7:9a07:0:b0:62b:47fc:a968 with SMTP id w7-20020aa79a07000000b0062b47fca968mr3052337pfj.8.1680632467769;
        Tue, 04 Apr 2023 11:21:07 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 03/23] ACPICA: Add structure definitions for RISC-V RHCT
Date: Tue,  4 Apr 2023 23:50:17 +0530
Message-Id: <20230404182037.863533-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112109_576628_77549A8E 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPICA commit 82afd0434e79f74b96a6be88115ddc8343a1ba40

RISC-V Hart Capabilities Table (RHCT) is a new static table.
The ECR to add RHCT is approved by the UEFI forum and will be
available in the next version of the ACPI spec.

Link: https://github.com/acpica/acpica/commit/82afd043
Reference: Mantis: 2349
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index c432fd15db65..86bb79fdfa62 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -47,6 +47,7 @@
 #define ACPI_SIG_PRMT           "PRMT"	/* Platform Runtime Mechanism Table */
 #define ACPI_SIG_RASF           "RASF"	/* RAS Feature table */
 #define ACPI_SIG_RGRT           "RGRT"	/* Regulatory Graphics Resource Table */
+#define ACPI_SIG_RHCT           "RHCT"	/* RISC-V Hart Capabilities Table */
 #define ACPI_SIG_SBST           "SBST"	/* Smart Battery Specification Table */
 #define ACPI_SIG_SDEI           "SDEI"	/* Software Delegated Exception Interface Table */
 #define ACPI_SIG_SDEV           "SDEV"	/* Secure Devices table */
@@ -2604,6 +2605,53 @@ enum acpi_rgrt_image_type {
 	ACPI_RGRT_TYPE_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/*******************************************************************************
+ *
+ * RHCT - RISC-V Hart Capabilities Table
+ *        Version 1
+ *
+ ******************************************************************************/
+
+struct acpi_table_rhct {
+	struct acpi_table_header header;	/* Common ACPI table header */
+	u32 reserved;
+	u64 time_base_freq;
+	u32 node_count;
+	u32 node_offset;
+};
+
+/*
+ * RHCT subtables
+ */
+struct acpi_rhct_node_header {
+	u16 type;
+	u16 length;
+	u16 revision;
+};
+
+/* Values for RHCT subtable Type above */
+
+enum acpi_rhct_node_type {
+	ACPI_RHCT_NODE_TYPE_ISA_STRING = 0x0000,
+	ACPI_RHCT_NODE_TYPE_HART_INFO = 0xFFFF,
+};
+
+/*
+ * RHCT node specific subtables
+ */
+
+/* ISA string node structure */
+struct acpi_rhct_isa_string {
+	u16 isa_length;
+	char isa[];
+};
+
+/* Hart Info node structure */
+struct acpi_rhct_hart_info {
+	u16 num_offsets;
+	u32 uid;		/* ACPI processor UID */
+};
+
 /*******************************************************************************
  *
  * SBST - Smart Battery Specification Table
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
