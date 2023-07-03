Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA305EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAZADz/ZmVukj9euequRlu1ogh03wLQrzAxRDVHqgGs=; b=adlZlj37Zwqcp5
	8Q9BIiJbOZlk7kcSGRnX9ZW5f1Xtl3omBdBtqBAnIP/EwmrVU2eRCCWPvzyvqH6VVl7S22CJ1Sj9t
	JVUU60hw2s3KaC/ItQQeDe+6Qq47R5GXVx38byNq+DuPwrv4syoVkhWxjbC0TzHwl2m5jEWdGJu7q
	0aJn07/Qb8keLr1hXR+AfwhJKPq38HHYV4pOlC8zFT316sozq4eL2/ZBWm9oTxec2PBPNgXCqpvHp
	1Q/pO+GnFp+bzGc05kx93xEV8vjRG8JsBkpMnrgd4qKTcKWrIFkARt2+dtorBWooRVE94X4tDt+QZ
	RJXzUys/yt9NXRveZZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ6D-00AYkr-1b;
	Mon, 03 Jul 2023 12:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ6C-00AYkQ-0i
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Jul 2023 12:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=; b=NU6YJH+7h8w+/HCVIK2NmNcmjj
	/8hThRCTDL0KchDwBdJI99Lj4esxYfLlakRSsQ9V8PDtFIK5bhD/drcCk7Vt4BfQAe5jH6n6XZARj
	CWkWYspkevdeI4zVMvnZrJNp17eQZjNDJM40qRAy2xE2HwIfswl147XvG6PJ4xREZtCpwn94s9OQY
	q3Jn0/FgS5pC5+76n/DFgIRvU35RBIHUvnvxFAbX4BalcDMNFf3GYsmCYBRlekyneX+D3jfAWmR92
	8ym3KlHU2E3xg2SKhpnUGIjzGUcaYRmYUjH7XzFmSFySOeTKSj10OsH/AoZOj8W30RJgG5/zRKfU4
	WWdzyPDg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJ66-00A5PT-10
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:56:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fba545d743so58998845e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388960; x=1690980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=;
        b=eLmweVJxmYuCpU0xTEX8xQe8dXtl4NU9y8Z36gyTnC+x+35WcTyfHdalG9MCKUsu7m
         SK8rT6ypZU8FEnt97O4TEwMf1EqZQQkYo1m6RmlP0+tnfGf2weBma4YZCRs0CfiKnZz2
         +ubfC4pwFoIsfqNb3AJb5j6Ke3HLSBiFKX5RFFMP/tYLHJtE0AmMDjB3enS5Mjy2W7Mm
         QbBM/YCkGh1JtMDjG5jczzIR/ny7XDAgZSJZzpOzSym3hXIHonYwp6dz3B5MJ1PixvDd
         1XXv+prSPFEz7MYyWdia5wRFo99FG6oNRN+oDBfPaID0KdORvAZGLclf/xQXJjvUrDDO
         Jh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388960; x=1690980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmbgD3BkRBunB0DFWSt+ANLkIPsXQvCtttyk0nyN3eI=;
        b=MZf4LqhgMnyXttGueyAz6VA/vKaI8kvEBkj08NfUINugv9Lkk9uKzzFvDphmZKPhgJ
         LGhUykT81vH1adUCgqnDGUiOLFH/+iFXWvUCJSPCyRmGRemh171n0XWAtIz6gAAaLJFy
         XiQ+c2xQ06tNiIiFcG/Z05maun18VwZlqj0g8cgllAu66EJgFLBRitLF/hzFQzaCnCTa
         oAXIiuZq+JWamy4iAwSe4QeXatDWFx5iv7VygtRR6tUfoemSkH9c/r4MeAtS/j0jMq4G
         FvqS80Q6YpS7utztjZu334j8YIcK1Nog9VoGUKA1dQqBowUrjn9VznPKQR+9QfoUK00z
         5mKw==
X-Gm-Message-State: AC+VfDyKPs3jpP0xGbFDJdrCGv/CNSWIGaLuFxG3Xss5g5v64yyRSuLH
	CEAMoAnSs9MFY+YamN5JYlvWYw==
X-Google-Smtp-Source: ACHHUZ5r2zHeZnE4xTJno42SI98R4Rva3fSu57wRx4nAzx4+PctoVQ0KZuh/SfE8h4cUz3ULu/fpqA==
X-Received: by 2002:a1c:7414:0:b0:3fb:9ea6:7a73 with SMTP id p20-20020a1c7414000000b003fb9ea67a73mr9421552wmc.23.1688388960102;
        Mon, 03 Jul 2023 05:56:00 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bce05000000b003fbaade0735sm16347372wmc.19.2023.07.03.05.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:55:59 -0700 (PDT)
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
Subject: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
Date: Mon,  3 Jul 2023 14:46:46 +0200
Message-Id: <20230703124647.215952-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_135606_726593_950AF4C3 
X-CRM114-Status: GOOD (  11.23  )
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
