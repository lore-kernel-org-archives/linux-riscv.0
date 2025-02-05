Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9799EC02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwX+K0bVGyl31ZpK++KoqOwk5qgYS+I0aKk9rjCYJAg=; b=LB0MpPuiBfzsyK
	IdHNW1Nxm4Tj8eUGFbXTKOYpw5bNl1i6Y05YX7m+imTRtLzIs3b5RDzEnDR3qql1QfGB7g3t2ofgD
	/EVwB/4vVlfFV7GJQ8MGS7Zz7qQ9YJVR1z7GyyVYZZEczbVK5Ux0cFDBu+18C8F+iIJ3I/PQXmFGb
	bTeCEdPYjnYhQCjTSBAkb5shye6MemewXi/Tk+mR66nPvPgJgH9rLWyzduvSW+pu0bClHbcwaj7Jl
	3ONWUvZhj/DXBUmjmFkrK7hp5MocqBnmf0PgB7QNjMu+JI4ePnquEz50tq0r63AyqMmILDtb8Px45
	t90Bw7eQlrm4o3607R0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCy-00000004sSH-0zK4;
	Wed, 05 Feb 2025 23:53:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCw-00000004sR5-1LqP
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 23:53:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21f200014f1so5209065ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 15:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738799606; x=1739404406; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1PL+AmY5mHFGg/IU99VIHHI5DAW9vTLr5f5zPiV9UQ=;
        b=erIm4oOd3q8YdUGa5FGvX9BLAFS23D85YcslBPCfQHUpVAoZvShzcqltQs8oS4nUHL
         SziGvGG5yp+sR2eU/lDymzHuwdO+u47xxrl3uOfaJgwAszPjTybl1BySVK8dYDNQSZV5
         XMc49ScBXn0mf23//jpNKRgSkkWxRibDYgHNu4jXJrccXcn4iag1SmroArrorCCJ6zPC
         IJ93ISJM9lpt7+Wz5ziINhTNEvTmVQQiuLKUppu2BBNu3DiuoqLQaNsGaEouA7MFnBLo
         dASxomH2YIb+qwpQTs2nslfZjZFq4vCpK6WJMi3rksN4NyPj/UGxrRuU9Q1tiJL28fM/
         UpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799606; x=1739404406;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1PL+AmY5mHFGg/IU99VIHHI5DAW9vTLr5f5zPiV9UQ=;
        b=I+CYncuwibUaKkWu2HbCFaBBpfxPQoTbiviAHm5CBScPPtyYOu4Vh1R+zdkgOnWfmz
         9VN2OVRU46lE2jVjK4L1bh5Y1lWvpAdm7rwFR8q15p/oKkAX0cmn3+lsJP5C2xFBPLVB
         ZxdWCl0aa/cFlnjvKGdetNc5sMnP6LMEpH0hC03jvVCPwkRfF10RXa+QBZ0B79vB0lka
         QTQ4vCr8ut0NVLCXAjQuAokE2R0dRmbig6NzsglVIZ60NHhQhDue0KpEc5AugXgJGWl7
         aEJTuII8Zgl9zc4Idqv9WZPvKtL1RXyMrkW6AMvKe0/iwvAeLjW4qftWhJ5k2O9zO8f7
         4p5g==
X-Gm-Message-State: AOJu0Yz1j4IE/QR+7e3SMcZJi4D03N7+GzdrcRcuoc85RypXR8RtVqep
	hdKdx5ZjJrp7mn4V7n82z1jSjha6/en4CfJsbyPip81vWuS9N0F7vr36pickRf0=
X-Gm-Gg: ASbGncv58eJ8qETNus+hmj/55uyOy02aNx0aq7EPpD04hUYGLYgfNJl0C3bpvj8TrCn
	gTBP5gE1JTwk11VbuTRPV2GluFjPvxtCD02qEm7kGrQGDzq9wui4Wck/xs13hMcm+roon7E62JG
	4+VT/SzaCqTuLXYXL3DaQnALGRnlHkhZdpWjlsyQ8/HuyBSaS0l8he6o8LoesRBewI87whM+1Vu
	DywV7Frsn8BH/pH0+YKbEjub1KN8ub2i02k56GCzznPbOV4CdxvAu5AWTzk4kzfITXk4te19hUA
	Xr/RoHgeKC7fFA==
X-Google-Smtp-Source: AGHT+IG81bLjWjy7kaKNou5Hl7YmtI9XRY1vCuMJO7h6MJk1Tk7DwnQPMY9b8mxY5VP+gjCTjvRNbQ==
X-Received: by 2002:a17:902:d2d1:b0:216:31aa:12eb with SMTP id d9443c01a7336-21f17e2d94dmr88736695ad.31.1738799605845;
        Wed, 05 Feb 2025 15:53:25 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3320fc3sm119841125ad.251.2025.02.05.15.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 15:53:25 -0800 (PST)
Subject: [PATCH v2 2/2] RISC-V: Use BIT_ULL(x) instead of 1ULL << x
Date: Wed,  5 Feb 2025 12:40:27 -0800
Message-ID: <20250205204129.10639-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205204129.10639-1-palmer@rivosinc.com>
References: <20250205204129.10639-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: alex@ghiti.fr, Charlie Jenkins <charlie@rivosinc.com>, Mr.Bossman075@gmail.com,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_155326_358741_C8099DC0 
X-CRM114-Status: GOOD (  11.32  )
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

There were a few of these outside hwprobe, so I figured it was easier to
just clean them up too.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/csr.h       | 10 +++++-----
 arch/riscv/include/asm/kasan.h     |  2 +-
 tools/arch/riscv/include/asm/csr.h | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..181867da7fe3 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -221,15 +221,15 @@
 
 /* Smstateen bits */
 #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
-#define SMSTATEEN0_AIA_IMSIC		(_ULL(1) << SMSTATEEN0_AIA_IMSIC_SHIFT)
+#define SMSTATEEN0_AIA_IMSIC		BIT_ULL(SMSTATEEN0_AIA_IMSIC_SHIFT)
 #define SMSTATEEN0_AIA_SHIFT		59
-#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
+#define SMSTATEEN0_AIA			BIT_ULL(SMSTATEEN0_AIA_SHIFT)
 #define SMSTATEEN0_AIA_ISEL_SHIFT	60
-#define SMSTATEEN0_AIA_ISEL		(_ULL(1) << SMSTATEEN0_AIA_ISEL_SHIFT)
+#define SMSTATEEN0_AIA_ISEL		BIT_ULL(SMSTATEEN0_AIA_ISEL_SHIFT)
 #define SMSTATEEN0_HSENVCFG_SHIFT	62
-#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
+#define SMSTATEEN0_HSENVCFG		BIT_ULL(SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
-#define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+#define SMSTATEEN0_SSTATEEN0		BIT_ULL(SMSTATEEN0_SSTATEEN0_SHIFT)
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index e6a0071bdb56..70660f431f8f 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -25,7 +25,7 @@
  */
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
-#define KASAN_SHADOW_SIZE	(UL(1) << ((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
+#define KASAN_SHADOW_SIZE	BIT_ULL((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT)
 /*
  * Depending on the size of the virtual address space, the region may not be
  * aligned on PGDIR_SIZE, so force its alignment to ease its population.
diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
index 0dfc09254f99..902d607c282e 100644
--- a/tools/arch/riscv/include/asm/csr.h
+++ b/tools/arch/riscv/include/asm/csr.h
@@ -203,16 +203,16 @@
 #define ENVCFG_FIOM			_AC(0x1, UL)
 
 /* Smstateen bits */
-#define SMSTATEEN0_AIA_IMSIC_SHIFT	58
-#define SMSTATEEN0_AIA_IMSIC		(_ULL(1) << SMSTATEEN0_AIA_IMSIC_SHIFT)
-#define SMSTATEEN0_AIA_SHIFT		59
-#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
-#define SMSTATEEN0_AIA_ISEL_SHIFT	60
-#define SMSTATEEN0_AIA_ISEL		(_ULL(1) << SMSTATEEN0_AIA_ISEL_SHIFT)
-#define SMSTATEEN0_HSENVCFG_SHIFT	62
-#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
-#define SMSTATEEN0_SSTATEEN0_SHIFT	63
-#define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+#define SMSTATEEN0_AIA_IMSIC_SHIFT	BIT_ULL(58)
+#define SMSTATEEN0_AIA_IMSIC		BIT_ULL(SMSTATEEN0_AIA_IMSIC_SHIFT)
+#define SMSTATEEN0_AIA_SHIFT		BIT_ULL(59)
+#define SMSTATEEN0_AIA			BIT_ULL(SMSTATEEN0_AIA_SHIFT)
+#define SMSTATEEN0_AIA_ISEL_SHIFT	BIT_ULL(60)
+#define SMSTATEEN0_AIA_ISEL		BIT_ULL(SMSTATEEN0_AIA_ISEL_SHIFT)
+#define SMSTATEEN0_HSENVCFG_SHIFT	BIT_ULL(62)
+#define SMSTATEEN0_HSENVCFG		BIT_ULL(SMSTATEEN0_HSENVCFG_SHIFT)
+#define SMSTATEEN0_SSTATEEN0_SHIFT	BIT_ULL(63)
+#define SMSTATEEN0_SSTATEEN0		BIT_ULL(SMSTATEEN0_SSTATEEN0_SHIFT)
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
