Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663D2C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3YNjbkkJf3Qo1QWhQR9xgaKqX7yYVem+rp/62ieeWQ=; b=Lgp0rMK5wEcSlH
	X8SmdaaMCP68IzrBc2+84EaHuSiKUbtqoBhriLmpdelmrFr129dzo4v493ihtPcwTnO/9et7a8+Qy
	lbfJ5fiG24HLzGMBVrfEhQiC6+urqBUvgfSVo5jgIo0wbeyXDTxQSm1LV8Dh8+QVCMWSVfzuzVG69
	0A9GBJGJjYpjyVa39sUsjWqHUC/oFojsxbRD0A/sgw5Xv7ORJfM8+klKCTpv6yP4fJpjSKNWoxkEW
	vCllLlUh+RPNNkUokwrVKXS50HiOaQ66dLDHVqyvNO9vWMt/HG5V82zPdFXcrN72wFSnGH410r+wm
	D/DvztjXtjX34Xk1WtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpkG-007Fis-OH; Fri, 21 Oct 2022 10:59:20 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpkB-007FfC-Hn
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 10:59:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m15so4298322edb.13
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJckaPIA4KIfeFQ276qeV/1yYx4y02q/Q43EmtzUIdo=;
        b=ib3PRNMNqzsA7hzNk1kFKpxB1uKmX1o0DroHhFW1n6inZ3rYPmPzRPgpj5RYUqdWTe
         ZW3Xy385vWOFRifw9+F2wunP42fp6dqVC03KoTwhtI900PSLTR3f63JWlOOl/isRCoAG
         6nHJt5Q1l0eg8t+9Y808xpLfrnsRcoirtWndsV3u/2flJhDvyxXC5q3D4TXvWVdmo4sF
         sSg2sujI25c5FAFUMKw6TJG/FUKF+kbfp9jmTSEShSHE75g18ztdQe9c5Dawrws5kOHY
         Uw0POz+fmqsTJgSrGzOgcQTtVfBHBAJ6atcxcX7hD3hxUur2I7DIqGCfZNSk6kKeK5wd
         Q/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJckaPIA4KIfeFQ276qeV/1yYx4y02q/Q43EmtzUIdo=;
        b=xxL1zBSPPQYSXXZK3YQb3THpJvABOr+FeA6kn7fRLyJWM8UmJzlose0g8ok8KKMqxP
         Kf+7KLuV7hG8yWJ9XYReNnysSbX702bJSorpOT2Jd8zbK1NPb1ENjwVZ3pMzniGC0zaz
         EM9oQW0gIz7qSUSmtRNRSn4JVWD2sur1hRZ1CuLVBJ9y1xAkbZtSN4UfQmD6+G1PyekB
         RTGhWZD5joNS4N/mwGBs3prfQ5JWn278iIhm+eOXcz5xIsv9lvkYJeWt55HM5lzbmS9+
         FVWL9CS+p6X/4KowDn192azrWU97gHIbXu3HYERiCT/zB+4z0HE7asBC4IzOwT57D6Gv
         4rTg==
X-Gm-Message-State: ACrzQf0ZbsVBeEymmjF42MhzA+cMI8YFEJRnatALCrpcWL/sGC8v3UUr
	VZhKVRGxDpw7Kd4s27nMIr4Syy0eqaIyRQ==
X-Google-Smtp-Source: AMsMyM4XThC2BwkQmY7bVEsXuAd1yaDOE2AxtlSy/R9Bd8JJtGBKzCBSmklMlbzKjfy9C/LngpNgHQ==
X-Received: by 2002:a17:907:2702:b0:78e:e94:2ac4 with SMTP id w2-20020a170907270200b0078e0e942ac4mr14847940ejk.679.1666349951675;
        Fri, 21 Oct 2022 03:59:11 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709061ba200b0078d76ee7543sm11398573ejg.222.2022.10.21.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:59:11 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 3/3] RISC-V: Ensure Zicbom has a valid block size
Date: Fri, 21 Oct 2022 12:59:05 +0200
Message-Id: <20221021105905.206385-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021105905.206385-1-ajones@ventanamicro.com>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035915_647021_0FDA7F2E 
X-CRM114-Status: GOOD (  12.66  )
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

When a DT puts zicbom in the isa string, but does not provide a block
size, ALT_CMO_OP() will attempt to do cache operations on address
zero since the start address will be ANDed with zero. We can't simply
BUG() in riscv_init_cbom_blocksize() when we fail to find a block
size because the failure will happen before logging works, leaving
users to scratch their heads as to why the boot hung. Instead, ensure
Zicbom is disabled and output an error which will hopefully alert
people that the DT needs to be fixed. While at it, add a check that
the block size is a power-of-2 too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 220be7222129..a4430a77df53 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -9,6 +9,7 @@
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <asm/alternative.h>
@@ -70,6 +71,20 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
 static bool riscv_isa_extension_check(int id)
 {
+	switch (id) {
+	case RISCV_ISA_EXT_ZICBOM:
+		if (!riscv_cbom_block_size) {
+			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
+				pr_err("cbom-block-size not found, cannot use Zicbom\n");
+			return false;
+		} else if (!is_power_of_2(riscv_cbom_block_size)) {
+			if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
+				pr_err("cbom-block-size is not a power-of-2, cannot use Zicbom\n");
+			return false;
+		}
+		return true;
+	}
+
 	return true;
 }
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
