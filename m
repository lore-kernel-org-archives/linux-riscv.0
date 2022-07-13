Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC51C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 22:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a2QzQN/GFgHeF5Ars1fa0J2E6o9WEyV1KzN2Dv39JUI=; b=TTXtxrXuqXUrTy
	sMHMcult8LTid2TryZA18RYxrvORScog8nUNVyDtZABlGI/Ti2PCfOxXQbFg1B0uZqZR9N+UNzXCe
	eFknsf0CxVuJNAdlkgnVIxPIFOPEESG1387l5vniVqzVAITtOMwd17CPR1lz3iLWXV3PKEY5p1hMr
	POFrAYUm78vv/5NFEtpMrSEyYf1Px+i6EpJotpGoniZXc+RO23ScCyPItkfZhIPGaUCWa/Vzj7QP+
	EeauT/ReSr64Z+tv1po+jkTIcPuNAK78tZH37Y7o16K7nm1BCcP9tY8YCUUg7Rz2XLtmxzCVmOZWE
	xVo55UhNF9iNYawn8lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkVe-008QYj-0X; Wed, 13 Jul 2022 22:07:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBkVa-008QOk-TB
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 22:07:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id r127-20020a1c4485000000b003a2fb7c1274so1558549wma.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 15:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7URAfRkTR9J4BOD5X4t9feYV2zH27ubtUGqupNIulVA=;
        b=h9aWQ5CkgGy4cxP/I2LxdYdhO0A88bEzD6Ke2Kbvu6uMzx7hMNcjHJ4DMweFzhNeTN
         dHpvuqxEDOrnvP6HgxMD9OzYxMIYGW33GV20HX+H1nQ8gR1Dk289ky3cNhmk/LRJpQZ7
         qqRr9gwk7G6BPYVLtWZQ/Gpkc6IECQODm8IG/Aw1LyGkUyIJ93T0LcFxsESWvsyMfek9
         wN/atE85AYeXgqSKzUfA/H3fbrEaCqvv2p/9Qjeflvt7MFkx/jNIS4twqziXytOVcVn9
         g9jRnBe+vyjEsYIsvuHTGu8bUKIjeYVbg/XTA97TZ55jawtS+hydTh49UzgEC/5O+Cns
         ISLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7URAfRkTR9J4BOD5X4t9feYV2zH27ubtUGqupNIulVA=;
        b=j4OCr/MjBhcqzRb98rdvGOo6zaTMzg0+NOmmlXBBX3z3xjNed/ZPaQqfBl7pInGb5w
         xSsMGi5Nf+h3F+zuQfMFuLFObKcbQ8wXqOuzkYorSiD9iZQ92u4aWUzQS5VwWKX2QL51
         fxs5t9aVNTVHp0wXJMLZe2RFodjrGylT/cJCwjnCMWRa8dxT8c4VyzI+1KlA/DPXvpCW
         OtCjo5+FHllgPE16+18YYcu7zPdBHIeRLbO7R9NZ+pimb+PKZk3rMUiBf0/Fmv88FXdd
         lFVO7yB5kjftMGnxcZ/j/SHoMFzQaumtQChI2nDY1pqwH65CFnviioqrtNzw9A52hhDb
         nJrA==
X-Gm-Message-State: AJIora89akDkcp8X3YQ9KScC+8UPRdRu15HvujqaDoSUo4Qg3VMHjtJX
	k8rf9oMPuUrhTjOlXPUOP5px0Pipxbd/Zw==
X-Google-Smtp-Source: AGRyM1sdEvxIk0dc/ndNt8ZA9mZRvtOE0S1nhCEg/m/LDd/5PGyKcrr/77iEH/1x9kQxflZjVl6DrQ==
X-Received: by 2002:a05:600c:1d08:b0:3a2:e05a:81a9 with SMTP id l8-20020a05600c1d0800b003a2e05a81a9mr5795871wms.89.1657750015851;
        Wed, 13 Jul 2022 15:06:55 -0700 (PDT)
Received: from localhost.localdomain (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
        by smtp.gmail.com with ESMTPSA id b13-20020a056000054d00b0021d7d251c76sm11870156wrf.46.2022.07.13.15.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 15:06:55 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>,
	Jude Onyenegecha <jude.onyenegecha@sifive.com>,
	Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] riscv/vdso: fix missing vdso_data declaration
Date: Wed, 13 Jul 2022 23:06:45 +0100
Message-Id: <20220713220645.105138-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_150703_004838_3D87CC29 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

The vdso_data is defined by has no declaration as the
arch/riscv/kernel/vdso.c does not include asm/vdso/vsyscall.h
for the definition. Fix the following sparse warning by
adding in the asm/vdso/vsyscall.h

arch/riscv/kernel/vdso.c:42:18: warning: symbol 'vdso_data' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 arch/riscv/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 69b05b6c181b..7564f0208957 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vsyscall.h>
 #include <linux/time_namespace.h>
 
 #ifdef CONFIG_GENERIC_TIME_VSYSCALL
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
