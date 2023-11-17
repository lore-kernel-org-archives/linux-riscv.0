Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7B3C5AD4C
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 21:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaI/kP1aKGI/RMyAMWq6KOwyxBFpPP2dufXK6sgkDkM=; b=UaJJ9/Hxcw9+sj
	uwXEVf5mZAqRxlPH5VCysGtIkGZrWrgkkyypuQIFdfMPct+n1XOZhzOap7PZXLoufXMqkPnADvRFs
	i3er//n12SdaCK8EI+cDFMDqVvRPQ+Yx4b7a2dWeswdw3LtmqCPSYvA7ayRtdSIDBlZWvu8GO2241
	OC0xyV0h233PCII6QHZ8QNufJJM3HmUrgbdTZuuOj6RYC7e1GC4fETMmctqI/nqtnB7nTUP1UXfUx
	flFnDz6X+Fs5/QXKRlDTHAx3alFC99yCkahVi9jeu99R1kUNHr8LwoWX90ALKUCi4vptRCJsHRKua
	fX9qGNecgUCvoGjPW4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r46Ns-007NKL-1C;
	Fri, 17 Nov 2023 21:28:16 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r46No-007NGa-2A
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 21:28:14 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1e9bb3a0bfeso1368840fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 13:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700256491; x=1700861291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Jfb6hOBzZpUnQKwLCoqR3E0xQBxJXpYyz1BMSpxkFw=;
        b=PGq8hnnOJfgha9kyvOkUwArBKYMtrhG1+yFMOLyPSLrCn1iSjtEKGKnJRzcnDkrEvA
         95tP+Za9xVTO4mngv50ALgNSeOM9wUQfhZrAn5CqfAdDImbE/e7CVzXrpd8Xh0oSXrKb
         TE0a5zyJKsrJP+J+E4P/BeTEyd7oLkyyDG6GEfBKaRaKV3FaHbHTQ49CjbpywrLC4Y/s
         624l+f/CHjW+rUrDd2/FHHzEO6Pi114pIT/xrDDXoGove3XiQuoJb4lb/dpu5pUiaTcA
         wtHqFrDfMavWjMhsy8JiRUdSDJv/HKlopItUfCCecEi5rBVmzjJubPpWjky61X/s26RE
         rYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700256491; x=1700861291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jfb6hOBzZpUnQKwLCoqR3E0xQBxJXpYyz1BMSpxkFw=;
        b=h9z29MNLL9nHapMUlRT3/8fZXIsR2FIiPp2uam3Mu9TiAS04fUHXt5ZYPcQ+YhJu30
         Lci26LLi1ENz3MleFLftAFU7xL5Ot8L+buM/MYgt/REVmtg7yz9wnIhfHfU0ICf04V24
         4TBcjUOldTdwc8wnM8akMaDdR/+FooF+8Nmi24TA90rW4XY21c+d9GSZ5CMFD/P4Q2PX
         55E+GOopfsQejaKB0McGLeRlF/5gjRs+BnLAPYRAHeQby6zecMkhxaogIk5suEufXZWo
         ATmuQ5uG81Tqy2+d2WSqDfKhQlo+tLWSvLGnq5ceON2KJqfpK4hBvBtw+f//L8snCVYP
         2lug==
X-Gm-Message-State: AOJu0YyWQ1eMR90WJN/ztRCkffsyAV7fi1dUhFLFL1jmIUjhzd7Lh1iA
	MRncY+xzlmR+A1HvepjXqwsHrQ==
X-Google-Smtp-Source: AGHT+IHj2Z2pnZ38FwJpnREYBKN+j7xsKbex5lAWS4vYTRD8S4SLoyfV+5pXVCGwm6dxV9XFtThxlg==
X-Received: by 2002:a05:6870:f608:b0:1e9:efa9:1199 with SMTP id ek8-20020a056870f60800b001e9efa91199mr585055oab.4.1700256491304;
        Fri, 17 Nov 2023 13:28:11 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e2-20020a05683013c200b006d3127234d7sm365677otq.8.2023.11.17.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:28:10 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 17 Nov 2023 13:28:00 -0800
Subject: [PATCH v11 2/5] riscv: Add static key for misaligned accesses
MIME-Version: 1.0
Message-Id: <20231117-optimize_checksum-v11-2-7d9d954fe361@rivosinc.com>
References: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
In-Reply-To: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231117_132812_709384_F192AB63 
X-CRM114-Status: GOOD (  13.44  )
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
