Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD55C54ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibhFu2cjWez/JiclxNLFkQYjkiMRnxM1H95KyDL8f2g=; b=cwIPA9wG+m0zrA
	u2m8Pf+5u1tbhKLZS2VUsWXZX7u5Hyo7X78m7nty41ollBs+Hp6gCrvOtSAcux6zjq5SSC737Nqh9
	sBZbaO3iYp2zSaVQPYewn3mxWCZpOGTy54T1OH4RoPMpEfFCnTfl/a2vqM9IUOcGvYnLUJEVtCQCz
	FuWL1PBO5xBowSiEq6oygNPg9TzaMJyOnKupXEnvC4tdQGQakYUSmboK2kv83IlbdG83xCe3goOR8
	FgbwzvfqTpTEIhaDAjSHuahBozbnPsvwhXY10rpAazFI9nmKw2RUWxTP2c2w2IkUJR7HYH3a/Y7kn
	mGzotiQ7mY0eiH+cvdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFTS-00000002U7b-3rXH;
	Thu, 22 May 2025 23:37:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIw-00000002Rr9-0Wu4
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 May 2025 23:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=; b=X6emFsNSMgHZ3dOJgHy9T9cS6g
	Prj+5Qn7i9kRD35PjqlrZWzYcJ89yD7z/lDCnPZzGmSf3DeRWZ1NKn8Cc58z1RPTeMs11k7FSMXmD
	HTzYGjONSX7vJmo1qMu+auU3pnW8Oj+yvMi1rIIlRCJ2bKrod1e561NGcZD5YvnTYdDdW3mLc6R6w
	8kVOQAp0Bm/dJLos/rfNlXkbdz2wM2uJxsE9Yfroa15nUbpfCFJWv0uoo84iaQudN+cacNpHgM6RP
	Hb42djHiCOpOn7gjQPAsg4jfkv9tD6JsarL5HVg8E7/QBH3eZG5oriOF2sw0MxpV5pvevCWWtKpYX
	EvyHlaug==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFIs-0000000161G-0PTS
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 23:26:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso108079835e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956379; x=1748561179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=;
        b=w18R5RREeazDkk2D8wYqqqZmE7dbcyE0lFDK8IFnVQ23euGoeoRcbLgO5nRXpY21qI
         E/2GcXaN+6fkorJQ6S4/PE6sZ6Us0x5EOqESuuhEM8JED3a54AC27p2hI+cm77EiaPBM
         HE6gFx+dmk4j9wSffVonjW1VaGq5CwYdfvI/n2nMOvkOkwtujJjWiqp/W0UtC4Lo/z8Z
         UxrGm6B5Jw7uMlu8jZzK5R3wFJHC5LF0FYzW6uzWvUc4UkQGDEj1r4rGuD18qYY5j1GP
         ijT2XZFQ4vJWbMnCedU+NiirmOX4Mivm8ECrLL8OceZiRtzfO64dQzK8B2KIrBA247It
         oyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956379; x=1748561179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7dqPj/4OqgIxw+lFGbLNi9FTj66PFQpLla1/LzexBE=;
        b=Yq1+sx+sxFzeRL38/TCTutfq/yX6iyEyIMCCu2wfw33HjI58oAT+CQ00CeUGYvwyTH
         cKE8t4w/qndYnSDK5hrzuwiQ/DnjN5x66gVIg5Rmx4Hs0M0i4G2sTP7XY87OdbszqNpN
         Vlk2RCV2EEyRvBWgcI5xDo2jWs6M0dp1bDP8w0ZaGdOn9lPs1cPn3LN6WKCXfojq6Et9
         GzcmpACpeLrWI+tWkEl4RLINT+UlvvQdcvDCIVYJCuL2tu48RlUfRDmzFxvp4MrX/VYQ
         njha57ELO7YxVXRE/AEhWhzoOj78coPqd66Hk3DsiDYLYmILkSFSKcKvm5uEqgCQ8SFr
         ZSFg==
X-Forwarded-Encrypted: i=1; AJvYcCWpsRvAGks2CUUm2abw1d3QKFT9ddLwtRf1r0ceGJZMXcNPqa6/GUF3I5YS/w+GGpmuORoG0PQ7k8KwdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH2PvAZ6BXq8KzHdxUrSqJCkVFQKfeR/JURaoMXi5z7lf5Q+FN
	E74htKKZn5RS9hzWvnAiRl1xoLEkfCBQ9ANqyiYKvH69wlq+hZGhb0RCRNoqTBcS+xc=
X-Gm-Gg: ASbGncuElbo0KdAqjHZXSwULNlEl3Lmr0bCnLuVLBFDb+CRy11vO4y0Qnrjbdjk9SCF
	YFMeRIJwCCF++GWBoSN6LwxOQTC80nbfep5kkpHudpicpBwx43RORa4si31gkU9HFJ+aIOd3kiV
	o9obkMyZ3D6NI/uhcxZyQOAHnzF2yJW8I+Wo+kVa1hcBX8SwqPwXdBH3OFjw+JK98lDSYJ6yqYX
	MmIDFE6uZmpVTItz/ze4ZbLCJvBvU6LwOv7Y+MhwiScivRlpSmUW/sHjuTBCfW3sttWz0DOFl6Q
	rh+CcC2QKUgaAlODJethxEOTtG/PxlCdElMiCylxp90n/a6BECCP4w==
X-Google-Smtp-Source: AGHT+IFXXmQbzS5vqDGu4y4TwQnk0EiK4CC5C6meSlb8RPETRBYPhp8qkAqi3TzGPklrLZOBPgJ0mA==
X-Received: by 2002:a05:600c:64c6:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44b6d1d44aemr7930635e9.10.1747956379233;
        Thu, 22 May 2025 16:26:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:19 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:09 +0100
Subject: [PATCH v3 3/7] riscv: Add Control Transfer Records extension
 parsing
MIME-Version: 1.0
Message-Id: <20250523-b4-ctr_upstream_v3-v3-3-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=2624;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=gvU0uMFD6Kovn+U10/vBvR06A23qjRw3z0F47+AnYRQ=;
 b=pyfnCvhX86bz9z1y3qjxlNR2g5lGOH2Tq7LR0ghQj5QSvYJrDGwpQ/jbb4U4sW1BvShvZvEdX
 QqJA4YOOC0EDUOV9duD2meq3fYPM1ise96t5o6riam+ED3WjJWGTHfg
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_002622_551205_8A8D3A8B 
X-CRM114-Status: GOOD (  10.46  )
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
index fa5e01bcb990ec26a2681916be6f9b27262a0add..9b88dfd0e53c7070793ec71d363f8cd46ea43b92 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -105,6 +105,8 @@
 #define RISCV_ISA_EXT_SMCNTRPMF         96
 #define RISCV_ISA_EXT_SSCCFG            97
 #define RISCV_ISA_EXT_SMCDELEG          98
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
index f72552adb257681c35a9f94ad5bbf7165fb93945..7fcbde89e4b9ee55b30b27f5b93e33dbe8f9ce58 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -419,6 +419,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 				      riscv_ext_smcdeleg_validate),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
@@ -426,6 +427,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
