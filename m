Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F398CC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KSxCMrQ5VySK9Qrm1a18W70x+DLiiNm9Vj7i3u57Ma0=; b=ip4BSFO2hofspb
	QixvoOMH5toeII2yy/b1z0PoZkYBov/uqKydwGSwrJLyD1ZrZ2IHhGy4U0Nko48mBmkU4Xw1ziMD0
	2Brc00eqlfY4Y8FGOIIbtUy1wdh/FQqY/kJx0RdCfjJiOGJG/52wcrYMl3WOGu+jsEXEKhjja2Uv/
	4jXV9n2c9cH9MCQnZZN//dokHyO7gWylv9ahOzbE01WlnUSNxYYW3cOWGPlyYKMqDNpmO0KzgZPZC
	QNuNe5T1UlkgITXwBBFVOXokfdod5G262OitbKIze1Nf/LwNLRYf9E9KViS1pB7YbLwOuAMUz8Znw
	V57owXyJzy323dAP4ZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKRP-004iQa-1Z;
	Wed, 16 Aug 2023 17:36:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKRN-004iPT-00
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 17:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AF38643C8;
	Wed, 16 Aug 2023 17:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C38C433CA;
	Wed, 16 Aug 2023 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692207375;
	bh=m679p/qT6+EyvubNhxEO5K2mUWdE4N+P6efMLjeRxGw=;
	h=From:Date:Subject:To:Cc:From;
	b=HfNrC/VNXLU2zN7yz9ioqbbYI6MatQwhSss0CKArWGV0bLb53MhC2Kn+h63zcgnnQ
	 OaZ/LCaai2p+1nZtfOuojFokIT6y8ofycIxMPhbzOl8sm8tV/996S8V/UexSqerVZY
	 RGTXxgMANVI8jjVn0Ijlyp6FyHQ/8LzT9BBhiNvfc6byvFwkqVEBwV0Z6rwr5JMc7N
	 nqR4vYi4RIePFPxkmOjmK2e/LOvNyhKLhIfC3pKTNV7hvnKT5mxotP2LY7LAEVZT1m
	 si9DTo4nMo8DNkn3gv+8SBh2IFyyd72Z1c8ujqmVMVVIoBXgz79/oKZF7vDb75ciKF
	 xhOCoVH+zNJfA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 16 Aug 2023 10:35:43 -0700
Subject: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
MIME-Version: 1.0
Message-Id: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO4I3WQC/x3MSwqAMAwA0atI1haaih+8ikipNWpAqjQqgnh3i
 8u3mHlAKDIJtNkDkS4W3kIC5hn4xYWZFI/JYLQpdIOViiz+UiMN52w5TJuVfeVD6RqLskaHzht
 I8R5p4vsfd/37fgujfGNoAAAA
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 akpm@linux-foundation.org
Cc: conor@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=nathan@kernel.org;
 h=from:subject:message-id; bh=m679p/qT6+EyvubNhxEO5K2mUWdE4N+P6efMLjeRxGw=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCl3OfkExD9F7fHcujvxoHro5+nPGv/lFzIzHs08Et660
 qvfptW3o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkDR/DH472fWeuhOS5cjye
 aX1hB2fRRe31btynWoT6ZoXvc+1t4GP4Z6P2VmhKnsbGngTdXzUGjAphT66kWt9Ma/Sefn3X04d
 XmAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_103617_125076_04CED79E 
X-CRM114-Status: GOOD (  11.50  )
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

When building for ARCH=riscv using LLVM < 14, there is an error with
CONFIG_DEBUG_INFO_SPLIT=y:

  error: A dwo section may not contain relocations

This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
'-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
with newer versions of LLVM:

  $ clang --target=riscv64-linux-gnu -gsplit-dwarf -c -o /dev/null -x c /dev/null
  clang: error: -gsplit-dwarf is unsupported with RISC-V linker relaxation (-mrelax)

GCC silently had a similar issue that was resolved with GCC 12.x.
Restrict CONFIG_DEBUG_INFO_SPLIT for RISC-V when using LLVM or GCC <
12.x to avoid these known issues.

Link: https://github.com/ClangBuiltLinux/linux/issues/1914
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202308090204.9yZffBWo-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Since this only impacts RISC-V, it seems reasonable that this would go
in via their tree but I have added Andrew in case he wants to take it.
---
 lib/Kconfig.debug | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d6798513a8c2..bd51274f4771 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -355,6 +355,11 @@ endchoice # "Compressed Debug information"
 config DEBUG_INFO_SPLIT
 	bool "Produce split debuginfo in .dwo files"
 	depends on $(cc-option,-gsplit-dwarf)
+	# RISC-V linker relaxation + -gsplit-dwarf has issues with LLVM and GCC
+	# prior to 12.x:
+	# https://github.com/llvm/llvm-project/issues/56642
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
+	depends on !RISCV || GCC_VERSION >= 120000
 	help
 	  Generate debug info into separate .dwo files. This significantly
 	  reduces the build directory size for builds with DEBUG_INFO,

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-riscv-debug_info_split-0713571a1ac2

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
