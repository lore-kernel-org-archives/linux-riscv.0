Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EB4C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FmIur4m8IO+pQVmgTMcaIZHgfhYDHETgQZuntPRCC8=; b=JRUCp6eKatm1hQ
	jp0U/R4i6ZT+ffNK7iTCc1bX8M7iU/DxlhIz/qr7IFHJ3maaNq3UXFVMtWKlMDElBADXvee8gtHcf
	StgZX4OIHauwFIHdKvhzPAgBVAb6k4YuA6Ps+AzE2LPLxfTI1umvTC2g6mSTvkDlM6UtiropQnrlN
	yL6Saz9PQFXgnJT+AMVB+p/NyB4hGhDt+Mf2nhD/OyaVv7IFkAYrkGJ6N0CDnu8M6ARRvk5QndWTn
	1L7uI/YYpS8/CQr3SasTwbKzwtXF33pDz0NCGhC6oqdi8d6Ht62HfTaV8ye5bz7zTdDaQdVdA38FI
	S0iS2gogGFt+BrOY+mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjP-001sjJ-K8; Tue, 15 Feb 2022 09:02:43 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjH-001sdr-Ko
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:37 +0000
Received: by mail-qt1-x834.google.com with SMTP id bt3so70581qtb.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKIMNTCTSaMpDoiqtlH3Q9QXsNmu9SOq71EHGRiXKQg=;
 b=IKo/im9vNvmw3DDbv7pl3Jy9rQHe0pf4uWP6c70xfG0w+L4au40G42ELqNNlEIA5t5
 lotcK9NYVkKEcMFnpug+isg/KHOOChYTsJtA16RR+TbVa03ziUCKC/Fo5mw1PqrqzhtA
 Blvot4EgBJLkRgNAM+hVnd9AC/c8iSPBO6+Wy5D7qQm5/01SKrw/DRSMKXYJu1vS78tD
 dbUlx/AVYIoYfRA+tjbRv2MapUG0BRXUVnK9MmPN46SmiBQg14AHV6WYM5FNl4gbaw/D
 NAdbSrlv+ILXXpa7B/0Fm8qCNJBeWr0VxgnfpvbXtOuvdc2gbPza0pR0RnP4ttCQXTrd
 K76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKIMNTCTSaMpDoiqtlH3Q9QXsNmu9SOq71EHGRiXKQg=;
 b=ec/vT16XRFTEcknRkxNAj2SER0V22KkIs9xGNHqudd35BrwS8LTYq5Gp44F67JNt5m
 FzOfSJghdAk5LUzBIX3Sd+WZLRYct7X/A34gkbxDr20jOYn7L5V/dSoOMEW7f6znHGoR
 yJWPaiOsAsg1mPKhBLWTLFHlj4FS1NcDczTI51u7xJMG9U7eQBxcXh+l6TgbO1eBZtKf
 3J5KV7MjZxMse+rgA+l88H0ZSiHNmKunptvXjJFVfpuw2PCPvOHk6BQfxNGjJoU2Hvdg
 JI2nO+G0WUVyrv9DMsXGNAVdailCH9NgYVo8AwtemwSH4/BFluuURyAkcV8LwYgDgjOy
 pg/g==
X-Gm-Message-State: AOAM530bbQM7DlQAKknw1RxJLygWYw73Kc2QxQFhCyj0a86JD+amGuZN
 Y8kJ01auRwX3X65uP4RQYWHCjA==
X-Google-Smtp-Source: ABdhPJzx9QXJ2FNduXLIO3eucXJXSddratxrtG+GboFKt493dIEOaNkDPKFaL7o5yk74IsytWpegew==
X-Received: by 2002:a05:622a:1351:: with SMTP id
 w17mr1961454qtk.447.1644915754311; 
 Tue, 15 Feb 2022 01:02:34 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:33 -0800 (PST)
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
Subject: [PATCH v3 2/6] RISC-V: Minimal parser for "riscv, isa" strings
Date: Tue, 15 Feb 2022 01:02:07 -0800
Message-Id: <20220215090211.911366-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010235_707893_23F21730 
X-CRM114-Status: GOOD (  18.13  )
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

Current hart ISA ("riscv,isa") parser don't correctly parse:

1. Multi-letter extensions
2. Version numbers

All ISA extensions ratified recently has multi-letter extensions
(except 'H'). The current "riscv,isa" parser that is easily confused
by multi-letter extensions and "p" in version numbers can be a huge
problem for adding new extensions through the device tree.

Leaving it would create incompatible hacks and would make "riscv,isa"
value unreliable.

This commit implements minimal parser for "riscv,isa" strings.  With this,
we can safely ignore multi-letter extensions and version numbers.

[Improved commit text and fixed a bug around 's' in base extension]
Signed-off-by: Atish Patra <atishp@rivosinc.com>
[Fixed workaround for QEMU]
Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 66 ++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dd3d57eb4eea..9d5448542226 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitmap.h>
+#include <linux/ctype.h>
 #include <linux/of.h>
 #include <asm/processor.h>
 #include <asm/hwcap.h>
@@ -66,7 +67,7 @@ void __init riscv_fill_hwcap(void)
 	struct device_node *node;
 	const char *isa;
 	char print_str[NUM_ALPHA_EXTS + 1];
-	size_t i, j, isa_len;
+	int i, j;
 	static unsigned long isa2hwcap[256] = {0};
 
 	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
@@ -92,23 +93,66 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
-		i = 0;
-		isa_len = strlen(isa);
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
-			i += 4;
+			isa += 4;
 #elif IS_ENABLED(CONFIG_64BIT)
 		if (!strncmp(isa, "rv64", 4))
-			i += 4;
+			isa += 4;
 #endif
-		for (; i < isa_len; ++i) {
-			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
+		for (; *isa; ++isa) {
+			const char *ext = isa++;
+			const char *ext_end = isa;
+			bool ext_long = false, ext_err = false;
+
+			switch (*ext) {
+			case 's':
+			case 'x':
+			case 'z':
+				/**
+				 * Workaround for invalid single-letter 's' (QEMU).
+				 * It works until multi-letter extension starting
+				 * with "Su" appears.
+				 */
+				if (*ext == 's' && ext[-1] != '_' && ext[1] == 'u')
+					break;
+				ext_long = true;
+				/* Multi-letter extension must be delimited */
+				for (; *isa && *isa != '_'; ++isa)
+					if (!islower(*isa) && !isdigit(*isa))
+						ext_err = true;
+				/* ... but must be ignored. */
+				break;
+			default:
+				if (unlikely(!islower(*ext))) {
+					ext_err = true;
+					break;
+				}
+				/* Find next extension */
+				if (!isdigit(*isa))
+					break;
+				while (isdigit(*++isa))
+					;
+				if (*isa != 'p')
+					break;
+				if (!isdigit(*++isa)) {
+					--isa;
+					break;
+				}
+				while (isdigit(*++isa))
+					;
+				break;
+			}
+			if (*isa != '_')
+				--isa;
 			/*
-			 * TODO: X, Y and Z extension parsing for Host ISA
-			 * bitmap will be added in-future.
+			 * TODO: Full version-aware handling including
+			 * multi-letter extensions will be added in-future.
 			 */
-			if ('a' <= isa[i] && isa[i] < 'x')
-				this_isa |= (1UL << (isa[i] - 'a'));
+			if (ext_err || ext_long)
+				continue;
+			this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
+			this_isa |= (1UL << (*ext - 'a'));
 		}
 
 		/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
