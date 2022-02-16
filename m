Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CDEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 05:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gE4e/lvGE5PcKqg0mF1A5iz8dfdeV+Ms5ViRoBRNFHQ=; b=YTVs0eg9wdUu34
	kCXz43Kn3DCEpnlarkTDIl0a1c3+eiL5NoBEW0cNogNDSJUudHQiHYKcs7VKI5bDQDo9Vpo7JHT9H
	47VrCZAijaxT07S+rRX/e4SIN7DMch++dsX2n/Hn+vtGi3RSXkEc9twHjFtYwcC0cYVKF7UayG49+
	z7mkmAQh88ZtuBOMUokAQC9yZIC1CziughYtH35gO3pY3tCMTodS3gVhxpLt+8tjbUDF+XG2LNAPV
	GWCV5o5ENJTa2QUiut6QkItF/52HcgP0oRZjDRed0Ra7E0Wli01hDwdIXsvAkNsSSBmmxsUpmQvBR
	eDflkGdXL6yQ/cwuy/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKClN-005aEj-G6; Wed, 16 Feb 2022 05:22:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKClK-005aDg-3l
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 05:21:59 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1383536pjh.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 21:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fkaw2AgXeRapA2vSGzULQ3ZFgz87sJihuak0e8PCYl4=;
 b=JVdxVIQGvlv4EAIbwhLIia88Drof+Ql0VIpTJ5KF80jdvIuqT9g/y3Z6uVveFvkP18
 hQyjG+Y7edH91sHJZWwqvINOjxz84mpFEcxXY+ehad/rP0MclJVE+Il3nQ4KQPvKvJMo
 Wnwxmr2mxeSp7uBReaQYgY4pjEP6BjFpkZBqCzbLbvDCTKNB3RXmeeCmGTxiE9I7yfpY
 WO3OyX7PN4SANtT1Bi7IIQ5rsR3P46pUsifCcLKgVXriuZIas7isxbd+G/f1gH/P7euX
 at0vrBTRo+DH6DvbwEo0zAieiSpI5KURwlBmzLSy2X9aGUoXuYyXI6hVmUuey1WNhl7p
 dCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fkaw2AgXeRapA2vSGzULQ3ZFgz87sJihuak0e8PCYl4=;
 b=IyRAla/Kz7/Fhzl2yVHKItViKDvyF1fBKR1te1WO37F/FXcEfhikG9lPjUUhzg+VAb
 b5Tg40NJEAXFSS4k6eSqtLhLdomIOttwYZfMTpdKDZ/IjSMkFu+KlVFuMj8GbLFBVp6h
 A1cp1iqyIedg6VHEt7ZX+Rs0VuSshEJx/c9Q7HWE+Sena1vFohhi5qq//HZn37b5HHTd
 C97CoKwHisyKNY15iYu+oSfeqWJkZZn/GB1gzf3R5M7n62Asb2qu4o9UiEdnCNZVGxvw
 gifV528dO29rVbgfCl55hKn69YnD3/nUnssn2v1k7OCyCtGAD1JH2nbXkFVV9F1dlVEF
 gT0A==
X-Gm-Message-State: AOAM533tq+jr7RUhadsgUnUTsLYq0R/LWh2hSUG98ypIs7bWO2gjMBRq
 odLRMk7GQL5E+H73FDf8Ii+/oQ==
X-Google-Smtp-Source: ABdhPJyqifKB2A/wkCgP3p0BooigA7Y58CXS/BbBGPS8ZodKSN9SErbkIUz+aRc5ZwwoucVhJKFPHw==
X-Received: by 2002:a17:902:c443:b0:14d:a756:b1f2 with SMTP id
 m3-20020a170902c44300b0014da756b1f2mr1032189plm.94.1644988916233; 
 Tue, 15 Feb 2022 21:21:56 -0800 (PST)
Received: from localhost.localdomain ([117.248.109.221])
 by smtp.gmail.com with ESMTPSA id ot12sm10775259pjb.22.2022.02.15.21.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 21:21:55 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: anup@brainfault.org, atishp@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH 1/2] riscv: enum for svinval extension
Date: Wed, 16 Feb 2022 10:51:09 +0530
Message-Id: <20220216052110.1053665-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216052110.1053665-1-mchitale@ventanamicro.com>
References: <20220216052110.1053665-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_212158_174055_D64B41E1 
X-CRM114-Status: GOOD (  10.87  )
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

Similar to the other ISA extensions, this patch enables
callers to check for the presence for the svinval extension.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 691fc9c8099b..bbff7cb279ea 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -51,6 +51,7 @@ extern unsigned long elf_hwcap;
  * available logical extension id.
  */
 enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_SVINVAL = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ced7e5be8641..ff0613f8cc39 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -71,6 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 	}
 
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
