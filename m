Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E1EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xT/sfrMJYndF6QN5OW5DMkhmlajAz5FMDW+Vco5LkFg=; b=cb+x7Xqx78cuD+
	5u872wSu20VTs0Q8Ix3ouZqW6dTAI03JHDbgxZ2ahMMZb7FOUNAg3JfD9Z1n9f55CRlM93d6xY4CZ
	sV1sH7kCuCB85h+E9e6nn6l9NHzjYp/UB6biAOQa5ZxeYmWTCn3YR9wN8A6yGT1JwBAm1FFO13GVn
	6N9blTUdYlxfhedB2IJ28REb97p4NyVZ7aAPr2Jo+lMFKn2ry5PRoVPNRQOSp5uZDok9ct9v373ao
	XDUiwI/49ts6uSttEBu8hOoUy26+V+o2VzGsFNvdrTMoDc5vTiaTnGFVIRfPneGiYSasZu2ePO8y1
	waMafgXUqB4yPC8pT34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9pm-00000006Iw2-3RIw;
	Wed, 14 Aug 2024 08:58:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9nz-00000006IC0-3Kah
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Kr1OlloTvp35mKilBnuEZzypgigPXmCly4KSd56Q7OI=; b=B1/KZEJx5Vr9fQtj4hIEeBiQz/
	MUtnuVJeVMn0gvOrd2JhcLC5dZjZheuDF8eNs7bWXtb3w5xpos45heBYGrtMuubxJ4cG/SC7hZSSF
	rE5mGI5xEQuKJj0Z/sFZalhytdN88fxO0la7GDPHLFyYm6tIxs4vrRiV/yeG+IvKap6GVkVgty3kT
	zIzK1DET4MrcQJsNHAucku42wKCFPUPCVZUEqf8znceVh3WGcuNO+iMc8+UrDi1uViGOfr1E1FezW
	vxeN4CIACo3pEPMKGbPAaiYHOWVY2PjeiyshJ/uXsqPBAYTviLZt523+lgoOPWHtwBhNGt8bR29SI
	ZRpXCxVA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9nv-00000007zBA-12eZ
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:56:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fd70ba6a15so49469895ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625786; x=1724230586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr1OlloTvp35mKilBnuEZzypgigPXmCly4KSd56Q7OI=;
        b=iEddrKr4i1PnAor6PaBO4WFxY8fFLVHe1ZAXi4dMJCW55fBHSFIoCntBILB+IGoKix
         5otW38RKyh9z7afkeJpvChRdCo+ZWd38V4an1oO3e6k6wJteeS8BluSdhtEEFEt+dw/i
         koODw7tZSe3/OdcMsR+TeXCwGmLsqmcmTnSNBU1HY9bQgMgdTM0cm3gMvWxY+dy5F8iW
         VAyO0aRYiNBY38GEie3eIzMRfYaFfuI7VvkjUQaAOQ+VqgHS0AsLZKWYSzvkodyvbqcm
         12X5UPZLL86klSW+RLpCPhqOywd/79fd5ZJgvVWoyZRKgvAE11OBe+yPa4f/LtASEoVB
         Lffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625786; x=1724230586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr1OlloTvp35mKilBnuEZzypgigPXmCly4KSd56Q7OI=;
        b=nbINUABRISqkA76PAu8N/RdDNpj0C3iUN/AAdixluj79OKYISRwl7DdaJFtwh4VQPC
         lFscJgSFbqOWInmnoTPTb+4oxrNI5L2V9ZAxLj/XVLyj04gy7aAiscD/jGpci4BLW2gi
         5Jc5VUFO8tGDk7au7roqSHm64xFzE3UcLky347BeM/e10IDnzFOkxuK4oX5ZubKOxVa4
         CsLFalTlL57VNscDTIvrcXCof3e531aKV7Rl9YoaCIDG8g1S//V/Fa/dhjPSVSCjwuRz
         K7qCxcu/cpXYfXnhrnezIlo2NSTJaYVzn5ftbJUSPkAODBT6jD6l6IpFUGYZwRjl9AT2
         NNsg==
X-Forwarded-Encrypted: i=1; AJvYcCUtb2MgbpIQnhb4UY4+xLGVmAAx160GcQXDnV/dX9Bor+Fa6o3FIjd+oQ7Lpz5yrCqb58tIZw8+EC7lesgsVDyGCQrzumsbWHEe2f3oW1e2
X-Gm-Message-State: AOJu0YzhTnIqKFJMcgmz/YTDpDIl6hptnRHGD+KH76o1kZDDgNi9SaBb
	rcOsmcFnJVXMkf8fMvefNdSJ1TwI6VCoh5ZgiKrBuQwZ23X2QjQH1gRa9xtYr98=
X-Google-Smtp-Source: AGHT+IE20LewatO25ueMR3XW0aRNE3Ho00UvK46l5CUL7vUBX+0A3K1zUsQysbjVk0qPCHhMgq/ydQ==
X-Received: by 2002:a17:903:360d:b0:1ff:49a0:46b1 with SMTP id d9443c01a7336-201d6397db6mr25518915ad.6.1723625785721;
        Wed, 14 Aug 2024 01:56:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:25 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 3/7] kasan: sw_tags: Support tag widths less than 8 bits
Date: Wed, 14 Aug 2024 01:55:31 -0700
Message-ID: <20240814085618.968833-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095627_736607_69640736 
X-CRM114-Status: GOOD (  11.08  )
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

Allow architectures to override KASAN_TAG_KERNEL in asm/kasan.h. This
is needed on RISC-V, which supports 57-bit virtual addresses and 7-bit
pointer tags. For consistency, move the arm64 MTE definition of
KASAN_TAG_MIN to asm/kasan.h, since it is also architecture-dependent;
RISC-V's equivalent extension is expected to support 7-bit hardware
memory tags.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm64/include/asm/kasan.h   |  6 ++++--
 arch/arm64/include/asm/uaccess.h |  1 +
 include/linux/kasan-tags.h       | 13 ++++++++-----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.h
index e1b57c13f8a4..4ab419df8b93 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -6,8 +6,10 @@
 
 #include <linux/linkage.h>
 #include <asm/memory.h>
-#include <asm/mte-kasan.h>
-#include <asm/pgtable-types.h>
+
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_TAG_MIN			0xF0 /* minimum value for random tags */
+#endif
 
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 28f665e0975a..56a09f412272 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -22,6 +22,7 @@
 #include <asm/cpufeature.h>
 #include <asm/mmu.h>
 #include <asm/mte.h>
+#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/memory.h>
 #include <asm/extable.h>
diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
index 4f85f562512c..e07c896f95d3 100644
--- a/include/linux/kasan-tags.h
+++ b/include/linux/kasan-tags.h
@@ -2,13 +2,16 @@
 #ifndef _LINUX_KASAN_TAGS_H
 #define _LINUX_KASAN_TAGS_H
 
+#include <asm/kasan.h>
+
+#ifndef KASAN_TAG_KERNEL
 #define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
-#define KASAN_TAG_INVALID	0xFE /* inaccessible memory tag */
-#define KASAN_TAG_MAX		0xFD /* maximum value for random tags */
+#endif
+
+#define KASAN_TAG_INVALID	(KASAN_TAG_KERNEL - 1) /* inaccessible memory tag */
+#define KASAN_TAG_MAX		(KASAN_TAG_KERNEL - 2) /* maximum value for random tags */
 
-#ifdef CONFIG_KASAN_HW_TAGS
-#define KASAN_TAG_MIN		0xF0 /* minimum value for random tags */
-#else
+#ifndef KASAN_TAG_MIN
 #define KASAN_TAG_MIN		0x00 /* minimum value for random tags */
 #endif
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
