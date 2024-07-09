Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C50C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTxmy5P540baTVo6bxLHnmR5KiMgxxMs7/4kUp3hloM=; b=Jn4XLPnRphiPwg
	Xz7SITGKmrOeWwDR4ratof3/mXi8kql2h/cZbaFVxmtkDBmzF9aWXarAhfeiEHYRcOU/jpCCB5CfR
	LUF8V2xQVuhOTzBVa0qEMyWQQmhs8rEKIEWR/OpEzRjMObLnq2pYNg8zRG35b1XA982mKT0tEhpzl
	zi3gItfxWYUmLtBGCSdDj9lW8z7GWn+YXBiSWf55z5OTeOaq5b+wcumLXICzGmoztjBzcYpQ57U8w
	+pxsLMUH4wFT6+udQP+n2cWsWYFtA3qoAHCPowtOL39eaXJFvX9bAhRmQ44KcMU1PDJhOU5VuDXMv
	dzSjKbTzbew/f7Pc2xaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoZ-00000008CGG-2FBr;
	Tue, 09 Jul 2024 17:39:43 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoX-00000008CF3-2efg
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 17:39:43 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-79f18509e76so91345685a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546780; x=1721151580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIkiZ+EC0cy3qQspr3kP3SqSJopsA9NQAjKMM+c2r1A=;
        b=3Us7Bfs9qBKJ7m+NxMpJZtDo+aL5/gxAHHOO5e+wT5c+uyHzsrRrQU/ab9/lpqmjGC
         TFxS4CXhvDCA+gQtnH/9eIbOdjBNqlu61F7rf45i6Ju2SquXHQj7C4WPyHQaiyUOlHC3
         iYNaVJ8ndjrnWZQ3MWq8IyqMWlDJpk2bJZdk8C+TkT2/hLBRNyZLMFxx9WZPERh60pei
         rV0g47aSFZYkDHK/Wk5ZbNJrKBl4lkxGhQ+2w86tUntWYsaRuFkC+EWJC2IPTki0dzMf
         NDfrXzpGfP0iEOonmgBB3aaf8/Av695bwZWPfrCDdGrHjSF4P3uqR9XH8+e7ym5O4hz1
         Qu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546780; x=1721151580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIkiZ+EC0cy3qQspr3kP3SqSJopsA9NQAjKMM+c2r1A=;
        b=MDSYdP5dFCQQm3Ez3RzSCtg+0BixoGGMyLt2mDpwX3XcF9reX/PGmTcklMQYB+EhH7
         3tqPIImSt/AdNrZ9fNmhydwX8F2QUMP1ji5k/krGQEDl2LhyH6OjxnjDm6p4/X+g63Un
         Bx8/PNs0SMxayYq4UvT/APw2jpvwGjvZ3JHXSnM2EHcnXBU//URQiWfSBOFLVjCpafun
         uzUMey5WuVhYnHToYv8hx9v4HlDLTy+7Ru1FPMkW3B3f6SxviIzoL1ZzSPnO8Bk0nosH
         5dobjestf7ZagorjP3pBYHxeV6bAFHDXHR66Cd7Z4glaSL5Qu/d9C1nVZRcggaJ/b9cN
         qJBg==
X-Gm-Message-State: AOJu0YwLLTKy/GgAP6UUsLVy99utoUPeI6CKi+KaN/gotlbej025gr0b
	NB+xQ/yXRcNaQGZaaOvxzi8vLTAPlVla44T5aJODjPMWLmlulLuV2VgvZcmKTSH5DIbCM7tofC+
	x
X-Google-Smtp-Source: AGHT+IFqf9MGCcfZzUZn5e2OPi31BYIsZtdOvyOYSAfI80AmjeHPmXW5Hh4FPbdEJB+RjrwEI5CSIg==
X-Received: by 2002:ae9:e017:0:b0:79c:f0e:f7ac with SMTP id af79cd13be357-79f19a1f8a5mr329303185a.28.1720546779837;
        Tue, 09 Jul 2024 10:39:39 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:39 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 1/4] RISC-V: pi: Force hidden visibility for all symbol references
Date: Tue,  9 Jul 2024 13:39:34 -0400
Message-ID: <20240709173937.510084-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
References: <20240709173937.510084-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_103941_735387_6FE1CA4D 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

Eliminate all GOT entries in the .pi section, by forcing hidden
visibility for all symbol references, which informs the compiler that
such references will be resolved at link time without the need for
allocating GOT entries.

Include linux/hidden.h in Makefile, like arm64, for the
hidden visibility attribute.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
---
 arch/riscv/kernel/pi/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..1ef7584be0c3 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -5,6 +5,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
 		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+		   -include $(srctree)/include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
