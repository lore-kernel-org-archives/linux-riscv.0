Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93CFC432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF9660F91
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FF9660F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f8PYOC3BoPlAgbiCqUqMXZ5cZOtDUstH9mEkPROYwME=; b=h1eZRX7EYOZyS6
	E5EIvk/9Ou1QiQqrk092SGwNtCU7bjjmoEzGQMg4NQQfmIsJPxuEUSu4m3jkglvB28O6wPGK3zcLe
	UDyoAXy6+WJhHsw5hGb0DQgp26yqVDzdxsChXjCnm4qbyDCLelXhQkdmlU7XmcHzup8ZOH6tpL+Ym
	rSq79g56SYKSwmj2bYBgw4gG5ArfU8ak+r15RXYoX9+8Ro53QHtrHzEHbWwVLEk1kmxhA0sA6i/D8
	77Wypc517Q2hGc4rULgIJJuq0j8WGeRXMKmEfDLDINpJMkDB8syKeFKLIdOCmVYNS9hREHcX/2H5l
	E6JlVZ1rk0ttXc0LsRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ8Yb-009GIN-Gp; Thu, 26 Aug 2021 06:08:09 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ8YY-009GEx-Iw
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 06:08:07 +0000
Received: by mail-pg1-x533.google.com with SMTP id x4so2214106pgh.1
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 23:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=XSO4aTMI8L6SABu9p5nHJasdEB0/4Gj8hIYzUHhpqoI=;
 b=uGZUttuTcwZQAXVURE4W4dhyTqswmOh9u28bv+2LfY7C5Z+u1mqJJPZ7slCgWDvnZP
 JSFht4nC+dJSQgWNGJxAmMhAp7OBo8M8SbHl8J2N5exn+0Kygj5hM6ql0bOEh3vTHngQ
 M/NqvIHEJMdAONtSwIxj3nDx+al1m/mCntMxggLGbdepslGiiRcd+udzkUCLTJh3RZqY
 YfHdQV5MibWsSgWAvmvY0n9fSjn/IZNpdBI/xkr2ambsVPnjOVwpm5qJOaIAdgLmbXv1
 +pQ+vd1hIhjRlw/bcKwRxuZPza2zqNH7QC23+S01Ts3eslpcqW2YvnQEwdgH/cdCNwC/
 m/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=XSO4aTMI8L6SABu9p5nHJasdEB0/4Gj8hIYzUHhpqoI=;
 b=imTOZZzw8nXLEwV4jXOx/HKbrPf9ZrbtsYyJkCDTn4K0P6jeJTatenzZtSSkqcX+h7
 CZi+nq6F4YaRcbstcSx3GtezP2dtSVmih8XccZVztDZvgWEdkdG+c3o4HnXSAtyQbpmC
 I2dqEcXt3lqITDX4ytGNfrk1FOMoxfu9bCFbpuErDc4QYvlpP4UUtmEoXXiHnxyBkhxm
 XevL0KrnR6Nv/t4b7gKWg7zbSJASIxLMz5Zop4fLu3ncyCZPoYYgjnINP68Vc0Lr5QVo
 +xHDBljOb5YMcn0cRIMUUcFRmGxzkDuwakQnWNjFSQLL6iXM0dkGDwoFqdAHDKpAMpSV
 xEnA==
X-Gm-Message-State: AOAM532Tuo546nOhrt5dSHmWc2+7zClmDEP8AKwiLStFSmnOnS2kAHkD
 waPkWaGRddmkhAULFYPInf10SQ==
X-Google-Smtp-Source: ABdhPJzW15W5p7nhvDQt3b4zFSYUvJ/8LxsZm9Z6KAltlF6bhi6uQj+Eb25pzinXJTo+sdn56L6T8w==
X-Received: by 2002:a63:e40a:: with SMTP id a10mr1898121pgi.414.1629958074381; 
 Wed, 25 Aug 2021 23:07:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t10sm7203435pji.30.2021.08.25.23.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 23:07:53 -0700 (PDT)
Subject: [PATCH] RISC-V: Fix VDSO build for !MMU
Date: Wed, 25 Aug 2021 23:05:10 -0700
Message-Id: <20210826060509.2470960-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, penberg@kernel.org, guoren@linux.alibaba.com,
 abdulras@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_230806_676727_86A1DCBC 
X-CRM114-Status: GOOD (  12.01  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

We don't have a VDSO for the !MMU configurations, so don't try to build
one.

Fixes: fde9c59aebaf ("riscv: explicitly use symbol offsets for VDSO")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Makefile           | 2 ++
 arch/riscv/include/asm/vdso.h | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index e026b2d0a5a4..83ee0e71204c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -108,9 +108,11 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 
+ifeq ($(CONFIG_MMU),y)
 prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
+endif
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
 ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index d8d003c2b5a3..893e47195e30 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -8,6 +8,13 @@
 #ifndef _ASM_RISCV_VDSO_H
 #define _ASM_RISCV_VDSO_H
 
+
+/*
+ * All systems with an MMU have a VDSO, but systems without an MMU don't
+ * support shared libraries and therefor don't have one.
+ */
+#ifdef CONFIG_MMU
+
 #include <linux/types.h>
 #include <generated/vdso-offsets.h>
 
@@ -19,6 +26,8 @@ struct vdso_data {
 #define VDSO_SYMBOL(base, name)							\
 	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
 
+#endif /* CONFIG_MMU */
+
 asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
 
 #endif /* _ASM_RISCV_VDSO_H */
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
