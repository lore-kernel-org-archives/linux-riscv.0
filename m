Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0557C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkhPfF44KvzftidSVpNkddhtP8yi6IC5WNsyOe3XrXk=; b=P2TivttufbKuJw
	prHLHfpRgzA32nYK95GhzgBIJ5i2IahsqeYn9UtYHC+Z3H8QiPwFgsixigHkQap3xycan4zXb/Nyx
	CXQ3nSrIS+cCCHsPDuOumSdC6HHUL6nBSexqZxqEGq5ziYITsYIhuzEYIw+RsXE872tpqWTOO+vTt
	NlQyGJobPrt/VNrWiJ9fCWtUhZInEtH/zoABgP1k1Aj0ZJGGdCXx2YLON6rYi+z+KysRCqFuJcAC4
	xxtKqFYiB4XhKw+nnLL7AlI1v/CSacxMw83E4h1nrIW2JW3PFRHxpqfiFeLoZxXR8xAxB9exZmxvo
	j2f+4gHKkEOgGk2HlyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfu-00BWTu-1Y; Wed, 25 May 2022 15:11:50 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfn-00BWPU-FV
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:11:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x2-20020a17090a1f8200b001e07a64c461so1912412pja.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qOKTXeNWDM3OWSCFHqvRVjau9Hc7oDvh7tjC+k8jq/o=;
        b=UBPZWH+TATz2VkNVjv3l2uIGgs0f1hNmfKu7UsCQSpxOzNfX5uqFHquZe8kNsXXQt3
         BBCLl7nupfFq0WQFWWHfPkBOiIa9/ew/QhkawAL+2nW1czDfTbqXjob/WnYtw5XrT+jg
         B1xb4KceFpgK1vSRD9I1CLCGHyHo03oThdHhNh8BuL19b7UyfuhcqLvsfTNVoKdHuw7z
         U7dYiJnG03VkJJdBriok+RoqEbdYmn/kJ8GgPr/WvK3g51iR00AhGx385tiqh/+cShSw
         l0MgmcAbdSlv76GMNFW5D0zhfaUPWjXU7Hq5cZ2nuurJFE+SiUluGvCiOSRw4kON6eaV
         dtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qOKTXeNWDM3OWSCFHqvRVjau9Hc7oDvh7tjC+k8jq/o=;
        b=KIPHsYe/Cp6O0UN1Gv9pnzT286gMiVZAwfkd1iMKfmwqD/xy+4XVZ+fCLk7ECMbJSL
         JBzdICPTHNZsUgSJCAq2ie57WGC4uXzJYemlwYRX1pocyArOj5yptN7fQXr6tvlkc8eN
         bZJjXBjRgCFg64Q4aSEMfdUPl5LT/pa4ITLbehgjxsbxlwzLJ5lwqtbFUOEMLanQJZa3
         K1nfDLH9asl+5a1eKAlVEUtUj99ro+bNbtapy7HpUFlg3ZHZlzzspynqQe+zw4Y6IRv0
         dq/pWuNkxtgDLNf9dtR/MTVvWUB2ZLRW2ZaXFVLNUN5MuDhvTodIixnxKRGwbhtzfh3/
         SFyw==
X-Gm-Message-State: AOAM530nk1RuAUXdP+nfhwr75hZd8IipXOmHexkpj8+a32WbyrY9qj9n
	8woLYkl6UEXz1Y3cBoK8/WtcDw==
X-Google-Smtp-Source: ABdhPJzFV9KXkmRnt8/Y7g7Ea3f3WGAs/0un5724uAJwdas6wB2yfb1D/0UbPM5JfoAR9HFPwLVd2g==
X-Received: by 2002:a17:902:d707:b0:15f:42a:bc62 with SMTP id w7-20020a170902d70700b0015f042abc62mr33373118ply.98.1653491500360;
        Wed, 25 May 2022 08:11:40 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b00161b50c3db4sm9383129plg.94.2022.05.25.08.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:11:40 -0700 (PDT)
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
Subject: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
Date: Wed, 25 May 2022 20:41:06 +0530
Message-Id: <20220525151106.2176147-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_081143_576130_DAA8A8E2 
X-CRM114-Status: GOOD (  12.67  )
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
 drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 9e85e58d1f27..d748533f1329 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
 {
 	const void *fdt;
 	int chosen_node, len;
-	const fdt32_t *prop;
+	const void *prop;
 
 	fdt = get_efi_config_table(DEVICE_TREE_GUID);
 	if (!fdt)
@@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
 		return -EINVAL;
 
 	prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
-	if (!prop || len != sizeof(u32))
+	if (!prop)
+		return -EINVAL;
+
+	if (len == sizeof(u32))
+		hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
+	else if (len == sizeof(u64))
+		hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);
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
