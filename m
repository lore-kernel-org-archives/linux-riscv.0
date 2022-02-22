Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849E8C43219
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnk5/VOFWF4Mz4wHWovse1JNnuzarUggXOK9EITAsc8=; b=soIoKdR6DmLAx4
	XsPp3ErCe0m+f1DEKhK9xS2qdOV+7c2wdf2uHQqtTPNA5siesgKNq6FtJiYZXO9vUTWdyFY9De5AD
	BlgMKHMIgKDQE4z8c15dbQC+4SP8FsRbGO+mvYGp/K/mQ0l21pXXx+HgeKiXHpJxf2TPO9z9Edkxe
	VUl0JY2v0zWsl1Dn2VtktZU0AvGI4KbKI5zQmgb2Ix03YI1sLribSG6yCdhPmBUD0jjxuC3VeV8mb
	QVF89+8HB6+dXUltTDLVqjGUjphE6k3TV/RapsGE7zWKSmA5hys6wkSeXPKl7DzI5kDtUbK0Ir+aC
	i97zQTGP27Ke7IXkFZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc5H-00BZao-PX; Tue, 22 Feb 2022 20:48:31 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc5D-00BZYW-Cj
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:48:28 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso19395020ooa.4
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FsTSrbVAURtuc7icXoc7CnjlReAr0UpIVXQMIlDTc4=;
 b=6a+eX7j3LCyMn7OaC5yvtENFql8mK7SDDMa4RtV1aQ93fAn5DduP6Fgc7zUxkNDPTK
 2f5BEhyv8QBUUnYojgoP9I+MJqoziATEH1PvK8x/8t7oxNPO0/tcxhlAJGfxpsv2ELxp
 nfu2dWei93dbF37AOXHaYScoVk4bCNOoDm8lnsSjeyt2iYjkkidiwnvv/dGi5PNu1x2R
 68xEWUesACbG6mjSkozJilU0wLtHje/Ch7BosK/ew81mgyEbv8fsSfyEZnHa/tvVCuWn
 NihWa3DT/You12J90LfMjxx/hnQY9P/qyn3SO5SeuXy/X83tM5KGyBCAF4sPu+G1sY0j
 nLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FsTSrbVAURtuc7icXoc7CnjlReAr0UpIVXQMIlDTc4=;
 b=rOx/wl3bVRbFIaAjCyL1PdwD37NZ+4zLK0l/NaYbO082d3b9riTkwNZhiPqVPfY3nI
 wv6otVE3GdGo+lMv093t1mejf/cRWaVhfkljH/fKDAcYk3kgR/21Dw302cBnMY+CXPEU
 GAXfEj7joMU8qMYbg7jZu+fcczfUSDQl2ICFq7/ABNX+5uBwuzrCgW2DyQeIkXLVWoHa
 eMh5MMRdFgxn1E26lGF2Kvf415+pW5KkReR+pTLm65uE0eFBxxIrLnb0c2vzrpzy0bm8
 iA5msvSDGdQj3NDneM0jIZTdbiVOp20eMYJemTrk4wCa55oi8y9rxxnBXdcUt3Gch8Nc
 1NsQ==
X-Gm-Message-State: AOAM5320ZxAQmce1bZVYdwimzfuj00LQpEOaULF8xdparbVtvv2cv33e
 Y2KxrpJjyjppDmbKN/Ltkd4lNg==
X-Google-Smtp-Source: ABdhPJwVNKQnkJZdZ0jgSou92auChtzBu1r7KPJtir+JSZM/M01cC0DkREbbPZe7LjE4CO/652m/yQ==
X-Received: by 2002:a05:6870:d88e:b0:d1:359a:29f with SMTP id
 dv14-20020a056870d88e00b000d1359a029fmr2644172oab.232.1645562906164; 
 Tue, 22 Feb 2022 12:48:26 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o14sm16508197oaq.37.2022.02.22.12.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:48:25 -0800 (PST)
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
Subject: [PATCH v5 2/6] RISC-V: Minimal parser for "riscv, isa" strings
Date: Tue, 22 Feb 2022 12:48:07 -0800
Message-Id: <20220222204811.2281949-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222204811.2281949-1-atishp@rivosinc.com>
References: <20220222204811.2281949-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_124827_459348_B0D1874C 
X-CRM114-Status: GOOD (  18.56  )
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
 arch/riscv/kernel/cpufeature.c | 72 ++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dd3d57eb4eea..72c5f6ef56b5 100644
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
@@ -92,23 +93,72 @@ void __init riscv_fill_hwcap(void)
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
+				/**
+				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
+				 * No need to set the bit in riscv_isa as 's' & 'u' are
+				 * not valid ISA extensions. It works until multi-letter
+				 * extension starting with "Su" appears.
+				 */
+				if (ext[-1] != '_' && ext[1] == 'u') {
+					++isa;
+					ext_err = true;
+					break;
+				}
+				fallthrough;
+			case 'x':
+			case 'z':
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
