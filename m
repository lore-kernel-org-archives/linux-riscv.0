Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B37C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VU6t970ZcqIz89p38kwlMsrYeewMYMLILe/4svVSu4o=; b=SsqLANT6UvWD5E
	D65yFlPD+GGy8lWRc9+7qYebM09D0Q6LwW6B7ZH9nGR9fCsrJ1TrofSjx+RBjkpNhIittoUhEVo1m
	jsap1BKTc2wlxSqZOqq6e/I3fNrb//TWoo11457PTOXgA8CGRPsJXAIGgV3eMx/7UadCFbu0wLnza
	OUAdLpH3kYHIEiTCQNuPc3bQa7MS1OEbtld2nCsWKCzG619Ks3XOOIiiZgXVqSCgY+9TGh+zNLNOL
	45KP2IStIv2LRRnUrnvjFol/ZsO4DN3mIJG6qXcGYyUxzBwdl4dPumJCDRqfrbFrK7OOy8dUpATyx
	Ev43FiseUBR4X4um2OTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHue-0000000AxYU-1iCl;
	Thu, 06 Jun 2024 18:32:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFHua-0000000AxXi-4AUQ
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 18:32:34 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-702508bf0a9so1084297b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717698752; x=1718303552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHQ4xY0/ZycwaDFTeaCf9+bM8HlQPdbfiT+ZJ9McmuU=;
        b=sCouGduc/wmGvN5y6nPMihMnwRJKkLsdxU3x3VNyb9aZDDWdTyj31kWqbdGHsa7Lj3
         BlGloqpOH7RF6VfvKTg/VT2dczRomiXkt8Sot41xAeUEDB5BKLln3i1Btk0InHrJJvjj
         MpWyrA0roSYzqtrKwg/59Tz86Ws5ORAlBH0+RipKt4LBos7oOAv5I4cdrEI2OMBUbZ0Y
         p11cxNIPTlbR6pQFdYd5eZTma1ddfDkqSUY8DhJf9NNyYIxsVGETEVO3sPFsCbVAJHIe
         b3ei883Fm/Ha2/2CKUza75kwtYiLaZbWBOyagLRBwMAaSkW2M4ygCEeQ1Um5lHXOTni0
         usQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717698752; x=1718303552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHQ4xY0/ZycwaDFTeaCf9+bM8HlQPdbfiT+ZJ9McmuU=;
        b=gifaaUjh8GbvVa4bN9x3WA+TGZ4vTRHpQED60Dy/EL35QSAvWOFF4nCKrV8Xp4AVMJ
         AW+9jTFG8+QqYTZKMhq9/2MfVGfy9XLliwWKqQa6EkJ4xsYhVG2YUpMSDlaupaIBAYNx
         ANJNz1amqvXr3KEdEV+J9Rbx8FvVcfKCnQKrYQBWLmvqjJpmF9G34C6faJLqdxEb5Rk9
         s6UQpHIBYRvqcQzUuB+RC310QByh0zogC9x1UtB9uRN6qB/gcIREe1htSl2qHVVyB9xo
         EGrNnoCCk1UOvjJA986fWhsuIDFizoLEiCAxK+PNn5Kj5X7Ae0PFMI566iN1fk70e8lX
         tkXA==
X-Gm-Message-State: AOJu0YwsagaWdpHLbCIb8d6ezwSEGzSSnuizNL3nS/JoK2zAq/fq1URq
	OOlQjDUexYorKBXAUA7qBdI3eJR+w5Jh8klTBzRAOfjMnbCLdHAfwTp6DlHUtx4knXYJ6lK8wzJ
	jzIM=
X-Google-Smtp-Source: AGHT+IE7uVUmqhwWIRRmVbjMZN707tZ0ufiL2FY4wEF2ttUqm8YDlay8qBTPoUJh4t9AHRrtXZ/ztA==
X-Received: by 2002:a05:6a00:9aa:b0:702:5a22:3ccc with SMTP id d2e1a72fcca58-7040c749549mr201330b3a.33.1717698751529;
        Thu, 06 Jun 2024 11:32:31 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd50f0c6sm1378400b3a.191.2024.06.06.11.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 11:32:31 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] RISC-V: Add Zicclsm to cpufeature and hwprobe
Date: Thu,  6 Jun 2024 14:32:13 -0400
Message-ID: <20240606183215.416829-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_113233_055567_C1C977E6 
X-CRM114-Status: GOOD (  15.39  )
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

> Zicclsm Misaligned loads and stores to main memory regions with both
> the cacheability and coherence PMAs must be supported.
> Note:
> This introduces a new extension name for this feature.
> This requires misaligned support for all regular load and store
> instructions (including scalar and vector) but not AMOs or other
> specialized forms of memory access. Even though mandated, misaligned
> loads and stores might execute extremely slowly. Standard software
> distributions should assume their existence only for correctness,
> not for performance.

Detecing zicclsm allows the kernel to report if the
hardware supports misaligned accesses even if support wasn't probed.

This is useful for usermode to know if vector misaligned accesses are
supported.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..8c0d0b555a8e 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZICCLSM		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 2902f68dc913..060212331a03 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 36)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..863c708f2f2e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -305,6 +305,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8cae41a502dd..b286b73e763e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -125,6 +125,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZVKT);
 			EXT_KEY(ZVFH);
 			EXT_KEY(ZVFHMIN);
+			EXT_KEY(ZICCLSM);
 		}
 
 		if (has_fpu()) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
