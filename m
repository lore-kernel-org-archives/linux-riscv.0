Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901F3C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5KtaP4qKbvJvxlsWyZeUvxpWQl7bSiLv7v7CrFyo/A=; b=v1IU4LxL1dvI+A
	5wlfNhGm3H8zfJhBkb+YLGRHlLl3nYrSMiBEBVNAwDuLVFO80ZOgQI9X97kykI7k8KfQzRf0niMaR
	qma15Jd2jwr3EQyTMnBMsxU64J5anR9puJ6yxV8hifXnLanlp44VeCpRUQzXizMLi7ZPLMhh0EweF
	7PxxbgEjuNhehhEoU4Y0u28/nYVW1tNo9i+CUAmy+5rjoVApCseLeyD44aokyOAv2hm+lKwO5XYOL
	EMN868pgnowaTsmk/ycaiCkaU1+W2J9+cL4ZXUwyJUB58J9xtcybNnN9G+lMRuf+6h97e/0hc5Mas
	cCdEyfpfbNbx1UBN4clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9rL-00000006JRY-0eIi;
	Wed, 14 Aug 2024 08:59:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9o4-00000006IDq-1LKR
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BtxoKtjWvRqhjS0z2DQnl5gBuyvoRF+9CVzVIMvmZ6E=; b=c7DQgCem7J72kvVSvWKD1LBVpk
	O7Pf1Y2CraW93TuZRTl5KXPsbtKguuTVaxOgBS7FrZTKb0TxePGQ/i9hjCpVn95CzDwzdaaFHQ94p
	iZbmY/ymCM6d7cYbziZYKuay/xVRWKSAfgRmAtxflsQClZ+Uqh4bdVLSQjhFLVtyZ5smP9a1VzDIx
	NVzlZsV/zYRqQdhR17f2qyhNdm0m6TMFyk4SvCjroNSaP9hjoEDMWN6BOxomfUEd6Zba1YDLer1CV
	TzbtLGfn2cMWSFttNudOHm1j6anaaXDuoAD4aPosjR1g/IZpSdGPctMyyJcatf9Zb2YdHDGL1+79/
	YdPqU10w==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9o0-00000007zDs-3FA4
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:56:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70d1c655141so4596037b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625789; x=1724230589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtxoKtjWvRqhjS0z2DQnl5gBuyvoRF+9CVzVIMvmZ6E=;
        b=i1zzzHt2msT2iFsRD8CrqNjzDSSwTxFgCBfaHcpzeZ632kl8SWGu0RjXLbNi/gyijw
         fXJ60UUr9Vh5ZVrFPooy01r5CQLype1DKjCrjqGnT2cMKqiA+cO6DkWTKWu9h+oomIuo
         ioSic6AX4lD4FPzSYJ38QniI8FDewSAqZ4WKYj3tW873tcrp5wNuKl9CjcAn18/pfQg7
         1uFLNn5ug+LjJTmi+n2CmjQ8whMisDUelKcu9C1XP8oAtSWQNynE7HhOiqzFZJ482rAG
         mhQ+uJjvemXVszaX05THega/UZq/d4hTZpB22ZEkJ7zT5lcSvjcyEeD32sZukRPPrgsS
         RGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625789; x=1724230589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtxoKtjWvRqhjS0z2DQnl5gBuyvoRF+9CVzVIMvmZ6E=;
        b=igJKQK987rDqUewTuikgoKx6QZPJewdjOm64l/oxfeLFHTOMY2DPXF8JT7HYp2LvEd
         pJhbLAZKbTFh0XZnWXkX4pvXppeFllLHg+iz/0mmJNPXLxI9LJngelubiAWk/imv96hY
         sgcMuSJ0feOKzvohlmn4JEJqe+XkeHvSd292LpYOhzItJ4GZluOx7FEsxhVVYFFlQBzm
         e9uVem42ksaV0HGg2zyFRPRygp+nJmnR1lM+V2WKjFe8P+EPaOTpGoBodlUtI6b0rfzK
         FvP2YsK3K17YYUoGKPkphlg7Nuu4H1WTs4DbDZKCvpyExNQ+iPTlU7LobxqOBvxCqXBp
         rTYA==
X-Forwarded-Encrypted: i=1; AJvYcCWRJgfr38hJnDbcdanP2YiM27RBALAMLUi05msiiw6CYVBLqC2aqeOpr1fkU5aq4JNAs2P1KjeiEWD0hpSeRxpUXR2/nabwHwuqd606TsuX
X-Gm-Message-State: AOJu0Yzc58pWi7us4IZyDpHJKSU1nHXxNHtMZ1lcYbWKtje/6j1ko10r
	ib0CHOj2TVe0Pfh3c09oV99CRiGKQ4GjWwIyYaVOlUY80BmS2wwWNKOM2hEChKg=
X-Google-Smtp-Source: AGHT+IGKwvtrSq7d8JlTCA95HrODYZub/jNh1CadsEDvmYgd02vgRRSnG6ohafRUbcvHgfRX7yetxA==
X-Received: by 2002:a05:6a20:4f25:b0:1c8:edba:b9ca with SMTP id adf61e73a8af0-1c8edbabc7fmr1261808637.1.1723625789313;
        Wed, 14 Aug 2024 01:56:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:28 -0700 (PDT)
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
Subject: [RFC PATCH 5/7] riscv: Align the sv39 linear map to 16 GiB
Date: Wed, 14 Aug 2024 01:55:33 -0700
Message-ID: <20240814085618.968833-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095633_127120_673F86FD 
X-CRM114-Status: GOOD (  12.78  )
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

 Documentation/arch/riscv/vm-layout.rst | 10 +++++-----
 arch/riscv/include/asm/page.h          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index 077b968dcc81..ed71b3b1b784 100644
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
index 7ede2111c591..09d15567b0b8 100644
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
