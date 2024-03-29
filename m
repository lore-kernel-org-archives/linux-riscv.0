Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E70FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7e/sCRqO1o7nHlWZbTPMKJNSuuWMaCrgdv4s5Vxldk=; b=ICYqYjPUbE8lkI
	pBFqE45yUn3EenEh45nSRug94y1SMHF4+tf48oPcKCr3oa4lhrdERZpXRSvHpJlwRG2e9HuvoBILa
	ivQo1sL28a2iNInYY4SWHPJSsY8/mP4c3t6N4kjoZGIb2aw0ZdjUdz9X2fFLVsLdbs6riQCS17uvD
	d21AGIFHIH1E1XP/8FaU2t1Ypl7569gFp41Ev3hpZ4NVX/wdKXKExOs/HzAd/lMbqunjHTuKeHu8G
	dWpDbZ7PdhIFkf8+opMdPoiBqGgdwbs0K4Eq2Z1ZN+kuaSrS3lhL9Y50s9sCa0yYftqcx05JABWSX
	5LSdxtsU33cZ9sNlp8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6cB-0000000H8zZ-0Tvc;
	Fri, 29 Mar 2024 07:25:27 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6ba-0000000H8ZD-46Rl
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:24:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dca1efad59so1224908a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697090; x=1712301890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPRyZsExaX9jqH4yhl7xuz7hAOg3yG/uDoq2R6sqbZQ=;
        b=JRriq9lyYNURzcZp8Cz2N/1opAsIAQv8Fa/po6rVNtPiOyDnGtMwt4/ZXshtDDcUC4
         FWRE8iu9GaTnLiqZB9BFc1XFaSgo4vec2niyEhk3Ysxfe0BPGrCJZ9/9zfZYbZKAS74p
         uBy45MzMC2qziD69hke2bmTCjSjtWGA0zbmcRb4VfrwGv8sUEx62o1JpO4U6ZKj+YQid
         VSVrvzmsDIMGo4ajP9xtnIe99fGuhI4ly7EaKzkDsBdQsQZedTnSpFFa4Yj1kus8x9a8
         7ziOoFZevjyOfzW0IvFrZJO17To/WA9jBdtJsdsrVJFkJWmXmX9CAEhMtvyCNxkLeeNb
         zBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697090; x=1712301890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPRyZsExaX9jqH4yhl7xuz7hAOg3yG/uDoq2R6sqbZQ=;
        b=mI9QuzfplqsPThglB5ftnu2G6lFRrityGZp8sEnZn9u9p/YLGGaw1S/Qkh0gR7hWJR
         AwBGWMJ+jdrUhd6N2MiH7e4svB49ZzxAchLRJqe7LmNHn+X93ywPXPofYXIlNcaAL6i6
         jlRFQZt/UxziZnrD9VBDlX4SEjV6Ss6rK60oO/aNwd3LoJAyJcZu4QaeDczjQNewch3Z
         JYAGD/sKRe7ToAldbUAmULSqaLtSmcn0ItjrndkAZ7kNQ8v6CVV+AYxZFbmQsgpuihhE
         +DXdybu+vtWdnhNLeH/wnq+AT9yPygIZ1DNx1bCPXIow9X28uhSDiEEuiaMBnaJhRT7J
         EdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEezQoi24SA1b0tNVF4yVscxp5RBHMlTg02a9GUXUPT/vaYrqZB+bCd43wVeJrEY8hEegSQvo+lTqeRu/X1VkguhMHvtqCU2394WxY/UZs
X-Gm-Message-State: AOJu0Yz6imEAX+ijutF69CWd7L+As52Vub1lezvl5aBkZNSshEHHc7RY
	7FnbbWfPnyulF2mBYyGGz/l0e1WE80ceqmrzx940JiJrkvrAHl5BFioncU6ZHA4=
X-Google-Smtp-Source: AGHT+IGTP4+TuVjePLHUufBWyrdagoR69ieuL91+Fm218jTRMOa2nDQVrtkL7zzrGfUrh4aL4xmRCg==
X-Received: by 2002:a05:6a20:2db:b0:1a3:71f7:df3d with SMTP id 27-20020a056a2002db00b001a371f7df3dmr1114388pzb.30.1711697089806;
        Fri, 29 Mar 2024 00:24:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:49 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 05/15] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:20 -0700
Message-ID: <20240329072441.591471-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_002451_217896_739D61F7 
X-CRM114-Status: GOOD (  10.40  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/arm64/lib/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 29490be2546b..13e6a2829116 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -7,10 +7,8 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
 obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
-CFLAGS_REMOVE_xor-neon.o	+= -mgeneral-regs-only
-CFLAGS_xor-neon.o		+= -ffreestanding
-# Enable <arm_neon.h>
-CFLAGS_xor-neon.o		+= -isystem $(shell $(CC) -print-file-name=include)
+CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
