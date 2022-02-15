Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A81DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oatb19GIUYKbgDeLTKy3uA8ci5u7yNQfqWQigaEiIyw=; b=H5qM+fPlTDKQb9
	PVAbtc7sl2H2acOKIsNXKeAGcfLItv9mr+LeF64Q5mfcWKFbjB4gLlcYrWjB9nnMJCnuok/io4S6a
	geYJ5UOpOt2lSKR0Uevm0hAxcsKJRulaXLnXEF05ZDlgABBhpfKnexnbPH3srzbly1lxroE2tznvS
	+NN0ecjXVFlEbYq1E0n6B4HVnyggi88EOBPYA7IIUXrNgdDu7bNcgO46yBoRG3WjCuKFHYvxZ+wrN
	JbRwPc9E+zO4pJSRNrn1CSrqlCInbVQGwmefJ7qMvXs1f33fhg51w4m1MlljAyqkvicznjg8Z76bc
	7rAEIZOxSn+QjULROpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjJ-001see-1i; Tue, 15 Feb 2022 09:02:37 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjG-001sdJ-Be
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:35 +0000
Received: by mail-qt1-x82e.google.com with SMTP id z1so17951193qto.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6U4rijSjm5U8GLHq/t1MdTXdgQmgucjQmV8Ymo3NwgE=;
 b=d6AqXpyQAUkwb7NXhHhPGHpTrpz3kInmKc5l+9JKzydHa1Yjbsy2BRjVcrrntoh+uV
 YSQEMzX9r2CZNmJmFCHPm+X5kRBzgTrZM02dq9yoSvrYlt7uRDIMi7wlJLYJE7nizXzu
 aYhyLgumMIBE/xOUIwG9y/Z4cXW7mmh0UdF/CzdS7XB+Ck7zFP01JNJ19/P1gKt7YD3D
 7hyGx4x7oSLcY1P5xdXeceqdoBd7KXOMfRoYuKL1/FOYYXCS14RqfWH01+GK6FFBzypt
 8KllIXTC2VopZSJX1gQ/d3NwidFhmksqid4R56q62/Y6aJliP/uD5fXLPByPaBNiDRGF
 +DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6U4rijSjm5U8GLHq/t1MdTXdgQmgucjQmV8Ymo3NwgE=;
 b=1dW8ZHeuVczHk9QBf0G74GEmE1xZXPLoGdf9qhaY+4mXdHXas2Wyy3NSU2ptlVZoek
 0McV84RnIaUmNLWfnwAirXfynTG3vOJLPvcTwS8nIkQY9c2G9dsBeqyIotINjgFuuasD
 pJ9YxvCKBb6bb3j5g3hjsFGL8a1ls+tgGCB2wwMG5K0vDcRwsxMl8WUwpwzqYIYxAHlx
 OVKmzxXbBKMIY+Px8SX5Kib0xDjPjzmLALkfmP/wK0Zbj3Ej1wxKf+UxwDtaltTeTbBE
 8vTP9eUEdoBDyf7X777dMZSNQRbParh2jRrMgif6WLwrDl/rs6qn3EDzHRfyUoDz6TMt
 Z/Aw==
X-Gm-Message-State: AOAM531JxcPb89VA6rpAJ+aWHXsXs9Kc4Udvw4CC9TvNPuU54t26cCNy
 PYlkaB/Sf2TSKOIaFK/14zYZnA==
X-Google-Smtp-Source: ABdhPJx4/yvXhJ/ovAf24/YgwDAEuc6OS7o3jsbBhcLP6CiFPWkQQ7xGpHWTW3PyyVI01ETcK1YUEw==
X-Received: by 2002:a05:622a:1350:: with SMTP id
 w16mr1988487qtk.320.1644915752185; 
 Tue, 15 Feb 2022 01:02:32 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/6] RISC-V: Correctly print supported extensions
Date: Tue, 15 Feb 2022 01:02:06 -0800
Message-Id: <20220215090211.911366-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010234_424267_30EAEC97 
X-CRM114-Status: GOOD (  13.77  )
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
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
