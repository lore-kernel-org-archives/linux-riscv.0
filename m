Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ED6C77B6C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 23:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOPNDYJ6Ojtg52bQNCaPCWgwI9bCNXmarhdolsoHnNc=; b=Oq/ihD66nmTvwv
	cu092Zc+qZAqo7Vmqc3XpIGSBHFkjVRldPkOO3E9cAak3Ei8pIEAfDSyT3ilpcwil2ODWf2R1J4tt
	X7gOMHZpxm9XHImHq64vEgbyhOK5GrBt7NMmnyi7KwLD36YvVxoB/kbvNc3VOg779AF90e8cBS56Y
	yKGSr2BpXUJtJq03JQZ+JJ/nOq52/DOBYM1THOEXz79srvcU0R8lrILphU7VjX0GfrGRGDe6EVrkT
	qkFoBhTkFFhOlDdSe80QrqAoRW/tbilG+UNVE8eirN46TQii6pi7wTXi15VhFEZjg9QCCbVbXbChy
	7vwkGQRiM3DMWOF5ZLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvEl-00BJWC-0a;
	Fri, 07 Apr 2023 23:11:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvEh-00BJR8-1J
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 23:11:17 +0000
Received: by mail-pj1-x1034.google.com with SMTP id r21-20020a17090aa09500b0024663a79050so1558219pjp.4
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680909075; x=1683501075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qJSx8+ImAcMnjiqAry1hxSsn47JERJ47bfiyaja2dk=;
        b=FUJf4sHnWDSsfV8R5zEgAN5n2hSjTFeHRqKnxfMgpyHCH9bhi4rbwdc8iI/XpYGzEF
         tQ3bajD+Pt9tAK7Zs2c4YPLcKFkEOGPFZ6apeZX4HbpJ3eDwTQtJ4l9c+DtfDVcGeM9w
         LuMBubC2CD2p0879xsgii38Vc9YI5NJ6Yg53cHCQ3zI4GUJoFHP4+yEOnYLO4shEsKnm
         2DGZwNKITPMIcOeZAgMSxoorbTNWbrUUl7bgWGWiPZDqBtIEN7SszCDcOgQIOhuHAziL
         fF61wSaI/n2G1wrytVbuHdVWXSaabxJ1vjx5n1AStmUoOvFqqj2zfbTY7GlD4nCO78ie
         73jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909075; x=1683501075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qJSx8+ImAcMnjiqAry1hxSsn47JERJ47bfiyaja2dk=;
        b=P8feITc2cETyyXSFIVdPj+cd1943sscyMLaQBphJbl8YkCj0f8P/Vc/PZGRRkOEzez
         rnyatVxKy0XjOxZO2mYZi94vG8wFx2eiHFLD1hNxv/uuTHFrL9oocVQuahWhJ7U0hfeg
         Pj1DHk5W2M8l+HlO1jzxEDbM41Xl0YbtKgDV8K+SGtuKvVJmZo2UXNLQnEGmYrlRN+8/
         ez4u9Fp1Q4UGAN0H33xBVBtJjnn2IYpemY9QgyGuioeJjga7uxodG6ug0yjgvy+SF3cH
         1RJzQebHez18eAGrCLJ3ZlX4tva7IyAdldf2lGrC3NJMNwhlmENz2WwAn5p2YKl+WzVx
         drjw==
X-Gm-Message-State: AAQBX9fkfopRIoIbjj39T9X1rF1AiXXP9pH2IWMzheuHNDqsm478eSOW
	454bLHLP7Ihim2s3JjbJH4ipnw==
X-Google-Smtp-Source: AKy350YOI1JvTjyJnVhuHF0/GZe506qbmhTfWethAuEj8TDysJJtkcdLAPJ8nISY8Nvsa/qV1un2tA==
X-Received: by 2002:a17:90b:38c5:b0:23d:5196:eca8 with SMTP id nn5-20020a17090b38c500b0023d5196eca8mr4260918pjb.20.1680909074953;
        Fri, 07 Apr 2023 16:11:14 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902be0500b001a076568da9sm3361526pls.216.2023.04.07.16.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 16:11:14 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 1/6] RISC-V: Move struct riscv_cpuinfo to new header
Date: Fri,  7 Apr 2023 16:10:58 -0700
Message-Id: <20230407231103.2622178-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407231103.2622178-1-evan@rivosinc.com>
References: <20230407231103.2622178-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_161115_442015_BAC7A422 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, heiko@sntech.de, Atish Patra <atishp@rivosinc.com>, vineetg@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, slewis@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In preparation for tracking and exposing microarchitectural details to
userspace (like whether or not unaligned accesses are fast), move the
riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
need to be used by more than just cpu.c.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
---

(no changes since v5)

Changes in v5:
 - Added tags

Changes in v3:
 - Updated copyright date in cpufeature.h
 - Fixed typo in cpufeature.h comment (Conor)

Changes in v2:
 - Factored the move of struct riscv_cpuinfo to its own header

 arch/riscv/include/asm/cpufeature.h | 21 +++++++++++++++++++++
 arch/riscv/kernel/cpu.c             |  8 ++------
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature.h

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 000000000000..66ebaae449c8
--- /dev/null
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022-2023 Rivos, Inc
+ */
+
+#ifndef _ASM_CPUFEATURE_H
+#define _ASM_CPUFEATURE_H
+
+/*
+ * These are probed via a device_initcall(), via either the SBI or directly
+ * from the corresponding CSRs.
+ */
+struct riscv_cpuinfo {
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
+};
+
+DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+
+#endif
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..dafd0caa4f1d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
@@ -70,12 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
-struct riscv_cpuinfo {
-	unsigned long mvendorid;
-	unsigned long marchid;
-	unsigned long mimpid;
-};
-static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
