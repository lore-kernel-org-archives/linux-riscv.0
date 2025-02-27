Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68758C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwFouxM3tyI8Aql7pNSH/wnXRxbihMUkMEXXPTP80kg=; b=cdl6Deh3WX9/nv
	MUOzZdyze0DcoAg9kybjdh6b8eKsH39TZ4VuSxmigIo0c9yKWcqeDT9NG/btj+E0knvXYkXQe1DLs
	tfIuoKTudP3hsjRQQq0JZ/k1ZuPFM6P9+IiJQeKjjDu8uprbNAlTWviIfxu+5iMFbLW8rRjepL5D9
	/BOXuSXwZUBS8twDC2nhEJBAsrPFUTWxxF7MeWfjT4LbOwwpCmp5Vks2MkYk/Fwdl3XYkYLB137M9
	hw3vtAxXYBRNL4sVDDLnSRGr+U4HmoIeWXSjtIXu8w5WTn1R0tO8RwlgVIesuGlh3GVQMkfdY50WQ
	51BzigVD7NpcF4yPOQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndoo-00000007VCh-1YG3;
	Thu, 27 Feb 2025 13:20:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8t-00000007OEC-2ld2
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223594b3c6dso7039425ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659850; x=1741264650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+mNjfrfC3KQpEysy41mS2Tv5FPl9byidBfQ8gAxtKE=;
        b=Yzl2ffT4BUz9VCk36+OWX3Ait6Fy7t2TBJqSAIks6gQb8VYnfzJI+VHqGS/c5SUk/4
         gxLEOdHgiU9SqqvXc7N91P2iZweUcjmqt7je1wj7IajlXnm36hHGxCgU+vd75/ZvEdir
         QBuloBG28zluRFblt390evyfTRMB6IiVtaQLKjJmu+blyDj/teNsUWs8sfD7mIovElgj
         Vu/E9Q1OlVcrpsRziyySaQPLfpFkpD5dliePEu5Nag1DHm/4tNFqH7rNG9q76l2HGCbL
         /8+WSlUuWHsR+3JGR22bZIIIpiYDCDTGIY9S3PiyWKezSJ9QMYNBmv1aHsgc0NLva8xa
         Pzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659850; x=1741264650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+mNjfrfC3KQpEysy41mS2Tv5FPl9byidBfQ8gAxtKE=;
        b=e0FH2uMa2Yxijz77RXvbOwIfeDP1GGumtqPKkdydQq7/JuR/2GAcBJAv8cek+nqsIE
         kPziChnlo3ulSMQhICm6pzB2U8EFB45ddeShJeGkVeq17MBX62GfMuyZ0nZ5H1rBSv9Z
         AxHBFDU5BS8QnQdzOPr4Wee0RbjooGTyLrPrUJSqFEC5HuVb8/UzAylDLokhasDN3qjE
         bz34aHDvqneP5tqg0XDnO1NaZOH0tLOXOyLg4KsaY7V+EsSyfH5GYXb/P2bETj2FKWA/
         VI2/yhUP9qinyJVGBCQkDGGOj4ARGl/t9Z0JbwsnyYSs5i9OFcbdDrtkH8qYioIUv3Im
         Egww==
X-Gm-Message-State: AOJu0YyWydTICRV5/xoian+cyvVYxUUI3NAg40oyVayP8EBHWk01mYxF
	ZsuT5UKsMbqveW4ftzIuwVq7iHdxA/TKC3j14VgSOKwq98p4rhv99EvDdVAa2OIXBGYI7klgb1J
	3+TQ=
X-Gm-Gg: ASbGncujSo34S91mXK8ayeC4WOBBsiiiIM7JqpUAZAXAIdo9KSt/Ra95hCIiQyN8UDV
	gTLHTlFDEPSQ3ZV7voN6bJUKZB+wMuYMGkNUbDQhkSZH/vmOPKXpmcSopDZwZbbNiNpVZ2hTeoc
	VAibBmyvc5QwysgwI+qFUw8G3g421n+yjVyUga+mHCKhSpHG9o072dW9x/il7yBVdBPnpCpZUOA
	Cy1GpVl4ZYDXGjbE7emK57BBW3jI+HF+/PglyzlGUX3lXPZ49w29K9HxQ6bhuvoZ96q94sGLpr8
	tNWXlRYvXkvkk+dOxXVUaSC2bTSn28kptSnF
X-Google-Smtp-Source: AGHT+IE9Vof5DljJTx2QIG7oo7zj0JMnbJZ2cxvFEIVb6E+KmXCrNVvzk23nCPfXj+pXqJcPAINyhg==
X-Received: by 2002:a17:902:e847:b0:223:4b8d:32f7 with SMTP id d9443c01a7336-2234b8d349dmr54186705ad.19.1740659850577;
        Thu, 27 Feb 2025 04:37:30 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:37:30 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 10/10] riscv: Enable APEI and NMI safe cmpxchg options required for RAS
Date: Thu, 27 Feb 2025 18:06:28 +0530
Message-ID: <20250227123628.2931490-11-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043731_695455_71B86291 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the APEI option so that APEI GHES options are visible.
Enable SAFE_CMPXCHG option required for GHES error handling.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..baf97a4f6830 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -54,6 +54,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_TIME_DATA
+	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
@@ -175,6 +176,7 @@ config RISCV
 	select HAVE_MOVE_PUD
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
