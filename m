Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBC3C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7AONwiPeEGU3mLUjMZaWDG5G/ebhK+4U+f1uC+GsQ8=; b=tfL9005hEuuhzF
	gDOU5F4x7/btfWx4D4x8451gJ3DofZDAX5zd4ue8iNnpmhqgniVkTjFhSjMmdiJvHxNp2Iv7pp+Le
	9bF2ZJX3cOcebsHirI+92EV0VZEqo5Fwk0S1xIHpJ1vOupwyGsJ8N1JbC3etcxne7GxwjVjeUEctM
	oP0W4AU3sXYuid3ATdZ/XBLKmcW1RBT3KSy8DGAu24auHTy3GpfgGSc8ImbJwAK0+XXQ+15PDf4VN
	P4+kD5MvjmDJMJXB0f+2w7OIN4eKRU5mBfjgV0VkOGbuIUWZBsjgaRLUxEj2CDUJ3TSW5XbTvi2gW
	ls6AJu9usEggT1kR2gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNW3-0000000DgZ8-26cz;
	Tue, 05 Aug 2025 19:40:07 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNW0-0000000DgVX-18BI
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 19:40:05 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7e699c5b110so27596985a.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754422803; x=1755027603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBx+S5U+eiCq8pUooPV2kB8TZrzcZaWUvNy/30cjCv8=;
        b=GQQJDMDTWY96q3T6TooE8lpKG8Y8pevpZA1o5vwK/u90O9sJC6TjHIkZ+08mo6cxAg
         kBJ3xFpIH1w6/h634CizF2vt6XfJar7jZMkHFNpov6Q4KFq2YENbDBxz4JL+wzXyE91o
         u6KiwPO/N+KULo7xyOm+WV4X1nxlj7KeVXZDp/tIqwSXUwZWOr0jq69Sa0eWVsJetSIa
         HpruUTLu2UaQTZ437zlUf/D0hPOnd1M58VDwFUk7ovksh4H8AKEV7xSl22iQNlBWrW5h
         Cw4HPGlVZzOcOw7uuBCBnHh/I3ZqPlG1XQNER5mwZrtGRpTQlY8ZodN3r6Kf3hXzEqBV
         Q2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422803; x=1755027603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBx+S5U+eiCq8pUooPV2kB8TZrzcZaWUvNy/30cjCv8=;
        b=piHfDGPkoz7wn/oMRRCQQBUJS7c72VYKV6e/Xvup5suKMFr9RcH4P3I+cwSCi7ospy
         jZqbBYxkGgKNmTvxjksua4ODcfn9wv6lp5OTFQyCG9poGk7CSq9zarzALVyRbpJ/SEfZ
         HRp/OJtkAp1kw8vtd5auN8jTToerFbe04LS2SMXi7YQ11yuw9XGILQKEqfm6nblL529V
         DWKlnJWHK93XPVtcZqictzNoFu8iBxN0cJLVL2OIC6cIPskZfcB3F7AAdCUnrp5GgvVy
         bs1bOUjLgSPHl/3uUtxtvtbPJZnBtUNaJAlljlqkdHPGOLex08xjHO5aSqt05oo5QofH
         8jpg==
X-Gm-Message-State: AOJu0YzVvdoTcbW+ObvqVTaLkuxnrFIiQGID3MfKiu+tOcNcL635aciL
	bRPrq9iUJ0LvJtuHwf7siliqedzg69uu8fa2Y0vMb3ljH8E9dQ5dmed3mfm6GPZSRo3jeE8mj25
	zllGl
X-Gm-Gg: ASbGnctXKQiZ/ay6uAoFluCTmNIikVItZcYNjHrTiiRv3oFmjf4S7PvyOaqafcZIvfQ
	EwvXnTChdQIWww6NyYjye+IQsD+t9TRA7ptssu8d7CeKwNQdXSoyfVMk1ToZFl3ivoCs4Y+G9B6
	HPj7NK+fPhnpBJT7O+3JV1+LbmsnFvWVXCdQnh6p2hNiYjiksOD8ipOdvjz5w21/4/HAlTVnsgX
	V77QJZVqdf9ugZsxlfGy0qwGKHdrON+sCHFCoCIDMz3crQWn/q2aeRPArqxiS8G4Z8CFf2pAJbx
	jxYLmEWsPBzTj85dO4WHKbcykivNNMirj2YeBz9V9Qz4qrwN3bfs4DO+ai6PwZ4PLYLqFCdS98C
	lj6Nvs2lShF9nz9PuYkOa8PsE+Q6x7vmvXQ9Mu35hQVeuVgsr0ihBUMWCd6dCumMZR+uxYzvO43
	V2PDvTsA==
X-Google-Smtp-Source: AGHT+IGX7OQglHEEPOq98awptA6J/9DSpmeeKDOZlvbBLWPX9HQBX2UPCjNuTmMSORoLz+090C2k2w==
X-Received: by 2002:a05:620a:424c:b0:7e6:99d7:3340 with SMTP id af79cd13be357-7e8156bcaacmr32337785a.12.1754422802272;
        Tue, 05 Aug 2025 12:40:02 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7064b0sm717855685a.54.2025.08.05.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:40:02 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley  <conor.dooley@microchip.com>,
	Deepak Gupta  <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/8] riscv: Add SBI debug trigger extension and function ids
Date: Tue,  5 Aug 2025 12:39:49 -0700
Message-ID: <20250805193955.798277-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805193955.798277-1-jesse@rivosinc.com>
References: <20250805193955.798277-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_124004_341261_9BC812DF 
X-CRM114-Status: GOOD (  14.14  )
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

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

Debug trigger extension is a proposed SBI extension to support
native debugging in S-mode and VS-mode.

The proposal for the extension can be found at:
https://lists.riscv.org/g/sig-hypervisors/message/361

This patch adds the extension and the function IDs defined
by the extension.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
RFC -> V1:
 - No change
---
 arch/riscv/include/asm/sbi.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..be2ca8e8a49e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_DBTR = 0x44425452,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,34 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI debug triggers function IDs */
+enum sbi_ext_dbtr_fid {
+	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
+	SBI_EXT_DBTR_SETUP_SHMEM,
+	SBI_EXT_DBTR_TRIG_READ,
+	SBI_EXT_DBTR_TRIG_INSTALL,
+	SBI_EXT_DBTR_TRIG_UPDATE,
+	SBI_EXT_DBTR_TRIG_UNINSTALL,
+	SBI_EXT_DBTR_TRIG_ENABLE,
+	SBI_EXT_DBTR_TRIG_DISABLE,
+};
+
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+};
+
+union sbi_dbtr_shmem_entry {
+	struct sbi_dbtr_data_msg data;
+	struct sbi_dbtr_id_msg id;
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
