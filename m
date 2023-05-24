Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA44C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLmA+iR4vTFBrxlOTmgGx4e+PG1RpL/ADhJnZSeBcKs=; b=XW7gOHYELyo5/P
	g9wa9Cstl3kjfrpzOLBgg/YA2HTDQtXxkSECLVB1bBn4UB3DTjiAuhhWv6/IhfIrUosvl63sI3Xz4
	E+xCHgMYN9IqpFW/85/7rXOPck9aQeIOkvYd664DUVpXA4+2WG36ZIBK1FcdkKioqtbdgPrQBMgwl
	AA0h3DZjvt4yyoJcnoR6ikwOzVf052ql9bom5rDORYP8ZkAf0kUKXEINRgR9qrYokAB63Z2NH9gBw
	ZVWoqr4r82wT2rJzkg/ik1wIZNwEqB854kWHvDMu7wOJTZxDPHtLwPyjVN9qMHrkdHUvefVExFw/+
	Qq182+1868piFAIcotfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kko-00CxF5-0c;
	Wed, 24 May 2023 09:25:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kkk-00CxDV-2s
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 09:25:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d247a023aso483296b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 May 2023 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684920351; x=1687512351;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvHr5LmWlOAwH72dKmpy22b0i7NyoTobA4QHfY56YqY=;
        b=ciC8y7QAPHbykBqQcM730+HPORFRKmlNjUKYf9ifW40ENmc67orcf+Yp9oZihPOc8X
         BcMXx+0qOVQxl4OmO7rSqvWyUf4beB3vtMxAirZ4T6DpPfGF/aW2T1nJEKuXkHHGU2oQ
         w5UsCgQfPco1m516CCV6Us7B+x4c44gpw3XQf48rOAwTyVPnN8KYn5Qwi2/pj9/ShqhO
         K8vhDvFSBOdIbeO8jNHOILoijJ6zBZzr9ZHMf9DnajaAjd7LklYtg+ITNOORHr4HUEQv
         9LV8IYcBMSo10gyEBdLrrT0EfH7m7TGVZyJK/VqOQxGJdduKLTI/jEno0p93gQvDJaOD
         gDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684920351; x=1687512351;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvHr5LmWlOAwH72dKmpy22b0i7NyoTobA4QHfY56YqY=;
        b=aqMpYWcEIIQmVmx5TSfiTxc2Y0WSIVNfisbH/aUb8xu/xsN1ZiiJSMWBQB9zTbBPG0
         urfR+eMh7OVGBNpXHbMVHindPc1MFuilMkpZvUTP9xxS/YoeTaYvvZez/Ci5pMMzgLNZ
         farpOR98E5RmzuxAqkO1zgLRASW8rUV4DO4boWRlbHzRb/fXhw5mulcWn7DZWvOnjyuf
         KXCrLKkI7PsAr6PX+/dk3WoBey7AIFquQ/AS7eY+UsqLo7a8iMSuB9RSeUa62DoH1el2
         0uwu0LCO8yV5c4c8Ka+8omlrFLPpVp3rzJedB1LkCfpWGa4WEH3yAZeATYXmRp/fgQmE
         Higg==
X-Gm-Message-State: AC+VfDxNpk/qLkUwYUQlYu7p48Ywmo/gsSN/v/vBo1XbyTxyRU99LQ9j
	eezzLYlG1LyfSLOIcIZrU5CyMQ==
X-Google-Smtp-Source: ACHHUZ4yigSzUbkNGJIFZ403kPHhDrOx8fj3JMeflq0CzrSnTyB/03UP4L2tSWv7WQHKQIa/QKD22A==
X-Received: by 2002:a05:6a21:99a6:b0:10b:f980:18d3 with SMTP id ve38-20020a056a2199a600b0010bf98018d3mr9336670pzb.1.1684920351146;
        Wed, 24 May 2023 02:25:51 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id t14-20020a17090b018e00b002532eef4fc5sm925013pjs.34.2023.05.24.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 02:25:50 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com
Cc: andy.chiu@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	remi@remlab.net
Subject: Re: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace vector management
Date: Wed, 24 May 2023 09:25:30 +0000
Message-Id: <20230524092530.7773-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <mhng-52f8af07-f3fc-4674-94ea-abbe2108907a@palmer-ri-x1c9a>
References: <mhng-52f8af07-f3fc-4674-94ea-abbe2108907a@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_022554_962885_5CB36284 
X-CRM114-Status: GOOD (  13.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

How about adding the following 2 patches to deal with the problem.
However, I am concerned if this makes ELF_HWCAP too complicated. e.g.
Future extensions may as well want to do something here after we create
an entry here.

Thanks,
Andy

[-- Attachment #1: patch.diff --]
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 24 May 2023 08:00:11 +0000
Subject: [PATCH 1/2] riscv: hwcap: change ELF_HWCAP to a function

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/elf.h   | 2 +-
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index ca23c4f6c440..c24280774caf 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -66,7 +66,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
  * via a bitmap that coorespends to each single-letter ISA extension.  This is
  * essentially defunct, but will remain for compatibility with userspace.
  */
-#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
+#define ELF_HWCAP	riscv_get_elf_hwcap()
 extern unsigned long elf_hwcap;
 
 /*
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 574385930ba7..e6c288ac4581 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -61,6 +61,8 @@
 
 #include <linux/jump_label.h>
 
+unsigned long riscv_get_elf_hwcap(void);
+
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 28032b083463..29c0680652a0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -293,6 +293,11 @@ void __init riscv_fill_hwcap(void)
 	pr_info("riscv: ELF capabilities %s\n", print_str);
 }
 
+unsigned long riscv_get_elf_hwcap(void)
+{
+	return (elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1));
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
-- 
2.17.1

[-- Attachment #2: patch2.diff --]
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 24 May 2023 08:00:11 +0000
Subject: [PATCH 1/2] riscv: hwcap: change ELF_HWCAP to a function

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/elf.h   | 2 +-
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index ca23c4f6c440..c24280774caf 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -66,7 +66,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
  * via a bitmap that coorespends to each single-letter ISA extension.  This is
  * essentially defunct, but will remain for compatibility with userspace.
  */
-#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
+#define ELF_HWCAP	riscv_get_elf_hwcap()
 extern unsigned long elf_hwcap;
 
 /*
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 574385930ba7..e6c288ac4581 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -61,6 +61,8 @@
 
 #include <linux/jump_label.h>
 
+unsigned long riscv_get_elf_hwcap(void);
+
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 28032b083463..29c0680652a0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -293,6 +293,11 @@ void __init riscv_fill_hwcap(void)
 	pr_info("riscv: ELF capabilities %s\n", print_str);
 }
 
+unsigned long riscv_get_elf_hwcap(void)
+{
+	return (elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1));
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
