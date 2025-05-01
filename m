Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D9CC369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q20DsyKGJhev8GZnTfKHAkw0pn63w99OU+y/UYMfa2E=; b=a0vzn9HM1CF5y8
	CdtB234+F2STq/PHrn3Ko3SwdqvGCFLe3UJbKk4Ui9YJxh7cv+/5zUrERDB4oTS6QU+RTIHBXaqZx
	rk9aIaidzRxBo6b3w+o5qRc1Wju9ZfYnTMWWjNxgLo0kX9XfFFSz7VucpLAk0lq20r3sqRxVvRC3o
	1eKxevJAkm+ad86RHMcqzFdez1pq6UuJcwAGXiidIKCeSQzAywetRe7PgTmzsNjPjBEnBGZZjnHPc
	aPMjP7hlvnvhXBTPv1MAOTpCDWmNzUoHKUuRf8cLX4HZbTEjWwZQtdas0pei/gLtpMuZIhylP5oKU
	CqWHMojGDLq0aahC2Qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAY0c-0000000GJrx-0uAc;
	Thu, 01 May 2025 17:47:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAY0D-0000000GJpP-3Wfz
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 17:47:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22928d629faso12790235ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746121637; x=1746726437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JgrpjyIVurw8ZnhExu0OpjTLOaTTcXOTASTKpgw31Y=;
        b=LpUFoSCOIghEjqoTiW2ragiVg4IgUlwl98Unvjy/VcwjL+RxvucnTZWREj7uZgjSwd
         148wtGX8Lu8lVbgda1W3qqZmf92fN6kA6fiJCLPdxX7u2U5U1K+m634Tq0X8S5q71kcc
         3Ba55EBXK90K850iAt1IS3Iz75/ulmyIgG7F0aokJ28p8BdV7oUCi/BykZBFNC0i9zcK
         TF+nFKyi30iQOrXwBPjNLj7YdPaw2+5Y3+Qfvy2jCTlLezqQ68iE8lhlO3hr1fG0rF/u
         rzac1BfInloY2Ec/x8KFVGzE71uqBx+qIATbmsP0+ZK43+YCUx2rBCH++C29+5Q8Y1oq
         J1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121637; x=1746726437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JgrpjyIVurw8ZnhExu0OpjTLOaTTcXOTASTKpgw31Y=;
        b=WU2bl9WsC6cyWcdZwOs+m04qKqoocx5xn25HCIR8jXG/o44LM7ZRSYWdUAf+pos+kL
         Tjh+WMRACVPKjUCnCbWjDCW3xJomwzfIFHj3j6Xjbrpx0Gs5XiUlaCeiyqxtxcaCASo5
         Zh7JXyWs6CsQ2djDN3UZJJujOgJz6lg+TICkvkgyzxZFOhWHkFeF70aXbAGO3e/qMlY0
         yR/kuT0/kJdzIkgk3clWnqB7XLHlyffZWRTnPMEbpdC0jb8w0HM3CHVHwew3/T+FHw8Z
         BB57m0SYd1AwvPbUaEQr4iAUSdD4tUdEoOXGImxqs6wOMBbLi0iZqlbzDkHCCIy7re3v
         MMfA==
X-Forwarded-Encrypted: i=1; AJvYcCUjxzmDVra1+3+X28XcMrWyGs9/Fe2srYCzrPwfUurkiRuy7p2loPvT42+/lTSjeyFuLM4hOCCQw27dPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUjT10VK4VNrH1qcwLzS5zS4iByj1dWA0gjKEX31f1J9dLN1x5
	GpuXRMeEA5ToZwoh+hE5m6gO9Dw0cNhNeaLKSxzQhIwUaP7L742B2ifIDhzxIA==
X-Gm-Gg: ASbGncuwmyUFkS/QWLy77r10pn2kOlQ43fB82YngThzhaNQgQjR8Hne96BdABngx1LE
	73sCQgohpeQPVSx5zQ0+wC3do+JbhO32t3DNCnPWiIJZpPfvZ6QhA/2p0Rpv45KF2QtN2CQKruG
	moJPKJCDXEKMdNp6+GsJSG7qraRyjf9Qmh7SpaCUj68wlmqnOEINAQRkEujgIsP/CYqZml9hF2j
	NDrUSwJLqB/oBRr4ozmUiGjzZLzzkmYoDC+Uo8zyrFb1oq+7Qjit+1k3t590HFKpBVtoNzioN4a
	mcVGb/4Sr8gyTYUYWHXip6Ue5uChnr63hwSDYTyV0sKWzMWsyRrrsyaRsSMTfmrGm1hESWzjGH8
	o9qqKHz56IqaFhQ==
X-Google-Smtp-Source: AGHT+IG3mPJyDPXGVidQgks96nF8i3OAf1xC+gtDnCesF+Inf4BO1ZhItOBTJP8wGyJkHDf9fzb1qA==
X-Received: by 2002:a17:903:1249:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22e08424dcfmr54803565ad.16.1746121636607;
        Thu, 01 May 2025 10:47:16 -0700 (PDT)
Received: from google.com (30.240.118.34.bc.googleusercontent.com. [34.118.240.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bb0e158sm9676965ad.67.2025.05.01.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:47:15 -0700 (PDT)
Date: Thu, 1 May 2025 10:47:10 -0700
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sean Christopherson <seanjc@google.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] KVM: selftests: Use $(SRCARCH) instead of $(ARCH)
Message-ID: <aBOznhkrLZ0Z_3Xw@google.com>
References: <20250430224720.1882145-1-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430224720.1882145-1-dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_104717_899342_C1D5C863 
X-CRM114-Status: GOOD (  20.23  )
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

On 2025-04-30 03:47 PM, David Matlack wrote:
> Use $(SRCARCH) in Makefile.kvm instead of $(ARCH). The former may have
> been set on the command line and thus make will ignore the variable
> assignment to convert x86_64 to x86.
> 
> Introduce $(SRCARCH) rather than just reverting commit 9af04539d474
> ("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
> to keep KVM selftests consistent with the top-level kernel Makefile,
> which uses $(SRCARCH) for the exact same purpose.
> 
> While here, drop the comment about the top-level selftests allowing
> ARCH=x86_64. The kernel itself allows/expects ARCH=x86_64 so it's
> reasonable to expect the KVM selftests to handle it as well.
> 
> Fixes: 9af04539d474 ("KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR")
> Signed-off-by: David Matlack <dmatlack@google.com>

If this approach seems reasonable I can also send another patch to share
the definitions of $(ARCH) and $(SRCARCH) with the top-level Makefile so
that we don't need any custom Makefile code in KVM selftests for this.

e.g.

From: David Matlack <dmatlack@google.com>
Date: Thu, 1 May 2025 10:30:26 -0700
Subject: [PATCH v2] kbuild: Share $(ARCH) and $(SRCARCH) with tools/

Pull out the definitions for $(ARCH), $(SRCARCH), and $(SUBARCH) into a
scripts/arch.include and use it to reduce duplication in Makefiles under
tools/.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 Makefile                                  | 28 +++--------------------
 scripts/{subarch.include => arch.include} | 24 +++++++++++++++++++
 tools/include/nolibc/Makefile             |  5 +---
 tools/testing/selftests/Makefile          |  3 +--
 tools/testing/selftests/kvm/Makefile      |  8 +------
 tools/testing/selftests/nolibc/Makefile   |  5 +---
 6 files changed, 31 insertions(+), 42 deletions(-)
 rename scripts/{subarch.include => arch.include} (61%)

diff --git a/Makefile b/Makefile
index c91afd55099e..7a10252ddbe1 100644
--- a/Makefile
+++ b/Makefile
@@ -380,8 +380,6 @@ KERNELRELEASE = $(call read-file, $(objtree)/include/config/kernel.release)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 
-include $(srctree)/scripts/subarch.include
-
 # Cross compiling and selecting different set of gcc/bin-utils
 # ---------------------------------------------------------------------------
 #
@@ -400,32 +398,12 @@ include $(srctree)/scripts/subarch.include
 # Alternatively CROSS_COMPILE can be set in the environment.
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
-ARCH		?= $(SUBARCH)
+
+# Import definitions for SUBARCH, ARCH, and SRCARCH.
+include $(srctree)/scripts/arch.include
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)
-SRCARCH 	:= $(ARCH)
-
-# Additional ARCH settings for x86
-ifeq ($(ARCH),i386)
-        SRCARCH := x86
-endif
-ifeq ($(ARCH),x86_64)
-        SRCARCH := x86
-endif
-
-# Additional ARCH settings for sparc
-ifeq ($(ARCH),sparc32)
-       SRCARCH := sparc
-endif
-ifeq ($(ARCH),sparc64)
-       SRCARCH := sparc
-endif
-
-# Additional ARCH settings for parisc
-ifeq ($(ARCH),parisc64)
-       SRCARCH := parisc
-endif
 
 export cross_compiling :=
 ifneq ($(SRCARCH),$(SUBARCH))
diff --git a/scripts/subarch.include b/scripts/arch.include
similarity index 61%
rename from scripts/subarch.include
rename to scripts/arch.include
index c4592d59d69b..545f731140df 100644
--- a/scripts/subarch.include
+++ b/scripts/arch.include
@@ -11,3 +11,27 @@ SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
 				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
 				  -e s/riscv.*/riscv/ -e s/loongarch.*/loongarch/)
+
+ARCH		?= $(SUBARCH)
+SRCARCH 	:= $(ARCH)
+
+# Additional ARCH settings for x86
+ifeq ($(ARCH),i386)
+        SRCARCH := x86
+endif
+ifeq ($(ARCH),x86_64)
+        SRCARCH := x86
+endif
+
+# Additional ARCH settings for sparc
+ifeq ($(ARCH),sparc32)
+       SRCARCH := sparc
+endif
+ifeq ($(ARCH),sparc64)
+       SRCARCH := sparc
+endif
+
+# Additional ARCH settings for parisc
+ifeq ($(ARCH),parisc64)
+       SRCARCH := parisc
+endif
diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index f9702877ac21..9a78fe77205f 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -8,10 +8,7 @@ srctree := $(patsubst %/tools/include/,%,$(dir $(CURDIR)))
 endif
 
 # when run as make -C tools/ nolibc_<foo> the arch is not set
-ifeq ($(ARCH),)
-include $(srctree)/scripts/subarch.include
-ARCH = $(SUBARCH)
-endif
+include $(srctree)/scripts/arch.include
 
 # OUTPUT is only set when run from the main makefile, otherwise
 # it defaults to this nolibc directory.
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c77c8c8e3d9b..827ce9bf3e50 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -190,8 +190,7 @@ else
 endif
 
 # Prepare for headers install
-include $(top_srcdir)/scripts/subarch.include
-ARCH           ?= $(SUBARCH)
+include $(top_srcdir)/scripts/arch.include
 export BUILD
 export KHDR_INCLUDES
 
diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 02bf061c51f8..503530d671e9 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -1,13 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 top_srcdir = ../../../..
 
-include $(top_srcdir)/scripts/subarch.include
-ARCH 	?= $(SUBARCH)
-SRCARCH := $(ARCH)
-
-ifeq ($(ARCH),x86_64)
-        SRCARCH := x86
-endif
+include $(top_srcdir)/scripts/arch.include
 
 ifeq ($(SRCARCH),$(filter $(SRCARCH),arm64 s390 riscv x86))
 include Makefile.kvm
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 58bcbbd029bc..13555d418c78 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -18,10 +18,7 @@ else
 objtree ?= $(srctree)
 endif
 
-ifeq ($(ARCH),)
-include $(srctree)/scripts/subarch.include
-ARCH = $(SUBARCH)
-endif
+include $(srctree)/scripts/arch.include
 
 cc-option = $(call __cc-option, $(CC),$(CLANG_CROSS_FLAGS),$(1),$(2))
 

base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
prerequisite-patch-id: 3bae97c9e1093148763235f47a84fa040b512d04
-- 
2.49.0.906.g1f30a19c02-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
