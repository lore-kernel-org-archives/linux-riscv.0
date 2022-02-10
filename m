Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98570C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rn6RIkmK2qYw2aOA/NV4r2dQxhnLt40xOlwfj+p0KXw=; b=ez2rHBCePm5V6a
	WOT29OByriweZJwmqH9bdMkxhV0ymUWjbzlAq75elj7csxmLGJq2rKANoANNsT9qb8+gaMTu29odp
	SFYhLo3Qf5EOOuwM4bbJTjWDEiwRhGkjbwsNpdWzTNiZInc0xAifpUZWjnbZaxFQwtIj1LJEQU5IK
	QSss+ukIvTbRiKTVpkgPcSMD0YVqRtY9YaIweHDPGB6RTioAylkWSTKcLWATtn7gIkqxdMo3wW7Bi
	xYUvMsID3SthkatTs/B/ZfsBnkuYGHTUIP/0h7/un+Yr0hnLvEvqYRWFSw/5H8CZcihyg8AwVp/ux
	49Pgw3nmUcj5DJUSaoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHB5-004xC7-4W; Thu, 10 Feb 2022 21:40:35 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB1-004xAb-JO
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:32 +0000
Received: by mail-oo1-xc33.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so8008896oor.12
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GFjBD5pXW1oDYaZhB6JNhzufwg/iO3HkPCeezpJonjE=;
 b=iksg0xdHxV1KXnXClS6AIq8Ytp1aDbko+dvCH7ZzHG71K23Qmnr1+R0baz0UQxMCs2
 YQTWvhzGus502Nd4u11IWiGPHUnIgTfbja0rgGiY7Kn74mZ6HmbGXID4MbaE24nQL4qG
 danGWG+Lpn6iR2Jc9eq5JDuebElwhYT73dr8r8FB9XinMxsfVaO3PXz71hGqOG7ihwdc
 5UygxaTyz5DPQN7mVmw2tyAYRh8Y7UDZtPf/IHUoybfdjnnqxwAlhyxDgVDi0cyjqU/Q
 jTIeJlVIVuFVs7tIb8dMpkOctU9yNl7saXOCdqPq2OGfMDZ3RmrezmG+996Xw9JtDMN+
 VMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GFjBD5pXW1oDYaZhB6JNhzufwg/iO3HkPCeezpJonjE=;
 b=SAXjSXBOgeubp4QG5GOLxL0pbVxmAa1I9VJj8sv7YBkDS5tqvE3tTNK7vH7NpjTVlR
 Qv/WLKn82v3njIOftNpURO2vQbZLsTZVPGr1Dm9yG+5U1jqxUGDpSbH6+xnKwVsu8av9
 e9LT8QjhUHXj05kJXUVOKzdtClneiN/SVN957e+3FMf0/IC1GxD5xh14KKjWLpFCWbe1
 scNYNU3KIGdzNySI5QEpvPF/0Hzxm4lRZ8ogzox90ErJdo6lEnMI2ECn7YMA0STPRmYf
 rrS3OckvxXRArabuplJkNJDZ5/6rKwIos07zMkY8v9Vw7HFpWJWuUtUqYOo4LArGwlcG
 0PXw==
X-Gm-Message-State: AOAM532L83N4C9W9KDIpu38x6XDAG2eSOXizUGqJeKwcu3qJVh7BJw/w
 pLV1fE8k2kPYHkrZgUiFgjrDWw==
X-Google-Smtp-Source: ABdhPJxIOW/t2XpzltCUJWHCX7cMfGm3IFWRnAKi5lDaNjDq9qMokJgcb7uSVeoQZAYVBUNcPYb07A==
X-Received: by 2002:a05:6870:3816:: with SMTP id
 y22mr1449908oal.210.1644529230378; 
 Thu, 10 Feb 2022 13:40:30 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/6] RISC-V: Correctly print supported extensions
Date: Thu, 10 Feb 2022 13:40:13 -0800
Message-Id: <20220210214018.55739-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210214018.55739-1-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134031_662124_870D66A8 
X-CRM114-Status: GOOD (  13.19  )
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
