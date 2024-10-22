Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12D1D17157
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3buJizr6zp+20ueZuq4KJMoa/fq9056gyhwQuKUI93Q=; b=1vSLN01j9oWblb
	ElZi1vfHWBp+Iagycmvxk9QMKhUHfuVUYHW5l/R9yaFf82XkZ5qQSs83Z5EpcNyB7h36ZYpssttfy
	V0qRGUVLfb7Ulw5Pg0figgAgO2U+GpScb4AnIA+FrZqKVaCCxby6SOINc/5X+QK6NcTI4N+3mQnKI
	KF/+PSx4Rlzc+Fxh9P7K6ngpTGemak9ohvwCLHcTPCfEXkorp2yzHsxqs4JEGcBjGOimVtJv3pmxM
	eQiOPygmaAeogCXui5FlO1fNKNfh3YXWNzRB+xZFQ3AcizRJn1e2v7sGb9Ns1yBQgRmNVpUVJAkuq
	XvTeQRCn0DPMlLLrNq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34HO-00000009HRy-3k1n;
	Tue, 22 Oct 2024 02:05:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34BA-00000009Fnw-151e
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso3282621b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562363; x=1730167163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/iY9Y4RpcnWjc25xyItwxMbRygrVUaVLlWUhwxh2UQ=;
        b=MC0lpBtVc/H1rPTiBpCclnBzMwb69GoX0JsjIJjBqRm6djKgawCf2w21i7BBbMN6Rd
         jjdt97OPhVAPadhplc9SqQQu5kxTjqV2WQX66+KV4Niy8Y7RyLMl6p13uWVmpNNys/Jd
         +pBsQAv+W2VMPnOquk9ovVy1NIe6zfs6JRD9qDlJyWaf74eGIkRv9f8vIJNoaMcDtqKC
         txDhoKGQ1TvOJXjCwI81ZFl/Wo9va2BvHlfTxXy9eJ/CCAutWQyWm8jMaX5dfbOyCler
         JjPGbLAb654oEI1lHfDBh5t5j97nJ5XhMRqggeEoHUUdIR4E897LxZf28SKvkMbWEsup
         XJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562363; x=1730167163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/iY9Y4RpcnWjc25xyItwxMbRygrVUaVLlWUhwxh2UQ=;
        b=Id2NufWVFaKv0C3l8Bkdd34UMFYMJ3MqBuxjWiqnbAcWqPdIDSsyFTh/L/AeFLbi80
         Xao4UAPUb3fm9lzRd4+4b91eAZkkkgCUmDShBGFDoy4ACCrH0l9s+q4gRKuE+a/PEoOW
         pZ9/S4G4uwJwA+ctd3uB+lxbfMoI3G3aBRRJreMPWCnG3z+APyDG7Y6jjwEBg1y4bCQ7
         8HjepdUE0NvFT/N8EUTMEx0Zf8bNs4hvGTdGBT9Tqj5QUL6n6qIb4QEdBEVAP8hIzi4U
         eaAUFpQFdjzwnaKDwONP01zT2b4rNSZ6d6WPut80jLqPzhjO8Xd7g7ce1gzVbGscQym2
         MLew==
X-Forwarded-Encrypted: i=1; AJvYcCU1I1iTM5M1xGy4W8JsuZsnRhFCnTk2t01/XUK9Xj/SJXVua4PrgYgFTrzPyNzft0omRUM+jWFjEOI2xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdJtZS3Jizg2a/uEkypK6kUhenxdx6bS0kc/CoiAehsZ3V78zK
	Cues2s6FD9h4XSiTLmCbs2R7D8TdVk4rNR9bHBdq/BCTG0wxpzhiJJ6hQ2Q/5RU=
X-Google-Smtp-Source: AGHT+IFB0AudxwQCUfX+B+Q1Nd/kKdWsIXk3CQ+Qmrq1W4iGhp3wWHffFzDvMvs7eDfgOIFmgokQfg==
X-Received: by 2002:a05:6a00:9298:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-71ea323b91dmr19028480b3a.24.1729562363415;
        Mon, 21 Oct 2024 18:59:23 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:23 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 4/9] kasan: sw_tags: Support tag widths less than 8 bits
Date: Mon, 21 Oct 2024 18:57:12 -0700
Message-ID: <20241022015913.3524425-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185924_379692_F210174F 
X-CRM114-Status: GOOD (  11.11  )
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

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

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
index 1aa4ecb73429..8f700a7dd2cd 100644
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
