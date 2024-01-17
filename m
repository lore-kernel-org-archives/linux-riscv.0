Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E09C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PI48VvNNNJGFpIZURisdNMCJuFk7bG7d1AoGZ/6a+0I=; b=Tup3jYV0fv2akN
	ENtXIRsHaTHP75fCH7bfM+8KQLAoR1Hao6LfRllNYq/5q0D4qfm3NFmpkdK8rILNEGd+TzYcZJBVM
	FdTbtU4uWqZhT/hfXx8traH9YqZDE3nGla6X9INoHuREAAg/MbopJuz8pzWSSVldYTbYukVj/Mv6B
	KcCErmanlYaM7CLTLsYyY0eTwF+rHwi2MRles+B6OgvZspLdJn5rNmHYoKq2Fb6JF54Io2U0hpfzX
	eQ8B4HcZYF0IveHj34fW8n826riVzLeehMSZlxy1mSAASIXYtWaz3hL6gQlFLbEkkp4ET9FBGb7ny
	wXO9JPh2FFqBGoADL1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1En-00EsFw-1E;
	Wed, 17 Jan 2024 08:25:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1Ek-00EsFI-0m
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 08:25:28 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6d9bc8939d0so6897153b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 00:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705479922; x=1706084722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLAj/2p6EWO6CuOFTo5201/UFs9ytEaathr/jXBe1ac=;
        b=Q7karx8zDHAURBEk8UUbD7Tw/rhjwIlT38bMBKhaJZJTdJdF7Pr9cNNreHlgicG1te
         wGLeItpfk4mIlJKR7hH2aTRWPT6tCoi2+MVOLHBeY6Xc2LAk8VBj18X1KCRevbF2odrQ
         w/MpJvkN1X0TA3wtvdmCEoL3roNg+1a/QsCyyFjQ+OYwvZ0hiukfX5MzG39YeJ9M5N75
         wnRN7eCDaPIGPfhh0mlDPlwrCmGHBj/0sJ6hPwcfchCC9ttLQNTIdTfbTKOw3QggzT8N
         E3Zosi/mEDsgDNDjFhdi3tne80+PgiOl/4z5wIFE8643hVqJ82zNpjhjUCNfus25/oyw
         AxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705479922; x=1706084722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLAj/2p6EWO6CuOFTo5201/UFs9ytEaathr/jXBe1ac=;
        b=Z20+1YpfhfC27UtqHWO/iTQUDFrXkAD4gw+eL95TffoLLfffgrjF4RE6l4O8Os/qsw
         uFXYfcnX5DqQEEP43l+2hL6wQhAXEKvEISU1dJyHF6m0yhPPg+vDkKbpY5u+2eymFke4
         CBDZEsBh3ePhyEuvp5OOknydfuVx+7rxUruMCkCby0hthoeGF9nYCIH+ydxFtJmhIYQ6
         sOOUZE7q0r7CRgin2Pn6NeT9N3dav+l/p0q1V9kRKwSq6TZfxnkxP2qmYkIyMU4sfY1n
         IslsMN8Qq9vU0xyvi01AYSeou8sZFb4NWW6NA7wR7TZnOb3yNJXOPQrzvNgs0CxdsVX5
         zung==
X-Gm-Message-State: AOJu0YxsIgcFrNlRQhF+/ViSDNnzxgCxYFnn14JNE6ZfhDc56sFO3WfF
	fdGEcHENg9hizkmIYLved0gizK1C/05MiTjWDciNcbXekZJrZg==
X-Google-Smtp-Source: AGHT+IHya5IfDhQf7BZmho8amnGY7/fz5x+QBoLxcJNy/Z6r0mJJOQs3go7xdMoyB52Opolqof04XA==
X-Received: by 2002:a05:6a21:338f:b0:19b:7e2c:d5db with SMTP id yy15-20020a056a21338f00b0019b7e2cd5dbmr42515pzb.38.1705479921914;
        Wed, 17 Jan 2024 00:25:21 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id jg20-20020a17090326d400b001d060c61da5sm10426802plb.134.2024.01.17.00.25.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jan 2024 00:25:21 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	ajones@ventanamicro.com,
	xiao.w.wang@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xuzhipeng.1973@bytedance.com
Subject: [PATCH] RISC-V: selftests: fix cbo.c compilation error
Date: Wed, 17 Jan 2024 16:25:14 +0800
Message-Id: <20240117082514.42967-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_002526_305644_D777B961 
X-CRM114-Status: UNSURE (   7.27  )
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

When compiling with -O0, the following error will occur:
cbo.c: In function 'cbo_insn':
cbo.c:43:9: warning: 'asm' operand 1 probably does not match constraints
   43 |         asm volatile(
      |         ^~~
cbo.c:43:9: warning: 'asm' operand 2 probably does not match constraints
cbo.c:43:9: error: impossible constraint in 'asm'

Add __attribute__((optimize("O"))) to fix.

Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Suggested-by: Zhipeng Xu <xuzhipeng.1973@bytedance.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index 50a2cc8aef38..ff1d8e843d70 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -36,7 +36,7 @@ static void sigill_handler(int sig, siginfo_t *info, void *context)
 	regs[0] += 4;
 }
 
-static void cbo_insn(char *base, int fn)
+static __always_inline void cbo_insn(char *base, int fn)
 {
 	uint32_t insn = MK_CBO(fn);
 
@@ -47,10 +47,11 @@ static void cbo_insn(char *base, int fn)
 	: : "r" (base), "i" (fn), "i" (insn) : "a0", "a1", "memory");
 }
 
-static void cbo_inval(char *base) { cbo_insn(base, 0); }
-static void cbo_clean(char *base) { cbo_insn(base, 1); }
-static void cbo_flush(char *base) { cbo_insn(base, 2); }
-static void cbo_zero(char *base)  { cbo_insn(base, 4); }
+#define OPTIMIZE __attribute__((optimize("O")))
+OPTIMIZE static void cbo_inval(char *base) { cbo_insn(base, 0); }
+OPTIMIZE static void cbo_clean(char *base) { cbo_insn(base, 1); }
+OPTIMIZE static void cbo_flush(char *base) { cbo_insn(base, 2); }
+OPTIMIZE static void cbo_zero(char *base)  { cbo_insn(base, 4); }
 
 static void test_no_zicbom(void *arg)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
