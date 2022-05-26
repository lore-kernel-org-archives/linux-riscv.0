Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F64C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYPBn2FsTndxOh+fFgiDEPcgE/o2+1nmoYE0Fqb+Ksg=; b=vnj/YOlL2om3Y+
	XlGeICaP4P6pG4NZf4W1X7jGjRYAHVYtNL4XbZmvGVgc0+zOBIFebG0adQofkWUb1lIt7SqPvdSOC
	dgAF5uutYBbuYK6qAkO5YkaVrdOHwzT3PlQRWn01/Zd90btqqE4CKaEHwb6IMa7rsFeNWvFBGUWt1
	JhaOYjfaNqmnJIuxxHgopCW86ANf2JhCWoouH2JD4XSgWFfQz7nwSvQy5rNVOtzLfEHR34/BNNBE1
	7sZo30Nun1gdPDLXsNfjOh6MSAS4c5Re0YnIJP/u3fly4FTge0scRaCiwnW7ForzwOJOi41P5AhAU
	nQ1oWG6g4WjH8vEtREtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuATN-00ELbe-5r; Thu, 26 May 2022 10:12:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuATJ-00ELYd-Ns
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:12:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so4022444pju.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2nXJi7PiDDt9d1NL5JWtAPFwSienZjCWVKHwZcbhaBc=;
        b=JOR9LUUFNgj0IhaBYyG+l5lZ0VF9aY94nwBPk8vRUqj9RK+tdsptxfK3s5B99lnFXk
         2ccRWc8trH74wUOJ225CGHcpTKEsX6ZzpUjc9JKnZV+6ZpPFVKTgKN0tMyqFUu9NIv5s
         SjbVlc6K3Cb4zoXyIamBmKjv/NuHbpn5zZE8I+rMWqlqP8gytbUKBiPlVmalQJoENPVJ
         E0Y615jRLoSaQgCZZ71FCsFsF0sAcF1J5QF36Fe7frEj/tXj+rdciwQp3nGid8lzS5kX
         D1T5HG613dqG7U8xRPU7+o3Ixt+rfgmhXvITxe1fuQ4PEweHuRsDjHSohwiIS43nevOS
         ltiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2nXJi7PiDDt9d1NL5JWtAPFwSienZjCWVKHwZcbhaBc=;
        b=osx0ykjE6H+BhIN7xJG1o04ZADRGYCc7EQ3Mox08fe65m/M905a10zYbwnQNnfhIQV
         o/tzi1scmEbu4OZS3QpivD8wgDNqmBWC2/bRBFUXUSzdp0sXH2os3EqnHh7QkzW2HmWs
         yfSVpCr07sr8IZgnwZIH3/sH1kSW3Ejsa0GgnmBPlUCW1BLDp2z7xYphffvahcgJAdTi
         b27kAOiktbqOvxRe/ikoKHcQQN03Z4xC6CnQw1UufBpScRkQU+aKe7mUHewk25yDejsu
         NPX9+R5Svy6ZWSsXC5Ygcn0XWOgecAq9GHptR6khq9M3cg1x6rw3UNjUsNQqldetNvg5
         SBww==
X-Gm-Message-State: AOAM533PriH/KGlKyqqsmsaDNcGkxO7dA/JdcxAeijjlPTntU18N1YiS
	M3FnD4JM9sK53wrpVXWikOgXeQjq/8cJX+NY
X-Google-Smtp-Source: ABdhPJzk38UFvmZ2o5iGTIUaOlnX9TN0YPEZTK04SPZov7Zl3y6PwSIE61Oh2DmJjFw+uDJ03NumjQ==
X-Received: by 2002:a17:90a:408f:b0:1d1:d1ba:2abb with SMTP id l15-20020a17090a408f00b001d1d1ba2abbmr1833141pjg.152.1653559919412;
        Thu, 26 May 2022 03:11:59 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id z17-20020a170902d55100b0015f309f14d0sm1114861plf.56.2022.05.26.03.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:11:59 -0700 (PDT)
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
Subject: [PATCH V2 5/5] riscv/efi_stub: Support for 64bit boot-hartid
Date: Thu, 26 May 2022 15:41:31 +0530
Message-Id: <20220526101131.2340729-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031201_830020_D38C7366 
X-CRM114-Status: GOOD (  13.47  )
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

The boot-hartid can be a 64bit value on RV64 platforms. Currently,
the "boot-hartid" in DT is assumed to be 32bit only. This patch
detects the size of the "boot-hartid" and uses 32bit or 64bit
FDT reads appropriately.

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
