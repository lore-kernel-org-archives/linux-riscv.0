Return-Path: <SRS0=GYez=4H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E7CC34022
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 07:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88992176D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 07:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/GSbzvo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JDlJjhXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88992176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9m5e0QHNeNmV7aMCp0usfj64aJ0N1hu4WRwi2copvk=; b=B/GSbzvojlX/HJ
	iFm9FjHhRvm2dXcllAjmhipkjGbBDX3gJyj7bhmAJeAdBf2nbAwo6hW0lacL+jqgO1fzosb4CSpMK
	T2XEVLOWpO9gGU+4Myken3OlunufG7whaXbM3l3C+btJrX4/77KBsmcYaCcmWTjYeyWble1c2Zmc6
	XRw+uSB0aCWsOtomJ2ppZojfowP+XzzKsHcr7H6i9ChHg1NuF0SOVpe54lqnzurbUn4C0O4Jz9xq8
	ggwiEQCOxGIoLetiurTVICnV6Y4oNRtOhjsxX2zfJ9cUbMN8r5e9su2qMYsB0mRgekk011lFtXUiq
	3HqMYeYznGvZDpf96eGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Jmr-0005L1-55; Wed, 19 Feb 2020 07:28:49 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Jmo-0005Io-V9
 for linux-riscv@lists.infradead.org; Wed, 19 Feb 2020 07:28:48 +0000
Received: by mail-pj1-x1041.google.com with SMTP id m13so2162800pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2020 23:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f9m5e0QHNeNmV7aMCp0usfj64aJ0N1hu4WRwi2copvk=;
 b=JDlJjhXZpOBLOD5RtrhxFUncUFHJpCKQrS3ZoLGLO7cqdbtGC4j2kLCRr+nDFNxjNU
 w3Iw8eAfgGm+4Poy2C6mXGSrDitsJUuIsUDQ2B5hrhYVjDO0TvmcKL4PqsIOyx6ZNAbs
 nnUmBKXfSaaWJhDoF0K3Sl9UME9Qvt/SmnzFjCAnnWRMlA0hbC2y1c4B9tsfhp48N+MJ
 nmeZBTEDq1fsM2oG58s/TNHdZ4wWPrlai7rwNruAlPXjA/nnIArbAqoT8mV/QYwFPijj
 4cPi8We2lzqsnbwdOyiekx1vtRUTA42SzXnoMhqtoakcd9m/tkAXmUMWaPhVP1J8JB6D
 MGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f9m5e0QHNeNmV7aMCp0usfj64aJ0N1hu4WRwi2copvk=;
 b=Nxk9dNPKSxtW8ECfNuQIcSfsFDDzJyFbYWNVYGwbEwoktc8zXACUIlvGX0dUamOzkj
 OcxX9RzOrZZEn5WxMubhUfnkPAuRDOeYQIsBP9cBgoIW07uJOfBnwZGp1A0Z1B+nxM5J
 JUjONlUB3BkZIJZ7ak0h6f5qr2BlEWfTCh4KwIq9plGV2YgiUoYpSGqcIrfnCY3iCgIk
 2Jo3DvLJeJB9fhm8t0YskgHtkOAzuLmaGiLGNhLIbOOqOZ90Q+onnJQF88/N4zXvr1Gg
 5LXSNKY7l2mYwlgJRli1JGmvvQLTvRlc0wrVJJ2svkm/V5VDvSKaHFlUnrww5S/3Ou/p
 2mzQ==
X-Gm-Message-State: APjAAAUIkG1w92zEnOZWR2hgQH2FOYrvpKFt1ih6bgs0IljmW6/GM764
 V8JLut18SLrBg6CC7LgH/ZZUPmjcEIv00g==
X-Google-Smtp-Source: APXvYqz+Y1kcPgwA44GJzCt/feu/VB+Nuww3TXKWoTdjtUm6rXXWM2OUPr48k0DpRaHbCiiYEEJYXQ==
X-Received: by 2002:a17:902:be08:: with SMTP id
 r8mr24725893pls.175.1582097324395; 
 Tue, 18 Feb 2020 23:28:44 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id c188sm1500699pfb.151.2020.02.18.23.28.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 23:28:43 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Subject: [PATCH 1/2] riscv: avoid the PIC offset of static percpu data in
 module beyond 2G limits
Date: Wed, 19 Feb 2020 15:28:23 +0800
Message-Id: <1582097304-5547-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582097304-5547-1-git-send-email-vincent.chen@sifive.com>
References: <1582097304-5547-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_232847_018680_872A2178 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The compiler uses the PIC-relative method to access static variables
instead of GOT when the code model is PIC. Therefore, the limitation of
the access range from the instruction to the symbol address is +-2GB.
Under this circumstance, the kernel cannot load a kernel module if this
module has static per-CPU symbols declared by DEFINE_PER_CPU(). The reason
is that kernel relocates the .data..percpu section of the kernel module to
the end of kernel's .data..percpu. Hence, the distance between the per-CPU
symbols and the instruction will exceed the 2GB limits. To solve this
problem, the kernel should place the loaded module in the memory area
[&_end-2G, VMALLOC_END].

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Suggested-by: Alex Ghiti <alex@ghiti.fr>
Suggested-by: Anup Patel <anup@brainfault.org>

---
 arch/riscv/kernel/module.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index b7401858d872..c498beb82369 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -8,6 +8,10 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/moduleloader.h>
+#include <linux/vmalloc.h>
+#include <linux/sizes.h>
+#include <asm/pgtable.h>
+#include <asm/sections.h>
 
 static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
 {
@@ -386,3 +390,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 	return 0;
 }
+#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
+#ifdef CONFIG_MAXPHYSMEM_2GB
+#define VMALLOC_MODULE_START \
+	max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
+#else
+#define VMALLOC_MODULE_START PFN_ALIGN((unsigned long)&_end - SZ_2G)
+#endif
+void *module_alloc(unsigned long size)
+{
+	return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
+	VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
+	__builtin_return_address(0));
+}
+#endif
-- 
2.7.4


