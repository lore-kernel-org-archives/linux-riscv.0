Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A56810ED65C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQXtXYXS4mthzi7dkj/Dd8AcoQLjdYmGmz9wSIGL4zk=; b=hkcPP5sqxmzODN
	JDX0tGjcXVdHj7oWF24444+qsw5EK2dW3Rt5N/IXaYKfPZnesM6SXEixmKhTZB8GgipCnXyq2NM7i
	exI5a+V6CSJMq2DGqQTtjPwJaKNxDrFr8wiUUr9yJGA6bTLOqdWKYP6PC3dvu2GQNrCT+50NLGVS5
	Pe+mRvl7WUuat7jZdJixO59mWYZO3E2Cxwwe1P7XaaTIqfoefnkah3tWcdyhXzxoeobkGuF9eMOBv
	zjWZhx6nuks7eJmYu+Fkju8GIO81VnIw3jOHdbKw03cBOz1vgBMWc6xYfFIGK+6fVsKEe8gfp6feF
	Bno6qC63KA/ToGc5i7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65fv-00000007IxN-1OH1;
	Fri, 27 Mar 2026 11:48:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65ft-00000007Ix1-2d4V
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 11:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bVoIY6pTYZDOqm8IuntqRqHezyaa7BDdVZSXw3DwDtQ=; b=c6oNmHLVa0tKnmqs/MQSy0f6hp
	9ek7cwjBS3nhOoZy6/1wrACg8Ixk3tGqZu+t7FCVIcR0iPkgAWfeXcY3Mh8v0Tm9kPOWVpsQwizP2
	8HkVB7gnuhQQIS1MjTfmCVh3+CFx3AIjm3TH4IMoEeM5Z6oJCIivxtBjCHxpjwituZhL1nX71MMuk
	T5VMDpq1WyCBP303Jo5Oim4OxlyxdVAdw9Vtgn2GRtRTHVhBn3stKREfawPBGLJ8B4m79IfPdLEtZ
	3wPznKEDHGbzh6wy/UmGkHrFQdjkEe+rE4vuzzr6OrMAAf0BDm2Xk1YcSGrtq3vJH3xBFQIg69DwR
	6bPZES9w==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65fq-0000000AKht-29Hc
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 11:48:24 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82a893d289bso905390b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612100; x=1775216900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVoIY6pTYZDOqm8IuntqRqHezyaa7BDdVZSXw3DwDtQ=;
        b=dbgZwWTU3sDOUOVfMX8xhzoBNRwnXkk/85AysRVs5C/9SL0fUXVMc6y+KsKPPjyVrm
         P9cq6q1tTI6DZYyBvu2ybBED+J+S+MXbU2loy0o48liXM6xyW1AfJcpjRa/xZiLmJdB0
         1ZO8f++d4ArGAIEEUBo5D7xOaYhOPzpSv2d4DbnXEG2Qz1hjeahfLRHZPGUQVr+y5ZWM
         HUDNpqUAauBgslDqB3I6vaVYHdGBReSfoj3uHRxlfjdS74CIwi6ryGummHwRlBN3XWYM
         B6VSfwKTXesc7fSINhEQ9dTQ5b6zmca4ennmHD1Tca/AqYz8vcgOdSXjIhkx40RJojZB
         sK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612100; x=1775216900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVoIY6pTYZDOqm8IuntqRqHezyaa7BDdVZSXw3DwDtQ=;
        b=cxPVBaOvR2vdkCnlXSfK0GFLQ6/VoOsaWr3fqPfvzENSYKBnukacgeVV0CSyzQTXQB
         4hUsoer8PSDhxI7vrqzJzfKnJquCRsRVLZHXbNpGK2iGnzDh+CBUi7Pfh80YoF3G+NCZ
         RdPUzXRh2zdRdTIH5QP5nhMxkaIhzH1Hy7R/TjcxWDjxiXlngBhjy0Xxwcsu2gDm9mXn
         zNJMoiBvMg5vpnGhS2KOsfgl8uhOhzFrtvbnh0XF+uGZEVksDCDIqiSK5fulW4WAAQ/E
         yHFDQP9bVZvYtUXMeJ5WnK+O1F8t46fFnUyrsLwo88u9RxsGwsqH622wjx12t2OipN2T
         WGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg2C1MhnqVy1+pnapmw9yRuGFsMkuod+RX6U5iZF5X4oTd1dseCZeHBTY3/iy9CVTUEmSHLztDvPnAtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza/RFGgKXitXoE1qQvxJ6zuG4RYWBs06t11NGJkK20GCghWUn5
	dfTgeKVjQjzq9IrtfUHPo762Z5/aekQnAgD/a88HQKegUv2XRvJpUoxq
X-Gm-Gg: ATEYQzxN/L4lAVM/QqT70oo64zpUukcfZed68ccKihH6oBOd3El8e2Bnmkq9jUrQu2M
	3xeziBicITVkuN8O74higgRehNR1QyhZV6cVrYp12XDQEESb7iNR3yZ1mAzLyAhhI2YB5PNse0F
	JTs5CCjc4zxjBWeLNZoOq+l9nF4l+HtulS2Gs8yvpg32pA6lH6ohOTEXYGw85bLSg8r79dXsy/v
	pbXqMTvJzVyRqYtKk2pWa4cZODkx+2WkflqFyVXu2KqMd8pn2VAYE2cs6eSW0qpkQOulwEyZB0d
	wvz1FVd1GgCx6CfgS4hll3UlXaDVowcmZSoitFMsDlerA7Uy42SxNJxWqOJ7PirF9H97uUj/jrv
	uA5Lfx4j4DYYsUQoA9Fc6XXCCi9silvccTsO24PPQ+DwcarQXKJMgtdTJRmYdFCAk8GRIi+jIGB
	qy6ALinTChPwzpwPWkMjeSDkXnjcKdr0KjiYGDhFOjhWsanDbPPwiqHA==
X-Received: by 2002:a05:6a00:2294:b0:82a:7ad8:75f2 with SMTP id d2e1a72fcca58-82c960d5574mr2414880b3a.56.1774612099844;
        Fri, 27 Mar 2026 04:48:19 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c289dsm5235572b3a.47.2026.03.27.04.48.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Mar 2026 04:48:19 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: axboe@kernel.dk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [RFC 2/2] tools/ufq_iosched: add BPF example scheduler and build scaffolding
Date: Fri, 27 Mar 2026 19:47:41 +0800
Message-ID: <20260327114741.91500-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327114741.91500-1-pilgrimtao@gmail.com>
References: <20260327114741.91500-1-pilgrimtao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114822_679289_D63F23F9 
X-CRM114-Status: GOOD (  17.55  )
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Add ufq_iosched as a simple example for the UFQ block I/O scheduler,
In the ufq_simple example, we implement the eBPF struct_ops hooks the
kernel exposes so we can exercise and validate the behavior and stability
of the kernel UFQ scheduling framework. The Makefile and directory
layout are modeled after sched_ext.

This mirrors the sched_ext examples pattern so developers can experiment
with user-defined queueing policies on top of IOSCHED_UFQ.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 tools/ufq_iosched/.gitignore                  |   2 +
 tools/ufq_iosched/Makefile                    | 262 +++++++++++
 tools/ufq_iosched/README.md                   | 136 ++++++
 .../include/bpf-compat/gnu/stubs.h            |  12 +
 tools/ufq_iosched/include/ufq/common.bpf.h    |  73 +++
 tools/ufq_iosched/include/ufq/common.h        |  91 ++++
 tools/ufq_iosched/include/ufq/simple_stat.h   |  21 +
 tools/ufq_iosched/ufq_simple.bpf.c            | 445 ++++++++++++++++++
 tools/ufq_iosched/ufq_simple.c                | 118 +++++
 9 files changed, 1160 insertions(+)
 create mode 100644 tools/ufq_iosched/.gitignore
 create mode 100644 tools/ufq_iosched/Makefile
 create mode 100644 tools/ufq_iosched/README.md
 create mode 100644 tools/ufq_iosched/include/bpf-compat/gnu/stubs.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.bpf.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.h
 create mode 100644 tools/ufq_iosched/include/ufq/simple_stat.h
 create mode 100644 tools/ufq_iosched/ufq_simple.bpf.c
 create mode 100644 tools/ufq_iosched/ufq_simple.c

diff --git a/tools/ufq_iosched/.gitignore b/tools/ufq_iosched/.gitignore
new file mode 100644
index 000000000000..d6264fe1c8cd
--- /dev/null
+++ b/tools/ufq_iosched/.gitignore
@@ -0,0 +1,2 @@
+tools/
+build/
diff --git a/tools/ufq_iosched/Makefile b/tools/ufq_iosched/Makefile
new file mode 100644
index 000000000000..7dc37d9172aa
--- /dev/null
+++ b/tools/ufq_iosched/Makefile
@@ -0,0 +1,262 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2026 KylinSoft Corporation.
+# Copyright (c) 2026 Kaitao Cheng <chengkaitao@kylinos.cn>
+include ../build/Build.include
+include ../scripts/Makefile.arch
+include ../scripts/Makefile.include
+
+all: all_targets
+
+ifneq ($(LLVM),)
+ifneq ($(filter %/,$(LLVM)),)
+LLVM_PREFIX := $(LLVM)
+else ifneq ($(filter -%,$(LLVM)),)
+LLVM_SUFFIX := $(LLVM)
+endif
+
+CLANG_TARGET_FLAGS_arm          := arm-linux-gnueabi
+CLANG_TARGET_FLAGS_arm64        := aarch64-linux-gnu
+CLANG_TARGET_FLAGS_hexagon      := hexagon-linux-musl
+CLANG_TARGET_FLAGS_m68k         := m68k-linux-gnu
+CLANG_TARGET_FLAGS_mips         := mipsel-linux-gnu
+CLANG_TARGET_FLAGS_powerpc      := powerpc64le-linux-gnu
+CLANG_TARGET_FLAGS_riscv        := riscv64-linux-gnu
+CLANG_TARGET_FLAGS_s390         := s390x-linux-gnu
+CLANG_TARGET_FLAGS_x86          := x86_64-linux-gnu
+CLANG_TARGET_FLAGS              := $(CLANG_TARGET_FLAGS_$(ARCH))
+
+ifeq ($(CROSS_COMPILE),)
+ifeq ($(CLANG_TARGET_FLAGS),)
+$(error Specify CROSS_COMPILE or add '--target=' option to lib.mk)
+else
+CLANG_FLAGS     += --target=$(CLANG_TARGET_FLAGS)
+endif # CLANG_TARGET_FLAGS
+else
+CLANG_FLAGS     += --target=$(notdir $(CROSS_COMPILE:%-=%))
+endif # CROSS_COMPILE
+
+CC := $(LLVM_PREFIX)clang$(LLVM_SUFFIX) $(CLANG_FLAGS) -fintegrated-as
+else
+CC := $(CROSS_COMPILE)gcc
+endif # LLVM
+
+CURDIR := $(abspath .)
+TOOLSDIR := $(abspath ..)
+LIBDIR := $(TOOLSDIR)/lib
+BPFDIR := $(LIBDIR)/bpf
+TOOLSINCDIR := $(TOOLSDIR)/include
+BPFTOOLDIR := $(TOOLSDIR)/bpf/bpftool
+APIDIR := $(TOOLSINCDIR)/uapi
+GENDIR := $(abspath ../../include/generated)
+GENHDR := $(GENDIR)/autoconf.h
+
+ifeq ($(O),)
+OUTPUT_DIR := $(CURDIR)/build
+else
+OUTPUT_DIR := $(O)/build
+endif # O
+OBJ_DIR := $(OUTPUT_DIR)/obj
+INCLUDE_DIR := $(OUTPUT_DIR)/include
+BPFOBJ_DIR := $(OBJ_DIR)/libbpf
+UFQOBJ_DIR := $(OBJ_DIR)/ufq_iosched
+BINDIR := $(OUTPUT_DIR)/bin
+BPFOBJ := $(BPFOBJ_DIR)/libbpf.a
+ifneq ($(CROSS_COMPILE),)
+HOST_BUILD_DIR		:= $(OBJ_DIR)/host/obj
+HOST_OUTPUT_DIR		:= $(OBJ_DIR)/host
+HOST_INCLUDE_DIR	:= $(HOST_OUTPUT_DIR)/include
+else
+HOST_BUILD_DIR		:= $(OBJ_DIR)
+HOST_OUTPUT_DIR		:= $(OUTPUT_DIR)
+HOST_INCLUDE_DIR	:= $(INCLUDE_DIR)
+endif
+HOST_BPFOBJ := $(HOST_BUILD_DIR)/libbpf/libbpf.a
+RESOLVE_BTFIDS := $(HOST_BUILD_DIR)/resolve_btfids/resolve_btfids
+DEFAULT_BPFTOOL := $(HOST_OUTPUT_DIR)/sbin/bpftool
+
+VMLINUX_BTF_PATHS ?= $(if $(O),$(O)/vmlinux)					\
+		     $(if $(KBUILD_OUTPUT),$(KBUILD_OUTPUT)/vmlinux)		\
+		     ../../vmlinux						\
+		     /sys/kernel/btf/vmlinux					\
+		     /boot/vmlinux-$(shell uname -r)
+VMLINUX_BTF ?= $(abspath $(firstword $(wildcard $(VMLINUX_BTF_PATHS))))
+ifeq ($(VMLINUX_BTF),)
+$(error Cannot find a vmlinux for VMLINUX_BTF at any of "$(VMLINUX_BTF_PATHS)")
+endif
+
+BPFTOOL ?= $(DEFAULT_BPFTOOL)
+
+ifneq ($(wildcard $(GENHDR)),)
+  GENFLAGS := -DHAVE_GENHDR
+endif
+
+CFLAGS += -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)			\
+	  -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)				\
+	  -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include
+
+# Silence some warnings when compiled with clang
+ifneq ($(LLVM),)
+CFLAGS += -Wno-unused-command-line-argument
+endif
+
+LDFLAGS += -lelf -lz -lpthread
+
+IS_LITTLE_ENDIAN = $(shell $(CC) -dM -E - </dev/null |				\
+			grep 'define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__')
+
+# Get Clang's default includes on this system, as opposed to those seen by
+# '-target bpf'. This fixes "missing" files on some architectures/distros,
+# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
+#
+# Use '-idirafter': Don't interfere with include mechanics except where the
+# build would have failed anyways.
+define get_sys_includes
+$(shell $(1) -v -E - </dev/null 2>&1 \
+	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }') \
+$(shell $(1) -dM -E - </dev/null | grep '__riscv_xlen ' | awk '{printf("-D__riscv_xlen=%d -D__BITS_PER_LONG=%d", $$3, $$3)}')
+endef
+
+BPF_CFLAGS = -g -D__TARGET_ARCH_$(SRCARCH)					\
+	     $(if $(IS_LITTLE_ENDIAN),-mlittle-endian,-mbig-endian)		\
+	     -I$(CURDIR)/include -I$(CURDIR)/include/bpf-compat			\
+	     -I$(INCLUDE_DIR) -I$(APIDIR)					\
+	     -I../../include							\
+	     $(call get_sys_includes,$(CLANG))					\
+	     -Wall -Wno-compare-distinct-pointer-types				\
+	     -Wno-microsoft-anon-tag						\
+	     -fms-extensions							\
+	     -O2 -mcpu=v3
+
+# sort removes libbpf duplicates when not cross-building
+MAKE_DIRS := $(sort $(OBJ_DIR)/libbpf $(HOST_BUILD_DIR)/libbpf			\
+	       $(HOST_BUILD_DIR)/bpftool $(HOST_BUILD_DIR)/resolve_btfids	\
+	       $(INCLUDE_DIR) $(UFQOBJ_DIR) $(BINDIR))
+
+$(MAKE_DIRS):
+	$(call msg,MKDIR,,$@)
+	$(Q)mkdir -p $@
+
+ifneq ($(CROSS_COMPILE),)
+$(BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)			\
+	   $(APIDIR)/linux/bpf.h						\
+	   | $(OBJ_DIR)/libbpf
+	$(Q)$(MAKE) $(submake_extras) CROSS_COMPILE=$(CROSS_COMPILE) 		\
+		    -C $(BPFDIR) OUTPUT=$(OBJ_DIR)/libbpf/			\
+		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
+		    LDFLAGS="$(LDFLAGS)"					\
+		    DESTDIR=$(OUTPUT_DIR) prefix= all install_headers
+endif
+
+$(HOST_BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)		\
+	   $(APIDIR)/linux/bpf.h						\
+	   | $(HOST_BUILD_DIR)/libbpf
+	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR) 				\
+		    OUTPUT=$(HOST_BUILD_DIR)/libbpf/				\
+		    ARCH= CROSS_COMPILE= CC="$(HOSTCC)" LD=$(HOSTLD)		\
+		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
+		    DESTDIR=$(HOST_OUTPUT_DIR) prefix= all install_headers
+
+$(DEFAULT_BPFTOOL): $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile)	\
+		    $(HOST_BPFOBJ) | $(HOST_BUILD_DIR)/bpftool
+	$(Q)$(MAKE) $(submake_extras)  -C $(BPFTOOLDIR)				\
+		    ARCH= CROSS_COMPILE= CC="$(HOSTCC)" LD=$(HOSTLD)		\
+		    EXTRA_CFLAGS='-g -O0'					\
+		    OUTPUT=$(HOST_BUILD_DIR)/bpftool/				\
+		    LIBBPF_OUTPUT=$(HOST_BUILD_DIR)/libbpf/			\
+		    LIBBPF_DESTDIR=$(HOST_OUTPUT_DIR)/				\
+		    prefix= DESTDIR=$(HOST_OUTPUT_DIR)/ install-bin
+
+$(INCLUDE_DIR)/vmlinux.h: $(VMLINUX_BTF) $(BPFTOOL) | $(INCLUDE_DIR)
+ifeq ($(VMLINUX_H),)
+	$(call msg,GEN,,$@)
+	$(Q)$(BPFTOOL) btf dump file $(VMLINUX_BTF) format c > $@
+else
+	$(call msg,CP,,$@)
+	$(Q)cp "$(VMLINUX_H)" $@
+endif
+
+$(UFQOBJ_DIR)/%.bpf.o: %.bpf.c $(INCLUDE_DIR)/vmlinux.h include/ufq/*.h		\
+		       | $(BPFOBJ) $(UFQOBJ_DIR)
+	$(call msg,CLNG-BPF,,$(notdir $@))
+	$(Q)$(CLANG) $(BPF_CFLAGS) -target bpf -c $< -o $@
+
+$(INCLUDE_DIR)/%.bpf.skel.h: $(UFQOBJ_DIR)/%.bpf.o $(INCLUDE_DIR)/vmlinux.h $(BPFTOOL)
+	$(eval sched=$(notdir $@))
+	$(call msg,GEN-SKEL,,$(sched))
+	$(Q)$(BPFTOOL) gen object $(<:.o=.linked1.o) $<
+	$(Q)$(BPFTOOL) gen object $(<:.o=.linked2.o) $(<:.o=.linked1.o)
+	$(Q)$(BPFTOOL) gen object $(<:.o=.linked3.o) $(<:.o=.linked2.o)
+	$(Q)diff $(<:.o=.linked2.o) $(<:.o=.linked3.o)
+	$(Q)$(BPFTOOL) gen skeleton $(<:.o=.linked3.o) name $(subst .bpf.skel.h,,$(sched)) > $@
+	$(Q)$(BPFTOOL) gen subskeleton $(<:.o=.linked3.o) name $(subst .bpf.skel.h,,$(sched)) > $(@:.skel.h=.subskel.h)
+
+UFQ_COMMON_DEPS := include/ufq/common.h include/ufq/simple_stat.h | $(BINDIR)
+
+c-sched-targets = ufq_simple
+
+$(addprefix $(BINDIR)/,$(c-sched-targets)): \
+	$(BINDIR)/%: \
+		$(filter-out %.bpf.c,%.c) \
+		$(INCLUDE_DIR)/%.bpf.skel.h \
+		$(UFQ_COMMON_DEPS)
+	$(eval sched=$(notdir $@))
+	$(CC) $(CFLAGS) -c $(sched).c -o $(UFQOBJ_DIR)/$(sched).o
+	$(CC) -o $@ $(UFQOBJ_DIR)/$(sched).o $(BPFOBJ) $(LDFLAGS)
+
+$(c-sched-targets): %: $(BINDIR)/%
+
+install: all
+	$(Q)mkdir -p $(DESTDIR)/usr/local/bin/
+	$(Q)cp $(BINDIR)/* $(DESTDIR)/usr/local/bin/
+
+clean:
+	rm -rf $(OUTPUT_DIR) $(HOST_OUTPUT_DIR)
+	rm -f *.o *.bpf.o *.bpf.skel.h *.bpf.subskel.h
+	rm -f $(c-sched-targets)
+
+help:
+	@echo   'Building targets'
+	@echo   '================'
+	@echo   ''
+	@echo   '  all		  - Compile all schedulers'
+	@echo   ''
+	@echo   'Alternatively, you may compile individual schedulers:'
+	@echo   ''
+	@printf '  %s\n' $(c-sched-targets)
+	@echo   ''
+	@echo   'For any scheduler build target, you may specify an alternative'
+	@echo   'build output path with the O= environment variable. For example:'
+	@echo   ''
+	@echo   '   O=/tmp/ufq_iosched make all'
+	@echo   ''
+	@echo   'will compile all schedulers, and emit the build artifacts to'
+	@echo   '/tmp/ufq_iosched/build.'
+	@echo   ''
+	@echo   ''
+	@echo   'Installing targets'
+	@echo   '=================='
+	@echo   ''
+	@echo   '  install	  - Compile and install all schedulers to /usr/bin.'
+	@echo   '		    You may specify the DESTDIR= environment variable'
+	@echo   '		    to indicate a prefix for /usr/bin. For example:'
+	@echo   ''
+	@echo   '                     DESTDIR=/tmp/ufq_iosched make install'
+	@echo   ''
+	@echo   '		    will build the schedulers in CWD/build, and'
+	@echo   '		    install the schedulers to /tmp/ufq_iosched/usr/bin.'
+	@echo   ''
+	@echo   ''
+	@echo   'Cleaning targets'
+	@echo   '================'
+	@echo   ''
+	@echo   '  clean		  - Remove all generated files'
+
+all_targets: $(c-sched-targets)
+
+.PHONY: all all_targets $(c-sched-targets) clean help
+
+# delete failed targets
+.DELETE_ON_ERROR:
+
+# keep intermediate (.bpf.skel.h, .bpf.o, etc) targets
+.SECONDARY:
diff --git a/tools/ufq_iosched/README.md b/tools/ufq_iosched/README.md
new file mode 100644
index 000000000000..d831bae7a326
--- /dev/null
+++ b/tools/ufq_iosched/README.md
@@ -0,0 +1,136 @@
+UFQ IOSCHED EXAMPLE SCHEDULERS
+============================
+
+# Introduction
+
+This directory contains a simple example of the ufq IO scheduler. It is meant
+to illustrate the different kinds of IO schedulers you can build with ufq;
+new schedulers will be added as the project evolves across releases.
+
+# Compiling the examples
+
+There are a few toolchain dependencies for compiling the example schedulers.
+
+## Toolchain dependencies
+
+1. clang >= 16.0.0
+
+The schedulers are BPF programs, and therefore must be compiled with clang. gcc
+is actively working on adding a BPF backend compiler as well, but are still
+missing some features such as BTF type tags which are necessary for using
+kptrs.
+
+2. pahole >= 1.25
+
+You may need pahole in order to generate BTF from DWARF.
+
+3. rust >= 1.70.0
+
+Rust schedulers uses features present in the rust toolchain >= 1.70.0. You
+should be able to use the stable build from rustup, but if that doesn't
+work, try using the rustup nightly build.
+
+There are other requirements as well, such as make, but these are the main /
+non-trivial ones.
+
+## Compiling the kernel
+
+In order to run a ufq scheduler, you'll have to run a kernel compiled
+with the patches in this repository, and with a minimum set of necessary
+Kconfig options:
+
+```
+CONFIG_BPF=y
+CONFIG_IOSCHED_UFQ=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
+CONFIG_DEBUG_INFO_BTF=y
+```
+
+It's also recommended that you also include the following Kconfig options:
+
+```
+CONFIG_BPF_JIT_ALWAYS_ON=y
+CONFIG_BPF_JIT_DEFAULT_ON=y
+CONFIG_PAHOLE_HAS_SPLIT_BTF=y
+CONFIG_PAHOLE_HAS_BTF_TAG=y
+```
+
+There is a `Kconfig` file in this directory whose contents you can append to
+your local `.config` file, as long as there are no conflicts with any existing
+options in the file.
+
+## Getting a vmlinux.h file
+
+You may notice that most of the example schedulers include a "vmlinux.h" file.
+This is a large, auto-generated header file that contains all of the types
+defined in some vmlinux binary that was compiled with
+[BTF](https://docs.kernel.org/bpf/btf.html) (i.e. with the BTF-related Kconfig
+options specified above).
+
+The header file is created using `bpftool`, by passing it a vmlinux binary
+compiled with BTF as follows:
+
+```bash
+$ bpftool btf dump file /path/to/vmlinux format c > vmlinux.h
+```
+
+`bpftool` analyzes all of the BTF encodings in the binary, and produces a
+header file that can be included by BPF programs to access those types.  For
+example, using vmlinux.h allows a scheduler to access fields defined directly
+in vmlinux
+
+The scheduler build system will generate this vmlinux.h file as part of the
+scheduler build pipeline. It looks for a vmlinux file in the following
+dependency order:
+
+1. If the O= environment variable is defined, at `$O/vmlinux`
+2. If the KBUILD_OUTPUT= environment variable is defined, at
+   `$KBUILD_OUTPUT/vmlinux`
+3. At `../../vmlinux` (i.e. at the root of the kernel tree where you're
+   compiling the schedulers)
+3. `/sys/kernel/btf/vmlinux`
+4. `/boot/vmlinux-$(uname -r)`
+
+In other words, if you have compiled a kernel in your local repo, its vmlinux
+file will be used to generate vmlinux.h. Otherwise, it will be the vmlinux of
+the kernel you're currently running on. This means that if you're running on a
+kernel with ufq support, you may not need to compile a local kernel at
+all.
+
+### Aside on CO-RE
+
+One of the cooler features of BPF is that it supports
+[CO-RE](https://nakryiko.com/posts/bpf-core-reference-guide/) (Compile Once Run
+Everywhere). This feature allows you to reference fields inside of structs with
+types defined internal to the kernel, and not have to recompile if you load the
+BPF program on a different kernel with the field at a different offset.
+
+## Compiling the schedulers
+
+Once you have your toolchain setup, and a vmlinux that can be used to generate
+a full vmlinux.h file, you can compile the schedulers using `make`:
+
+```bash
+$ make -j($nproc)
+```
+
+## ufq_simple
+
+A simple IO scheduler that provides an example of a minimal ufq scheduler.
+Populates commonly used kernel-exposed BPF interfaces for testing the UFQ
+scheduler framework in the kernel.
+
+### llvm: [OFF]
+
+You may see the following output when building the schedulers:
+
+```
+Auto-detecting system features:
+...                         clang-bpf-co-re: [ on  ]
+...                                    llvm: [ OFF ]
+...                                  libcap: [ on  ]
+...                                  libbfd: [ on  ]
+```
+
+Seeing `llvm: [ OFF ]` here is not an issue. You can safely ignore.
diff --git a/tools/ufq_iosched/include/bpf-compat/gnu/stubs.h b/tools/ufq_iosched/include/bpf-compat/gnu/stubs.h
new file mode 100644
index 000000000000..f200ac0f6ccd
--- /dev/null
+++ b/tools/ufq_iosched/include/bpf-compat/gnu/stubs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Dummy gnu/stubs.h. clang can end up including /usr/include/gnu/stubs.h when
+ * compiling BPF files although its content doesn't play any role. The file in
+ * turn includes stubs-64.h or stubs-32.h depending on whether __x86_64__ is
+ * defined. When compiling a BPF source, __x86_64__ isn't set and thus
+ * stubs-32.h is selected. However, the file is not there if the system doesn't
+ * have 32bit glibc devel package installed leading to a build failure.
+ *
+ * The problem is worked around by making this file available in the include
+ * search paths before the system one when building BPF.
+ */
diff --git a/tools/ufq_iosched/include/ufq/common.bpf.h b/tools/ufq_iosched/include/ufq/common.bpf.h
new file mode 100644
index 000000000000..96832d317464
--- /dev/null
+++ b/tools/ufq_iosched/include/ufq/common.bpf.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 KylinSoft Corporation.
+ * Copyright (c) 2026 Kaitao Cheng <chengkaitao@kylinos.cn>
+ */
+#ifndef __UFQ_COMMON_BPF_H
+#define __UFQ_COMMON_BPF_H
+
+#ifdef LSP
+#define __bpf__
+#include "../vmlinux/vmlinux.h"
+#else
+#include "vmlinux.h"
+#endif
+
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include <bpf/bpf_core_read.h>
+#include <asm-generic/errno.h>
+#include "simple_stat.h"
+
+#define BPF_STRUCT_OPS(name, args...)					\
+	SEC("struct_ops/" #name) BPF_PROG(name, ##args)
+
+/* Define struct ufq_iosched_ops for .struct_ops.link in the BPF object */
+#define UFQ_OPS_DEFINE(__name, ...)					\
+	SEC(".struct_ops.link")						\
+	struct ufq_iosched_ops __name = {				\
+		__VA_ARGS__,						\
+	}
+
+/* list and rbtree */
+#define __contains(name, node) __attribute__((btf_decl_tag("contains:" #name ":" #node)))
+
+struct request *bpf_request_acquire(struct request *rq) __ksym;
+bool bpf_request_put(struct request *rq) __ksym;
+void bpf_request_release(struct request *rq) __ksym;
+
+void *bpf_obj_new_impl(__u64 local_type_id, void *meta) __ksym;
+void bpf_obj_drop_impl(void *kptr, void *meta) __ksym;
+
+#define bpf_obj_new(type) ((type *)bpf_obj_new_impl(bpf_core_type_id_local(type), NULL))
+#define bpf_obj_drop(kptr) bpf_obj_drop_impl(kptr, NULL)
+
+int bpf_list_push_front_impl(struct bpf_list_head *head,
+				    struct bpf_list_node *node,
+				    void *meta, __u64 off) __ksym;
+#define bpf_list_push_front(head, node) bpf_list_push_front_impl(head, node, NULL, 0)
+
+int bpf_list_push_back_impl(struct bpf_list_head *head,
+				   struct bpf_list_node *node,
+				   void *meta, __u64 off) __ksym;
+#define bpf_list_push_back(head, node) bpf_list_push_back_impl(head, node, NULL, 0)
+
+struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ksym;
+struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksym;
+bool bpf_list_empty(struct bpf_list_head *head) __ksym;
+struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
+				   struct bpf_list_node *node) __ksym;
+
+struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
+				      struct bpf_rb_node *node) __ksym;
+int bpf_rbtree_add_impl(struct bpf_rb_root *root, struct bpf_rb_node *node,
+			bool (less)(struct bpf_rb_node *a, const struct bpf_rb_node *b),
+			void *meta, __u64 off) __ksym;
+#define bpf_rbtree_add(head, node, less) bpf_rbtree_add_impl(head, node, less, NULL, 0)
+
+struct bpf_rb_node *bpf_rbtree_first(struct bpf_rb_root *root) __ksym;
+
+void *bpf_refcount_acquire_impl(void *kptr, void *meta) __ksym;
+#define bpf_refcount_acquire(kptr) bpf_refcount_acquire_impl(kptr, NULL)
+
+#endif	/* __UFQ_COMMON_BPF_H */
diff --git a/tools/ufq_iosched/include/ufq/common.h b/tools/ufq_iosched/include/ufq/common.h
new file mode 100644
index 000000000000..c537c9e34056
--- /dev/null
+++ b/tools/ufq_iosched/include/ufq/common.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 KylinSoft Corporation.
+ * Copyright (c) 2026 Kaitao Cheng <chengkaitao@kylinos.cn>
+ */
+#ifndef __UFQ_IOSCHED_COMMON_H
+#define __UFQ_IOSCHED_COMMON_H
+
+#ifdef __KERNEL__
+#error "Should not be included by BPF programs"
+#endif
+
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <errno.h>
+#include <bpf/bpf.h>
+#include "simple_stat.h"
+
+typedef uint8_t u8;
+typedef uint16_t u16;
+typedef uint32_t u32;
+typedef uint64_t u64;
+typedef int8_t s8;
+typedef int16_t s16;
+typedef int32_t s32;
+typedef int64_t s64;
+
+#define UFQ_ERR(__fmt, ...)							\
+	do {									\
+		fprintf(stderr, "[UFQ_ERR] %s:%d", __FILE__, __LINE__);		\
+		if (errno)							\
+			fprintf(stderr, " (%s)\n", strerror(errno));		\
+		else								\
+			fprintf(stderr, "\n");					\
+		fprintf(stderr, __fmt __VA_OPT__(,) __VA_ARGS__);		\
+		fprintf(stderr, "\n");						\
+										\
+		exit(EXIT_FAILURE);						\
+	} while (0)
+
+#define UFQ_ERR_IF(__cond, __fmt, ...)						\
+	do {									\
+		if (__cond)							\
+			UFQ_ERR((__fmt) __VA_OPT__(,) __VA_ARGS__);		\
+	} while (0)
+
+/*
+ * struct ufq_iosched_ops can grow over time. With common.bpf.h::UFQ_OPS_DEFINE()
+ * and UFQ_OPS_LOAD()/UFQ_OPS_ATTACH(), libbpf performs struct_ops attachment.
+ */
+#define UFQ_OPS_OPEN(__ops_name, __ufq_name) ({					\
+	struct __ufq_name *__skel;						\
+										\
+	__skel = __ufq_name##__open();						\
+	UFQ_ERR_IF(!__skel, "Could not open " #__ufq_name);			\
+	(void)__skel->maps.__ops_name;						\
+	__skel;									\
+})
+
+#define UFQ_OPS_LOAD(__skel, __ops_name, __ufq_name) ({				\
+	(void)(__skel)->maps.__ops_name;					\
+	UFQ_ERR_IF(__ufq_name##__load((__skel)), "Failed to load skel");	\
+})
+
+/*
+ * New versions of bpftool emit additional link placeholders for BPF maps,
+ * and set up BPF skeleton so libbpf can auto-attach BPF maps (v1.5+). Old
+ * libbpf ignores those links. Disable autoattach on newer libbpf to avoid
+ * attaching twice when we attach struct_ops explicitly.
+ */
+#if LIBBPF_MAJOR_VERSION > 1 ||							\
+	(LIBBPF_MAJOR_VERSION == 1 && LIBBPF_MINOR_VERSION >= 5)
+#define __UFQ_OPS_DISABLE_AUTOATTACH(__skel, __ops_name)			\
+	bpf_map__set_autoattach((__skel)->maps.__ops_name, false)
+#else
+#define __UFQ_OPS_DISABLE_AUTOATTACH(__skel, __ops_name) do {} while (0)
+#endif
+
+#define UFQ_OPS_ATTACH(__skel, __ops_name, __ufq_name) ({			\
+	struct bpf_link *__link;						\
+	__UFQ_OPS_DISABLE_AUTOATTACH(__skel, __ops_name);			\
+	UFQ_ERR_IF(__ufq_name##__attach((__skel)), "Failed to attach skel");	\
+	__link = bpf_map__attach_struct_ops((__skel)->maps.__ops_name);		\
+	UFQ_ERR_IF(!__link, "Failed to attach struct_ops");			\
+	__link;									\
+})
+
+#endif	/* __UFQ_IOSCHED_COMMON_H */
+
diff --git a/tools/ufq_iosched/include/ufq/simple_stat.h b/tools/ufq_iosched/include/ufq/simple_stat.h
new file mode 100644
index 000000000000..286d5999a457
--- /dev/null
+++ b/tools/ufq_iosched/include/ufq/simple_stat.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 KylinSoft Corporation.
+ * Copyright (c) 2026 Kaitao Cheng <chengkaitao@kylinos.cn>
+ */
+#ifndef __UFQ_SIMPLE_STAT_H
+#define __UFQ_SIMPLE_STAT_H
+
+enum ufq_simp_stat_index {
+	UFQ_SIMP_INSERT_CNT,
+	UFQ_SIMP_INSERT_SIZE,
+	UFQ_SIMP_DISPATCH_CNT,
+	UFQ_SIMP_DISPATCH_SIZE,
+	UFQ_SIMP_MERGE_CNT,
+	UFQ_SIMP_MERGE_SIZE,
+	UFQ_SIMP_FINISH_CNT,
+	UFQ_SIMP_FINISH_SIZE,
+	UFQ_SIMP_STAT_MAX,
+};
+
+#endif /* __UFQ_SIMPLE_STAT_H */
diff --git a/tools/ufq_iosched/ufq_simple.bpf.c b/tools/ufq_iosched/ufq_simple.bpf.c
new file mode 100644
index 000000000000..63edd7772600
--- /dev/null
+++ b/tools/ufq_iosched/ufq_simple.bpf.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 KylinSoft Corporation.
+ * Copyright (c) 2026 Kaitao Cheng <chengkaitao@kylinos.cn>
+ */
+#include <ufq/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+#define UFQ_DISK_SUM		20
+#define BLK_MQ_INSERT_AT_HEAD	0x01
+#define REQ_OP_MASK		((1 << 8) - 1)
+#define SECTOR_SHIFT		9
+
+struct {
+	__uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
+	__uint(key_size, sizeof(u32));
+	__uint(value_size, sizeof(u64));
+	__uint(max_entries, UFQ_SIMP_STAT_MAX);
+} stats SEC(".maps");
+
+enum ufq_simp_data_dir {
+	UFQ_SIMP_READ,
+	UFQ_SIMP_WRITE,
+	UFQ_SIMP_DIR_COUNT
+};
+
+struct queue_list_node {
+	struct bpf_list_node node;
+	struct request __kptr * req;
+};
+
+struct sort_tree_node {
+	struct bpf_refcount ref;
+	struct bpf_rb_node rb_node;
+	struct bpf_list_node list_node;
+	u64 key;
+	struct request __kptr * req;
+};
+
+struct ufq_simple_data {
+	struct bpf_spin_lock lock;
+	struct bpf_rb_root sort_tree_read __contains(sort_tree_node, rb_node);
+	struct bpf_rb_root sort_tree_write __contains(sort_tree_node, rb_node);
+	struct bpf_list_head dispatch __contains(queue_list_node, node);
+	struct bpf_list_head fifo_list __contains(sort_tree_node, list_node);
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(max_entries, UFQ_DISK_SUM);
+	__type(key, s32);
+	__type(value, struct ufq_simple_data);
+} ufq_map SEC(".maps");
+
+static void stat_add(u32 idx, u32 val)
+{
+	u64 *cnt_p = bpf_map_lookup_elem(&stats, &idx);
+
+	if (cnt_p)
+		(*cnt_p) += val;
+}
+
+static void stat_sub(u32 idx, u32 val)
+{
+	u64 *cnt_p = bpf_map_lookup_elem(&stats, &idx);
+
+	if (cnt_p)
+		(*cnt_p) -= val;
+}
+
+static bool sort_tree_less(struct bpf_rb_node *a, const struct bpf_rb_node *b)
+{
+	struct sort_tree_node *node_a, *node_b;
+
+	node_a = container_of(a, struct sort_tree_node, rb_node);
+	node_b = container_of(b, struct sort_tree_node, rb_node);
+
+	return node_a->key < node_b->key;
+}
+
+static struct ufq_simple_data *dd_init_sched(struct request_queue *q)
+{
+	struct ufq_simple_data ufq_sd = {}, *ufq_sp;
+	int ret, id = q->id;
+
+	bpf_printk("ufq_simple init sched!");
+	ret = bpf_map_update_elem(&ufq_map, &id, &ufq_sd, BPF_NOEXIST);
+	if (ret) {
+		bpf_printk("ufq_simple/init_sched: update ufq_map err %d", ret);
+		return NULL;
+	}
+
+	ufq_sp = bpf_map_lookup_elem(&ufq_map, &id);
+	if (!ufq_sp) {
+		bpf_printk("ufq_simple/init_sched: lookup queue id %d in ufq_map failed", id);
+		return NULL;
+	}
+
+	return ufq_sp;
+}
+
+int BPF_STRUCT_OPS(ufq_simple_init_sched, struct request_queue *q)
+{
+	if (dd_init_sched(q))
+		return 0;
+	else
+		return -EPERM;
+}
+
+int BPF_STRUCT_OPS(ufq_simple_exit_sched, struct request_queue *q)
+{
+	int id = q->id;
+
+	bpf_printk("ufq_simple exit sched!");
+	bpf_map_delete_elem(&ufq_map, &id);
+	return 0;
+}
+
+int BPF_STRUCT_OPS(ufq_simple_insert_req, struct request_queue *q,
+		   struct request *rq, blk_insert_t flags,
+		   struct list_head *freeq)
+{
+	struct ufq_simple_data *ufq_sd;
+	struct queue_list_node *qnode;
+	struct sort_tree_node *snode, *lnode;
+	int id = q->id, ret = 0;
+	struct request *acquired, *old;
+	enum ufq_simp_data_dir dir = ((rq->cmd_flags & REQ_OP_MASK) & 1) ?
+				   UFQ_SIMP_WRITE : UFQ_SIMP_READ;
+
+	ufq_sd = bpf_map_lookup_elem(&ufq_map, &id);
+	if (!ufq_sd) {
+		ufq_sd = dd_init_sched(q);
+		if (!ufq_sd) {
+			bpf_printk("ufq_simple/insert_req: dd_init_sched failed");
+			return -EPERM;
+		}
+	}
+
+	if (flags & BLK_MQ_INSERT_AT_HEAD) {
+		/* create queue_list_node */
+		qnode = bpf_obj_new(typeof(*qnode));
+		if (!qnode) {
+			bpf_printk("ufq_simple/insert_req: qnode alloc failed");
+			return -ENOMEM;
+		}
+
+		acquired = bpf_request_acquire(rq);
+		if (!acquired) {
+			bpf_obj_drop(qnode);
+			bpf_printk("ufq_simple/head-insert_req: request_acquire failed");
+			return -EPERM;
+		}
+
+		/* Set request for queue_list_node */
+		old = bpf_kptr_xchg(&qnode->req, acquired);
+		if (old)
+			bpf_request_release(old);
+
+		/* Add queue_list_node to dispatch list */
+		bpf_spin_lock(&ufq_sd->lock);
+		ret = bpf_list_push_back(&ufq_sd->dispatch, &qnode->node);
+		bpf_spin_unlock(&ufq_sd->lock);
+	} else {
+		/* create sort_tree_node */
+		snode = bpf_obj_new(typeof(*snode));
+		if (!snode) {
+			bpf_printk("ufq_simple/insert_req: sort_tree_node alloc failed");
+			return -ENOMEM;
+		}
+
+		/* Use request's starting sector as sort key */
+		snode->key = rq->__sector;
+
+		/*
+		 * Acquire request reference again for sort_tree_node (each node
+		 * needs independent reference)
+		 */
+		acquired = bpf_request_acquire(rq);
+		if (!acquired) {
+			bpf_obj_drop(snode);
+			bpf_printk("ufq_simple/insert_req: bpf_request_acquire failed");
+			return -EPERM;
+		}
+
+		/* Set request for sort_tree_node */
+		old = bpf_kptr_xchg(&snode->req, acquired);
+		if (old)
+			bpf_request_release(old);
+
+		/* Add sort_tree_node to red-black tree and list_node to fifo_list */
+		bpf_spin_lock(&ufq_sd->lock);
+		if (dir == UFQ_SIMP_READ)
+			bpf_rbtree_add(&ufq_sd->sort_tree_read, &snode->rb_node, sort_tree_less);
+		else
+			bpf_rbtree_add(&ufq_sd->sort_tree_write, &snode->rb_node, sort_tree_less);
+
+		/* Acquire reference count since the node is also added to fifo_list */
+		lnode = bpf_refcount_acquire(snode);
+		if (!lnode) {
+			struct bpf_rb_root *tree = (dir == UFQ_SIMP_READ) ?
+				&ufq_sd->sort_tree_read : &ufq_sd->sort_tree_write;
+			struct bpf_rb_node *rb_node;
+
+			rb_node = bpf_rbtree_remove(tree, &snode->rb_node);
+			bpf_spin_unlock(&ufq_sd->lock);
+			if (rb_node)
+				bpf_obj_drop(container_of(rb_node, struct sort_tree_node, rb_node));
+			bpf_printk("ufq_simple/insert_req: bpf_refcount_acquire failed");
+			return -EPERM;
+		}
+
+		ret = bpf_list_push_back(&ufq_sd->fifo_list, &lnode->list_node);
+		bpf_spin_unlock(&ufq_sd->lock);
+	}
+
+	if (!ret) {
+		stat_add(UFQ_SIMP_INSERT_CNT, 1);
+		stat_add(UFQ_SIMP_INSERT_SIZE, rq->__data_len);
+	}
+	return ret;
+}
+
+struct request *BPF_STRUCT_OPS(ufq_simple_dispatch_req, struct request_queue *q)
+{
+	struct request *rq = NULL;
+	struct bpf_list_node *list_node;
+	struct bpf_rb_node *rb_node = NULL;
+	struct queue_list_node *qnode;
+	struct sort_tree_node *snode, *lnode;
+	struct ufq_simple_data *ufq_sd;
+	int id = q->id;
+
+	ufq_sd = bpf_map_lookup_elem(&ufq_map, &id);
+	if (!ufq_sd) {
+		bpf_printk("ufq_simple/dispatch_req: ufq_map lookup %d failed", id);
+		return NULL;
+	}
+
+	bpf_spin_lock(&ufq_sd->lock);
+	list_node = bpf_list_pop_front(&ufq_sd->dispatch);
+
+	if (list_node) {
+		qnode = container_of(list_node, struct queue_list_node, node);
+		rq = bpf_kptr_xchg(&qnode->req, NULL);
+		bpf_spin_unlock(&ufq_sd->lock);
+		bpf_obj_drop(qnode);
+	} else {
+		rb_node = bpf_rbtree_first(&ufq_sd->sort_tree_read);
+		if (rb_node) {
+			rb_node = bpf_rbtree_remove(&ufq_sd->sort_tree_read, rb_node);
+		} else {
+			rb_node = bpf_rbtree_first(&ufq_sd->sort_tree_write);
+			if (rb_node)
+				rb_node = bpf_rbtree_remove(&ufq_sd->sort_tree_write, rb_node);
+		}
+
+		if (!rb_node) {
+			bpf_spin_unlock(&ufq_sd->lock);
+			goto out;
+		}
+
+		snode = container_of(rb_node, struct sort_tree_node, rb_node);
+
+		/* Get request from sort_tree_node (this will be returned) */
+		rq = bpf_kptr_xchg(&snode->req, NULL);
+
+		/* Remove list_node from fifo_list (must be done while holding lock) */
+		list_node = bpf_list_del(&ufq_sd->fifo_list, &snode->list_node);
+		bpf_spin_unlock(&ufq_sd->lock);
+
+		if (list_node) {
+			lnode = container_of(list_node, struct sort_tree_node, list_node);
+			bpf_obj_drop(lnode);
+		}
+		bpf_obj_drop(snode);
+	}
+	if (!rq)
+		bpf_printk("ufq_simple/dispatch_req: no request to dispatch");
+
+out:
+	if (rq) {
+		stat_add(UFQ_SIMP_DISPATCH_CNT, 1);
+		stat_add(UFQ_SIMP_DISPATCH_SIZE, rq->__data_len);
+	}
+
+	return rq;
+}
+
+bool BPF_STRUCT_OPS(ufq_simple_has_req, struct request_queue *q, int rqs_count)
+{
+	struct ufq_simple_data *ufq_sd;
+	bool has;
+	int id = q->id;
+
+	ufq_sd = bpf_map_lookup_elem(&ufq_map, &id);
+	if (!ufq_sd) {
+		bpf_printk("ufq_simple/has_req: ufq_map lookup %d failed", id);
+		return false;
+	}
+
+	bpf_spin_lock(&ufq_sd->lock);
+	has = !bpf_list_empty(&ufq_sd->dispatch) ||
+	      bpf_rbtree_root(&ufq_sd->sort_tree_read) ||
+	      bpf_rbtree_root(&ufq_sd->sort_tree_write);
+	bpf_spin_unlock(&ufq_sd->lock);
+
+	return has;
+}
+
+void BPF_STRUCT_OPS(ufq_simple_finish_req, struct request *rq)
+{
+	if (rq) {
+		stat_add(UFQ_SIMP_FINISH_CNT, 1);
+		stat_add(UFQ_SIMP_FINISH_SIZE, rq->__data_len);
+		bpf_request_put(rq);
+	}
+}
+
+struct request *BPF_STRUCT_OPS(ufq_simple_next_req, struct request_queue *q,
+			       struct request *rq)
+{
+	return NULL;
+}
+
+struct request *BPF_STRUCT_OPS(ufq_simple_former_req, struct request_queue *q,
+			       struct request *rq)
+{
+	return NULL;
+}
+
+struct request *BPF_STRUCT_OPS(ufq_simple_merge_req, struct request_queue *q,
+				struct request *rq, int *type)
+{
+	struct sort_tree_node *snode = NULL, *lnode = NULL;
+	sector_t rq_start, rq_end, other_start, other_end;
+	enum elv_merge mt = ELEVATOR_NO_MERGE;
+	struct bpf_list_node *list_node = NULL;
+	struct bpf_rb_node *rb_node = NULL;
+	struct ufq_simple_data *ufq_sd;
+	struct request *targ = NULL;
+	enum ufq_simp_data_dir dir;
+	struct bpf_rb_root *tree;
+	int id = q->id;
+	int count = 0;
+
+	*type = ELEVATOR_NO_MERGE;
+	dir = ((rq->cmd_flags & REQ_OP_MASK) & 1) ? UFQ_SIMP_WRITE : UFQ_SIMP_READ;
+	ufq_sd = bpf_map_lookup_elem(&ufq_map, &id);
+	if (!ufq_sd)
+		return NULL;
+
+	/* Calculate current request position and end */
+	rq_start = rq->__sector;
+	rq_end = rq_start + (rq->__data_len >> SECTOR_SHIFT);
+
+	if (dir == UFQ_SIMP_READ)
+		tree = &ufq_sd->sort_tree_read;
+	else
+		tree = &ufq_sd->sort_tree_write;
+
+	bpf_spin_lock(&ufq_sd->lock);
+	rb_node = bpf_rbtree_root(tree);
+	if (!rb_node) {
+		bpf_spin_unlock(&ufq_sd->lock);
+		return NULL;
+	}
+
+	while (mt == ELEVATOR_NO_MERGE && rb_node && count < 100) {
+		count++;
+		snode = container_of(rb_node, struct sort_tree_node, rb_node);
+		targ = bpf_kptr_xchg(&snode->req, NULL);
+		if (!targ)
+			break;
+
+		other_start = targ->__sector;
+		other_end = other_start + (targ->__data_len >> SECTOR_SHIFT);
+
+		targ = bpf_kptr_xchg(&snode->req, targ);
+		if (targ) {
+			bpf_spin_unlock(&ufq_sd->lock);
+			bpf_request_release(targ);
+			return NULL;
+		}
+
+		if (rq_start > other_end)
+			rb_node = bpf_rbtree_right(tree, rb_node);
+		else if (rq_end < other_start)
+			rb_node = bpf_rbtree_left(tree, rb_node);
+		else if (rq_end == other_start)
+			mt = ELEVATOR_FRONT_MERGE;
+		else if (other_end == rq_start)
+			mt = ELEVATOR_BACK_MERGE;
+		else
+			break;
+
+		if (mt) {
+			rb_node = bpf_rbtree_remove(tree, rb_node);
+			if (rb_node) {
+				snode = container_of(rb_node,
+					struct sort_tree_node, rb_node);
+				targ = bpf_kptr_xchg(&snode->req, NULL);
+
+				list_node = bpf_list_del(&ufq_sd->fifo_list,
+							 &snode->list_node);
+				bpf_spin_unlock(&ufq_sd->lock);
+				if (targ) {
+					*type = mt;
+					stat_add(UFQ_SIMP_MERGE_CNT, 1);
+					stat_add(UFQ_SIMP_MERGE_SIZE, targ->__data_len);
+					stat_sub(UFQ_SIMP_INSERT_CNT, 1);
+					stat_sub(UFQ_SIMP_INSERT_SIZE, targ->__data_len);
+				}
+
+				if (list_node) {
+					lnode = container_of(list_node,
+						struct sort_tree_node, list_node);
+					bpf_obj_drop(lnode);
+				}
+
+				bpf_obj_drop(snode);
+			} else {
+				bpf_spin_unlock(&ufq_sd->lock);
+				*type = ELEVATOR_NO_MERGE;
+			}
+			return targ;
+		}
+	}
+	bpf_spin_unlock(&ufq_sd->lock);
+
+	return NULL;
+}
+
+UFQ_OPS_DEFINE(ufq_simple_ops,
+	.init_sched		= (void *)ufq_simple_init_sched,
+	.exit_sched		= (void *)ufq_simple_exit_sched,
+	.insert_req		= (void *)ufq_simple_insert_req,
+	.dispatch_req		= (void *)ufq_simple_dispatch_req,
+	.has_req		= (void *)ufq_simple_has_req,
+	.finish_req		= (void *)ufq_simple_finish_req,
+	.next_req		= (void *)ufq_simple_next_req,
+	.former_req		= (void *)ufq_simple_former_req,
+	.merge_req		= (void *)ufq_simple_merge_req,
+	.name			= "ufq_simple");
diff --git a/tools/ufq_iosched/ufq_simple.c b/tools/ufq_iosched/ufq_simple.c
new file mode 100644
index 000000000000..3e043e475461
--- /dev/null
+++ b/tools/ufq_iosched/ufq_simple.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 KylinSoft Corporation.
+ * Copyright (c) 2026 Kaitao Cheng <chengkaitao@kylinos.cn>
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <signal.h>
+#include <libgen.h>
+#include <bpf/bpf.h>
+#include <ufq/common.h>
+#include "ufq_simple.bpf.skel.h"
+
+const char help_fmt[] =
+"A simple ufq scheduler.\n"
+"\n"
+"Usage: %s [-v] [-d] [-h]\n"
+"\n"
+"  -v            Print version\n"
+"  -d            Print libbpf debug messages\n"
+"  -h            Display this help and exit\n";
+
+#define UFQ_SIMPLE_VERSION "0.1.0"
+#define TIME_INTERVAL 3
+static bool verbose;
+static volatile int exit_req;
+__u64 old_stats[UFQ_SIMP_STAT_MAX];
+
+static int libbpf_print_fn(enum libbpf_print_level level, const char *format, va_list args)
+{
+	if (level == LIBBPF_DEBUG && !verbose)
+		return 0;
+	return vfprintf(stderr, format, args);
+}
+
+static void sigint_handler(int simple)
+{
+	exit_req = 1;
+}
+
+static void read_stats(struct ufq_simple *skel, __u64 *stats)
+{
+	int nr_cpus = libbpf_num_possible_cpus();
+	__u64 cnts[UFQ_SIMP_STAT_MAX][nr_cpus];
+	__u32 idx;
+
+	memset(stats, 0, sizeof(stats[0]) * UFQ_SIMP_STAT_MAX);
+
+	for (idx = 0; idx < UFQ_SIMP_STAT_MAX; idx++) {
+		int ret, cpu;
+
+		ret = bpf_map_lookup_elem(bpf_map__fd(skel->maps.stats),
+					  &idx, cnts[idx]);
+		if (ret < 0)
+			continue;
+		for (cpu = 0; cpu < nr_cpus; cpu++)
+			stats[idx] += cnts[idx][cpu];
+	}
+}
+
+int main(int argc, char **argv)
+{
+	struct ufq_simple *skel;
+	struct bpf_link *link;
+	__u32 opt;
+
+	libbpf_set_print(libbpf_print_fn);
+	signal(SIGINT, sigint_handler);
+	signal(SIGTERM, sigint_handler);
+
+	skel = UFQ_OPS_OPEN(ufq_simple_ops, ufq_simple);
+
+	while ((opt = getopt(argc, argv, "vdh")) != -1) {
+		switch (opt) {
+		case 'v':
+			printf("ufq_simple version: %s\n", UFQ_SIMPLE_VERSION);
+			return 0;
+		case 'd':
+			verbose = true;
+			break;
+		default:
+			fprintf(stderr, help_fmt, basename(argv[0]));
+			return opt != 'h';
+		}
+	}
+
+	UFQ_OPS_LOAD(skel, ufq_simple_ops, ufq_simple);
+	link = UFQ_OPS_ATTACH(skel, ufq_simple_ops, ufq_simple);
+
+	printf("ufq_simple loop ...\n");
+	while (!exit_req) {
+		__u64 stats[UFQ_SIMP_STAT_MAX];
+
+		printf("--------------------------------\n");
+		read_stats(skel, stats);
+		printf("bps:%lluk  iops:%llu\n",
+		       (stats[UFQ_SIMP_FINISH_SIZE] -
+			old_stats[UFQ_SIMP_FINISH_SIZE]) / 1024 / TIME_INTERVAL,
+		       (stats[UFQ_SIMP_FINISH_CNT] -
+			old_stats[UFQ_SIMP_FINISH_CNT]) / TIME_INTERVAL);
+		printf("(insert:   cnt=%llu size=%llu) (merge:  cnt=%llu size=%llu)\n",
+				stats[UFQ_SIMP_INSERT_CNT], stats[UFQ_SIMP_INSERT_SIZE],
+				stats[UFQ_SIMP_MERGE_CNT], stats[UFQ_SIMP_MERGE_SIZE]);
+		printf("(dispatch: cnt=%llu size=%llu) (finish: cnt=%llu size=%llu)\n",
+			stats[UFQ_SIMP_DISPATCH_CNT], stats[UFQ_SIMP_DISPATCH_SIZE],
+			stats[UFQ_SIMP_FINISH_CNT], stats[UFQ_SIMP_FINISH_SIZE]);
+		memcpy(old_stats, stats, sizeof(old_stats));
+		sleep(TIME_INTERVAL);
+	}
+
+	printf("ufq_simple loop exit ...\n");
+	bpf_link__destroy(link);
+	ufq_simple__destroy(skel);
+
+	return 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
