Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8889CED619
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7YGd0ld5UICsis6mYFJv3lenMUT4WLNFw3Wa7gquYxs=; b=VPB7LAqnKSr/oO
	40/86b5k0T0Zd3gehKW1JH4KO1zHE3+Y9C1A4VOZJzz8QPW8Y9lGINHTvM0LF8dnSgdu3EtbHLDi3
	bHmJySjWutzVsDwCXj+BkwiAHr73ty4/CrChuU3ok4gpaj90nENF9dw66+49r3eFehxpyR9cKZ3zb
	x88UhGkHDOWuaOetQTmqVRCJ2TjFyzKIzmktDtugIKweQK/sT5qpNlsrF0X/ClZ62MNR6RPc1oWL0
	+bRzDCl27K1/brAM1fGNUxt3i/U/kwde7ZCziT3C/hc2kYr0mT75u6RD7CbZT9mwbMmUme7yzYY1d
	BHoEj4ugCblUt3LNnCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syR71-00000008EGh-155c;
	Wed, 09 Oct 2024 07:27:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syR6y-00000008EES-16U3
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:27:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so66326565e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728458874; x=1729063674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ptmB7S0LctNy2c3zE9ySdgHDTmsXSWnpMdU0vVeLDg=;
        b=nyv1OAhXncXGjoOeh5wLa7nXgIWhE/suqFZ0VEpVI0SSyEeebK1gJtPzcBwqwoC2tp
         jtb6gZHlCui3NHhHX/6jBrqZUFzz/s2atRBsyMBf/KlIUKeAhxf4zEdrOe7S97cdoktt
         jtDzsIYMPp0jJA2KyGbuQ8tmhugeCgUVvBRLQ23rBJOjbFfKnwD9cNBbiDbzXjJbDo94
         bSEe/DzVS/Kg3DfBmMIchabnvecZCrsjQatsZHwa7dQ3XxXg0dB2QcTxXkuZUf8dSurv
         jF8RLNGPPWmQOkJuIqO4Lng6mhstYTsbF1QEYtX+e5Io4wfgWi2x25iaWmZShn5xkY9Q
         TYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728458874; x=1729063674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ptmB7S0LctNy2c3zE9ySdgHDTmsXSWnpMdU0vVeLDg=;
        b=DikNMLQVSVCnq3I8kSMfbDx0cWfqjOhlLJhX0uois4UwQ65VPun+AZpwYTu7pRB1v9
         O4PIGL1jd3nMwSXTKMm9SnHfKSuNcBVB7QEnSULyvwN57IgcrrL5EIwROGZZUcKuKaiK
         NupesqglyB+KBOMCs4NY0exFuzpxEVdra7yaeZJU+prgUuJzFgmGl47UhSk/NuAnCTfe
         m0kS1UR2A/I4VCTH1YWPHCqR1DEQ3+rHT2ZhTfQBL8gXvUgJODyZMxYXd1K3+cVLu14O
         nqaZN/Nhu37LLnqyHpB/TDVqHo6bknlR+DUEelWgOes0x+mLTls5UMDBTJrEkPjbcwFf
         UBOg==
X-Forwarded-Encrypted: i=1; AJvYcCX5WnrWweD30srfpQwmm44wa27XfZyEYP7Ah1+k6jsIMWYnxtHYpaJlnakJh7cHfM4Hh3KD8DJcLQukTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZBwwQWrC16R9tw/8s/6L98hnBX67my3+G+XYRo12Qy/ZgK0gV
	ESE6EYJbj8v/1r0QXMv0eD7E+9FBeet72jrpB5Fll/rEMafceSGZKS+YmXAnBkM=
X-Google-Smtp-Source: AGHT+IH8tMgk+bXicF051ZBDsXltfKaJUiyBqM8XWScG+ZYwForWjazqlcyOrOg5Qj6tPEtQ++uzag==
X-Received: by 2002:a05:600c:34d2:b0:42c:c003:edd1 with SMTP id 5b1f17b1804b1-430ccf1b03fmr9473025e9.10.1728458873828;
        Wed, 09 Oct 2024 00:27:53 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf31b35sm11178275e9.3.2024.10.09.00.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 00:27:53 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jason Montleon <jmontleo@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes] riscv: Do not use fortify in early code
Date: Wed,  9 Oct 2024 09:27:49 +0200
Message-Id: <20241009072749.45006-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_002756_623574_9A10A7EE 
X-CRM114-Status: GOOD (  10.05  )
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

Early code designates the code executed when the MMU is not yet enabled,
and this comes with some limitations (see
Documentation/arch/riscv/boot.rst, section "Pre-MMU execution").

FORTIFY_SOURCE must be disabled then since it can trigger kernel panics
as reported in [1].

Reported-by: Jason Montleon <jmontleo@redhat.com>
Closes: https://lore.kernel.org/linux-riscv/CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com/ [1]
Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/errata/Makefile    | 6 ++++++
 arch/riscv/kernel/Makefile    | 5 +++++
 arch/riscv/kernel/pi/Makefile | 6 +++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 8a2739485123..f0da9d7b39c3 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -2,6 +2,12 @@ ifdef CONFIG_RELOCATABLE
 KBUILD_CFLAGS += -fno-pie
 endif
 
+ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
+ifdef CONFIG_FORTIFY_SOURCE
+KBUILD_CFLAGS += -D__NO_FORTIFY
+endif
+endif
+
 obj-$(CONFIG_ERRATA_ANDES) += andes/
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
 obj-$(CONFIG_ERRATA_THEAD) += thead/
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 7f88cc4931f5..69dc8aaab3fb 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -36,6 +36,11 @@ KASAN_SANITIZE_alternative.o := n
 KASAN_SANITIZE_cpufeature.o := n
 KASAN_SANITIZE_sbi_ecall.o := n
 endif
+ifdef CONFIG_FORTIFY_SOURCE
+CFLAGS_alternative.o += -D__NO_FORTIFY
+CFLAGS_cpufeature.o += -D__NO_FORTIFY
+CFLAGS_sbi_ecall.o += -D__NO_FORTIFY
+endif
 endif
 
 extra-y += vmlinux.lds
diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index d5bf1bc7de62..81d69d45c06c 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -16,8 +16,12 @@ KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 KBUILD_CFLAGS	+= -mcmodel=medany
 
 CFLAGS_cmdline_early.o += -D__NO_FORTIFY
-CFLAGS_lib-fdt_ro.o += -D__NO_FORTIFY
 CFLAGS_fdt_early.o += -D__NO_FORTIFY
+# lib/string.c already defines __NO_FORTIFY
+CFLAGS_ctype.o += -D__NO_FORTIFY
+CFLAGS_lib-fdt.o += -D__NO_FORTIFY
+CFLAGS_lib-fdt_ro.o += -D__NO_FORTIFY
+CFLAGS_archrandom_early.o += -D__NO_FORTIFY
 
 $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
 			       --remove-section=.note.gnu.property \
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
