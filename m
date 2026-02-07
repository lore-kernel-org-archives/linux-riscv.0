Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07439EE0AC7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgZnACeLY9p39GjbyfJZXBjt5rHsrTWIfASVVCFZLa0=; b=4DmMu+vEz/RD+6
	PTXNzMgxVGsJfmsmhGznEELnbu+7byEuRkjx7V64+Ndx6loiik4ND7znpD2xiQBU0ypyrgaPMQQSU
	41XsTNhBU+CBjwZZVcQH3dzcL769yDvqZVfN2F/LoRT03p/kQu4fuLCthKW2R5Gc7zWkhibrSottE
	3t7t/pX3+7W0GQBlIg827TxHVTnfLZOqNPnWF9anrNjqQFY1YWEFWY9s1NPy3fWRn2osm3cdmoh1h
	G3vhFojZEK0OmtXrhaNu506ZTrT9B3SBPVsAnX3cwueZSIOmuSifH2b6bzUqckFTO8ssoUw2B7T6l
	ZvBakU2EPgoQcqZhKPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofY5-0000000CKK0-3nI0;
	Sat, 07 Feb 2026 10:28:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofY3-0000000CKJQ-2Dz9
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29f102b013fso16001565ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460098; x=1771064898; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwaoSKGFCCZq9SrY+ClofJYdLMOIdvCR/KkOdMrPfno=;
        b=ZfErRjgp7RIV/AW4jV4t5ufc+W/3vqHGJ1MuUDToiMDjVZ1PyL/mmmUXA19jBxkT8k
         RMyCsz1O6dqSHOqgmF91DCOzphPdHKrHCGbQLBwQMstJkzyJ4NqEKSNoFjx1AoGkaVkv
         49AU2MGSEed7ljIInBXTnh4P4pmMo9oL+5A0eHN99j0txPyI/zi5Nsnj3WVt9PImNM1Y
         xxoppeOSnaoGmlxrlIf1nVdzpbw8kmSTTrkri+vzgpYdjDW0W4pf92u3m4FIclyFUOV9
         kyCOsfjqPZuwaONpu/hycmNbMKyKmN/QW638q5/ot+S5qNOGa6fm8O3m4PDox0jrfqky
         Ys2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460098; x=1771064898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kwaoSKGFCCZq9SrY+ClofJYdLMOIdvCR/KkOdMrPfno=;
        b=CPpdFb/M9MY0A3RtZQ7OBXoS/4DK68Lj3+g9/H232aFdL5Wk+PHAy8Cn4Tnf0FaVYc
         ftgphI66blG4BawSAmRMH21ottTvmRPvGL4X2VJwSICH9w2ojQNwCsRhVPwmBvRe1AGR
         IefqY74CAUaeP5n8aLTbgZzcHgRa8zH+4hv9I/YVZ7TUIBPSMBPPIVfbQCT2U4Sci26E
         NBQyzL220wt/xuFC4efgN/xsFSZb3yy2wjV3EFLraCkg9FdEaVXsqyOwStyXWMhKbcAC
         IziqaL95C4p/J11mhmV6PRPqDQ7uuwbqjj4oVJjbM9N4eTwSzR+yvu7yS4ghjifj6Jla
         HK9g==
X-Gm-Message-State: AOJu0YzJtVQLQB04Jdp839UkHLmem9uN2I/TWvZp256aJxwMLkFKob36
	oTHtFDMFXlJ1c6CSySywaY5/RSHHgqrQUDeSwOVbdzBUtzvuf4QI70IObgEftIi8SkY=
X-Gm-Gg: AZuq6aKs8DWs/W9ZuzLK2mqsw15P33xlofaGdXdt3m+MaVrdWgETK1V14h7y/neJckb
	n0DeoCgx0gEBFnTwwc9KO9EVhAaD+6AQXaHMj1hp+AbmxyVc34iTpy/7oiAfiF+BPvmHskCktuy
	NmZi+2m1jRaJ3/kZhFdUzaIhecOtCSbMRL/9mgrEkW6A7KDvegvrBEAhUbjgsf6WADW8fZw79E5
	FZ7+8UddaiYB+z8wHNfwg4aAm/Co6Y69kxKeYWaK6+JwmjmbM7tif3BI3vvS1ATG8ztsZiW+EF9
	WyEfVtH9JKV+ZEQEnFxjVVF6UAKj0W/BZ4EcRuBLdVAN72VX1DR5yO93v6PdZ5Opyy10QYiAnqx
	9J/qmJZUjhIwo8+IKHeVw+n54AZ6N3yHkEFcVTJFCcAB9nw3AGOFmLReEuhl9vluKRMChUlFpVx
	WEfTCF8chrHxtiVxgjz4g+Vm8m1GqAZzPpRTJIXUAPqAMtI6bP+QJb3w==
X-Received: by 2002:a17:903:41c2:b0:2a0:9755:2e97 with SMTP id d9443c01a7336-2a9516864f7mr56133595ad.15.1770460098496;
        Sat, 07 Feb 2026 02:28:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:56 +0800
Subject: [PATCH 2/8] riscv: hwprobe: Add support for probing B
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-2-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022819_596415_C890F6C2 
X-CRM114-Status: GOOD (  11.80  )
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

The B extension is a shorthand for the Zba, Zbb, and Zbs extensions
combined, as defined by version 20240411 of the RISC-V Instruction Set
Manual Volume I Unprivileged Architecture.

The B bit is added as a system-wide check in RISCV_HWPROBE_KEY_IMA_EXT_1
using the global ISA bitmap.

It should be noted that the kernel already exports Zba, Zbb, and Zbs
individually in RISCV_HWPROBE_KEY_IMA_EXT_0 with per-CPU granularity.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc6811573051154bc9c64617f3d7464..8430bc94fdba073e1e3ded973322c773c598a0b5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -391,3 +391,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_B`: The B extension is supported, as defined
+    by version 20240411 of the RISC-V Instruction Set Manual, Volume I
+    Unprivileged Architecture.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecbf466098ace486658aaeeb6667e3..e7bd2e9ea33459572d01495f4063e32e3207e48f 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_IMA_B		(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288fc296d711c111e8d1a2e2fc8026a..491af3c5b66a0cb30471dafc8b31c70df2f9bed1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -191,6 +191,9 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 
 	pair->value = 0;
 
+	if (riscv_isa_extension_available(NULL, b))
+		pair->value |= RISCV_HWPROBE_IMA_B;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
