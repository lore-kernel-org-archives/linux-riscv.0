Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14604C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fw8TVVFZhOS07fabc+sxIWCWqu3LFy2t9NYSVtYxEUY=; b=xxbuONMrlv+SAy
	mDJ3sLn/k+nvRci6IGb+XGTokBvhcORMnPm5LYuPWcgNpd+5Rm0XXK7FCxyRdlv6xwO0u7HSxc8J+
	42nIakjTvV5NPdrxTDFq3soOAhCZDJSrkI7YUn3/hqlz/gBVoFyPVnKt4GnzEkqgyq+dmhjxH6DCL
	/H8VZUJpBxTctzYk377rUKUyatVsRyGvdtK9iEfJ7xT6/GAiKtPXdsgQdj8Cph3xgac4HHqN3GoFi
	MJmltFUYr8JJpvTV2IqtrZ3F+Qe9n/85yPeN0TsfFLspNFY8WRnkNRKc+4x2IwpM0PqeMSzG7WvoJ
	F3SJfCNU1gA5ZR8GOElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CH-0053yI-1j; Wed, 16 Feb 2022 00:29:29 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CC-0053vZ-G0
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:26 +0000
Received: by mail-qk1-x729.google.com with SMTP id o25so371927qkj.7
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPhfrRu9lOMUwT/7SSpNUGyvJjdNpXCP/wW++bFxhRc=;
 b=YPlmDeBF2w6ovQYBYeEzPbox6WtothHnO7nsxF53hmX5zJ0jsbDAZKFrpdr0D1vh0z
 BbtZFa59zGUcnQ6/cbDnd6PQANTTzmOeB+gsU48SuAocmqBcD4N+sy7LAskYEaXBbwON
 faFomcz6BuIUnNy12LVRLPmhUmXV2EuhqKhLv5YuTTEKFMqRf/Emz0Vl33gr1+NI30yy
 WOWkisZcDD98K0wjYQAUeBQPkSOJ2RrMxr4zqfkXb6dusQu7XfRJqSUgx4b6fbppCbtY
 VEq5tpGWHkbhOf7QjDe3WcQ0aDkKljAApomEwZzmb4UtaF2z/YR0SswW3HCXgIO6LJm8
 WaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPhfrRu9lOMUwT/7SSpNUGyvJjdNpXCP/wW++bFxhRc=;
 b=CgJ4qTk8J1CZ64qn7KXQr72loSeWkdLH5kF3ycNHWzymzbebfjowhqH86CMx5pmF0k
 65bxnJeVvDW+5iV9h5ekDy6utu4LNPk6Elh0+hjLIcseESbAGENKMSqWd83sfcQj4vh/
 chqWtwRKNcvR9r7UR906Q14fYpRNJ8eCvDpCNE20fu0iRFbDGruuHH1wd6iT8KDL5coM
 GSuE/7ITKUSqeg5WAIQVQwgFppgIny0IAH6ZZn5X6su5odpX0kAyHd+bbmLBH4cLMEI9
 j6AlYqiHymZcmrM9GpBkgkkcYmDxnilGchjtcK1ElQcOaMznc+IpiFm2xGyJaj6Tg7F5
 YaIw==
X-Gm-Message-State: AOAM533LSVEisBZ+vIg6SDhbXDzROhRVLF5JDaav+se4k+VRWKN+SD/t
 kY6A4Aldcp2S4tX/UgwNWg7Afg==
X-Google-Smtp-Source: ABdhPJwjUXfhUdSHWN5jaqEIsJNOX3lvX7622QszkSBMLvEK3VhO3Psn4rluzieRO/ioHE2DD9qi0Q==
X-Received: by 2002:a37:2797:0:b0:605:bbdb:310d with SMTP id
 n145-20020a372797000000b00605bbdb310dmr208086qkn.638.1644971363199; 
 Tue, 15 Feb 2022 16:29:23 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:22 -0800 (PST)
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
Subject: [PATCH v4 2/6] RISC-V: Minimal parser for "riscv, isa" strings
Date: Tue, 15 Feb 2022 16:29:07 -0800
Message-Id: <20220216002911.1219593-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216002911.1219593-1-atishp@rivosinc.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162924_576770_BB406B18 
X-CRM114-Status: GOOD (  18.21  )
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
 arch/riscv/kernel/cpufeature.c | 67 ++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dd3d57eb4eea..65664422b04d 100644
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
@@ -92,23 +93,67 @@ void __init riscv_fill_hwcap(void)
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
+				break;
+			default:
+				if (unlikely(!islower(*ext))) {
+					ext_err = true;
+					break;
+				}
+				/* Find next extension */
+				if (!isdigit(*isa))
+					break;
+				/* Skip the minor version */
+				while (isdigit(*++isa))
+					;
+				if (*isa != 'p')
+					break;
+				if (!isdigit(*++isa)) {
+					--isa;
+					break;
+				}
+				/* Skip the major version */
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
