Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2933C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTQXIIrpDxFPtwOzTzZIVpdto2Zd5wJmNVEum7TeMa0=; b=y/fBJNdJ8k4PLZ
	azU/lTCRkFT9Y62CXlP/uJjlgc8R/d/IYuV02lAJqBQQOW60BE9fkB66aoUOoXYHQ1atRCW73yQJr
	Bu7wwTA+jBSyXXYs3FqGO2H4Kpm2FpYetzSK8nPY19c3PwiuSR+tyD+SA0cOy+MYNZmyqPRGLLzBk
	b3hm4RPPsRa5+BSjoOXNrQDPOLV+8/MkO2NFqtiAdC9+4QbHK0KWynvrDlCHVbwzfaC30PrEQ6W6L
	Xr7qlHhU2aam5qA1d+ll32dTYRQz/0i26jQpo3hj1sqauQhsmWMvRbzBRsu384ldEk0hpzyHNw1TF
	xW4nqthuTaXueCIGRF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hU-009IlH-2d; Tue, 29 Nov 2022 14:35:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hJ-009IaL-1L
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:34:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v8so20073452edi.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRUPuFnySQ9LnVjWmtvi+D+64eD/OXASdUGKw7rxo5E=;
        b=WkNWFkyjiVxfZMMiRwugqlsqs1hqJ+504jWdF/8S7UNAXF2g6DWxM/Kmi+bX7k7mdy
         56o44pRXLApNvZp7NHgcu55lG0COL5o3PvE4UM2NzBL27Eo8HKn1LN84niTLd/1cyWwN
         vowf+1lUow1J4XbYivxq4MutNo82qw8nbanWHAQEbwT8iquyVOUxQ317Bj7EkkPCg23+
         CkKywPsQfaesSrtKYMvNj92oCMqhzln00zFfBI9O4qSgNvUdmRM4JVPbesFKcvGcweAm
         mQgbfCL6K2szMdlIo/kniJMcQssSjFV6d2oHQ4E/oAbpZnTMBC6OSqb79x+5yKKIzfRx
         dCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRUPuFnySQ9LnVjWmtvi+D+64eD/OXASdUGKw7rxo5E=;
        b=TaWk20/Cbe2fuO1D4RRLevryieuLLCiRUCcNj30UwURlAqdgDNq0GpqlvoRrY5VJ92
         S/ueCJij0iriQpYnA55BU32vDECMpCcY/U+Dm7AEIjUC11urYSScH20Q0y7ZQ3n08ra2
         +3JA1opmwGXlr/JYTL/IftGYFgTlPi5rbJiQq3QOcKoSwPPGhSoyQjcCTHr3mqWn6O0a
         58cVaE524uj4mggYTB0wV/TIf3iRWo0Ts2HkqzqwugeA+uG1Zl8m1OoxEIm9Sg88dqmm
         UF0B1Npn6nbRRQ39Z/zMsK02m9Pc+2s+yhYGbrmUZG0lYLf1S/MWjRy+RX0iA4/jHYio
         WFmA==
X-Gm-Message-State: ANoB5pmo1ZuvxskzH17N+LOQxIvHG//2ymktvXsM3UfRftYSRKup0dFa
	QIi7Av8asA4ONqJ3pVaDG20RifNJpTOVPw==
X-Google-Smtp-Source: AA0mqf4cD3u3nRGn1WgwCggv33MyEMrO4vESGMcbH1Z2mncs+TrL0NLUzwYcaBGbErL8FdzSZ1e1aQ==
X-Received: by 2002:aa7:d518:0:b0:46a:727f:b659 with SMTP id y24-20020aa7d518000000b0046a727fb659mr26663903edq.420.1669732493070;
        Tue, 29 Nov 2022 06:34:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id k16-20020a17090632d000b007b2a3cad2cfsm6199500ejk.132.2022.11.29.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:34:52 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Date: Tue, 29 Nov 2022 15:34:47 +0100
Message-Id: <20221129143447.49714-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129143447.49714-1-ajones@ventanamicro.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_063457_140238_783298C8 
X-CRM114-Status: GOOD (  13.98  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 220be7222129..93e45560af30 100644
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
@@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
 static bool riscv_isa_extension_check(int id)
 {
+	switch (id) {
+	case RISCV_ISA_EXT_ZICBOM:
+		if (!riscv_cbom_block_size) {
+			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
+			return false;
+		} else if (!is_power_of_2(riscv_cbom_block_size)) {
+			pr_err("cbom-block-size present, but is not a power-of-2\n");
+			return false;
+		}
+		return true;
+	}
+
 	return true;
 }
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
