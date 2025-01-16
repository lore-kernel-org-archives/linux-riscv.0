Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A2C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9sTEu9YWdhXKt4lz9a2tcT+eXYWbYHYcqAZCXthHJg=; b=HTYzrgyfUp+zaK
	ucTDqxW2tNidTS7UQ8afhgvh4mz7C+JhX6zoolQr7uRkDc6KACoyfCcTM0zD7cVPrPCk1VHyagwAB
	QHbC6ZelUlCfcwIdNtuze6qmLRRofhUEr1cnBNEkFiCP5fLFSY+z64ojlIUvA4l60CLtgvOsixy4A
	27bW9mlkfsatuvRLwNY6YgAaN1u5JACR30YecOCVI9Ek/bR1K4rbbdokpD5a329iKCDGEQ5HH3oqc
	AljVPPOijcb9KZlZfmGTHCF+VMPZ8/8Y4BmrOWFJSqNkvVCpc4WuCH1fIp3y7xOIi4Nr0fYUlFQ+v
	zJoEoOngjKk78KiaVD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0U-0000000GJjv-2Olr;
	Thu, 16 Jan 2025 23:10:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0S-0000000GJgU-0iNz
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385eed29d17so849248f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069030; x=1737673830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp/FsiaV0Z94/Qxw/F7YAAt+C4ai0FuIMW/dVHkyoAE=;
        b=GRq6h9cJJEHGTo6GI3i0+xP8KAW4pSAJhjB/00B5vzykbwgqU0b90mPEJg5enH1/9H
         gU/WVka+vziHoj7aZitjqfTyFFCjaUllM/HitfGRlZgAgDHv8Vl30+RDAAYVvrq2hb5o
         WCrlgQCSXHvx6e15+ioNRHwV+R+AVRvta8fPuvF9/AxO6jiEPSRGsGS4ub7OET2iURtt
         HogQXP2+wgKrDyCpnHLeIM+DYbcS6XqfAVFmv8BNdVsxxRIK5uLbYmbvMpqSN7Aw2N2l
         PLknJzltpNetWKbbwybgq1vMC+QQ6D+dThHRc1imra3YvrdFe+/hgrc32bktjaCUXS1Q
         VNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069030; x=1737673830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp/FsiaV0Z94/Qxw/F7YAAt+C4ai0FuIMW/dVHkyoAE=;
        b=FFh4nlluUWawuMXhRFodIXBfbUp60CvSa6FnhLG+2XqJqK259sN19LU2qZig8eVThd
         Dk1BXrESL+YAftEDlGz1imLKUItbfKmBMzP+qvxpHJRJTt5zS4Y35rlkN/SY5Mmgf+La
         67UhrL0yIzB35TtvDYjgSGwod3BqGjI2QxP7J+wbVwbVmF7buVZaNImwKrsrC5eigw0j
         B3M/d8xZyDfBUxbbEMqgkLDqZp42VP+TXAfITHtDzVXQ4dIwnuWoi6f2egVJ0VucoItP
         9I3Zb2LRASnujhMjt9MmtPNaaoOiYM/sAFO33o+oMfYpcuKsCM2O5CM97G+ByQPAiCY6
         emTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxJgXTlCtOxcWfjFfdceeu37N7KHI/v9fjn3si371MY57Akeh7K8VMMdM184/Rmy3XYlgI6s9F8bKYrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy16N9P6TeC64mRcCuKfttqJ9vBdgjqx6SsBVat0IKrPM8bPh/r
	O0N+ExFOky5mWq3/o36sSDn/pedEr/D1WrfY2Dzkdb0zhQqIw71AF5oi1OxXlbM=
X-Gm-Gg: ASbGncvK7gx8RK2onnpILrFmOdFgu6aYzojkBptTwogDBdVMoK+/rvD2w2dHmpk/CME
	kv3Ijx2CXCAORx2PPqpMZYKVCQCvt2tdoEPiddSgsCwmiZrbwl0gR1ae+mjhnKi7Cge4IwzkcAD
	7mhtHogBXaGulPKBTpiabQ6xmdid9vDbabhfLtZ1t44OyPy7f+9sjeExipLcJLHuSqovgcnVew4
	o4m0inUcR0GGccxoOjfgbIC0AAFKytszhxi59ZgEk+jvjppaw2FlbO7zwiQW5QzU9NivDJpgm1d
	5U3nkdlkDXy2rsKq
X-Google-Smtp-Source: AGHT+IE0MecDnwhZClHJ7PgerRYXtp8cYAxIgYswrea4HoSFCj4iDiT/DdG8q//dcV9mlJlAaDCGOA==
X-Received: by 2002:a5d:5f51:0:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-38bf566240amr315638f8f.12.1737069030525;
        Thu, 16 Jan 2025 15:10:30 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:30 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 3/7] riscv: Add Control Transfer Records extension parsing
Date: Thu, 16 Jan 2025 23:09:51 +0000
Message-Id: <20250116230955.867152-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116230955.867152-1-rkanwal@rivosinc.com>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151032_205888_E7FA45E5 
X-CRM114-Status: UNSURE (   7.87  )
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

Adding CTR extension in ISA extension map to lookup for extension
availability.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 42b34e2f80e8..552c7ebae7be 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -105,6 +105,8 @@
 #define RISCV_ISA_EXT_SSCCFG            96
 #define RISCV_ISA_EXT_SMCDELEG          97
 #define RISCV_ISA_EXT_SMCNTRPMF         98
+#define RISCV_ISA_EXT_SMCTR             99
+#define RISCV_ISA_EXT_SSCTR             100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -115,11 +117,13 @@
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ec068c9130e5..ef3b70f7d5d2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -391,6 +391,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
@@ -400,6 +401,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
