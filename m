Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D1ED17159
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbN/VwVtTsPVZ7BANxyVr6UM+zVuTmZtdYYVqPZugvo=; b=oGWDqJwgKUkZwc
	pRZ35i53YZ8VEamKTRTgI50JVQqjqPB8z+cmnJdJmH4ysQ7hP1FMp6rDLYsDhvC9yjhbUatvR1LeD
	f+OHO7QDD9LhY+FSXGDt3lTi8RHqYwH3+GB/+a+OlGEtP+6GSukt4Q5MDfQGxknznbrRcJL7SzNDi
	aqfyVDN+pdXWMixXpro7pr8TM1asBsHOerIHU13lgC1/tx9mHZi/w0LO3gFyrX2WgO7FmJ0YD3TMt
	N+vG4Nm7Nmh5AdK1AbF9NE2NCCatfg6jcwH7mtU8oJH1ZkCeGGWBVll7OqwX3TCuNenKXV/UIo3nF
	+2Ts5Gkmlh2XAWIoeAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34No-00000009IUH-2Am2;
	Tue, 22 Oct 2024 02:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34BR-00000009G02-1fPi
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Oct 2024 01:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=559wueV0PG6xFm1m5EmJll56/fKSQJhn2CptHQFJIX4=; b=o/lTLAq8qYOjGTMS6mBUbtTDLX
	CryYKwcsw/KUYIr+XchkAKxeVhnWVEJr2aKbjFaUiFNoQl3dwLPv3B4so9r+fkQkWGGYjvvKqIpHo
	G5scXxN6mEcCNyydhcTy8KoCYQIwjUYPAO/gCoiYj7YsNCRa8DKwqvYvRMuNyyslOXh16pWIsXkSu
	rlWNNDa/LK/QQrEb+L04+39ip9d60zXR8tyDOlipzzDWpsBG4htSv7yLbOCr+F2WhUi7E+gLK6XMy
	YMfPhAowQ66ZlHTBWtbAEQEvaJH/ZAIHPz2QfZSkPgp/gvvVjbTRfE0AWhYCKcLvdalIAhK+VODsC
	tdrWOBgw==;
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34BL-000000085ON-1oU1
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:39 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-288b392b8daso1816894fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562368; x=1730167168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=559wueV0PG6xFm1m5EmJll56/fKSQJhn2CptHQFJIX4=;
        b=fOkES0EpzB6Ws7ZmIHr75OtpsKOOHrDJvKY/ye1Y7eqolDMW8RBZgPLVivEjCG8H+l
         LcgNS8zMYji24Zn3qejheS/O8+AEV/CsKMuYFTxysh0gVSrJ7ytt1kslSgRldluzMnhF
         lsnYUM9MtRTEakKlIPhEeWa+gvdMKr426Q+I3j+cOXol+tgd1jiUZgNru6QgxtgrePDI
         pW+tSIcaambaGfGC+yupiFsqPO7A6KvAaZ+3vRpFlSKoo19LD6sYlOdIkJkaybl69KVq
         G/4U20WrotkBdQqJlbYuAyxJhsmUjFvSYR1vahnSUbOU2FhljwPpxC7sOtkrE/5wk57L
         +wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562368; x=1730167168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=559wueV0PG6xFm1m5EmJll56/fKSQJhn2CptHQFJIX4=;
        b=HKyTVoeZn6ueyzdYvoXsOpJwYcl6N3dQyBOd9jDsd/YafDhUxgGvP+knsw+Lmn8Guc
         t6ElWJDek0wlUZmia/uE3dPFeM5wKNOANM/eGc5kZydQ5EhlCyxSOw8xy3YC3bSeCLf/
         6HtdJFElSiuQ3A15/oZGoonaqzXgAv2Du/bLSOtYF8ly8eJpCt5E6Bq4KlVwt9Dweyvl
         NTpJyIR44gpWhsdwafdxoFKThWvJem+Cxvswv9Ocn6aUIeNROR+dpQYZpLkPIw+t/rtX
         3IJtApfwDYvFpmjJCB61QlO3vgIa8lDYJpbkQV3aLZIzmlMGi74QefrDSUAKLSb4064t
         ZPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsWBS49NGoKEpDWTrNiltt46MirNXHmW8Yf6tYRPJ981RBz0NIU7vZsC6r1br0KbqAHBqLqRSV1KsVVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdsUZupENEu5aaXlpCkEzOYxLbBGK9eOoa29YWrDq53e02GXGs
	N5qcI69SZJjZ5rEQY2k8ta2sPUYYkoUVbZq4Y9zubMal8CFUI8mk/Lxc/OOCsUw=
X-Google-Smtp-Source: AGHT+IEp2UA/bF+2FyY3t++ENshpm/xo2VESMIC3hEEwlJcPqi8vvi8Dyd6MCRyyBM+qcOZbinhyoQ==
X-Received: by 2002:a05:6870:95aa:b0:277:a43a:dac2 with SMTP id 586e51a60fabf-2892c2df34amr10113787fac.17.1729562368580;
        Mon, 21 Oct 2024 18:59:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:28 -0700 (PDT)
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
Subject: [PATCH v2 7/9] riscv: Align the sv39 linear map to 16 GiB
Date: Mon, 21 Oct 2024 18:57:15 -0700
Message-ID: <20241022015913.3524425-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_025935_828883_5647049C 
X-CRM114-Status: GOOD (  12.31  )
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

The KASAN implementation on RISC-V requires the shadow memory for the
vmemmap and linear map regions to be aligned to a PMD boundary (1 GiB).
For KASAN_GENERIC (KASAN_SHADOW_SCALE_SHIFT == 3), this enforces 8 GiB
alignment for the memory regions themselves. KASAN_SW_TAGS uses 16-byte
granules (KASAN_SHADOW_SCALE_SHIFT == 4), so now the memory regions must
be aligned to a 16 GiB boundary.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index eabec99b5852..c0778c421b34 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -47,11 +47,11 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
-   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
-   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
-   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | direct mapping of all physical memory
+   ffffffc2fea00000 | -244    GB | ffffffc2feffffff |    6 MB | fixmap
+   ffffffc2ff000000 | -244    GB | ffffffc2ffffffff |   16 MB | PCI io
+   ffffffc300000000 | -244    GB | ffffffc3ffffffff |    4 GB | vmemmap
+   ffffffc400000000 | -240    GB | ffffffd3ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd400000000 | -176    GB | fffffff3ffffffff |  128 GB | direct mapping of all physical memory
                     |            |                  |         |
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 32d308a3355f..6e2f79cf77c5 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -37,7 +37,7 @@
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
+#define PAGE_OFFSET_L3		_AC(0xffffffd400000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
