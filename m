Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4205CC52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDQly7cJUlP711XQXh1+BGKTD8IP7C5GyYjteUWpyhg=; b=3j7JIvCnwO8PIN
	RfwQht/wY5oM2A7S3UirBNRrwollcmIdPPOF4S8rhY3fjTtAjUUahhQc40pbn3inogsv8XDs8pcdn
	ny7CquzcMm3n8xyP2q9wovk/v/pfCdKjYy3veyggLWHmzxFxaulWSaNoyoLJS9RMDDvW7xgpp6a6Z
	miTjPjppijmNrHn+rnBVPR+VCPuiRsivDX3MaJgFWkoI1NnZ7Ck92PBQvIVh/YT0Fsc613c8VR4No
	iOAXUW/FRQezBiOZMOURVpHsZlNno/mJOkGsBrNBsxyokv3x7x3bb4KM66FAXfemgcuc5sOwpFk/2
	A5rdNeFKt7QxnTkHPPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seB2d-00000006XXS-2ZN2;
	Wed, 14 Aug 2024 10:15:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9o7-00000006IFU-2lDj
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9hz49lwxt/ore9sEZ/uYZptf0bZHlG9fVMF8g6BZbdk=; b=IKneuVzCPsHhPtUAbd36G4dy9d
	d1bQTsxx5gWoIzJAbS4WiLVxwq1JTfw+6NNaCzbwfgs6qT/8QCtVmaG3lZ59HATPsNEK7GMMo/bCb
	ONTFE8ZDi1Iv9cUGkFe9aXQGTbrmea/bQBMjyleWH6PAbvRwS1WNXovtNcUkhmIIz3sKCbScrni+D
	hrLkhj/F0JXxBqnzSamdE3t3ZF2MngNmlwg1TDtfFKqvO+lCGDl2F//qTIQElTZRxWASguaoB8NF4
	s09mtzaP+B5r8PSUwQpmTLSzYh/u/L7sJdEdj9QHljXmJghcQPzr0wItybG+kke0FwzAMrdLl4iJ/
	CqlneHLg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9o4-00000007zGB-04Sk
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:56:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-201cd78c6a3so14079705ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625793; x=1724230593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hz49lwxt/ore9sEZ/uYZptf0bZHlG9fVMF8g6BZbdk=;
        b=BmfK4k+OUsqPfzJxo03M8csv/ozcTptoALRIoq5jJFvG+ksMuL/7aD6KPhIb2CCCOU
         s8il86M7+jM79fZem5FQoz0oDbGuUIhgUuB5Ew5/gPF6opBDakFneB+Ptrdbnc3PWtXY
         fiXsf7TDv1Sdmb+7R4IBDKkom2gziRYiPHTwUF11O5gOEzDmN7NFYuKfK/otvXKQkIdr
         aOgKa6PS1a3/HTYAjIQtKy8jweCwTFmCXTzaKmAvW1gVw+QN3t2SBodCuQ569NN7uwRq
         Tfz06weKdshja9rdF4Qrgx0UsHvyh1zQNfT5I1VJwRxxyDRo/OoljnaEEgVpUM9AdXZR
         Cn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625793; x=1724230593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hz49lwxt/ore9sEZ/uYZptf0bZHlG9fVMF8g6BZbdk=;
        b=o0Gdr+eIZxcOxq9iHkJI1CYYgspO5TLJ6mpXo2ItT2rUyBSxiaW0v2PtORgIG+Batg
         bhjpSlA4wzXYap+GejtQlo9Oxy2M3oD2C99F4A/yiZOBG2eQthsJgDHVGegACx8C6azi
         mz3xwGJR+2LspBX5IBO74Z4k2no6pRsM0RJsvpaLPnxzPvB772Tgk19KxKSm1jxKP3TT
         DfYrlSHi//DQi4guK6MmjLe4iwDpjcrT/cF06qKzRTVhc9mOCyBb67utecXn2FJORDDm
         GUD+T6t+CdY/cw21WDsI0geJiNEU9X2ZOEeZevTQDaQEq462QM81ghbzYSLlxsf1uoxL
         s3pg==
X-Forwarded-Encrypted: i=1; AJvYcCVw5F7zArErrH2MUlYcaZKumRxJtRr5IGtz0mrh7zxI4KvM5TBGDN7BhGHuylpsC41LoljV5qWgRx2q8qHUq2nvqJNsQZPrXs+mncIqrXVN
X-Gm-Message-State: AOJu0YxTGmH/naVD/5TsHoLQg0/lMWmxiW4MiGGlgXVdvwdn7ctqjgDM
	naD24xr7CCPrSqqJ4/nerRK4wg51LmuK5dfltZyiXRGh2n+6IP3IUSMLJeiGcsU=
X-Google-Smtp-Source: AGHT+IEjBmXCU7mNTlJDHLEXVaA9qjlxh2UbxM2PLdod3xVt/jyJ0BnNxQ5PpAdVoFfN1q2eB+NLCQ==
X-Received: by 2002:a17:903:1c9:b0:1fc:2ee3:d46f with SMTP id d9443c01a7336-201d638d797mr29420295ad.11.1723625792838;
        Wed, 14 Aug 2024 01:56:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:32 -0700 (PDT)
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
Subject: [RFC PATCH 7/7] kasan: sw_tags: Support runtime stack tagging control for RISC-V
Date: Wed, 14 Aug 2024 01:55:35 -0700
Message-ID: <20240814085618.968833-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095636_415362_F762EE9B 
X-CRM114-Status: GOOD (  10.04  )
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

This allows the kernel to boot on systems without pointer masking
support when stack tagging is enabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 mm/kasan/kasan.h       | 2 ++
 mm/kasan/sw_tags.c     | 9 +++++++++
 scripts/Makefile.kasan | 5 +++++
 3 files changed, 16 insertions(+)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fb2b9ac0659a..01e945cb111d 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -630,6 +630,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
 void *__asan_memmove(void *dest, const void *src, ssize_t len);
 void *__asan_memcpy(void *dest, const void *src, ssize_t len);
 
+u8 __hwasan_generate_tag(void);
+
 void __hwasan_load1_noabort(void *);
 void __hwasan_store1_noabort(void *);
 void __hwasan_load2_noabort(void *);
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index 220b5d4c6876..32435d33583a 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -70,6 +70,15 @@ u8 kasan_random_tag(void)
 	return (u8)(state % (KASAN_TAG_MAX + 1));
 }
 
+u8 __hwasan_generate_tag(void)
+{
+	if (!kasan_enabled())
+		return KASAN_TAG_KERNEL;
+
+	return kasan_random_tag();
+}
+EXPORT_SYMBOL(__hwasan_generate_tag);
+
 bool kasan_check_range(const void *addr, size_t size, bool write,
 			unsigned long ret_ip)
 {
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 390658a2d5b7..f64c1aca3e97 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -73,6 +73,11 @@ ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
 CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
 endif
 
+# RISC-V requires dynamically determining if stack tagging can be enabled.
+ifdef CONFIG_RISCV
+CFLAGS_KASAN += $(call cc-param,hwasan-generate-tags-with-calls=1)
+endif
+
 endif # CONFIG_KASAN_SW_TAGS
 
 export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
