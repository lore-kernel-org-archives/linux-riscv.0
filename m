Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC66C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apFI5wO1Rohe3BL8Z9mtlqTa2xuCboklb/9+A81DxKw=; b=rM628yMFSJJBAf
	DURns3clkkeCP2MrKSlqRDO5SxgOoF70g1jDx7ZbpHtepkK1q+sNV0pkXuQZAZiNmuvGXgbQaqCxP
	lVDn5xC9c5UAsq94k31Egof0N7c/D6uykdhkt0zl+Ow/4dK2nL2mPi/WBeGpxAGia/cLonHPDuZj2
	+W8nLbaOg4H/A2nbuaSpjEYL9PdsRzjcKzr98umlDao/NdVpAcqFl9W4V/h4dCW2Nd1N525y55Dca
	B0p5s3LBQetDiDR2Mj+vnERO4pEvfS/nauvoqumoYIDQFD6Pj+KgA1coJIx8jM8uUwk6yrVG0hQAZ
	QVBGRdl9yQ1JpIkiapgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6yu-004LUt-38;
	Wed, 02 Aug 2023 08:13:20 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6yr-004LTK-2y
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:13:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe3b86cec1so4554136e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963993; x=1691568793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y/bQQbBFHXNw50XUcOgOJzdcwsaF1ZFeXZB2P7FgjM=;
        b=csnH5qnZNRgQkg/B+nfGz7zVemQT+gGvFMobtlHK8PmLj2NEIk81Dg1RgIwrPOKQaF
         CSSKfKgqiGXCHTcvCB4092k4CCD2O0Yz0o5XK7jr/ehZ6cP8627jVZPHIBULuypRWVFY
         5lUgUrOIicnA4Iw17NOSQVQaEztdbIuo1oEcbFWwNzjCCSocKLRSxjqsmwLLmFRdukUA
         iRqIq6Bx+LSNbAsz2enAsWsiIId0DXiC71Gh6ZIzE9NdmeUrnMwZAJgXVFHNmpw4eI/j
         3G88B6BQ4jh10ED3tPMqUumWi4nrcVzf3tb5mXl2952Ta2ry99uBPObhwLudwC8K90T8
         CxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963993; x=1691568793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+y/bQQbBFHXNw50XUcOgOJzdcwsaF1ZFeXZB2P7FgjM=;
        b=FlMzdWJfv0MB+1xzQTNfSg8eWNohLHufuWlBjC9o/qWqRzB51e6pJvgUDo2tUunWA7
         WcCsdAm74r3xOXzB8hU8bPmWkxG0Z/kVCn+RdJL3K/Wktwfe1/2fLY9tLMDjrQZd34bz
         XasLOO2IsxoYlir3cqfvgGa05contoZSgVvLONLbTp+jfL+qYLs//pvT0ooTrT98Ezuk
         FBvj5QljFLkQ44cjfAnVuno0iL/IlJxjnThQs2Q1SwfNd+75g6nHBVWrauRwY9sRT9pD
         nqLdyl38kFnT2jxZG+2qhxzwHxvEdKAKt9RAsOPcK2s2/yTYKgOLCOaV+/YFDxXjGuEn
         Q0KQ==
X-Gm-Message-State: ABy/qLa5ru7wXgWn38pguLZ8gieIEOH5bNZCs4OecJTY/dBjeSMtyY44
	RPLUEGAZOABZdM11W0yBDj+Zxw==
X-Google-Smtp-Source: APBJJlGK09HgaF9wFvXB+jOQcgV4RSRZVrsi2YRdYqNUz3TOvrlz2ov4hOf7OCGN+tQF8Incs16BXA==
X-Received: by 2002:a05:6512:4003:b0:4f8:7055:6f7e with SMTP id br3-20020a056512400300b004f870556f7emr3111543lfb.44.1690963992981;
        Wed, 02 Aug 2023 01:13:12 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcc15000000b003fc01f7b415sm1013823wmh.39.2023.08.02.01.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:13:12 -0700 (PDT)
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
Subject: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
Date: Wed,  2 Aug 2023 10:03:27 +0200
Message-Id: <20230802080328.1213905-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_011317_958799_B87EDD15 
X-CRM114-Status: GOOD (  11.89  )
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
 tools/lib/perf/mmap.c | 66 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index 0d1634cedf44..2184814b37dd 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -392,6 +392,72 @@ static u64 read_perf_counter(unsigned int counter)
 
 static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
 
+/* __riscv_xlen contains the witdh of the native base integer, here 64-bit */
+#elif defined(__riscv) && __riscv_xlen == 64
+
+/* TODO: implement rv32 support */
+
+#define CSR_CYCLE	0xc00
+#define CSR_TIME	0xc01
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+		__asm__ __volatile__ ("csrr %0, %1"		\
+		 : "=r" (__v)					\
+		 : "i" (csr) : );				\
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
