Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD9AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGe3QY0ML5Wt4pwC5506WQFjtuGTATouo7WAYvlOdBE=; b=Z+m/8U3HS5v8Qv
	8hVQRSWs4UC/LuMPyf7Siqt0nTa0oBCcPYUrYEe5SPUF1i4rNprNAZ77AkxWiIurPRDMX30703FcI
	zJQfB8yUmdk61I+m6eoVXK/obvfCY2MOHuifdxfCxxvBiU+YIcSdq3KNO0M2owLFe+vKkAJik5S9V
	p0faZaHhdenS1whHID7QLt04/dWE6e7pKjqyvM3Ag5Ukxbqt3tBPP2f/JXOXZMMeghZAn5zMJMIjm
	n42O4MkIsb7ceoTjNOm8AKknTLCHdJ9jNlWYxUavOM/ebkkpSJvu61un+S79bm7W7lVKj4Yr08qNr
	jHEvpjFi6+BIVkok7jwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpkD-007FhF-EK; Fri, 21 Oct 2022 10:59:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpk8-007Fe3-Dv
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 10:59:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id b12so4357043edd.6
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw0lFK3SmkKeOhZumK+n9dghOgfaQ3QYXbrLz8+oImM=;
        b=fH2UwcrPp/jQQ+TQk3GgvW3MTFSeytJOzbl3BQ5tFqUFqhX8huqCH05FDABT0l7r7A
         Pu8xDA1SOqg0wz5WsuHlR4Vi0QFxr7cYwpGBLontbkYc9vGGRS73FvA1DhSx91WPJgjF
         Si6NXWh0XWfd7XLXkCzCH900bkywU8ghJ3tQ40ssS3hIR02Jt4L9W9uZGHSLkGhfl95R
         wvEalQ6yYMqCXWv52yWoGFl2aB95oAtrmSFnwWblikhFGkfQFkEIXVTEGB3dvrkfn9WG
         ct2eKCjGiEzsibv5dF6FQx4Dlo6gD+db6TDvJGWwYpszMIKoXFY+WcSVOryaQ7wVkZgJ
         aovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw0lFK3SmkKeOhZumK+n9dghOgfaQ3QYXbrLz8+oImM=;
        b=vMLIxkDt8CV56TrRvkb1bPcZN7Puz4U3V4RFt+kQ81KRYgKRhrkVvmSHXP54E0WtFe
         65v4TCjQAjZvlWmMqWwybdCx1WoMQY96LdYlVRHWRliChy2FiRNzHPOC13Kf6AH5PLE/
         v/HAxjclzzt1k3Mf/ZlU7LEvg/qt+lmSvwvwAx5EWcbc/Ws1NUPZCx+LC3JCr8lZm5IJ
         ZNNSOQB2DTh6TA/MiBeRRMgk1XpsQXAeszMHRr3IM3aKhLXwlD8zl3WPFkRHjKsiFEaA
         tdwczdI/lWAg8btzgINN9nn5qE4SZ4AXlzfaN0Gvw/tvBpogFpn5tyHe3aTZH2KebENL
         n35g==
X-Gm-Message-State: ACrzQf0aJ61IG7W9wE69kJhRxuT35245nfmNk8eqHN4P940hv9uUv33h
	4pDrzRE50ghrvC5u2i1FR9g4jsc03ck2ww==
X-Google-Smtp-Source: AMsMyM7NszRPoMr6grqxqLKCUN66UKnLDHXr9ohB8441E4tbb0B9vcToV/zc/dHbW0iuarBNOafeyw==
X-Received: by 2002:a05:6402:27c7:b0:45d:45f0:e6c4 with SMTP id c7-20020a05640227c700b0045d45f0e6c4mr16434835ede.325.1666349948584;
        Fri, 21 Oct 2022 03:59:08 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id c7-20020aa7d607000000b0045d74aa401fsm9389360edr.60.2022.10.21.03.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:59:08 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 1/3] RISC-V: Improve use of isa2hwcap[]
Date: Fri, 21 Oct 2022 12:59:03 +0200
Message-Id: <20221021105905.206385-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021105905.206385-1-ajones@ventanamicro.com>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035912_482534_A262D3BF 
X-CRM114-Status: GOOD (  10.85  )
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

Improve isa2hwcap[] by removing it from static storage, as
riscv_fill_hwcap() is only called once, and by reducing its size
from 256 bytes to 26. The latter improvement is possible because
isa2hwcap[] will never be indexed with capital letters and we can
precompute the offsets from 'a'.

No functional change intended.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..4677320d7e31 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -74,15 +74,15 @@ void __init riscv_fill_hwcap(void)
 	const char *isa;
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
-	static unsigned long isa2hwcap[256] = {0};
+	unsigned long isa2hwcap[26] = {0};
 	unsigned long hartid;
 
-	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
-	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
-	isa2hwcap['a'] = isa2hwcap['A'] = COMPAT_HWCAP_ISA_A;
-	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
-	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
-	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
 
 	elf_hwcap = 0;
 
@@ -196,8 +196,10 @@ void __init riscv_fill_hwcap(void)
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
-				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-				set_bit(*ext - 'a', this_isa);
+				int nr = *ext - 'a';
+
+				this_hwcap |= isa2hwcap[nr];
+				set_bit(nr, this_isa);
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
