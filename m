Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B765BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 22:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaI/kP1aKGI/RMyAMWq6KOwyxBFpPP2dufXK6sgkDkM=; b=IQ4ZZ+EwTk8OuX
	bOH2ofOwk01TUEXDsBg2feayfyq6saDcuw1hr+U7U3v8w5fooCJ3OPK+RhM3GMbw1GC7WTCAGMqLW
	cw/Lqa0BCfrL3wfyw25H4DZoPyBnuIZrRH2ZP57xd6OgnhD4BI4zv6OPFBnkNwTDue5jzfCbUeE0d
	XWVvFLBbjgOKPXSc7ngs/VWwMezgEBlwdyZSiPAPFp/lk4eg76ThFJ6oy+xdLLbPCXXmL2SQXVQI1
	vVFgP16eGAchdl2bu4E1K4AoFIEll6vSz+UDQr0M56QJHnd+JS5u5iYc7QqkcQkMF5ALNwL3aga7P
	IIS6P/xwKj9pufsoQSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyK0b-008Eqb-0X;
	Wed, 01 Nov 2023 22:48:21 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyK0X-008Eok-37
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 22:48:19 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b2ea7cc821so222659b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698878896; x=1699483696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Jfb6hOBzZpUnQKwLCoqR3E0xQBxJXpYyz1BMSpxkFw=;
        b=i5Qn7Fxs9rtRqQoJpAW6BkJSJJIYxwUHYXiGLu1rY6ZS3muuXG+3dIATd70tz6l0nQ
         hGWdzj2vUtzU39FRokpjGgvfKfFCgMFkut76EQQ/nJt+YJLZanchRwmVY656QsKGRXOC
         tmHfE4PQAje67sw/pxcnJG/EL04eZlcYALE5njTkleVSrvJQ3MNdVmwul8zDX2r1vIS7
         z7XuOUte7lb7cuH5XU3/1G0CRt6cCPttZwrWmaMax/pUGmOcbhQKtXzb6IhLu5aMNp8R
         aPt2hLeneziLDL0bIr0WTx7WjrBLmiebv85uRckDcn4d9MFZ5K8QAeEnmUrrOnxtut5a
         v2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698878896; x=1699483696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jfb6hOBzZpUnQKwLCoqR3E0xQBxJXpYyz1BMSpxkFw=;
        b=Qj6M1YonRzQEFQd0jz04LYvH4MFpEbyDVuG/fVZCAzzrNMjqRt7ywx0zOvKPQyEq9O
         oDSCl2P96VFH7FDlOsxxxJc3C4jIwz4zDkq8Fiy3px61Y4ZmGJJmcoYN+Yy747uc/ycp
         o9CJ7h7CP0dHc6zyYfuzB97YqbWFfFb8fkxpLeLt0wxOOCyB6r442mayc/or7I7xNpU1
         qGuYhCw5SGeLkXYlJmae0Od5ufweUVRlM49aTB4cmEekmWc6TbU89gkZAIUbmYLg/DRv
         yU7I2zrs3mLhL3Adi56tPX1lbtlLGCF7vlH7t2uGxGW1BDn1PP5kRaYjY0OfZfQZy/Ut
         kaZA==
X-Gm-Message-State: AOJu0YzvB1LDDWWKpUzoQb6GwCvABx/I/t36lydEkz0c7Zv7O5Pm2Dja
	YTSr8NO/o+aBDeB33rTjTvhMfA==
X-Google-Smtp-Source: AGHT+IFrRQ4RvXCeg9zgcc6gQJKyxMZycIJwRZBo6fv/AO0GuJFj60KRW9zeICB72WblOqK7tOZRDw==
X-Received: by 2002:a05:6808:13d6:b0:3b2:ef9a:4339 with SMTP id d22-20020a05680813d600b003b2ef9a4339mr21460103oiw.49.1698878896675;
        Wed, 01 Nov 2023 15:48:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id be24-20020a056808219800b003b274008e46sm376580oib.0.2023.11.01.15.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 15:48:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 01 Nov 2023 15:48:12 -0700
Subject: [PATCH v10 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231101-optimize_checksum-v10-2-a498577bb969@rivosinc.com>
References: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
In-Reply-To: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_154818_002802_DA2DA3C4 
X-CRM114-Status: GOOD (  14.20  )
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

Support static branches depending on the value of misaligned accesses.
This will be used by a later patch in the series. All cpus must be
considered "fast" for this static branch to be flipped.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  3 +++
 arch/riscv/kernel/cpufeature.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index b139796392d0..febd9de4373e 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -7,6 +7,7 @@
 #define _ASM_CPUFEATURE_H
 
 #include <linux/bitmap.h>
+#include <linux/jump_label.h>
 #include <asm/hwcap.h>
 
 /*
@@ -32,4 +33,6 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
 
 int check_unaligned_access(void *unused);
 
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40bb854fcb96..8935481d32da 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
+#include <linux/jump_label.h>
 #include <linux/log2.h>
 #include <linux/memory.h>
 #include <linux/module.h>
@@ -665,6 +666,35 @@ static int check_unaligned_access_all_cpus(void)
 
 arch_initcall(check_unaligned_access_all_cpus);
 
+DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static int set_unaligned_access_static_branches(void)
+{
+	/*
+	 * This will be called after check_unaligned_access_all_cpus so the
+	 * result of unaligned access speed for all cpus will be available.
+	 */
+
+	int cpu;
+	bool fast_misaligned_access_speed = true;
+
+	for_each_online_cpu(cpu) {
+		int this_perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (this_perf != RISCV_HWPROBE_MISALIGNED_FAST) {
+			fast_misaligned_access_speed = false;
+			break;
+		}
+	}
+
+	if (fast_misaligned_access_speed)
+		static_branch_enable(&fast_misaligned_access_speed_key);
+
+	return 0;
+}
+
+arch_initcall_sync(set_unaligned_access_static_branches);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
