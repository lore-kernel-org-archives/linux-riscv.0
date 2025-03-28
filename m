Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F80C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKCrILCUaVUQ0o0ZN1h5eSImUut65csfdrgMrBijWfU=; b=42XyLl9f7Gmixv
	lhwjEacRvbQs1U2wsrwEVv32ueys2robo5Au6Sn4CVkm5cwRubQYxVuVCmAt+yOnajRG3VGqPVUcP
	hOkbDwMjEsIG3bUoxgaLjcr+5XSus5MHyD2IMzOKsvCZ+6j6CZlLpzhzHs4OP71r7FjPCm4KvS5wn
	UQwj11Nk9T8waq7Ht97Jr3j9pvmdvXvWO0apvvcE+Wt/mhwccTyRweWeDdtDTpctMi44QDwTEJBUJ
	KrcI00obOaD/WZgYYgE1aMk1OiE2t36nK32J/8yu62prPrfk3GQIDT1EeK8xB9DQP1jd3OCCrmugH
	G8EypjrphGoYxykn2Lag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8IF-0000000DGrn-0BYI;
	Fri, 28 Mar 2025 11:54:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8IB-0000000DGrA-2gTr
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 11:54:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso20779245e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 04:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743162870; x=1743767670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nq8SiNiOdFdszcNU99jrT9rjXqla8Cq35fKjERj5P+Q=;
        b=254DkI8U7iI7k/SPVemyn3mxFcD55ThL6UhBwPjzPImtDWxOUejkRnfODGTdye4gVr
         WKsWX4bN1KMwJFeiSNIdFIpdUk4Q/FCzfwgQb+Y4Y2zX/y+6fEhO5xIg5PEdqdt6675g
         gDD18N+qLYVlhmSucNAeprGMVdN0N+OkPwBUmWjxrfRf5vr4jPsYDj4/OeNUTPbhEqgG
         fPkKBA9m9mFxaaN5N9P0A1GEQdz6ntr2EBfF7t/aNB/8Si5kEf0lfVIasSrRenhyz4P4
         xcS0DoxBkGOZh3yKlxldGixvGQ3aCeBaS/cp/vsKCWdUcVdWgHAQVGnmiO6KvSX4za7P
         UEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162870; x=1743767670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nq8SiNiOdFdszcNU99jrT9rjXqla8Cq35fKjERj5P+Q=;
        b=T/tDggPSh04ts4162cmK8ZE5GLV9recvyrQ4ass1qS4jWyEOILbyOFKN4vAwNXoto5
         txzKYMs8DaDdE6tJi8roLRAIf5xMzau0s16HbYOzqfMFZwepLaTFpZo5u1T+Xkc5O5Mz
         +KaCJIYQFMPecdQKXM1pvzn9CTMZmHcNmY+gcaIimI3b95AA8l7gPTZ3oQOaIM6hXqXR
         mxtseAILBkq28TH8fvVd/tlsfz3QKI7YTLNjdFLlIfXCI296R0ha02U1E0YJRv0hD4Xk
         Z9WC/5SAUCoofrmrWVuDN3Bhx8VtWDi250sp5BrqZtunBKO9pZdLfe6sagL3g7BVIv0M
         p8xA==
X-Forwarded-Encrypted: i=1; AJvYcCUkvcDKhiVOq+/AJJ5o1dNIFNMNg1MvkP6XFb4vm8Toci1WY7YJmyIY039asNOZZAIUUDtm7I0/5W3UpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2dw83Kq8mKeLYQWxuk6//v0hm9zrbTwFsoeUytCpBy06iYfQG
	ycnjKxTNiuOXWXCJogzVk/oUhUSJlDhNteYAWZOorOTH7HsfqUXYNKsJa41cNcSBcf3OqDPP+KI
	v
X-Gm-Gg: ASbGncuWQfcnWm0yK537P64LkHWQqSly+rY/IfzLXpx9UOiEHIzk6qKUyx0DBHQ/wR7
	L8OQnKh3bPORjSzTsb9H2y2q6euGU8RIBAjJSVQNOoQMEF+BvOBYVSG85wtvvYDQr/98uzmRN3u
	3gBJgcYOfEV4J7vH5Niz2DfjXknpgQkID4scaf/B+8VBh4k9lkw/pRCt2TO+exKC0wZDbhfASa0
	CuxOk+VOVHyYiryf+PAgKHNjIrNP/fMOupZFjXiR+WKIoOviG4c6O88IZEYytXgAaaA9GCFxexE
	IaV8EMPy77SCGJsWiYVzVWVFq59AJT2kmm2dq+0aoe1nUO1MUVEXB9/B0or5q9W4tQr4f10Qg4W
	JWw==
X-Google-Smtp-Source: AGHT+IEkWECdQf8/xfXN75gZF2L+P0bhLua+nXVm6jXHa+PKu51SnPE9OqMC2xatRrQHN0rM92gjzg==
X-Received: by 2002:a05:600c:45c8:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43d84f5bc0amr67401155e9.6.1743162869930;
        Fri, 28 Mar 2025 04:54:29 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([193.33.57.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d900013afsm25163605e9.36.2025.03.28.04.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:54:29 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Make sure toolchain supports zba before using zba instructions
Date: Fri, 28 Mar 2025 12:54:22 +0100
Message-Id: <20250328115422.253670-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_045431_944925_036DCE39 
X-CRM114-Status: GOOD (  10.66  )
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

Old toolchain like gcc 8.5.0 does not support zba, so we must check that
the toolchain supports this extension before using it in the kernel.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                     | 8 ++++++++
 arch/riscv/include/asm/runtime-const.h | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0d8def968a7e..ae6303f15b28 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -735,6 +735,14 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
 	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
 	depends on AS_HAS_OPTION_ARCH
 
+config TOOLCHAIN_HAS_ZBA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
 	default y
diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index ea2e49c7149c..c07d049fdd5d 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -77,7 +77,8 @@
 	".long 1b - .\n\t"					\
 	".popsection"						\
 
-#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
+#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)	\
+	&& defined(CONFIG_RISCV_ISA_ZBKB)
 #define runtime_const_ptr(sym)						\
 ({									\
 	typeof(sym) __ret, __tmp;					\
@@ -93,7 +94,7 @@
 		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
 	__ret;								\
 })
-#elif defined(CONFIG_RISCV_ISA_ZBA)
+#elif defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_TOOLCHAIN_HAS_ZBA)
 #define runtime_const_ptr(sym)						\
 ({									\
 	typeof(sym) __ret, __tmp;					\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
