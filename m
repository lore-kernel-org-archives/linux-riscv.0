Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBDEC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfmMRr+8PBOfNtxLBpCg16duuW6o2j8IbducnawlVZg=; b=p2mNp4x3LkIywg
	WLQO5uSGP8uBbxPSsy0qodcWIOI2B0lXklpgVg/4whh6qaXXH/fMvoAJDcSGcYgx7Sgx2b92mUF0R
	a0Ip3s5TouYMiA9CEUL+OyDdHW2CpVEOG6MwfqutribZgMjgc+vmUn17jl+sYm7TOrleNvL2JXQEt
	68/CVSCakZOxtkFM3ibu35m6tQ/LiDcGKuLjb8wbtFiTeAs3yklKIf+PrkKwAbYKw4V7YzXNVtQyg
	tKh/DaQBxouGONk5ZiNm6iatik68/3EAt0uRg6FZBYR6nwGjCocgPWegHsILyrRjSAvQ7nsR1EUax
	yCFIWG12fF7V20oEVelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOg8-00BPUZ-1r;
	Fri, 12 May 2023 09:03:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOg6-00BPTh-0B
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 09:03:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30786c6082dso4935390f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683882184; x=1686474184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khPfbby7IPCncqSF+FJrwJStKuiFrL9boyjJq7WdL+E=;
        b=hY9SG8dIhRNYozeemNnkzLRlAbmVclRbZV3GRGK8YaSPWIybFgW0uvkLWj0tKns0Bs
         7zgdl9tvFRUhZGLmm6dTtm8savwM52e2Bvepp1mbPtloweWDurrvhdOwraeoXZbrmZx/
         k85584aexQU9oFvEfH40xPUvrrym3cZvpS3Lf39pgKr9+vJ5fJaMprpKiCj2mUYagz8Q
         mwar/oteCL2Z/7RsFJQ1cZNrrp5dEbAyhDmb1fZxe3jQZphniieKvdjIyHYdsqLTSWjR
         WALgmEEY6qh90Mqw0shMHNhkY3aHivEgjjPxoyQF+OkxrkOFkHo2BIJXYWKv8miIwvGR
         qgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882184; x=1686474184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khPfbby7IPCncqSF+FJrwJStKuiFrL9boyjJq7WdL+E=;
        b=Sgaxor+LEV321FxcuJVKZi/KSUiKVAeKV9IH1yURx05GvjpLTLZHjNy8sp5qg6aKdQ
         R9aRGi5e/gphsMK5YIEGKq7n2xx3lrPAZYJl+SmudIPm19HZcKJsQ1YwrSeG4kZpjJ65
         ZKXsHAj6crAnJHVTHqxm58QdmZRgCrM847GLx16kO7cXkTLY/QQ6Bo4QpbZYNHV33avd
         Vocj4VeqvPepJZAWXIFkLfeXvhsqFxyaB8JMQmjvAfKePnvPCQU94+OuwQ1SvaHqSp8+
         2FHvxrrTK6i4H9lDIxgRIzyF5A+4vjvb3wGEC9W914V/UK+AD2CPo1Aly/VbwuRoIcEg
         vBVw==
X-Gm-Message-State: AC+VfDx4kN0fLiK6WctZG3zWJ8Rnpuf+idT3ErCUKZbVCa4cWcE2GW3o
	NL22T4gGxvgAIl1dNL1sdHd9gQ==
X-Google-Smtp-Source: ACHHUZ6Bl4FWbRLFAer4w2NXv26Ofk/W3DAGO9+CBJd/IoeWPKcp1Q1abg9G/dgxr8hI2QmW+SHLjQ==
X-Received: by 2002:adf:fd4c:0:b0:306:2c47:9736 with SMTP id h12-20020adffd4c000000b003062c479736mr16490510wrs.15.1683882184164;
        Fri, 12 May 2023 02:03:04 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z6-20020adff746000000b002f103ca90cdsm22791785wrp.101.2023.05.12.02.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 02:03:03 -0700 (PDT)
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
Subject: [PATCH v2 09/10] tools: lib: perf: Implement riscv mmap support
Date: Fri, 12 May 2023 10:53:20 +0200
Message-Id: <20230512085321.13259-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_020306_114012_D62D9FF8 
X-CRM114-Status: GOOD (  11.41  )
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

riscv now support mmaping hardware counters so add what's needed to
take advantage of that in libperf.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 tools/lib/perf/mmap.c | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index 0d1634cedf44..65f250e0ef92 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -392,6 +392,71 @@ static u64 read_perf_counter(unsigned int counter)
 
 static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
 
+#elif __riscv_xlen == 64
+
+#define CSR_CYCLE	0xc00
+#define CSR_TIME	0xc01
+#define CSR_CYCLEH	0xc80
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
+	switchcase_csr_read_32(CSR_CYCLEH, ret)
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
