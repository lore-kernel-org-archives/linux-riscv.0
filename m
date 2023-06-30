Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D07EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAZADz/ZmVukj9euequRlu1ogh03wLQrzAxRDVHqgGs=; b=1eJZGTvGQeDxWn
	i6f7VCMqlsowKkmdN8htgXftqjyhKQzWpskAZiIwRLY/PkHykT0NMDAmuLjFpwpfSMm7CcV4beLHR
	a2iJh8YMzVzms16anH1mWCmt6ZyGwoMTSoQgD0JxMXrLdJHPUhppSiKXAesMly1LXQa4Ukzsnh9K9
	jGCj9tqpZ36bQHhloxKJf3rvsWZuTE4NNDsG+75rQxWzWKfXBt9kBfU8w0nzFCHHAW+gkvNbVeNd6
	LO0lOK3AxX+g2gfsn+R3ZqDjDbORgC8WcLhBoo4TG4CEromivzwh1QYlKcUOV4mFxXbfQly9VMqNe
	QrVRRKjy15zDU/kziwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9gd-003DQQ-2X;
	Fri, 30 Jun 2023 08:41:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9gT-003DLl-20
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:41:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-311367a3e12so1901955f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114452; x=1690706452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=;
        b=xBb3tY6aRK51y+KAOkApMFJQ7mXklF1vW4Q8accpKYblAmqI6K0z8vW9G1W4XT5TYM
         2EX8fpWxNmwCgc4GVXIr4CkGfhBo6gRUxnYbz/El7AY1G1BhjLCjkz9wFpGlSKXBr2c9
         H2vpjBsJSbQ6fUaSiEk9c89ACweAwT6/EWkY5Y211Uonx3JBQfEpsNp9Qs6/QjFT+O16
         HgozLlmjm6OUqQb3+6nH22wKCGnLJPQqJQwUv2GA8/gLgXIJ0BiW8GFXJZJN+SPnDd2t
         Dyg+/kaHM1UTgmhc5hAcCkQxw2jZJ7l1RXzLPZy6VYlE4MDeVUNkPNoDRstWIAZBHvCa
         uDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114452; x=1690706452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=;
        b=OfR7UtljQsQlEARW3b4BaG9VJPm8U1P31S4Puvt4Qm5RA0KCZ6ECbodYaekMiO9dqh
         jiktCaYIFCu++jnDICFZfQFylbQqGDFJDfNglpSigFoykKRELl8UWR8AanSBQ3Fz3jBB
         PJzlYNd/MTsm3ESAG9F0AJCrnojQqLP7xx96DOQmZi7O1vfyA1kDxC6IF37o5Ik808K8
         CY2WL0osSNsXniJDEoqnqgSZkM+XFjBMjh/wWcQdZi9W/6nYhgUhpBVg9QT3iUhhDv9e
         SCH4vumLx1omJP8wyDIgQHudrc2bCaIYpOtniHy8UV2qbR3K7kmDLf1eNddmoaW/ZDuV
         pZlw==
X-Gm-Message-State: ABy/qLZ7FsgfTnOVggKgHjYD2LbEFD9SwglUOoSpNHx2szFjMqR9FSER
	jL4IY2KqgiiypkBuG6B4R7sopA==
X-Google-Smtp-Source: APBJJlGdPg2iyQ/a+BDt1aLZTv0Yk22uI/nygPWAvXy7YUewA8v5fcDT/TyEnCnUoiJVNGcrcvKwnQ==
X-Received: by 2002:a5d:4ac2:0:b0:313:e161:d013 with SMTP id y2-20020a5d4ac2000000b00313e161d013mr1634786wrs.15.1688114452123;
        Fri, 30 Jun 2023 01:40:52 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x2-20020a5d54c2000000b003142439c7bcsm740391wrv.80.2023.06.30.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:40:51 -0700 (PDT)
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
Subject: [PATCH v3 09/10] tools: lib: perf: Implement riscv mmap support
Date: Fri, 30 Jun 2023 10:30:12 +0200
Message-Id: <20230630083013.102334-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_014053_673696_FB90D5FB 
X-CRM114-Status: GOOD (  11.66  )
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

riscv now supports mmaping hardware counters so add what's needed to
take advantage of that in libperf.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/lib/perf/mmap.c | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index 0d1634cedf44..378a163f0554 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -392,6 +392,71 @@ static u64 read_perf_counter(unsigned int counter)
 
 static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
 
+#elif __riscv_xlen == 64
+
+/* TODO: implement rv32 support */
+
+#define CSR_CYCLE	0xc00
+#define CSR_TIME	0xc01
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+		__asm__ __volatile__ ("csrr %0, " #csr		\
+		 : "=r" (__v) :					\
+		 : "memory");					\
+		 __v;						\
+})
+
+static unsigned long csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)           {\
+	case __csr_num:                                 \
+		__val = csr_read(__csr_num);            \
+		break; }
+#define switchcase_csr_read_2(__csr_num, __val)         {\
+	switchcase_csr_read(__csr_num + 0, __val)        \
+	switchcase_csr_read(__csr_num + 1, __val)}
+#define switchcase_csr_read_4(__csr_num, __val)         {\
+	switchcase_csr_read_2(__csr_num + 0, __val)      \
+	switchcase_csr_read_2(__csr_num + 2, __val)}
+#define switchcase_csr_read_8(__csr_num, __val)         {\
+	switchcase_csr_read_4(__csr_num + 0, __val)      \
+	switchcase_csr_read_4(__csr_num + 4, __val)}
+#define switchcase_csr_read_16(__csr_num, __val)        {\
+	switchcase_csr_read_8(__csr_num + 0, __val)      \
+	switchcase_csr_read_8(__csr_num + 8, __val)}
+#define switchcase_csr_read_32(__csr_num, __val)        {\
+	switchcase_csr_read_16(__csr_num + 0, __val)     \
+	switchcase_csr_read_16(__csr_num + 16, __val)}
+
+	unsigned long ret = 0;
+
+	switch (csr_num) {
+	switchcase_csr_read_32(CSR_CYCLE, ret)
+	default:
+		break;
+	}
+
+	return ret;
+#undef switchcase_csr_read_32
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static u64 read_perf_counter(unsigned int counter)
+{
+	return csr_read_num(CSR_CYCLE + counter);
+}
+
+static u64 read_timestamp(void)
+{
+	return csr_read_num(CSR_TIME);
+}
+
 #else
 static u64 read_perf_counter(unsigned int counter __maybe_unused) { return 0; }
 static u64 read_timestamp(void) { return 0; }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
