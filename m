Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3BD17157
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4AviXPkJY6euKJnCI6tFQpPC4kJpYcVX6VLTaWoyac=; b=C7Qw1EbGce5Sak
	BRqcBODr/HrhJhy5UQIqyTBLpmdjE1hm39NYaJqokca9vB1jgahgH8JM7WQbCUbtGvJ62NHZBWGtC
	fwDpTXBMgfuuEYkcOU42w+xPumFg4scnwUDK1TJt421KYeQDJET5eLnr4ElVORB4GpBA5fTmJc4s6
	5GgBdHSSu9CCs9E10XAyTMRlm6gDVrpDszQ832AJUGwGjDGTwjtjwKsMDmYDISaj9XbcNH92kU2az
	dSw+torLPNgLGn+lSMvABT5cgWFxE5VoTnRhp0p2PCFcMhuUYYjFYEtPppSO9qe5/7pUQDapxrUon
	gU2XHG2J77SXUt4MU16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34HO-00000009HRs-1E7f;
	Tue, 22 Oct 2024 02:05:50 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34B8-00000009Fmf-2po9
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:24 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7ea8de14848so3078741a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562362; x=1730167162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FnCjcC1/gsDOd6L8rx/6dcUkVYp18eK0+PNRkpMvb8=;
        b=RjU0oPD7oXD+tWMcDuFQbnpYbwgcS/6n5ftq+xWErEa7IsRrNRv7HKxV+ZEc7ef2qO
         FwjvUdnbTN1W44f4PmRcHDronghY+wxKbSEpbCVRddKIkv/i5gVgstIKzLLt9g2itoCx
         rze5GfTMydmioM8/Z23DEqsoZxolfRQ6GsWy3y5flhHtWv9NigwvX/bj6odFJdSzsDHF
         SsruXeZBQND+Yn+6S9+8mcwjp1xziuEJkQyhfu/tuDdXyDZFXrI+8CHI0Wlz8KJ+bnAc
         k4zxALwozIFD6uRqe2nDZqylyRO/SBvrl7nxsRvHxWTUoHuz+Lq/ZQqPFCaP0kHMvX+q
         Bduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562362; x=1730167162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FnCjcC1/gsDOd6L8rx/6dcUkVYp18eK0+PNRkpMvb8=;
        b=B9eGJK+50SWoMTp6CRerp6NjW0FMliRXjpgydr1TGzt+SACF3mBdLREt37Jeg7nSpg
         nDyHCCVWZfGe3gEA0kc6BhB2CVgbHYVJhExpOzYklz0gkkJMIPztWLFNdYiuV3RuqWtc
         uQJ57R6xXofCes1BiRWHRqJB6nTIpWLmoIG98ofkcWqfT5Wjz3YNTnZd7mfd2dvt8xm+
         xEqlEq3Flu9OkzadDXJjPW/O1lkowCRGvYcfWIPgLhdXj3K1uIppznkaSs2kzCiwHuC9
         Bo0Rwa2PpQn/NXEaB4ff7hYPMqU6QFg03kmIcndsZ2UHmoy4TekYaLsRcsNQv+wDIwyG
         5AJA==
X-Forwarded-Encrypted: i=1; AJvYcCX9NJEUohEH2qIXDWeF9PxfTKSgaqshhhYTnC/Cm5Pr7Eev2I1wH92XY1E7TJhwGWPEDxp8Qey8Aryb5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9LkFahK/fKjOWp7mfZl8WUbEsx671XiAmyD+YEs4wzuMl9LEk
	Pt6Q27AEcRRfU8AkJ1OYtwNJupr0IlRwgp9BMQO++CEDmm4bUf43avKLox1FSOA=
X-Google-Smtp-Source: AGHT+IFrGG6oMYUOck7CBYXToXMnxG+Lx4oLmbcg4j3FeL+zQkCHcoYgP+J0xW6HIU5j3POtBJfPHg==
X-Received: by 2002:a05:6a20:43a4:b0:1cc:9f25:54d4 with SMTP id adf61e73a8af0-1d96df0ed05mr1060384637.38.1729562361689;
        Mon, 21 Oct 2024 18:59:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:21 -0700 (PDT)
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
Subject: [PATCH v2 3/9] kasan: sw_tags: Support outline stack tag generation
Date: Mon, 21 Oct 2024 18:57:11 -0700
Message-ID: <20241022015913.3524425-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185922_810586_CC337D4D 
X-CRM114-Status: GOOD (  10.01  )
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

This allows stack tagging to be disabled at runtime by tagging all
stack objects with the match-all tag. This is necessary on RISC-V,
where a kernel with KASAN_SW_TAGS enabled is expected to boot on
hardware without pointer masking support.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Split the generic and RISC-V parts of stack tag generation control
   to avoid breaking bisectability

 mm/kasan/kasan.h   | 2 ++
 mm/kasan/sw_tags.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index f438a6cdc964..72da5ddcceaa 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -636,6 +636,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
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
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
