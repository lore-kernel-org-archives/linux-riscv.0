Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A6C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w946HGvqLOz7OZqKYkb87+wOLHqw/Ws5iFPgoUJyKZc=; b=Xv5CzQUrRr8oPX
	NWhH4t5+yGV1rlTugbz9JzHSZpFsOrBWbF45M7rCGXT4S+AXqMjzLXRtoima3QcwO06dcRxM8RdPF
	e6mvZr86B/mO7oY2wCD5DVAE5FrZra8bysqbktcc98deS2PjLbCf46DFYYbXhHNWkFy/rHurE2Umy
	89+wJXfVCyPHqE2Y+aKgLJSBkfOPqdsVrWNA1W2RwOZFNuUN9n+BuOuA+UAGs2zheIKUgy+QJ631R
	7bKhSldoPwm3hWNuCc21s0tCwG6Oh2OZNCrKhBwxYwOFpJ+CdnjB26T/r7bDyLcWgvaH8DI6qYieA
	TcmTsVBO8uaHt4orUAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZUf-0000000Autw-0njm;
	Wed, 27 Mar 2024 20:03:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTV-0000000Au8D-3K97
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=; b=YE2vBlKtmFYLpE9mj3cgkq25YH
	OIcMQutXaaG+Lj9CDaUybxH8KiXyLfz15R8bJQhClkatZodqjsT/C2uP/Vj5qs0QQZRpui8ua8Xx5
	uMy2sGnc1Rhozc8+v20h3MjTKPBssra+VaxiwmMgc9Ds2KOIBGC1cOf55sezHU2E03pSbiTCgNZ3+
	dv1TB3TjFaL/4s0EXtLKv0LRyXkp78v8z61msmEdcBcgM5Uz7KGPDodIiO0VMw4M62rtMCdZwJYE0
	MSs1LcpNk5+zybpe1SB4f5PRPP3bVIGRp6aikatDXZrWv6beq8OCuPA9QT9fpvzQ8xmR44K4/x7do
	/8c77x/Q==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTO-00000000WqJ-2LmT
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e0d82d441bso2011095ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569728; x=1712174528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=;
        b=mkJJ0zMFHXHExZvekjH1i42sskThHkJ3vL+VGkbw6mdhRrKjgy74AvPCM338enDNRk
         MTCDzOnlxQtWVQWktqkx4GtlAF1/dh4j8hqCOQTqB8zall8YYO7eLByxDP3TRLxwbIM3
         Jhy67pQsU40Y6ZC7mSLqvqaW4InyipEwQmBJwBsIaorcrbMeVbMeGFYH9InmfbSPY5wA
         zEiArvcXpGakHwPACrOp8wNj6Omx+8ZxMX9bGHGuPjUMngHDwzgdTncUxUSSwMZCuqqc
         a0LZLmHvFJkuatUyEm2umzCWCp6cUMXfGEnoH1DOZRgHrJ6rGl/TF63gB134kOOZBDWL
         KdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569728; x=1712174528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=;
        b=St1PsOyKBW0j/vcoieWMwhAwuNi+dVdoYcda7frl1hBvQdCXvhba7u9Q7a1Mrb1Wbx
         GYbPucSlMcevVEwiAfctznVjZFTxFHNleKEZL4WEGQt4t2k8hqIITk60n05hkazi8Z1O
         jMR8V9sc3LoDpH2ggGoNtdOEUOAlUSp2wqNazdf57fdKXdQ3kiqFMHugp04UxhzlEupN
         Ce1l7Nq0XygN+3wBmmXNMyCSt+Kr8G7tyLHT5TJehnd2XEmlwXcG+NWuJkEjoV8+Gdw4
         2nUF6iI+6+mLHHXJgCEMvR0sCxienhdAEZp5R4WqI37FAicwF4rk3xEBSEGdvzzSUkGk
         3DLA==
X-Forwarded-Encrypted: i=1; AJvYcCUq4sC/1CqafIAOsl8TDr/ORX3g9bsuhBllpzI4fyP1waD3DSUJkr1MtJR112oBMaUwUqjDYUo7KQpYSTL/P31/VZanYCmUpKugIDtTjusC
X-Gm-Message-State: AOJu0Yx7Q2v6O3gHhyyl7ePtTUHb/jjHcEyjpBJbcSS6OWBJkMAB2KNu
	eAL5Uo48VMckUL2Bj++Tlac6705uF/rC0tSDRhuxD9OmVRiPKI80bVDaeKNw+XU=
X-Google-Smtp-Source: AGHT+IGM9v2q1Bg0jHlsJFItc73WPBzqi9soPcoc57OB2ZggdclEbNRISa4ohk9keY4487ms+Vhuaw==
X-Received: by 2002:a17:902:d4d0:b0:1de:fbc2:99f0 with SMTP id o16-20020a170902d4d000b001defbc299f0mr957547plg.2.1711569728307;
        Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:07 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:38 -0700
Message-ID: <20240327200157.1097089-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200213_007814_FE143A92 
X-CRM114-Status: GOOD (  12.28  )
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

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Rebase on v6.9-rc1

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..2266c6c41c38 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -18,6 +18,7 @@ config LOONGARCH
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index df6caf79537a..efb5440a43ec 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -26,6 +26,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_UNWINDER_ORC
 orc_hash_h := arch/$(SRCARCH)/include/generated/asm/orc_hash.h
 orc_hash_sh := $(srctree)/scripts/orc_hash.sh
@@ -59,7 +62,7 @@ ld-emul			= $(64bit-emul)
 cflags-y		+= -mabi=lp64s
 endif
 
-cflags-y			+= -pipe -msoft-float
+cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
 LDFLAGS_vmlinux			+= -static -n -nostdlib
 
 # When the assembler supports explicit relocation hint, we must use it.
diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index c2d8962fda00..3177674228f8 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -21,6 +21,7 @@
 
 struct sigcontext;
 
+#define kernel_fpu_available() cpu_has_fpu
 extern void kernel_fpu_begin(void);
 extern void kernel_fpu_end(void);
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
