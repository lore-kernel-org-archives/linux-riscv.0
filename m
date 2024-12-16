Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236DE77183
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMDUmGNrBco6rOuNW3RPkAFDa5wJwsYx+UU03/fKYdM=; b=sxSOv+5f7GmEyX
	g7py4L1LsGCpnheFQvPCQyoXp8m1hKc/Gh/uM2R6uJ0TAFL/1yWz8J0PUbRJDGHQ0wY6fWoMaK1oN
	tyWdE3mFzYFFbSju2poXT58qk79w9Z03diob3uEw/fc0J0A42aUe/4PmtsISMcTiFX7/ZHW3pTKD6
	nzKZWhbzmKix8gyZ09+SH7xvO4/+wAZVWzDWUOtmPNnPfSG06Ph0yJdvVCNKyvwHKsunzKg1ckL7d
	OSrYbHJmLzokaewG6SQRaudNNb1YPH6f78Xc80UpPAX/rQyNlI4UdhPgl2UeuoBkCKu02AeL5UNNe
	oBJfARmFIFEDNsY4arCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKHK-0000000BcfL-34mA;
	Mon, 16 Dec 2024 23:13:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNKHH-0000000BcdI-2Vuq
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 23:13:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2163bd70069so47706185ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734390806; x=1734995606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtErM1Ve2hYinmhWDXFCRPsbxJ5zQtoWuxH4M5kRJWs=;
        b=EECMQe1rjBe3CNQx5CLN3fy3XuATkPNvwXO8VLVGGkryKeee2/SZvIngjLyZFx4J1F
         8mQ/pd/xpqkWHJTy/nUcJCYe7BI4QdRebtIN08awpG1VswZxhMdzyCUL+232fPLR308b
         0hB2VN9OtUFzprkbr+UxbghLSQceeKjtWsmaeplQWo2pYyX+yXrgQmSzNsPzRr8wOVNr
         uthPsijRfzU8mmQaXWBcXz7wyYDItMwQqNqzzc5Ih7INz/WPcr7wb/PZ0dTQ1VeFqDHR
         fAVjfCAWVn4Ww8ftg6Yr9emGxuPYHwBppw+l9Vn2NEJYZNzH3RYitmoNsS5ej8h9f7Ol
         TeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390806; x=1734995606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtErM1Ve2hYinmhWDXFCRPsbxJ5zQtoWuxH4M5kRJWs=;
        b=Rw2deqrWA+WThd4a8qP2KXGIV+cqfs5zfve4y1zlMDpy/LXFjefSc0SuGki6kAssrB
         C3ClIpyV2nPFsR/vYtu4m7yCXau2KfXzw70VwYfWf+YE+6OygjagXNGKN+A7HAUGyrWG
         3DSjfMkPxH3Uy7DnL1MECMPTrRt39pNG6cWUhNg1rPJEMC7x7oa9I54hecIvRyn+Vzwy
         +6SBXt46N8jW/E7//Y4qm4PlZHIx6kjtde215Jn13Ez6RkdLh7UBUj3uFL4fqGJzvhEP
         PLc1Uyc8gUJIHZRG5WdLWAawnk+LXwXMFazw+kDP2Kq7btTVrOWhrzlGO/0sehGSJolW
         pWfA==
X-Forwarded-Encrypted: i=1; AJvYcCWYT858969LFqPxU06w+EMFK9oMwFJIfnCtEc0mGZPys/nxpF2B4tISpHzIf6rSEloa/TLJmREvbnAdUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9tgNkgIH7XrxpDCm4ADRX1mlHZUhUsI5unq2vHe1Il4CItFMc
	GFmjiSbD9e/bK0gsZE7+CgL9vqGjIVMKI0XWkVw+AJR8GEn/tSIRtJPYEmkANIs=
X-Gm-Gg: ASbGncutwsGEc5cmZiuC2NztLFYwm93SLKwt61JDviBqRHZMKcLCJPjVDBxK52D5x3U
	PGa2cPn4e1RZeey7ls68zlFPwa96Gdz3IpLdO2T8v3uLpkZRzSvWLPVxDVDnM0tfgvCROkfeV6K
	XNw+5VMCI/TtKp2EPM+EaYrc7v1mNKQ7PVgaIceTDt4U38sM6Hih0IqMBplvKR2Radsc/hq0iEE
	H4Pu+aEN9+FEtnz3Z+NTVSotZhklp2AhpeprlHn481fqN2JhAERmcO/5wfasmkk1vrPitkA
X-Google-Smtp-Source: AGHT+IG7d1EVk09Gyn4kffMe9mhj+HK2qa0XP67wFBNzKqGiDe300RSugOZB/wYYtlbfPKTuuRzmLQ==
X-Received: by 2002:a17:902:ecc8:b0:215:7421:262 with SMTP id d9443c01a7336-218929820a5mr216451045ad.12.1734390806556;
        Mon, 16 Dec 2024 15:13:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc47bsm48333255ad.63.2024.12.16.15.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:13:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 15:12:51 -0800
Subject: [PATCH 1/2] kbuild: Check version of objdump
MIME-Version: 1.0
Message-Id: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Nelson Chu <nelson@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3835; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IChtsS2vcC0zzlF9qX93bNksLgkX24amcVZg/Whalhg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rCFsFFrwPjpm/neppcomk8U6ZceR7/mol1y5/FNwstL
 W2dMm1JRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABO5ycPwv/bu6wu/imrKdDZq
 bjKZHBWWnnRkz7PCvC/pV51nvTyxJ5Hhn+mD3V2n+P5EHHj17tnntVdUz5lVzn/yf6butml/19y
 Lb+cEAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_151327_641906_E5F63E04 
X-CRM114-Status: GOOD (  16.10  )
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

Similar to ld-version, add a way to check the version of objdump. This
should most of the time end up being the binutils version or the llvm
version.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 init/Kconfig               | 10 +++++++
 scripts/Kconfig.include    |  6 ++++
 scripts/objdump-version.sh | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..0b5d36f939e1de89c12ebdd61e4815015314d4f1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -60,6 +60,16 @@ config LLD_VERSION
 	default $(ld-version) if LD_IS_LLD
 	default 0
 
+config OBJDUMP_IS_GNU
+	def_bool $(success,test "$(objdump-name)" = objdump)
+
+config OBJDUMP_IS_LLVM
+	def_bool $(success,test "$(objdump-name)" = llvm-objdump)
+
+config OBJDUMP_VERSION
+	int
+	default $(objdump-version)
+
 config RUSTC_VERSION
 	int
 	default $(rustc-version)
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..cb3e2d2564fea8cce780adb3be672c9596b7ccf2 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -58,6 +58,12 @@ $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supp
 ld-name := $(shell,set -- $(ld-info) && echo $1)
 ld-version := $(shell,set -- $(ld-info) && echo $2)
 
+# Get the objdump name, version, and error out if it is not supported.
+objdump-info := $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUMP))
+$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdump is not supported.)
+objdump-name := $(shell,set -- $(objdump-info) && echo $1)
+objdump-version := $(shell,set -- $(objdump-info) && echo $2)
+
 # machine bit flags
 #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
 #  $(m64-flag): -m64 if the compiler supports it, or an empty string otherwise.
diff --git a/scripts/objdump-version.sh b/scripts/objdump-version.sh
new file mode 100755
index 0000000000000000000000000000000000000000..fa24f8dc2d3c42fd1195fceb3c96b27f7127db25
--- /dev/null
+++ b/scripts/objdump-version.sh
@@ -0,0 +1,69 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Print the objdump name and its version in a 5 or 6-digit form.
+# Also, perform the minimum version check.
+
+set -e
+
+# Convert the version string x.y.z to a canonical 5 or 6-digit form.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+
+	# If the 2nd or 3rd field is missing, fill it with a zero.
+	#
+	# The 4th field, if present, is ignored.
+	# This occurs in development snapshots as in 2.35.1.20201116
+	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
+}
+
+orig_args="$@"
+
+# Get the first line of the --version output.
+IFS='
+'
+set -- $(LC_ALL=C "$@" --version)
+
+# Split the line on spaces.
+IFS=' '
+set -- $1
+
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
+if [ "$1" = GNU -a "$2" = objdump ]; then
+	shift $(($# - 1))
+	version=$1
+	min_version=$($min_tool_version binutils)
+	disp_name="GNU objdump"
+else
+	while [ $# -gt 1 -a "$1" != "LLVM" ]; do
+		shift
+	done
+
+	if [ "$1" = LLVM ]; then
+		version=$3
+		min_version=$($min_tool_version llvm)
+		disp_name="llvm-objdump"
+	else
+		echo "$orig_args: unknown objdump" >&2
+		exit 1
+	fi
+fi
+
+version=${version%%[!0-9.]*}
+
+cversion=$(get_canonical_version $version)
+min_cversion=$(get_canonical_version $min_version)
+
+if [ "$cversion" -lt "$min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** objdump is too old."
+	echo >&2 "***   Your $disp_name version:    $version"
+	echo >&2 "***   Minimum $disp_name version: $min_version"
+	echo >&2 "***"
+	exit 1
+fi
+
+echo objdump $cversion

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
