Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405BFECDFA1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6xRO1FJ5wVc8ZJiZGWrH7294U2lzX8o10KFnMaAGMQ=; b=waYuei81Tuat6R
	xOuTreFU1wOB9hZLpBMNGqHl90lJ65WokwqMXyYbyWVmkFEPMRbaNWPCWqs14AZVJHZysEPmm7zPY
	WSPQ1Mq/EdFbMxT6Va8df/HWXypPGTRy2GsSvj3QUpLaoeLj3979wwL60REU1Yr4kGEBxwkH7trzK
	JZQQIGmtGX91MZzo9uGXbzhEyIX/ST3cMN1G5n39XHnhK0ekMHWyDpNGxgFckkOjHnnQ9xD/3F1P9
	7BmztyxxVa/M41ROUGUaWy5BzeL5+wwaoiF4HMhvelXA7fKcF9OzqJ7bFZrxawh9307Q502v++1Sk
	Ii+2PMj0URVkKRW67gcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtWP-000Kxo-79; Mon, 24 Oct 2022 09:13:25 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtWF-000Kpp-Pi
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 09:13:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id a13so28852850edj.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Oct 2022 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl0Ds2qeJk1Yda707PPrlhZcJp3u9U5F992ZyizDpi0=;
        b=INun79nYtqIlysVy2xWXWISAL0RooJBVCismuISM45QMj6iB1+aC29GgzugiFo+3Es
         1NyzFR3+zsnxrIQXWbehNlcZJ+nj6zaqxKV7jkdH8q/mJpm6u6YyGtMRtwXvEis8GdvF
         xwhni6AJcawQIYRs/msLxPmP7bbb0HkF1kMFmYecjobLTLS2kYN4VIZaL4BXyl56le03
         bUtmy+dj0TBtXvqWDvdbDDDBnJ58pPjpuurPAjWpfKnb1uAmbcZxRcq83VQnQYS4k5yA
         RQXiV6BF7SoLiaqAar0c5W1tlzy/6lhM/EkxCU71jfaKhzhhOMjzxF04Ld6hQe6R9AJT
         rJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl0Ds2qeJk1Yda707PPrlhZcJp3u9U5F992ZyizDpi0=;
        b=vHgZ4tIZp6xdYZ0amFm0Fhmt/UslNlpU/AakDMGDzrHOXUzI1qe4419XBXeVZToh7D
         LVpISQCpx+BUAI4faYNfMAP6MZXYFc8fnBjOvMYzAAJvXR2gs9HNvJNr3vz/s6i6N6HO
         4ka0bf5VEM/WE61LajAD0zOMzTmv300ehliYpXcNr6NxMebtFT2bQx9/m814Gv++mzDj
         jCi5NFoI/zhxpPttmPi9vteRYfo7vcbbd/efqndF5Xt38oUgl9jo2LVHkkceUkaBZz/M
         ZlsPAdMhxd92VhqGYLbQ3UoDMKYNY0RT1NSYu1l6vIAB2OYc9XjSsTYqdzZNS+0u9xUs
         VxUg==
X-Gm-Message-State: ACrzQf1Th3fdc2pTAyXQN5J9uoZy+FegtBJIeQy2L73ONN2hNena/N27
	C0C4znVgbhcv7Aj4cWAw2B4JQsZPjDS77g==
X-Google-Smtp-Source: AMsMyM7JxsMPg7ow9FHCFnfVB99iCCH3lKpIJQ8LlnJ4HBm7P58DPimFSlWlkThqCHtXaGdljkdQRA==
X-Received: by 2002:a17:906:cc4d:b0:78d:fb86:3979 with SMTP id mm13-20020a170906cc4d00b0078dfb863979mr27323408ejb.421.1666602795163;
        Mon, 24 Oct 2022 02:13:15 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b007933047f923sm6872410ejf.118.2022.10.24.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 02:13:14 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 3/3] RISC-V: Ensure Zicbom has a valid block size
Date: Mon, 24 Oct 2022 11:13:09 +0200
Message-Id: <20221024091309.406906-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024091309.406906-1-ajones@ventanamicro.com>
References: <20221024091309.406906-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_021315_936958_D9645D95 
X-CRM114-Status: GOOD (  13.43  )
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

When a DT puts zicbom in the isa string, but does not provide a block
size, ALT_CMO_OP() will attempt to do cache operations on address
zero since the start address will be ANDed with zero. We can't simply
BUG() in riscv_init_cbom_blocksize() when we fail to find a block
size because the failure will happen before logging works, leaving
users to scratch their heads as to why the boot hung. Instead, ensure
Zicbom is disabled and output an error which will hopefully alert
people that the DT needs to be fixed. While at it, add a check that
the block size is a power-of-2 too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 220be7222129..93e45560af30 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -9,6 +9,7 @@
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <asm/alternative.h>
@@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
 static bool riscv_isa_extension_check(int id)
 {
+	switch (id) {
+	case RISCV_ISA_EXT_ZICBOM:
+		if (!riscv_cbom_block_size) {
+			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
+			return false;
+		} else if (!is_power_of_2(riscv_cbom_block_size)) {
+			pr_err("cbom-block-size present, but is not a power-of-2\n");
+			return false;
+		}
+		return true;
+	}
+
 	return true;
 }
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
