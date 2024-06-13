Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4219C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pkp0N0MH/5c/Lvv2g55XwSj1W25Z44P/yVAh5FvhfeI=; b=PSYd48tnVFVOgr
	tum6D951rkhGf1BEo1N3+hXG6yOKSF4CR0mRZKYOrTwRivlcNRW2ZkqeOzhgr4lX3NRoBzAAdkw+W
	kLZAHhiHHOL1IF1F02YLyuCvhissw4eKr3uQZ8jRyBi3ZeKI5WCAQ8SEvAJR3D32kQYZSfsd2fvzG
	4xw8dnuXp1nmn9cIByQFuVoLwAxN91OdUIuzBI3uHuVK9V0qiR458beW8cI/Dz6z7g/C17sXIk9l1
	O/fOc8SLgmdbcJc1hUYDIcJGMeEzFMJzoOdq/eqHkgTO9V6QNEQHDERd3F52COZ+NVFB7QhRvpbsU
	4o0VMrdQ39YSKAzQsTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexA-0000000FUUx-1vzz;
	Thu, 13 Jun 2024 07:33:00 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHex7-0000000FUS7-1ShA
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:32:59 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5ba1f60eb96so431525eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263976; x=1718868776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTElu2O7G4IRv2D6Es7gQcAecPf3onDHBKt+B4ik+4k=;
        b=TAxB7fERls9EH3uA55bIclufMClBa0KccTjd4lD4EnknIRn0W4BVFOTfgiWLWcxJui
         DLpkqxNAeTyRB+G50UhZFKYRe6KkSBfCtzlOcjEUWLY4L9d1d+0snN0UmBxsU68WAoAG
         WLjh6Gwo8bM26CxLo2Oc94YawL2pLfGg8hYwSjVbzbzYId9fvrf/qseNAcsXWBjo7wvb
         K8kyTl6XtrrkdKjCZSttxepBufx9elPo63RaK1PdNnHiyZMh+8c7alXWu0/NU/4IYAID
         Kbv1xYqE3wyBW4YksIJVH0QWL8lg1pCdHrgOZ0cVh16e8b0GhjsapbBPLLN/Rzntlj/h
         HwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263976; x=1718868776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTElu2O7G4IRv2D6Es7gQcAecPf3onDHBKt+B4ik+4k=;
        b=OYYZ0dcFbbEDlmxwgef0jLLoTM3bG+LHznvee6huHYuCSkWNzrvY6W9x7XLyWN+Hnc
         jlZrs1vpxB9cJc5UmldMLZ1r53jc1goeKCVYPUQRoG3JSLrGMraOYwbHmUYIG07MOPJ3
         HoM8GYQKO1VJ4sbNVHDxflRJayo59zA6Z9NZtV1yhW5q6XIU2iWUQnTAXfX+upVGtv8x
         0pmyG5i+M32OzsKXW9rAee+XTyGxNQCfWVVSgfytX+/Is9Wx77Tal/ii/AI4szvlipO7
         4lOEKjiBvC962a9pMv0qNdiYUVBG00xEN+OQvNfsuntDhJ0/PJfw58aW1akoqENrR0/9
         TL2w==
X-Forwarded-Encrypted: i=1; AJvYcCVa695R0hOk1lqmdzWhncnPfusuDAexG9XhUoC+WQi5yzP0A6J/Gojpg0d2hI1lym+HfGDmJqBfnNRxCs1iwALvHyrTbRB38VGrWhDBf+XN
X-Gm-Message-State: AOJu0YxFx2b0YNGyovqlDNkSnbcUPElxjHIumoV+14CAnGdFiV39Ig9x
	79AT9pqcYuF9fxEfbJi8JPvklNYnbREFfY1LKKVisBgFgCFvW9nnu8R5hSKlIhiprwkGcEMM5qy
	T
X-Google-Smtp-Source: AGHT+IGdJsIqWxldlAuacUU8l0dK4I8dOhgAshBKtsVS5QR/psuALrZ1MwA3KVg0EXK2RXnVq6OGZQ==
X-Received: by 2002:a05:6870:c087:b0:254:a9bd:70b2 with SMTP id 586e51a60fabf-2551501e0bfmr4485943fac.59.1718263975852;
        Thu, 13 Jun 2024 00:32:55 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:55 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:09 +0800
Subject: [PATCH 4/8] riscv: ftrace: align patchable functions to 4 Byte
 boundary
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003257_427128_573777D0 
X-CRM114-Status: GOOD (  11.96  )
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

We are changing ftrace code patching in order to remove dependency from
stop_machine() and enable kernel preemption. This requires us to align
functions entry at a 4-B align address.

However, -falign-functions on older versions of GCC alone was not strong
enoungh to align all functions. In fact, cold functions are not aligned
after turning on optimizations. We consider this is a bug in GCC and
turn off guess-branch-probility as a workaround to align all functions.

GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345

The option -fmin-function-alignment is able to align all functions
properly on newer versions of gcc. So, we add a cc-option to test if
the toolchain supports it.

Suggested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig  | 1 +
 arch/riscv/Makefile | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b94176e25be1..80b8d48e1e46 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -203,6 +203,7 @@ config CLANG_SUPPORTS_DYNAMIC_FTRACE
 config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
+	depends on $(cc-option,-fmin-function-alignment=4) || !RISCV_ISA_C
 
 config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 06de9d365088..74628ad8dcf8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -14,8 +14,13 @@ endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux += --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+ifeq ($(CONFIG_CC_IS_CLANG),y)
+	cflags_ftrace_align := -falign-functions=4
+else
+	cflags_ftrace_align := -fmin-function-alignment=4
+endif
 ifeq ($(CONFIG_RISCV_ISA_C),y)
-	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=4 $(cflags_ftrace_align)
 else
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=2
 endif

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
