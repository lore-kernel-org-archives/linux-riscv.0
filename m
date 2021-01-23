Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88712C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 13:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3519122AAB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 13:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3519122AAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDIhaY3MhAm78+kc+bYPHuLH0ApUwk2gexneQk9NpXM=; b=1BqD/XXvbSE+0jBq/8x2QHHgeD
	0Mv713FdwN8sc1qMxBmwNTwOoimucSJrJV4tjs3FajyygUGiTPNKydOD6IIZlaViZs21QRsNPVWnp
	QYFUxPXQ1ObSErmG75+vBmlHyeXFHUOl3IIhDLh32kuABf+QrOezVAzKDwoN0dWkHXz0ZrtJhJhoy
	oIEj7sPJ7zsuDVqNTSs5p5gcAgRzYJAZ8uldCVyDiXqNq0vARU/+DZ5s3PlHKqa5RetYGfkXXYUkg
	GTqHUijz6u+V/IpEptjpsUmWaDU/+x8bWzeptyzBS6yxwQyID+uzSlnoWGWorfXVBl/YBnkuUSIN7
	q3Eghk8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3J3k-0003vz-Th; Sat, 23 Jan 2021 13:34:36 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3J3h-0003vc-NI
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 13:34:35 +0000
Received: from localhost.localdomain (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 10NDXZc0024236;
 Sat, 23 Jan 2021 22:33:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 10NDXZc0024236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611408817;
 bh=DGvM3I3BmHsVYFSEZSnbjTe9JRbMp/dTjTb3DAh2UqM=;
 h=From:To:Cc:Subject:Date:From;
 b=Hx9Hz4R+DBToaPSugDtvoww3gYQDPMO+wlOHZe8aeyL1zFpZXzTHOzY/xcK5K1Lxw
 PpabTkzRX6ehwAgZPobGLGIgcdsyBKElG6/7H7g6X+ffANMQh+zhfZ/SKDzqTwEUHz
 rdUI3KqlByEjmY9k324Z8/2lLYexuGgqBgWQoaAD350wKymFfvlD0BA2P4XFIdLAs4
 6xzu5c51Ge9FjqaS3Xj9Et5zLO2H5dADm6bMAJj0NuhNnr7/+U+RBFMp0jlPwf74JT
 UQbWvEcGFYrNTS84yfO7krWVEhmHJYEKruU7+VJyIVrLWzoEKj0rs76PYctjZrfn+x
 D7DA+elXrLprg==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v2] doc: gcc-plugins: drop more stale information
Date: Sat, 23 Jan 2021 22:33:33 +0900
Message-Id: <20210123133333.736453-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_083434_320147_795CA541 
X-CRM114-Status: GOOD (  18.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-hardening@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Robert Karszniewicz <r.karszniewicz@phytec.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[1] Drop the version information

The range of the supported GCC versions are always changing. The
current minimal GCC version is 4.9, and commit 1e860048c53e
("gcc-plugins: simplify GCC plugin-dev capability test") removed the
old code accordingly.

We do not need to mention specific version ranges like "all gcc versions
from 4.5 to 6.0" since we forget to update the documentation when we
raise the minimal compiler version.

[2] Drop the C compiler statements

Since commit 77342a02ff6e ("gcc-plugins: drop support for GCC <= 4.7")
the GCC plugin infrastructure only supports g++.

[3] Drop supported architectures

As of v5.11-rc4, the infrastructure supports more architectures;
arm, arm64, mips, powerpc, riscv, s390, um, and x86. (just grep
"select HAVE_GCC_PLUGINS") Again, we miss to update this document when a
new architecture is supported. Let's just say "only some architectures".

[4] Update the apt-get example

We are now discussing to bump the minimal version to GCC 5. The GCC 4.9
support will be removed sooner or later. Change the package example to
gcc-10-plugin-dev while we are here.

[5] Update the build target

Since commit ce2fd53a10c7 ("kbuild: descend into scripts/gcc-plugins/
via scripts/Makefile"), "make gcc-plugins" is not supported.
"make scripts" builds all the enabled plugins, including some other
tools.

[6] Update the steps for adding a new plugin

At first, all CONFIG options for GCC plugins were located in arch/Kconfig.
After commit 45332b1bdfdc ("gcc-plugins: split out Kconfig entries to
scripts/gcc-plugins/Kconfig"), scripts/gcc-plugins/Kconfig became the
central place to collect plugin CONFIG options. In my understanding,
this requirement no longer exists because commit 9f671e58159a ("security:
Create "kernel hardening" config area") moved some of plugin CONFIG
options to another file. Find an appropriate place to add the new CONFIG.

The sub-directory support was never used by anyone, and removed by
commit c17d6179ad5a ("gcc-plugins: remove unused GCC_PLUGIN_SUBDIR").

Remove the useless $(src)/ prefix.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Remove the info about sub-directory support

 Documentation/kbuild/gcc-plugins.rst | 31 +++++++++++++---------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
index 63379d0150e3..979887558e72 100644
--- a/Documentation/kbuild/gcc-plugins.rst
+++ b/Documentation/kbuild/gcc-plugins.rst
@@ -11,16 +11,13 @@ compiler [1]_. They are useful for runtime instrumentation and static analysis.
 We can analyse, change and add further code during compilation via
 callbacks [2]_, GIMPLE [3]_, IPA [4]_ and RTL passes [5]_.
 
-The GCC plugin infrastructure of the kernel supports all gcc versions from
-4.5 to 6.0, building out-of-tree modules, cross-compilation and building in a
-separate directory.
-Plugin source files have to be compilable by both a C and a C++ compiler as well
-because gcc versions 4.5 and 4.6 are compiled by a C compiler,
-gcc-4.7 can be compiled by a C or a C++ compiler,
-and versions 4.8+ can only be compiled by a C++ compiler.
+The GCC plugin infrastructure of the kernel supports building out-of-tree
+modules, cross-compilation and building in a separate directory.
+Plugin source files have to be compilable by a C++ compiler.
 
-Currently the GCC plugin infrastructure supports only the x86, arm, arm64 and
-powerpc architectures.
+Currently the GCC plugin infrastructure supports only some architectures.
+Grep "select HAVE_GCC_PLUGINS" to find out which architectures support
+GCC plugins.
 
 This infrastructure was ported from grsecurity [6]_ and PaX [7]_.
 
@@ -53,8 +50,7 @@ $(src)/scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h,
 $(src)/scripts/gcc-plugins/gcc-generate-rtl-pass.h**
 
 	These headers automatically generate the registration structures for
-	GIMPLE, SIMPLE_IPA, IPA and RTL passes. They support all gcc versions
-	from 4.5 to 6.0.
+	GIMPLE, SIMPLE_IPA, IPA and RTL passes.
 	They should be preferred to creating the structures by hand.
 
 
@@ -62,9 +58,9 @@ Usage
 =====
 
 You must install the gcc plugin headers for your gcc version,
-e.g., on Ubuntu for gcc-4.9::
+e.g., on Ubuntu for gcc-10::
 
-	apt-get install gcc-4.9-plugin-dev
+	apt-get install gcc-10-plugin-dev
 
 Or on Fedora::
 
@@ -76,7 +72,7 @@ Enable a GCC plugin based feature in the kernel config::
 
 To compile only the plugin(s)::
 
-	make gcc-plugins
+	make scripts
 
 or just run the kernel make and compile the whole kernel with
 the cyclomatic complexity GCC plugin.
@@ -85,7 +81,8 @@ the cyclomatic complexity GCC plugin.
 4. How to add a new GCC plugin
 ==============================
 
-The GCC plugins are in $(src)/scripts/gcc-plugins/. You can use a file or a directory
-here. It must be added to $(src)/scripts/gcc-plugins/Makefile,
-$(src)/scripts/Makefile.gcc-plugins and $(src)/arch/Kconfig.
+The GCC plugins are in scripts/gcc-plugins/. You need to put plugin source files
+right under scripts/gcc-plugins/. Creating subdirectories is not supported.
+It must be added to scripts/gcc-plugins/Makefile, scripts/Makefile.gcc-plugins
+and a relevant Kconfig file.
 See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
