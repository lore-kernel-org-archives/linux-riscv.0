Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09B7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heT0UZnMghZMago1fcR+5KMHHPbXGVtdTWx6ybBgBdc=; b=oVLvyrOaPNwejw
	96HdswOSbzvOWY+wUCOHW2raZ/Je22PYKSrmW7ySqCnC4PN4z9PIUsoHzFkxFTEWngFgRsriINluP
	+dAkCvqfSXVZoapfzSH66W44dEfjMJQfF51ksfJOGrUeqUBmX3dZO5kRIQEb+w1X8+ZMQvqBdVtH3
	0EnbcD/PD7OrrD5NG1M/DZVmr8SsmFtxGKnLic+iEIYNs/3eEjEnZBrTecZjfwtZrD77/vAniIIYC
	GPBhM0/Hf9YfOM2O9ohKkgKNdTrkkofvsOhHHiyXQiTDQBHb0ul5WOL0eKtmM3LD4PGJXmGqAaPNz
	KwjXrCh3DHKNxuZrXztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHB9-004xEd-Eu; Thu, 10 Feb 2022 21:40:39 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB3-004xB6-6D
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:34 +0000
Received: by mail-oo1-xc35.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so8035935ooi.7
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxLurPe5gtmMACmwYrmQ7RV4VZQpgtW/wJpQ92EZaMA=;
 b=ZGAexjLB1fsWd1qu3I8dybz0nQgpssACPs0RnY+Wbrn6/mWSSoTmwXtMt9tNeO8Fkc
 0I+n/5SG7WgyBJUEanBaXBjICX1pVeCelvfL/q4Xt/QFRo37bcM9/PxgLviQdD4zbMFl
 5h58IG8lVAZ1J6bPIwLAp9BJ1/w8D8iX9uPpIWgrmAisAvF8kDTVY/Xx6EKmp+kqXapJ
 fs2it4qhJDundsIeMW62C6Djp0MgjOappTSv95/++s+Vlh1846suJzz2o+PBfhgkUTN7
 iO9VjOWP46FjzScJjuh2v27wQaujMWU43ViE7bryqlB+xX/DBpouqO0D986eCoGCFBrP
 0MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxLurPe5gtmMACmwYrmQ7RV4VZQpgtW/wJpQ92EZaMA=;
 b=cLItPGX/aPBNLBoL3LEdSwmpkZN8M0JimsO1Ry2CIgkbMWwphwJ+9AhjOQPPCyt9WG
 1cL2j/jo/6OerD4d41c/R2HFZmJTskK5Lsk1uxFdH80JXH0NNd+uS+aTdklp2GT85hKb
 AfkUQc42TVt6PNMpSSWfmjNviuBTmHLS+Jc9DdZLUTxXjY088PonHSH+cAaKJ78z0SxB
 RvVFeYtaS+3XK2S4ePzyynCmdtXQz4uwNHSO/PNcldGV4uFfQGpEvhe6YKCMY/EQcgrz
 VuROVjq30/4S1Wnuj8ClLfWRrlri44P51ze4E5ZCj5GvMccwlvb9AqSL7IJ1X4GT+0S+
 cOeQ==
X-Gm-Message-State: AOAM532UPP6WYq/mHn+Qb8v1JGmVDXbWgopw5NbJaR0t+YZd/lpFF5+y
 Zxo1SkD/20XNahWmvB1Om/D3Wg==
X-Google-Smtp-Source: ABdhPJwAVQp1nDJtdS+/A4GMweHMJUn2o2jysgwreocFk+ixOF7CGDbCRGXOrigMVd948zf4+Dd27g==
X-Received: by 2002:a05:6870:5a8c:: with SMTP id
 dt12mr1460469oab.327.1644529232021; 
 Thu, 10 Feb 2022 13:40:32 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:31 -0800 (PST)
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
Subject: [PATCH v2 2/6] RISC-V: Minimal parser for "riscv, isa" strings
Date: Thu, 10 Feb 2022 13:40:14 -0800
Message-Id: <20220210214018.55739-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210214018.55739-1-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134033_257176_BC2EB6D0 
X-CRM114-Status: GOOD (  17.81  )
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

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
[Improved commit text and fixed a bug around 's' in base extension]
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 67 ++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dd3d57eb4eea..e19ae4391a9b 100644
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
+			bool ext_long, ext_err = false;
+
+			switch (*ext) {
+			case 's':
+			case 'x':
+			case 'z':
+				/**
+				 * 's' is a special case because:
+				 * It can be present in base extension for supervisor
+				 * Multi-letter extensions can start with 's' as well for
+				 * Supervisor extensions (i.e. sstc, sscofpmf, svinval)
+				 */
+				if (*ext == 's' && ext[-1] != '_')
+					break;
+				ext_long = true;
+				/* Multi-letter extension must be delimited */
+				for (; *isa && *isa != '_'; ++isa)
+					if (!islower(*isa) && !isdigit(*isa))
+						ext_err = true;
+				/* ... but must be ignored. */
+				break;
+			default:
+				ext_long = false;
+				if (!islower(*ext)) {
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
