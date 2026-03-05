Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB4FF513E5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I5m8mPja0Ryu9MGlcYjgtkwoT1MRKSK+NqrWk4CDb6c=; b=lxd2PoH8Qul67ni9QPXbTRcQrQ
	uWpi0UyyJaMa1EOq4AUy5GIjoDKmlFo72bCD8Yw5fji0mqjGYtze4y9NAnqj98RGUbijdztuiW3ya
	cSbVg17+aT/YV2z1Lywj2Uacg2E2pHPlNe9c8vPGWfxLC2XDEb7K6xq4Fk4IgUb7oi7r2x0EsqCBH
	OhhhJ52EOCRjgEbco8xUTkSjyZTcXJhdyB8dOCRNZMRvvK7CXe5NjPbJLLKOHTWuCIPfq/lMaiAXR
	3vo0X7KkFlfY1vAEjj0Ww5nDOxzztZam41pE6JQlz7Gz1YG5hTidAU9aXWMiKu+3qyYqhHVQ4US55
	Uk15eMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2w-00000002ePn-47nx;
	Thu, 05 Mar 2026 22:19:55 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2t-00000002eKG-0CFX
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 22:19:52 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12776bebeb3so6809836c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 14:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749188; x=1773353988; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=enTjN37d4hARcTHIjUjR8jWWNgPDrM7ZrLy1xVh8f7c=;
        b=4NAfADIfFee8+Pckgpak1Tj+3AbO6V5G3FWbJVGi9uFrUrI0Q6wTKmP8xehHktpW4c
         +hqf7xHMFqo1zHiipMRG2SjmfkEQ+9R7Mp7GzLfd5CxEh3KEysKhJVKGnIhrXE9+kYMS
         IdklfYehPKPmmNQ7f4POSqgAzflzcdf9eGU+YLa3oxfKRxXeAdbAhPnNm3mdYXEAXfea
         YR6BPi7Z9RgUBmzFPhSBgB7MWPWv6IEeUVeCFjhg4Cr35EZ8FwYtrcLvYV+aUaybRzl7
         8OdsvsTS1wu3M7FNyJIidJhEHpwVl/UUekRvVRMTlakDSBijyA0vA1PHe9UryV9x46YK
         j+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749188; x=1773353988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enTjN37d4hARcTHIjUjR8jWWNgPDrM7ZrLy1xVh8f7c=;
        b=aK+tTutsGwYXGe5BM0e3SvCz39lFWLki/tDoTaudXxQfsK6ylA+6D4bwacxj6oiib0
         U7M1poSE+lVoAIT5TLs0g2H90mYxCyJnS2CiCvH4Btg2eWIPZ0T6ztTSGpeCcY3JpPMT
         SrGd/f+FbvPsfcprkJV0pw7HMtdOTAT1TzSFvw1x19jL3xfPBpIUK8z/OZ/7j0QE/7QU
         HnXSm7ysyP/0eHPKPy9jaCAbqvGHuQKTN9ng0Rllc9+Misg1PjLP98qGJsIRxShxwj5w
         azdlz266stlq0AjWhnjJ1a1aejwakUZfGjJmEVqe1LvNXe4d4KWEZLwf6loj6r4tl1F3
         Dj+g==
X-Forwarded-Encrypted: i=1; AJvYcCW1MYlGSrBAne9PnifB+n7aZ34yT9CeKxlGQ/6zPrZodZTAx424CiElUMyjGl6o/1DNQ49R1krLfhlqaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoc5C+xe0nsVCIy/zbjlGUT0u6E2AGrJwu8dcSEwT80t8sjifE
	hTE5WQJWC5Zp7WhWIP7vDGkpi2jIVA8ifUnVafLIPH/QHUxdI1cMpxvzIzoIgayOdAuam+GV9hH
	Rj9vClGM3zg==
X-Received: from dyx5.prod.google.com ([2002:a05:693c:8205:b0:2bd:f73f:2b3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:427:b0:124:9ae7:b2df
 with SMTP id a92af1059eb24-128c2ecce39mr3060c88.44.1772749187504; Thu, 05 Mar
 2026 14:19:47 -0800 (PST)
Date: Thu,  5 Mar 2026 14:19:23 -0800
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
Mime-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260305221927.3237145-5-irogers@google.com>
Subject: [PATCH v2 4/8] perf build: Be more programmatic when setting up
 libunwind variables
From: Ian Rogers <irogers@google.com>
To: irogers@google.com
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_141951_115377_6F931DC8 
X-CRM114-Status: GOOD (  11.84  )
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

Iterate LIBUNWIND_ARCHS when setting up CONFIG_ and HAVE_ definitions
rather than treating each architecture individually. This sets up the
libunwind build variables and C definitions beyond x86 and
arm/aarch64. The existing naming convention is followed for
compatibility.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 215 +++++++++++++++----------------------
 1 file changed, 89 insertions(+), 126 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index a8dc72cfe48e..f38213ecce08 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -65,95 +65,83 @@ $(call detected_var,SRCARCH)
 
 CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
 
-# Additional ARCH settings for ppc
-ifeq ($(SRCARCH),powerpc)
-  ifndef NO_LIBUNWIND
-    LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
-  endif
-endif
-
 # Additional ARCH settings for x86
 ifeq ($(SRCARCH),x86)
   $(call detected,CONFIG_X86)
   ifeq (${IS_64_BIT}, 1)
     CFLAGS += -DHAVE_ARCH_X86_64_SUPPORT
     ARCH_INCLUDE = ../../arch/x86/lib/memcpy_64.S ../../arch/x86/lib/memset_64.S
-    ifndef NO_LIBUNWIND
-      LIBUNWIND_LIBS = -lunwind-x86_64 -lunwind -llzma
-    endif
     $(call detected,CONFIG_X86_64)
-  else
-    ifndef NO_LIBUNWIND
-      LIBUNWIND_LIBS = -lunwind-x86 -llzma -lunwind
-    endif
   endif
 endif
 
-ifeq ($(SRCARCH),arm)
-  ifndef NO_LIBUNWIND
-    LIBUNWIND_LIBS = -lunwind -lunwind-arm
-  endif
+ifeq ($(ARCH),s390)
+  CFLAGS += -fPIC
 endif
 
-ifeq ($(SRCARCH),arm64)
-  ifndef NO_LIBUNWIND
-    LIBUNWIND_LIBS = -lunwind -lunwind-aarch64
-  endif
+ifneq ($(LIBUNWIND),1)
+  NO_LIBUNWIND := 1
 endif
 
-ifeq ($(SRCARCH),loongarch)
-  ifndef NO_LIBUNWIND
+ifndef NO_LIBUNWIND
+  ifeq ($(SRCARCH),arm)
+    LIBUNWIND_LIBS = -lunwind -lunwind-arm
+  endif
+  ifeq ($(SRCARCH),arm64)
+    LIBUNWIND_LIBS = -lunwind -lunwind-aarch64
+  endif
+  ifeq ($(SRCARCH),loongarch)
     LIBUNWIND_LIBS = -lunwind -lunwind-loongarch64
   endif
-endif
-
-ifeq ($(ARCH),s390)
-  CFLAGS += -fPIC
-endif
-
-ifeq ($(ARCH),mips)
-  ifndef NO_LIBUNWIND
+  ifeq ($(ARCH),mips)
     LIBUNWIND_LIBS = -lunwind -lunwind-mips
   endif
+  ifeq ($(SRCARCH),powerpc)
+    LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
+  endif
+  ifeq ($(SRCARCH),riscv)
+    LIBUNWIND_LIBS := -lunwind -lunwind-riscv
+  endif
+  ifeq ($(SRCARCH),s390)
+    LIBUNWIND_LIBS := -lunwind -lunwind-s390x
+  endif
+  ifeq ($(SRCARCH),x86)
+    ifeq (${IS_64_BIT}, 1)
+      LIBUNWIND_LIBS = -lunwind-x86_64 -lunwind -llzma
+    else
+      LIBUNWIND_LIBS = -lunwind-x86 -lunwind -llzma
+    endif
+  endif
+  ifeq ($(LIBUNWIND_LIBS),)
+    NO_LIBUNWIND := 1
+  endif
 endif
 
-ifneq ($(LIBUNWIND),1)
-  NO_LIBUNWIND := 1
-endif
-
-ifeq ($(LIBUNWIND_LIBS),)
-  NO_LIBUNWIND := 1
-endif
 #
 # For linking with debug library, run like:
 #
 #   make DEBUG=1 LIBUNWIND_DIR=/opt/libunwind/
 #
-
-libunwind_arch_set_flags = $(eval $(libunwind_arch_set_flags_code))
-define libunwind_arch_set_flags_code
-  FEATURE_CHECK_CFLAGS-libunwind-$(1)  = -I$(LIBUNWIND_DIR)/include
-  FEATURE_CHECK_LDFLAGS-libunwind-$(1) = -L$(LIBUNWIND_DIR)/lib
-endef
-
-ifdef LIBUNWIND_DIR
-  LIBUNWIND_CFLAGS  = -I$(LIBUNWIND_DIR)/include
-  LIBUNWIND_LDFLAGS = -L$(LIBUNWIND_DIR)/lib
-  LIBUNWIND_ARCHS = x86 x86_64 arm aarch64 debug-frame-arm debug-frame-aarch64 loongarch
-  $(foreach libunwind_arch,$(LIBUNWIND_ARCHS),$(call libunwind_arch_set_flags,$(libunwind_arch)))
-endif
+LIBUNWIND_ARCHS:=aarch64 arm loongarch64 mips ppc32 ppc64 riscv s390x x86 x86_64
 
 ifndef NO_LIBUNWIND
-  # Set per-feature check compilation flags
   FEATURE_CHECK_CFLAGS-libunwind = $(LIBUNWIND_CFLAGS)
   FEATURE_CHECK_LDFLAGS-libunwind = $(LIBUNWIND_LDFLAGS) $(LIBUNWIND_LIBS)
   FEATURE_CHECK_CFLAGS-libunwind-debug-frame = $(LIBUNWIND_CFLAGS)
   FEATURE_CHECK_LDFLAGS-libunwind-debug-frame = $(LIBUNWIND_LDFLAGS) $(LIBUNWIND_LIBS)
-  
-  FEATURE_CHECK_LDFLAGS-libunwind-arm += -lunwind -lunwind-arm
-  FEATURE_CHECK_LDFLAGS-libunwind-aarch64 += -lunwind -lunwind-aarch64
-  FEATURE_CHECK_LDFLAGS-libunwind-x86 += -lunwind -llzma -lunwind-x86
-  FEATURE_CHECK_LDFLAGS-libunwind-x86_64 += -lunwind -llzma -lunwind-x86_64
+
+  ifdef LIBUNWIND_DIR
+    LIBUNWIND_CFLAGS  = -I$(LIBUNWIND_DIR)/include
+    LIBUNWIND_LDFLAGS = -L$(LIBUNWIND_DIR)/lib
+
+    define libunwind_arch_set_flags
+      FEATURE_CHECK_CFLAGS-libunwind-$(1)  = -I$(LIBUNWIND_DIR)/include
+      FEATURE_CHECK_LDFLAGS-libunwind-$(1) = -L$(LIBUNWIND_DIR)/lib
+    endef
+    $(foreach arch,$(LIBUNWIND_ARCHS), \
+      $(eval $(call libunwind_arch_set_flags,$(arch))) \
+    )
+  endif
 endif
 
 ifdef CSINCLUDES
@@ -637,49 +625,6 @@ ifeq ($(SRCARCH),powerpc)
   endif
 endif
 
-ifndef NO_LIBUNWIND
-  have_libunwind :=
-
-  $(call feature_check,libunwind)
-
-  $(call feature_check,libunwind-x86)
-  ifeq ($(feature-libunwind-x86), 1)
-    $(call detected,CONFIG_LIBUNWIND_X86)
-    CFLAGS += -DHAVE_LIBUNWIND_X86_SUPPORT
-    LDFLAGS += -lunwind-x86
-    EXTLIBS_LIBUNWIND += -lunwind-x86
-    have_libunwind = 1
-  endif
-
-  $(call feature_check,libunwind-aarch64)
-  ifeq ($(feature-libunwind-aarch64), 1)
-    $(call detected,CONFIG_LIBUNWIND_AARCH64)
-    CFLAGS += -DHAVE_LIBUNWIND_AARCH64_SUPPORT
-    LDFLAGS += -lunwind-aarch64
-    EXTLIBS_LIBUNWIND += -lunwind-aarch64
-    have_libunwind = 1
-    $(call feature_check,libunwind-debug-frame-aarch64)
-    ifneq ($(feature-libunwind-debug-frame-aarch64), 1)
-      $(warning No debug_frame support found in libunwind-aarch64)
-      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME_AARCH64
-    endif
-  endif
-
-  ifneq ($(feature-libunwind), 1)
-    $(warning No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR and set LIBUNWIND=1 in the make command line as it is opt-in now)
-    NO_LOCAL_LIBUNWIND := 1
-  else
-    have_libunwind := 1
-    $(call detected,CONFIG_LOCAL_LIBUNWIND)
-  endif
-
-  ifneq ($(have_libunwind), 1)
-    NO_LIBUNWIND := 1
-  endif
-else
-  NO_LOCAL_LIBUNWIND := 1
-endif
-
 ifndef NO_LIBBPF
   ifneq ($(feature-bpf), 1)
     $(warning BPF API too old. Please install recent kernel headers. BPF support in 'perf record' is disabled.)
@@ -738,6 +683,49 @@ ifndef GEN_VMLINUX_H
   VMLINUX_H=$(src-perf)/util/bpf_skel/vmlinux/vmlinux.h
 endif
 
+ifndef NO_LIBUNWIND
+  have_libunwind :=
+
+  $(call feature_check,libunwind)
+  ifneq ($(feature-libunwind), 1)
+    $(warning No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR and set LIBUNWIND=1 in the make command line as it is opt-in now)
+    NO_LOCAL_LIBUNWIND := 1
+  else
+    have_libunwind := 1
+    $(call detected,CONFIG_LOCAL_LIBUNWIND)
+    CFLAGS  += -DHAVE_LIBUNWIND_SUPPORT
+    CFLAGS  += $(LIBUNWIND_CFLAGS)
+    LDFLAGS += $(LIBUNWIND_LDFLAGS)
+    EXTLIBS += $(EXTLIBS_LIBUNWIND)
+    $(call feature_check,libunwind-debug-frame)
+    ifneq ($(feature-libunwind-debug-frame), 1)
+      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME
+    endif
+  endif
+
+  define PROCESS_REMOTE_LIBUNWIND_ARCH
+    $(call feature_check,libunwind-$(1))
+
+    ifeq ($$(feature-libunwind-$(1)), 1)
+      upper_arch := $$(shell echo $(1) | tr '[:lower:]' '[:upper:]')
+      $$(call detected,CONFIG_LIBUNWIND_$$(upper_arch))
+
+      CFLAGS += -DHAVE_LIBUNWIND_$$(upper_arch)_SUPPORT
+      LDFLAGS += -lunwind-$(1)
+      EXTLIBS_LIBUNWIND += -lunwind-$(1)
+      have_libunwind := 1
+
+      $$(call feature_check,libunwind-debug-frame-$(1))
+      ifneq ($$(feature-libunwind-debug-frame-$(1)), 1)
+        CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME_$$(upper_arch)
+      endif
+    endif
+  endef
+  $(foreach arch,$(LIBUNWIND_ARCHS), \
+    $(eval $(call PROCESS_REMOTE_LIBUNWIND_ARCH,$(arch))) \
+  )
+endif
+
 dwarf-post-unwind := 1
 dwarf-post-unwind-text := BUG
 
@@ -760,31 +748,6 @@ ifeq ($(dwarf-post-unwind),1)
   $(call detected,CONFIG_DWARF_UNWIND)
 endif
 
-ifndef NO_LIBUNWIND
-  ifndef NO_LOCAL_LIBUNWIND
-    ifeq ($(SRCARCH),$(filter $(SRCARCH),arm arm64))
-      $(call feature_check,libunwind-debug-frame)
-      ifneq ($(feature-libunwind-debug-frame), 1)
-        $(warning No debug_frame support found in libunwind)
-        CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME
-      endif
-    else
-      # non-ARM has no dwarf_find_debug_frame() function:
-      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME
-    endif
-    EXTLIBS += $(LIBUNWIND_LIBS)
-    LDFLAGS += $(LIBUNWIND_LIBS)
-  endif
-  ifeq ($(findstring -static,${LDFLAGS}),-static)
-    # gcc -static links libgcc_eh which contans piece of libunwind
-    LIBUNWIND_LDFLAGS += -Wl,--allow-multiple-definition
-  endif
-  CFLAGS  += -DHAVE_LIBUNWIND_SUPPORT
-  CFLAGS  += $(LIBUNWIND_CFLAGS)
-  LDFLAGS += $(LIBUNWIND_LDFLAGS)
-  EXTLIBS += $(EXTLIBS_LIBUNWIND)
-endif
-
 ifneq ($(NO_LIBTRACEEVENT),1)
   $(call detected,CONFIG_TRACE)
 endif
-- 
2.53.0.473.g4a7958ca14-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
