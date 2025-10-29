Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC3CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qitYHkqF4RDD4M8oZWe7z+ud+TMWSlCIqffSpikHsQ0=; b=NZyIH9Zqh/j+VK
	WxA8LNkzctX0ohuIlbBS9L0X587qNubpcQ3wXNO0nvStfGW5Ow4bl5WJ5vQgTrHNRdycr2jgDDiic
	SIPEhAldKExu7kXAyCYe2CDDJ5kHFSdLBX3lkF/1pNlxdPim6Nmjw4Sersp/20VcTc1bi2du+Rq7g
	2HtfgLTcLpPE/+Rg1vtd05SVgP12UhJR0PouWHB6HlC/WHWCp7b28ZZo9niimwREFcfad/yb8MxKF
	4KtMMRDDu+HQSSlmsDi0yM0gdUx7s+4tbNUsxWrIaExx92tv+dMOh1+bA8qf/F2K3YH0DxUHsgiRg
	Ly8VL8rycG7m5gdIOXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ko-00000000xxn-39iN;
	Wed, 29 Oct 2025 11:27:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kl-00000000xvw-3O4X
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33d896debe5so7876765a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737239; x=1762342039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjTmNoD235Z0Q+UTnvL+T6Jk9tiw9Xtbmp+pbEirE4Q=;
        b=gyRrD1Gw95eKxoMsMvHWEhegMHpJt43+nTQ7AxRfiR07Y/RWMe4euNa/Jj8Db19pHq
         5MpzrC8W9mDaJ+au0fEarClOPy6BTPHrjZ8L8u/5mpMm4LTKr1UFQ+5ZgWTzHwLO9Sj8
         bazoNgfMXsWfVzqx5/6EetFOPozwKngROxDQWq+SeEb0rD4yLnymEXVSiEo9JXIWj1I/
         Wd5dz0vxFhqvO7U/Y1jBovfZU5h5qh1DmhjWOPn0GC7Zhz/lOBmUkr1YIGUycx/9eEJB
         DywGIzeGfB4zRiLay97AFYBAxAZMmH7zIogFukvam9UzoBvY3xgXWudWyjyt71yT2HXh
         5jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737239; x=1762342039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjTmNoD235Z0Q+UTnvL+T6Jk9tiw9Xtbmp+pbEirE4Q=;
        b=D/GopDG440q8N3Xl2nTyiWNNUSNwvcKSwnETjtDgb3w6sc5bpMoUUEAik/2VHgl4o2
         khQcomjrzBsblUF0ubsY5P0UQ69L1bwGmBObGB2rEoVNT/7HKC79onW/DVoyAyoMazQV
         AqHFKB6GhNfUg7BniGTPHKa+jjLEOY2oJcHK1SsRREOumRVUrTvJj+wiFfhlYNqAmO4g
         vEisj7g+YOOAHaU8CrBeVSHPmi/4rljPRZGZfJ+b7HCvvzORkUtbiXxr53NtLpneqhFL
         RbRmRKH/25ePtrjc/+7ajs5zaIhugMK4hdBlD/gdmzPk8hAwE+BgYPL+tutK2W7TLW7D
         v9Ew==
X-Gm-Message-State: AOJu0YwqCUYYJXYbOLXE/DdJxMZbvcP0aTLZmbhz490iZFY6FIg6S80E
	hP23LtxbzGvF0LLLp/cSYQrc3s4HWKVJPZGRgwrS0ReLjSy6d/CfLtAu/oZowPMfm1L4e92wCNu
	WaRRu1VHzkA==
X-Gm-Gg: ASbGnctASxPcf0VN5GWiAMxEA9IJuwPEvVOsJD8Hc3EkWG6j9MNz6IiNLEPP8Sw47ae
	xLyXbC5+j43AqQMDmm/0lnEcm3obsh387PaRGB5zYF/Cg+GyjIpKIOfzXCLTUGJ3VocBevyHI9A
	UofjvyhGx+rH27XY1y/hlWuoN9Yow2MaXP9BoAsixLB0V8MaXm3WFE6SjyRP+T5AUh8CoCmrf5e
	uI5bdEn/zbwOp4Pws16LmNvxnnqmh+AMDBf9A1iITe0ifgyb/tB2X2f9GztvinGYXF3uFkonHch
	/jwYpzekVrJG0UMifaAy8uAcEhBFLNRCHL/V7CJvSGfb2tpLSmEK8l7s4JBZjuvCqC2bDEoEd4j
	WdHtiwbE2PwJqS/Syt7mUTTuMdb4NZTVT6fFMqHMhnMPIgjh04bQdbhGK20dSMP9/o1TFAy63Ao
	8PKw0HA/9+RuYspL9bnLd9jqbNxEHu
X-Google-Smtp-Source: AGHT+IGV9vVH8+hlZLrwbCF6EeuF04kV3fpI5UDP/oNNvPeA5hF+38GHsytRURBATavrU36r7KMQfg==
X-Received: by 2002:a17:90b:384d:b0:339:d03e:2a11 with SMTP id 98e67ed59e1d1-3403a15844cmr2891587a91.14.1761737238675;
        Wed, 29 Oct 2025 04:27:18 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:18 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 03/10] acpi: Introduce SSE in HEST notification types
Date: Wed, 29 Oct 2025 16:56:41 +0530
Message-ID: <20251029112649.3811657-4-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042719_846802_36B6B24B 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce a new HEST notification type for RISC-V SSE events.
The GHES entry's notification structure contains the notification
to be used for a given error source. For error sources delivering
events over SSE, it should contain the new SSE notification type.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/acpi/actbl1.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index 7f35eb0e8458..20b490227398 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -1535,7 +1535,8 @@ enum acpi_hest_notify_types {
 	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
-	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
+	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
+	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
 };
 
 /* Values for config_write_enable bitfield above */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
