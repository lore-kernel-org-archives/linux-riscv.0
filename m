Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B071BC5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si2yhcDwZhqho+QrldZzB9KOYj1EdLjGN97bEyLBj3M=; b=0EWdhKqie+hajh
	NfkV34pPt9eP22EjYmMVnX9X/DVGtcEgE8UZFS8p9zH4y6gmvwd1HqtEV6YeHUBsqXh14BbBO5g86
	3jzLzqlt0gJnjMLFhMwqS5QvxAcRPRuqC5H+Aj/75YLWj3j8nn6AvDkCrEnIa6VZkao454kxo29Hy
	w1Ro/Dh3g0LGhji5HZJ5ebbd6ed/0SAcmQV61gBOMJF2TWG02+IG/9iOJfz2DjiFqIsacl/fIfB+s
	YRzY1Ex1OsjrQWuhhNbCYeNH4e2pAQJzReG8tQ9ekHcH3Z1APzOY0NkfIux8y+0w6YPbXcBk5evhA
	euFYxbooszkZjy8glPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fR-003xgq-0f;
	Thu, 23 Nov 2023 06:58:29 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63fO-003xef-2w
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:58:28 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6d7f2058213so349848a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722706; x=1701327506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXVVh5tHQq6H+NSQA4JeCtH/rNgHUAw+NLKBVun1FJI=;
        b=W4FBE+5eZHoq4bc6sOnwuM9tDT40g7IpZNcrWUeLhT7XU/RDWtaXorW/3q/CVxJMFd
         IM0CufGpQrJsbFqXfdztFv4NiHkp528U0TX9ZmJU6M0mdGogoXcSOhLvfJDeD4MujRE9
         ovW8mRdPGprSE26464hbIWdZDhSV1BBX1w3QbLFoXwG1O/10Y/C8OBiB89WSu+YouafM
         jTZxgUkXPQLvFrGtYr5cd7AcrTAXQ+YEqE8h0mfqOYdcUjd/l4TKCZPSYqvWpZUIJbil
         INI/GPMktSTY1MEZDdyR2KInr0BUhoPkcYoeDNFujFplbrMGrTPAxSBHKHznVvFU180n
         JNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722706; x=1701327506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXVVh5tHQq6H+NSQA4JeCtH/rNgHUAw+NLKBVun1FJI=;
        b=Nad+DL5b4iRjpvrn6d2fnRRIAHJRVq1Z/muQJbC4SFYoUrpuhHk2WkaQ5xCAQGZxxt
         g0F7E7AI69Wmuxs3d8qH1zE3lI5wPIMrb7RyxE/IpFY65jZCRMfIZAFHD3PFz9cWgeZg
         8bD59RrIbfuAkdNx8zMN6n/aL22WWgI4x95zFLyWXkNIBl7Xiso2gXgTV4ctjlZaAW17
         XPrps4Dv+xpKbfRSiRw8Rr1DCmmCoxjMCr8/1t/e3U33cLEq0dxlCd0gLYM09rfdUvC3
         Uq+YsPuB/Loa0BNMYMA1g6LeT9HG+ct5HFO/AwuGedVADivxt8s3hvtot3hfSDPTB4wS
         BBKg==
X-Gm-Message-State: AOJu0YzIv3VferS34LEXGoKTTgT+HpSojR6wvEeUeD2/5rdRCLiHgJws
	yArtPWd4ohOZj7ASPZutAHtm0g==
X-Google-Smtp-Source: AGHT+IHjXbEiIjdrtzBQes9pWsmlDe44Anh7ZX4igq4dgVqzJwwbqJ+5ff/GxnQby0i2Dm9GfBQciw==
X-Received: by 2002:a9d:620d:0:b0:6cd:8c3:5b40 with SMTP id g13-20020a9d620d000000b006cd08c35b40mr4649798otj.36.1700722705824;
        Wed, 22 Nov 2023 22:58:25 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.58.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:58:25 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 11/11] riscv: Introduce 64K page size
Date: Thu, 23 Nov 2023 14:57:08 +0800
Message-Id: <20231123065708.91345-12-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225826_951200_0F9666C4 
X-CRM114-Status: UNSURE (   7.66  )
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

This patch introduces new config to control whether enabling the 64K
base page feature on RISC-V.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/Kconfig       |  1 +
 arch/riscv/Kconfig | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index f4b210ab0612..66f64450d409 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1087,6 +1087,7 @@ config HAVE_ARCH_COMPAT_MMAP_BASES
 
 config PAGE_SIZE_LESS_THAN_64KB
 	def_bool y
+	depends on !RISCV_64K_PAGES
 	depends on !ARM64_64K_PAGES
 	depends on !PAGE_SIZE_64KB
 	depends on !PARISC_PAGE_SIZE_64KB
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 105cbb3ca797..d561f9f7f9b4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,6 +227,7 @@ config RISCV_HW_PAGE_SHIFT
 
 config RISCV_PAGE_SHIFT
 	int
+	default 16 if RISCV_64K_PAGES
 	default 12
 
 config KASAN_SHADOW_OFFSET
@@ -692,6 +693,25 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
+choice
+	prompt "Page size"
+	default RISCV_4K_PAGES
+	help
+	  Page size (translation granule) configuration.
+
+config RISCV_4K_PAGES
+	bool "4KB"
+	help
+	  This feature enables 4KB pages support.
+
+config RISCV_64K_PAGES
+	bool "64KB"
+	depends on ARCH_HAS_STRICT_KERNEL_RWX && 64BIT
+	help
+	  This feature enables 64KB pages support (4KB by default)
+
+endchoice
+
 config ARCH_SUPPORTS_KEXEC
 	def_bool MMU
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
