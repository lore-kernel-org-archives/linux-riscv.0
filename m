Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C515AEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRapQ2VrOMsv1m8rzZ5j4hs90pG37ujIMk3any2upIM=; b=KR+S4cZjgmiqQM
	JC6IX+eSc5pYJJOhIT6gsUvYPTeOP0tT8pUsYfroU/U855Yy6chLgB9KkEi08GANzbCbvur2uUfQL
	AG/+ouBEEzCQId+rk2BdNXOoYoGkImvY5coVtvWKSY0Gfas+aKD6gCwJN7wXegKsFJSc4AhTr4Ece
	OGER4JJKsKqjemBcq2gdZaQBySuWaD3XWH2NoLQ+T33ywNYrUXqolkrGLG6fOSKwkcwOPL5ZzI+gv
	Av6vF03t6ujTrngQbjiLJx+3I7v+Ec9I0wqUNAHbIaEu5Ounb1R8Sa+Yj2cFxhtnjqUyzCEAvTT5V
	jDq/OhpEvQFVG1p71mYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9hV-003DhP-19;
	Fri, 30 Jun 2023 08:41:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9hT-003DgC-0z
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:41:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f973035d60so2617799e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114513; x=1690706513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDd0P6Z6Y37kRPaqqHaNAC3kQrjxk6Pu8HaK2zooeKg=;
        b=Y41VrW8/WSTU5UZ0jha3wwL0Ej0Tqd3A2qkgrwAyZodUC/Uz8mWxFXPieMXCL9Qgkc
         aCxnf9L5pPkNT/eeVpj05gNJZy/aSu0i+l4K1alIFaVSt15uuOkO1E6tqT2Jw85snBkt
         eBMVD67kXwSAZmYJxN6xoMJp0H+pOyoW3QN4+hUahcRJSus8PGYrRNm9+d7On6kDNC7b
         g3jjB7S7COhraUHuWtlOaXR0UlBpzLL2bWINQ2J4KfkEAXDJXOOk2OggifnX6rcvyHeG
         nXSybsUY3tIMMztv3/UeobmrRZ0vqFQvg+NAjIoAuQfRago5a4TDxH3y3gIH4MfF24+s
         PliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114513; x=1690706513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDd0P6Z6Y37kRPaqqHaNAC3kQrjxk6Pu8HaK2zooeKg=;
        b=FT4aSKX17XJy7MX+dyi8g5uQeA7zJOK6waXjsHQ7FVX0M0jqqcA6slB9LOa4L3C7YN
         nWuYKFEixZHuIzJmYw/QNpqwPAM02E2A6ujiqOq3u1N/S6fYkh3DMPdOydJ6RFri+d3c
         uWuoxH1mQZpL2gLESQ+gUw9PBSSRtaj7ZahfykktG4ErCLMAPGSL7Tg03u+miH4u674O
         hwT5QhblvD156DRaahrxZl61T5wuvfyDMqO1j0zOvMHQKoerOyCajSU58sFV2TdcZhv/
         9WEAS2qBd/rcqKlbVqe3xPDMSfSxttp0T/usIZGSwvwHnaZ7byXotzv+r4OprMF37VAJ
         960Q==
X-Gm-Message-State: ABy/qLY9/GfyuiRZvc9X5Hbk5OM/VKjUruI9Y3aa+AIPeW2GCTYf2Qsb
	lAXPz7+iCxfzXRWWaz6GYxNm8g==
X-Google-Smtp-Source: APBJJlH7485mFBkMkfiINnyjXjrffdesyhHF/v8B35gqPVeTtnbEfcY+mPVgYOVbdZDlPoNQQNysmg==
X-Received: by 2002:a19:8c19:0:b0:4f1:4cdc:ec03 with SMTP id o25-20020a198c19000000b004f14cdcec03mr1476845lfd.18.1688114513557;
        Fri, 30 Jun 2023 01:41:53 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v11-20020adff68b000000b0031424950a99sm649850wrp.81.2023.06.30.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:41:53 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date: Fri, 30 Jun 2023 10:30:13 +0200
Message-Id: <20230630083013.102334-11-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_014155_348998_431B2640 
X-CRM114-Status: GOOD (  11.32  )
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

riscv now supports mmaping hardware counters to userspace so adapt the test
to run on this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/perf/tests/mmap-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..f5075ca774f8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
