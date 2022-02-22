Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87256C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD6tZTu7mHG4STAf9AXLdzM7otdiqd1tqQkiiy7t09o=; b=peEPvzIWy9mequ
	4gjk+pZfdc5G+aYdGhQA9DSZ42eh1Mp1IPghtQpfQaiMZXZSVQr+AzLR2GXcRe2MdRiCbuL+odNow
	bM2tYANrwN1kXrn/fS+N7E8rnvbAQQ2sLyN0Kch+W8BgXgLslvIJtPdGWkYrKj3AjoM8QSRRpXKlw
	1NxQ87ywZ6tsz/PKznJKa7TDybsoIYKiR+pGCBSQrg7dOnria48vs4sICDWHS85UWR5xaPEkPa1RT
	jESqSuALisc79xLQQW6JOVOAOiIODnPvJSM+lhVfHRfWVZOjaA3pSNTkR7zPueu7pJ90E5iQIftkc
	hiqnAQb8NQbyY/P5adXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc5F-00BZZq-Qz; Tue, 22 Feb 2022 20:48:29 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc5B-00BZXt-Q0
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:48:27 +0000
Received: by mail-oi1-x230.google.com with SMTP id s5so15949092oic.10
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iS9w0OaNOwq2lVntX7Egw8nvc58/BIqmU/Sn5pstZMs=;
 b=rRGe87CLAPEMwKCoMohUgZZL6sAWpauySTKwK10hlBitWtAMxblHUSHWwMfnnBkzDT
 fQRz9htC6ToICG4iDBshh1uYJSdDxHP60alvI+vnzF7Hm2lnQDcS2Q3EdF2AyqHWEODk
 YK3FWoptNBw4L47SYKIRZBRn9HGdrtw6StUyCFBgVEQq+LUCsL+BrruzWkN2zlu3I3UT
 dBDqH2aN+5LJNpsley/R7n5BSncuZjiDC+w6sM05yMnG3hTh47q/E3jWM1zbOwXhwibt
 O+4JhqYfGO8WdcrKVyMpisub3OqqHSZs0KrAuz7/Vnn8BV6TgSxK2WMsOoNMv9EcDLRN
 3Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iS9w0OaNOwq2lVntX7Egw8nvc58/BIqmU/Sn5pstZMs=;
 b=0nuM+n1a86Q0tnX7wPSlu3k+nK7Knt1iy77cPafhDloC9d+KhVd6djojgPnsLN36jk
 fXP5f1CunE9OhYkKJXEd8NtQbe8AD5IxmhhCUEJbovMStWiQIvTTQXfTEl/5dqSjdWjJ
 3UGv2/4R6Ix8F8rC0Q+Ma0/oC4dzQAV7bdUFw+X+RFz94tKdMlDcEgTHcAlSih/fMb11
 N69j2NdzHy7lGeg7JbQYdiwxL6Aw1xmN9eW4sc09vpV0anFDLBWxJ5DY1QghTPFKu9xq
 DSVlM2H/l7ZAT0UrynRCjGK+y8lT474x8JmOIlZqRjehdhbD3L39ja9jVX7mJJNy44kc
 CAFw==
X-Gm-Message-State: AOAM531IP8xIPOioN4EcJJBiwJS1MDCGtjAOEN3B0PSWJCYqxl2xXnbQ
 3G115o/wjUYypcslOfCyW12+C9+1+7e4EQ==
X-Google-Smtp-Source: ABdhPJw0ScEMRh1ux7LSggP6NcFsmCRkNYmE6w/mjB+xAu+3FRIejJDB5juXy405QpGsJwXjkx771w==
X-Received: by 2002:a05:6808:903:b0:2d4:8451:d651 with SMTP id
 w3-20020a056808090300b002d48451d651mr3075448oih.29.1645562904409; 
 Tue, 22 Feb 2022 12:48:24 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o14sm16508197oaq.37.2022.02.22.12.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:48:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Anup Patel <anup@brainfault.org>, Heiko Stuebner <heiko@sntech.de>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 1/6] RISC-V: Correctly print supported extensions
Date: Tue, 22 Feb 2022 12:48:06 -0800
Message-Id: <20220222204811.2281949-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222204811.2281949-1-atishp@rivosinc.com>
References: <20220222204811.2281949-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_124825_867280_68AE0128 
X-CRM114-Status: GOOD (  13.39  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

This commit replaces BITS_PER_LONG with number of alphabet letters.

Current ISA pretty-printing code expects extension 'a' (bit 0) through
'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
cause an issue in practice), it will be an annoying problem if we start to
use those in the future.

This commit disables printing high bits for now.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..dd3d57eb4eea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -13,6 +13,8 @@
 #include <asm/smp.h>
 #include <asm/switch_to.h>
 
+#define NUM_ALPHA_EXTS ('z' - 'a' + 1)
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -63,7 +65,7 @@ void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[BITS_PER_LONG + 1];
+	char print_str[NUM_ALPHA_EXTS + 1];
 	size_t i, j, isa_len;
 	static unsigned long isa2hwcap[256] = {0};
 
@@ -133,13 +135,13 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ISA extensions %s\n", print_str);
 
 	memset(print_str, 0, sizeof(print_str));
-	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
+	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (elf_hwcap & BIT_MASK(i))
 			print_str[j++] = (char)('a' + i);
 	pr_info("riscv: ELF capabilities %s\n", print_str);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
