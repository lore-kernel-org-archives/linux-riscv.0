Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB6DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 05:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+Z+NDvMTMMvXz23w1W+2IqGZSdqk4nRwciGse4mv7E=; b=GnxC77GhO5q72R
	+rYuhtSP1OG1Neg7fbogaG3SRKTR0ipikHRDwjVwhtXEd+9FFv1ceCNGCyHw+dx4K8pcTxMv92DMr
	W5FaqMZ61AtTzEhS9WdFwM0vID5myZ8viHgjaWsB9vEr5ukFvcUVHFFTGqT0/KoixswXu2OjTuZlg
	KZPH25mcLgDh8bzsq5xbrABk+sAK1YxMQz1F7XCIEBGB6bmnLv+BPvlbTuDFaa8dyr4ezb0bx79mO
	s/tNMsDRaCHQIrG7DwB4bWC0oYklFlltEtDvwd+T4XhMyG91QUnwcg7KnR4twKBhoJnFwgrIVEEc3
	FCgmIj34n1Bhi2jSF2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMb-00GfAR-AN; Fri, 27 May 2022 05:18:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMY-00Gf7L-Fl
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 05:18:15 +0000
Received: by mail-pg1-x52a.google.com with SMTP id t28so3039655pga.6
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 22:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7OLahpm+kkKBEARj4VmqHAWwKE6JWuCb2y1kO4JlMo=;
        b=jbbgWDbwDxjGdcveN5opTsfLAmWPWwGxc3+eVGbfsHWg/8rWmYs56+UOro+RogMEZM
         N62nMVWsUj4S1x1EO9/sOj+RyfnNolADop36vf0W9gI0grwBEj+LHvnS7NObdOChj1fr
         pdp0MAqHt69N2PVB+On0qE0fzZJgaFk0jSAklcoSCwUR6pMoJ4N8ch2kmRJgzYicZ9g8
         nlLrckWV6F2Xf89IfGJjZxykmYvwWKkF7yBDRhpy2/xXY+McSVN22CDwjx0K6bd6/K27
         2TheHSPfI3Q1v5eelfmdXtqX1eqTBKySsvAWD35PX8QXMUzn0ASyQRVsfnxQdZU0In0w
         pjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7OLahpm+kkKBEARj4VmqHAWwKE6JWuCb2y1kO4JlMo=;
        b=DBhnbVFUVINj8xwuT9lmOz9bN8m7zqfKpxgM7c2vz2pWXkUm167apUqpoB/h1Ywxze
         YBR8dxNk0Ni5t3RLfc0Al/Zl7hUnY6kK+3bLEHkkBK4kdJNra1k0EJQoTwaSmlo4eA3o
         LXTnr6VSPxP9C1hiftTtTEcgMTm8gPKST5EK/iqkiI+s6aXKpElUG8LupOynzZLyszbc
         0NiynIbFZUzSdQDmG1hziComxelg226AZfvoncvWJz859QJHTv8qHbqRwBnpk/IyK9dU
         LV2TTVU0VS14sY0keBTT7ufVhtp/n3JJDaxQNYyPsRYZJk4/e4NdbYbK0oOPZWeFY+Gk
         SAZw==
X-Gm-Message-State: AOAM532PQpPt9yVpAKggHYSnFvBn1YvTHvPcORmDuPFCxlJZRzIv6Unk
	tLywgVEgMwDBvtpGTl55V1I7Bw==
X-Google-Smtp-Source: ABdhPJyin/6mDo3jQxnY50FxpZpQL5woePXQ7wxcjU98TpEqhBp6YId9yZPThIcHY/RpYh8wXD0ktw==
X-Received: by 2002:a05:6a00:88f:b0:510:7a49:b72f with SMTP id q15-20020a056a00088f00b005107a49b72fmr41896359pfj.21.1653628691482;
        Thu, 26 May 2022 22:18:11 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id j34-20020a634a62000000b003c14af5063fsm2459003pgl.87.2022.05.26.22.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:18:11 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 5/5] riscv/efi_stub: Add 64bit boot-hartid support on RV64
Date: Fri, 27 May 2022 10:47:43 +0530
Message-Id: <20220527051743.2829940-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
References: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_221814_574301_8A5C5FAF 
X-CRM114-Status: GOOD (  12.54  )
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

The boot-hartid can be a 64bit value on RV64 platforms but
the "boot-hartid" in DT is assumed to be 32bit only.

Detect the size of the "boot-hartid" in DT and use 32bit or 64bit
read appropriately.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/firmware/efi/libstub/riscv-stub.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 9e85e58d1f27..b450ebf95977 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -8,6 +8,7 @@
 
 #include <asm/efi.h>
 #include <asm/sections.h>
+#include <asm/unaligned.h>
 
 #include "efistub.h"
 
@@ -29,7 +30,7 @@ static int get_boot_hartid_from_fdt(void)
 {
 	const void *fdt;
 	int chosen_node, len;
-	const fdt32_t *prop;
+	const void *prop;
 
 	fdt = get_efi_config_table(DEVICE_TREE_GUID);
 	if (!fdt)
@@ -40,10 +41,16 @@ static int get_boot_hartid_from_fdt(void)
 		return -EINVAL;
 
 	prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
-	if (!prop || len != sizeof(u32))
+	if (!prop)
+		return -EINVAL;
+
+	if (len == sizeof(u32))
+		hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
+	else if (len == sizeof(u64))
+		hartid = (unsigned long) fdt64_to_cpu(__get_unaligned_t(fdt64_t, prop));
+	else
 		return -EINVAL;
 
-	hartid = fdt32_to_cpu(*prop);
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
