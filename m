Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D8C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALan0h8mXwKFp3UrP0EnBS+UJ8nDwmkKLDrF+nWW0CM=; b=YN3KztqEyIUXeS
	kQHrJLIoC+NFrWtjWhns2/SHTTGEVdzskPh8XMIijuA6CSpamBN2aAL27ai6WvAjsgqG4GBXbieVO
	eoLgeUgGQlneiwAaZiwoOWgOeoRCCGrtyqcjR53G8SLo+y2cIdu0AQciPw7SFBpgzWbvdHibbObo7
	18mXdbwjis8ll236jAAX8zt+mzUX/pK7ybQHdPeXs//L1iI89iM7sT+hcXQmngl/DazOpITqa3TUP
	VtMlZz/8ge42hCuoJrAULJnv3F3i4AjAQmDJ90dlbA3Sgwkor0wPEeo9wjfEP0ht+REkQMqPQB2kV
	zdQ6D6uHt40qMY9+OGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEZ-006kqN-2e;
	Thu, 25 Jan 2024 06:29:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEX-006ko0-3B
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dAejTXU0ubiQ5glx+ACfMnILZ3BSyMGr/22gR94zPLU=; b=eUEqYx+TyneLfxHEwnVTgG7Wnk
	1AvLdqmzEgJBtbJz5TXOy+eOuXRjudv8yIk8tgccuyUolfHoEEOz+y13cpiK6/CA94yWnQCT7JJH1
	waIVJGtjLbMyfWN6ejYPJBMjNlt+JNY6E6c5SbGvFkWt5+V3HPBRhctcwHRFQuHltHYwYYMCm7OSn
	SMYSGBOUlJEnn7FZZWAUuMY1+xVae5BRVlLoAoHywANVPbf3IEdkfpx9j4uUPLtXj3Wcg+DMY21mR
	gkcYf+zftmXyBiS2XKTKyFIG2Lan0nuNw9ekK9xOgt35mwp5pE/EQ3myadNhbhUrFaOIkU1TEj6Kw
	89/MvyHA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStEM-00000004wSt-15bA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6da9c834646so6323781b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164127; x=1706768927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAejTXU0ubiQ5glx+ACfMnILZ3BSyMGr/22gR94zPLU=;
        b=HjSJYlLx25ZdwZgC1r8bWImjFumIG7j53dyVuRYkpNc9L86VN+gUykKGiOJ8oI/SQA
         nvp16qzw4vz2LBTUZ8a/jge25oYHetzzJvcDRoZ9dXBJqJGuGwu5C2XDY8pv4+5wJ2+O
         yu2hZ/n/GNcWi3/16d422SBiOSMMMI76q5NbEpVxZADg/9YmV0SI/vRhYVlpyFhjhoCK
         ZnhuLac5IVUFt3hghLGHt04wsypQFgcWQOMO8W1l5mrMn9ietodfHJKGjAm8ZGIFRkJ9
         oR8++4i19nWjTUTfaU+/+A6qoJ/nJf6Xmvf+rcidp1i5Tv+jMNNefLc6YBtx01UU3jBt
         waWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164127; x=1706768927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAejTXU0ubiQ5glx+ACfMnILZ3BSyMGr/22gR94zPLU=;
        b=rgICgvpuPoxvZH4eOjnYt4h7rFhz/HZdF8CGLtkjHMi+AjFDKAoqG+mQ5Mf2bbw5L8
         Vqd/RlWkykwRxL0dyX9pJcYATyB4KRAQtI82wOlW7t8P1N00kGrAF2Q6C29jmvN8iRiS
         nr5AAl8Go7by1EgsJzBW/xPkpR9YmTZWpNbgX1Q6o9rHE2G8n4Yg7WDNUXZfTdNdUxP4
         /HeRr0twjkO3PQDbv0Fb5pEEQB0BXeJlTW/hGn0BFiSAmoUBL1PWE11fl7rq4Vrb/vYL
         PlY9fmutNzPYAmuab/I4yA93OkfcsYON5YH3HdireHfQjOTa94xAl8rFAtty3aoUGThB
         c4PQ==
X-Gm-Message-State: AOJu0Yz42UcFxPZl4SJdQs8Hk/bSUrwPb2yBObJJbBEuEwiL3ppC17Ko
	nclm1S/JrQJncYTT05aVVB+R6Hzc2gysYQHJeeiQfXOB7KcgOXRZkzyQqgGQ0Ms=
X-Google-Smtp-Source: AGHT+IFqFfG67XTDjoNiouy/3B041dutuvZL3hrVwMOIb2sdzt40BlsHHzBmvSINS1AroXPOL+Y8dw==
X-Received: by 2002:a05:6a20:1447:b0:19a:2e13:667a with SMTP id a7-20020a056a20144700b0019a2e13667amr750598pzi.5.1706164127531;
        Wed, 24 Jan 2024 22:28:47 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:47 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 05/28] riscv: zicfiss/zicfilp enumeration
Date: Wed, 24 Jan 2024 22:21:30 -0800
Message-ID: <20240125062739.1339782-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_062857_522076_FDB9D02A 
X-CRM114-Status: GOOD (  10.96  )
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

From: Deepak Gupta <debug@rivosinc.com>

This patch adds support for detecting zicfiss and zicfilp. zicfiss and zicfilp
stands for unprivleged integer spec extension for shadow stack and branch
tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy lights
up bit in cpu feature bitmap. Furthermore this patch adds detection utility
functions to return whether shadow stack or landing pads are supported by
cpu.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 18 ++++++++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/kernel/cpufeature.c      |  2 ++
 4 files changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index a418c3112cd6..216190731c55 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -133,4 +133,22 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+#ifdef CONFIG_RISCV_USER_CFI
+	return riscv_isa_extension_available(NULL, ZICFISS);
+#else
+	return false;
+#endif
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+#ifdef CONFIG_RISCV_USER_CFI
+	return riscv_isa_extension_available(NULL, ZICFILP);
+#else
+	return false;
+#endif
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 06d30526ef3b..918165cfb4fa 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,6 +57,8 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
 #define RISCV_ISA_EXT_ZICOND		44
+#define RISCV_ISA_EXT_ZICFISS	45
+#define RISCV_ISA_EXT_ZICFILP	46
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..ee2f51787ff8 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,7 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 98623393fd1f..16624bc9a46b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -185,6 +185,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(zicfiss, RISCV_ISA_EXT_ZICFISS),
+	__RISCV_ISA_EXT_DATA(zicfilp, RISCV_ISA_EXT_ZICFILP),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
