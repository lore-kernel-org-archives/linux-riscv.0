Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DEFC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPO4FAsYN7bEGiElsjkzPhFKQfJ4daSR4nAocKvg4wk=; b=UmTMpq6CWtrJhl
	OJQxTTr+vqZuIfHwVBtjlYVbKSPqfXJ9nkvvnCYCkAhfRRKIdhqBsospilYbmxXojkj60cirUgtng
	/1KJaSYOjep0Hvdjp6ITMqlmZzvOOsqntt83XwuRRNKm6wtWwqt9C6QhpRbQawRLKmlVw4cfzptQn
	+G8cwVX3Fj+c+ux1lVG7cbQaxa8bkP61sbXnGQHhol0YlNu3PAy3xHc9myZUYyhG6l78jtSalmy7U
	s6KTIhJhZ6DVa7+6IIY+12fRAik7UNRhDR3/r5vKTclA2JNDDlbZTTg0l+MkGfEf0eS4XPo++/a7d
	cpUEZAYQ1lYArR0RfI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFz-00000007SYy-1Sa2;
	Wed, 27 Mar 2024 04:51:23 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFd-00000007SDG-1UVq
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:51:04 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5a4f608432bso3402266eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515059; x=1712119859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wFLc5gcnBs285NRnicKVmmQVV53EnA/2rANcUM2uCA=;
        b=QxiTk4/dC9QT48dwc4qNB1noxiAJKPYKeouA95n9OFJgLEjRBBRpPbLaLVum/LKIiZ
         tzWtvvnA+1kNaPW/xI52EZxxrD/Tp3aNndSdEZZzyuRkGRALVjtFejLYS5CRRwjCEkP+
         W7/cvBbuXG8pp2prRPY97CIsciGsaxmIWPbiIVS2HldBKow51SAc+h3nzGA/sxgLdZSY
         u5snN5e0QfC9HfSvoPs1Te16ZziBLD1O+RO6YhlwV48+wlueTR7h4pv8SqhvCdo6E0UW
         MJWvpl0pX/JKR7ZE6cdSw17PID4wG2zepP6LkLK5++XA5W48qWPVRkXs2uiyQz7skmXY
         4W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515059; x=1712119859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wFLc5gcnBs285NRnicKVmmQVV53EnA/2rANcUM2uCA=;
        b=WR4/i3h7/piV8QdHZ3SdR/QuuQokDKPac9u0eW2ko5aaMDODqLK8PfCmnWiLwNsZBi
         k12VaV9Z4Es0Y18m9WKr2v60HjpGCS+BEgciMlFTpGFd6asd1cxPrYqjSU7bW8oe2h3a
         tvwTy3JlmyOSQsmpH233QsguKQ7LuNOWxD+NcN7xKHO4tc7eBU+Kj+AYuzf5FxKtje4v
         bBlpYlTInbzc8JWn5Nb6IsGi9njQVnVyRcen6bfgAoDvUvAPtpYV1/Kq0xuKp2WrjVtC
         awpLgO/OK7MbkNLCFjBVfakLTESQNyCjmqRlsFkULRvcRRJvbXtnn6fED1j4uMXPyj8h
         299w==
X-Forwarded-Encrypted: i=1; AJvYcCWiGxm2ATqA9JSW/YOCHarqHmtrhbHWAKCpXFQJOkx5p1ksS/mMzkLQojXdk3frxVfZMwWs6moGxBA2cyfvdFiGIQQ1HrIQagdL8HEoezIX
X-Gm-Message-State: AOJu0YxdLmQobesFe0zP/ubeAggW7z014QtoLVPlXLDmjNVAqwmcq8bm
	8BmGGfTtELq2EdEcqAAlBZpnM/K3sLoTyeXikf3r72CtDwA3cDX69VfUFYOXNVU=
X-Google-Smtp-Source: AGHT+IFmC6K+A8yipt+L5BT3VYhAZMjFopo36khv4UzVVH+BHr/EbytiKBlOS5fSbYkXOITYtqGpvA==
X-Received: by 2002:a05:6358:320c:b0:17e:bb52:927f with SMTP id a12-20020a056358320c00b0017ebb52927fmr1922247rwe.1.1711515059146;
        Tue, 26 Mar 2024 21:50:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 11/13] riscv: mm: Make asid_bits a local variable
Date: Tue, 26 Mar 2024 21:49:52 -0700
Message-ID: <20240327045035.368512-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215101_585531_29561FED 
X-CRM114-Status: UNSURE (   9.10  )
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

This variable is only used inside asids_init().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 5315af06cd4d..0bf6d0070a14 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,7 +20,6 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
@@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	unsigned long asid_bits, old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
