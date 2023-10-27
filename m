Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD6C25B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 22:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8hIDOD4roJAahrrl1gLLBN9DFIZNhPgmBz53Y1n+5I=; b=hUJm9frpeUrxU1
	LVIpf5+37sCVttfi7/sVLHTIGMmZhM17joeA4ioTxTF3KjNlH9xDxKtavuwpA3OZj9KWeUoikbZBt
	Q//+ceirdmJKUzBE3LZvniMoJw+TgWUri9AvD8HMJmNrOsZj2d1jGnYH4+SEIZAg9XoDkcqglAy3+
	gxkHFcSxR2RS6fCtSDyeTpxJUhbjS+l5F2RZ/2dHI8WBLX1F76dKjvmCx+2BH18XmGZWzSyAkmPwD
	npOu+uiB8lU5a03KD3gumYl24E3m+cJ3SW9BLoYXVsgxdzg4aKL/lRByvdKai1ey/Ph5IOTWl2CXf
	BKXfqqVRf0dI0oLQRnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVYl-00HJQF-0Y;
	Fri, 27 Oct 2023 22:44:07 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVYh-00HJO8-14
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 22:44:04 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so1565714a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 15:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698446642; x=1699051442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkuVRV2BU2bq68g2g/lXL36oTT7d/CXQaqu3G/K1tPY=;
        b=c8W4EWGBSrU2k9fYXh+JPBx1ttLk3AsxndY1K3xoj20xfBs3qIhrZJFbgFMp/Bof8i
         zIJJ9pielfyRMb5qmFgKwbgcfoDfJH+v30cnfg5+j7D4VLG6pOx/pXUBKts1g5eWX+Rn
         jP98tG4s2JbBg5wORl21prtFk8W7/chlR0RJVJHwQtmjHx2JdJM4dYatHYdyZx+gPyXT
         JNqTckP2370ic4hcwPa/l3nq7pXgyuOuH1w8Z4bmDC4/8bjmAXrf8X7n3WFh/RS2L+KQ
         JT3pvzsDKrVT7OWGjNsIEaAt+mrHvd+iWx0lA9c1KjBbeMEGDXiNjqzgD9smSzyLZXsy
         1PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698446642; x=1699051442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkuVRV2BU2bq68g2g/lXL36oTT7d/CXQaqu3G/K1tPY=;
        b=VHpU3uqrIYz6MbfmrU3CvEPFeIKq3g5Hpm/+oegwsyQqgHPIncriTPRZnc2Bmrkt3e
         6zp/xsuTWrQ5cXT/va1PUMzcbtRN81SeFWxNVl5eB1BGS77OyWk0ovkfTmZCrciV+y54
         uoyLMxydIRJgSiOkTJzm6IdhkXi35QQIQhHWL5nq4AfHvUk2eGL6P8AekkQwc6kUJx0w
         71FPNcTXwfNxwIk+nJIpaZurJcrRt4zPfwXCOSL26esTtiY6ikSjCTu6a+krOGlG+AVh
         opzHDkn7s6M5aseTfUnIwZchLVOHkPAbaYbaqNHJOBXcUUO52hrLKLkvL1NPgR+zTOPq
         nNcg==
X-Gm-Message-State: AOJu0YymaZMXBuiaE+hPF8VHclzluX953i/xEKW3Y2xixiDPBkUBOn0G
	iV5EpJVWu6SQ5umm8zWUV2eaqA==
X-Google-Smtp-Source: AGHT+IEifoZmkZ0JYpGGDw8fgxafPG8lvBp43skyV4czBADds8egtLlIOYW5YWE8tbfXGV/KpmGh5g==
X-Received: by 2002:a05:6830:7190:b0:6c6:3926:8055 with SMTP id el16-20020a056830719000b006c639268055mr4329785otb.6.1698446641925;
        Fri, 27 Oct 2023 15:44:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t15-20020a9d748f000000b006c61c098d38sm448564otk.21.2023.10.27.15.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 15:44:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 27 Oct 2023 15:43:52 -0700
Subject: [PATCH v8 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231027-optimize_checksum-v8-2-feb7101d128d@rivosinc.com>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
In-Reply-To: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231027_154403_371103_20EDFABB 
X-CRM114-Status: GOOD (  13.77  )
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
