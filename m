Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F208CC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sDVCAVoQYicqTETIZQ3mitVCwQwfcbQEjtknKj92YA=; b=jm1MANnuM4Ir4x
	ZLnSLmX6UgOqMDXOVncDVnCOc3m7JyWxo8MTSFxoZ/502nFWk0dYMXqXIPsGJLNCIC23NT3ilxaJI
	BAjX//2Oc1CbHrBew0oaq133zrQmQn1cSD1o51/4DghFnroXJjmsEIUdsxUxZqbbIO8nMZrmPxAVJ
	UPvvd6AsH7gZfvOtrjP7muk9WWFOWH6jo2tv7MoEZdPARzrcfHZMML97PYrUTrnNK6bpi4wmrnubQ
	hTpujBDJOKDubnTSH9eX4wR21EZjRvhVJDnvcHfOypw4x7PYXnCU8RhPmK5RrqePmqnXxvde025ZU
	sjW2g4pke57bKi4Ed0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1yj-00FBxY-1q;
	Thu, 27 Jul 2023 14:28:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1yh-00FBvb-1s
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:28:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso11164615e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690468110; x=1691072910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66arnrPbHIu5M0dnPIGmis7CQPk0GPDOyAbE7q1SCMA=;
        b=c8JQYNtxWw5WK3euMF4rZHhmXo98QlKuUKMY+1Sg7Uqh3fqw9BDZ4Jxnn1YXpVefZi
         OdCWRKz/hUNg4LgncgOqHD58F06IL5aK6lBoHv5aOmASBZDbxIKX4FrhRqLLeWo9zhjh
         lJ0JLwcenXNUc1NDfRyHB0IvIoG8Uwa/wkBEiN6X5pQwanP80QTTLX8OBauFHpPFcyP/
         FlLRH9iueZNjQ6X3yvNDXQMmzy9/RitIKdaTvJCEKflJyQmujCVUnezqfwM6aDKALDW3
         Tf0gPdODKV84li+wkh2+o0JxJou4my+H4BUWRHab+O2O5LWQbBWcRi9y6ZiYrWeU+LZW
         TjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468110; x=1691072910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66arnrPbHIu5M0dnPIGmis7CQPk0GPDOyAbE7q1SCMA=;
        b=Ud2fJaUko3GPpOaMrZSm470PYcphH0Onx+iY88UG5JO3VMzfRvlAjdLTOi4iwz6TWS
         XBMdwSH9Dqs/g0HBiXFnnzQbBhOhG4q/F1Dr3LZjKuplOon8mkqd2U5uuHRQlrj7oTIq
         VVj6WTlqZh9xhASAU3H1qMEZGglYMJK+ThdWA4pwzVWSM5uK/blZCuHDWy6tMD4QXw3T
         fmCWSKrE43cQ1Bkc8oVw96IGAfK+LkGAyqCpKEbMtzV7bI/FIgWBQIoSQx6BNuGe7rDG
         Y6YD9zdQcmvvseBRj+Cui2fX/WXDO4OT4E0zXi8gwm/tSl9gBNAbTLvetGYNyGGnSTYp
         nUSg==
X-Gm-Message-State: ABy/qLYUUwTkJaKiBPH9sBN3NKLFM0CoA/tcYEjyLC7590x2Yt61ZGML
	7ENnH8TZriTF7Q1dgWTIbMDn+Q==
X-Google-Smtp-Source: APBJJlEVnuXj4+O4kAtoh5f0WIgrGxafvY8B+/Plh9+DeSiTI5SRqpG66kaKsMCtpZNnCm7ngZTE2Q==
X-Received: by 2002:a1c:ed0e:0:b0:3f9:9a93:217f with SMTP id l14-20020a1ced0e000000b003f99a93217fmr1976415wmh.3.1690468109878;
        Thu, 27 Jul 2023 07:28:29 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x17-20020a05600c21d100b003fbca05faa9sm1958433wmj.24.2023.07.27.07.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:28:29 -0700 (PDT)
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
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
Date: Thu, 27 Jul 2023 16:14:27 +0200
Message-Id: <20230727141428.962286-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_072831_693781_DE4EF224 
X-CRM114-Status: GOOD (  11.43  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
