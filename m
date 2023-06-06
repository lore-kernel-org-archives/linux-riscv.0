Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157EAC7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 01:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtS3QQOGrS3fz8Dyen1khzE7r8NiMd15sHjH1yG/x3E=; b=rOrjS2ap2le+8k
	AmH2Fj3tDGQD4kX4nc7Vstl+Gbslda+qxQgHNLZCEX0RFPeCygBLutnL9dRug4DtDe8mTJvPJrlid
	D2kSx/5xrbcMUHJFEFoVhn+RKffhxDvmiYK9xsYx44x6fwcstNmy8/hqznc2m+c68zyay9Xm52FwO
	MA5CFmausbVi/NKBCvQTJHhvnC4Y4U1MIyRIfWTdInb0cASebcYQJtKqUfISArz/iejFFUS0BWX7M
	TUeWs1Q7/n2mGBBlBPp49RasWUPBBDCy6dLWMU+K/duM5RhpktnxItBL3t9rQ08SSqLTbIzyHjbms
	WWIN0ATdPsIVQbKUgyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Lms-00HMhu-0Z;
	Tue, 06 Jun 2023 01:47:06 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Lmo-00HMdh-1P
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 01:47:04 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bad010e1e50so6501182276.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 18:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686016019; x=1688608019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBvpomnchyX7j3v430l8zI/TSWkCW48OKURbkmmT8Lg=;
        b=Yvw3nswdfisNoUFNbjcDZmSdJhpFzFDtRirNvYytRPleNJX56Za622OdZYdOFyOhZR
         UcuGDZIWvCqt3gS426bnC3VXdSaftTg+rQ7AeIFsYZa0MS4EYv6rP8ef56NTvdqn+0ko
         XbC3pgcMiBJKYCx885v6AWp2twW59HpiWoRa4arxgFQQbe38Wxil0Cz4rz743JHYcEic
         wDl0rARzXSQjUolm5NjuYwxZtDZc7fHwsDb+eB5k3wliwDylJ4HhW8VL8OBrjGBdetsU
         VHzn7A+U3JLvia436UF3XVlvtd8j+tHESJFXtIU/YD8XtC8NLS6JLnPlWk7nol6Xg79B
         4eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686016019; x=1688608019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBvpomnchyX7j3v430l8zI/TSWkCW48OKURbkmmT8Lg=;
        b=UsPFZKjGLCtLMFp8NPOofzf+XjyBjgf1kK4h4ZlsBQ7k6HX0fu0T71kXFKYa804cbj
         GLFvh/42zfDSamp8IToHrmMiCI4J14HnJ9zJVRjj7kOCqGjsUvU2PMge82sBgf7t+ODb
         NU9P701A3P0Vx6jriWxcF0Fdpi0V27s7ee81YKyw88OrUN5Iu9wj4sNsdSpaiEYeVP+K
         bPAhjRxzo3qf7cDXoNWK/3/iLZfn/2Ka7Uj5vw3Y8LdwjWotHK7MoF0mNBTUaAteSMKI
         er+QDfS3eyNri5wZYc5FxBse5cbDY77NM+jgk6Ul9cNdq4p85FBpeQl7/ov/Q2qELZRL
         DNSQ==
X-Gm-Message-State: AC+VfDzIP1XaGqhqdmofuEHgfApXDz+m/6xfv4RQu2VUc0KFEZXG3HxF
	hJ9Yu6J9cvage0GC4EqQWnJqzg==
X-Google-Smtp-Source: ACHHUZ4bB5+hLeQuY+8KrAqakzDJ2/ZhWZtGB3mIq2LgtEA6R+F8nsFjswj8xA/KX5/F504hWfLSgw==
X-Received: by 2002:a25:9946:0:b0:b9e:3bea:ebbb with SMTP id n6-20020a259946000000b00b9e3beaebbbmr373624ybo.60.1686016019193;
        Mon, 05 Jun 2023 18:46:59 -0700 (PDT)
Received: from leoy-huanghe.lan ([240e:389:8603:ad00:6600:a29f:6ab:1788])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902a50a00b001a64851087bsm7197805plq.272.2023.06.05.18.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 18:46:58 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 4/6] perf parse-regs: Remove unused macros PERF_REG_{IP|SP}
Date: Tue,  6 Jun 2023 09:45:57 +0800
Message-Id: <20230606014559.21783-5-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606014559.21783-1-leo.yan@linaro.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_184702_478866_E74805F6 
X-CRM114-Status: GOOD (  10.31  )
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

The macros PERF_REG_{IP|SP} have been replaced by using functions
perf_arch_reg_{ip|sp}(), remove them!

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/arch/arm/include/perf_regs.h       | 3 ---
 tools/perf/arch/arm64/include/perf_regs.h     | 3 ---
 tools/perf/arch/csky/include/perf_regs.h      | 3 ---
 tools/perf/arch/loongarch/include/perf_regs.h | 2 --
 tools/perf/arch/mips/include/perf_regs.h      | 2 --
 tools/perf/arch/powerpc/include/perf_regs.h   | 3 ---
 tools/perf/arch/riscv/include/perf_regs.h     | 3 ---
 tools/perf/arch/s390/include/perf_regs.h      | 3 ---
 tools/perf/arch/x86/include/perf_regs.h       | 2 --
 9 files changed, 24 deletions(-)

diff --git a/tools/perf/arch/arm/include/perf_regs.h b/tools/perf/arch/arm/include/perf_regs.h
index 99a06550e25d..75ce1c370114 100644
--- a/tools/perf/arch/arm/include/perf_regs.h
+++ b/tools/perf/arch/arm/include/perf_regs.h
@@ -12,7 +12,4 @@ void perf_regs_load(u64 *regs);
 #define PERF_REGS_MAX	PERF_REG_ARM_MAX
 #define PERF_SAMPLE_REGS_ABI	PERF_SAMPLE_REGS_ABI_32
 
-#define PERF_REG_IP	PERF_REG_ARM_PC
-#define PERF_REG_SP	PERF_REG_ARM_SP
-
 #endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/arm64/include/perf_regs.h b/tools/perf/arch/arm64/include/perf_regs.h
index 35a3cc775b39..58639ee9f7ea 100644
--- a/tools/perf/arch/arm64/include/perf_regs.h
+++ b/tools/perf/arch/arm64/include/perf_regs.h
@@ -14,7 +14,4 @@ void perf_regs_load(u64 *regs);
 #define PERF_REGS_MAX	PERF_REG_ARM64_MAX
 #define PERF_SAMPLE_REGS_ABI	PERF_SAMPLE_REGS_ABI_64
 
-#define PERF_REG_IP	PERF_REG_ARM64_PC
-#define PERF_REG_SP	PERF_REG_ARM64_SP
-
 #endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/csky/include/perf_regs.h b/tools/perf/arch/csky/include/perf_regs.h
index 1afcc0e916c2..076c7746c8a2 100644
--- a/tools/perf/arch/csky/include/perf_regs.h
+++ b/tools/perf/arch/csky/include/perf_regs.h
@@ -12,7 +12,4 @@
 #define PERF_REGS_MAX	PERF_REG_CSKY_MAX
 #define PERF_SAMPLE_REGS_ABI	PERF_SAMPLE_REGS_ABI_32
 
-#define PERF_REG_IP	PERF_REG_CSKY_PC
-#define PERF_REG_SP	PERF_REG_CSKY_SP
-
 #endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/loongarch/include/perf_regs.h b/tools/perf/arch/loongarch/include/perf_regs.h
index 7833c7dbd38d..45c799fa5330 100644
--- a/tools/perf/arch/loongarch/include/perf_regs.h
+++ b/tools/perf/arch/loongarch/include/perf_regs.h
@@ -7,8 +7,6 @@
 #include <asm/perf_regs.h>
 
 #define PERF_REGS_MAX PERF_REG_LOONGARCH_MAX
-#define PERF_REG_IP PERF_REG_LOONGARCH_PC
-#define PERF_REG_SP PERF_REG_LOONGARCH_R3
 
 #define PERF_REGS_MASK ((1ULL << PERF_REG_LOONGARCH_MAX) - 1)
 
diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mips/include/perf_regs.h
index b8cd8bbb37ba..7082e91e0ed1 100644
--- a/tools/perf/arch/mips/include/perf_regs.h
+++ b/tools/perf/arch/mips/include/perf_regs.h
@@ -7,8 +7,6 @@
 #include <asm/perf_regs.h>
 
 #define PERF_REGS_MAX PERF_REG_MIPS_MAX
-#define PERF_REG_IP PERF_REG_MIPS_PC
-#define PERF_REG_SP PERF_REG_MIPS_R29
 
 #define PERF_REGS_MASK ((1ULL << PERF_REG_MIPS_MAX) - 1)
 
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index 9bb17c3f370b..1c66f6ba6773 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -16,7 +16,4 @@ void perf_regs_load(u64 *regs);
 	#define PERF_SAMPLE_REGS_ABI	PERF_SAMPLE_REGS_ABI_32
 #endif
 
-#define PERF_REG_IP     PERF_REG_POWERPC_NIP
-#define PERF_REG_SP     PERF_REG_POWERPC_R1
-
 #endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/riscv/include/perf_regs.h b/tools/perf/arch/riscv/include/perf_regs.h
index 6944bf0de53e..d482edb413e5 100644
--- a/tools/perf/arch/riscv/include/perf_regs.h
+++ b/tools/perf/arch/riscv/include/perf_regs.h
@@ -16,7 +16,4 @@
 #define PERF_SAMPLE_REGS_ABI	PERF_SAMPLE_REGS_ABI_32
 #endif
 
-#define PERF_REG_IP	PERF_REG_RISCV_PC
-#define PERF_REG_SP	PERF_REG_RISCV_SP
-
 #endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/s390/include/perf_regs.h b/tools/perf/arch/s390/include/perf_regs.h
index 52fcc0891da6..130dfad2b96a 100644
--- a/tools/perf/arch/s390/include/perf_regs.h
+++ b/tools/perf/arch/s390/include/perf_regs.h
@@ -11,7 +11,4 @@ void perf_regs_load(u64 *regs);
 #define PERF_REGS_MAX PERF_REG_S390_MAX
 #define PERF_SAMPLE_REGS_ABI PERF_SAMPLE_REGS_ABI_64
 
-#define PERF_REG_IP PERF_REG_S390_PC
-#define PERF_REG_SP PERF_REG_S390_R15
-
 #endif /* ARCH_PERF_REGS_H */
diff --git a/tools/perf/arch/x86/include/perf_regs.h b/tools/perf/arch/x86/include/perf_regs.h
index 16e23b722042..f209ce2c1dd9 100644
--- a/tools/perf/arch/x86/include/perf_regs.h
+++ b/tools/perf/arch/x86/include/perf_regs.h
@@ -20,7 +20,5 @@ void perf_regs_load(u64 *regs);
 #define PERF_REGS_MASK (((1ULL << PERF_REG_X86_64_MAX) - 1) & ~REG_NOSUPPORT)
 #define PERF_SAMPLE_REGS_ABI PERF_SAMPLE_REGS_ABI_64
 #endif
-#define PERF_REG_IP PERF_REG_X86_IP
-#define PERF_REG_SP PERF_REG_X86_SP
 
 #endif /* ARCH_PERF_REGS_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
