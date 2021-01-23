Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33317C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 13:13:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79C622EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 13:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B79C622EBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oBjO7yHCLCiNV6qOpkRd05P5/mwqm2Wv09uFuTews1M=; b=x7mF7Uw7g+yyTvYSKA9fwpx+c1
	5dWyXXwYYMw4cx32OG0dRyp4UadQgMAypb2xt905uQ+ZGNNJTWjyV3DLxwoVssXSD+to8vO4clFax
	88mIPAr4at0rXH8S8SuNoa00M168CJcTbKAZeUL+lDfXyDvGr6pjEFzpoF8+4orMax/4aph4LDLWp
	MwOx3/A7Sh/4T0qdVBn2/csNmboLVUDNbLZU653LZtermhkP7WlD9qbSCZBRH3/rCyVOnEZObepL5
	MEl9rqWKEoTtWiCqpeLNcttTbxrvUIy0/JM8rJF7MIh2o+7U98+BZjP8lv/WC3talxEiX75lMlWZm
	FcREWiqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3Ij8-0002Cb-E6; Sat, 23 Jan 2021 13:13:18 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3Ij5-0002C2-DG
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 13:13:17 +0000
Received: from localhost.localdomain (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10NDBvPP016300;
 Sat, 23 Jan 2021 22:11:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10NDBvPP016300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611407519;
 bh=Q7tcC4mt1Zp1/28EOjcXN8NS6DZeIM4iUSeIYyg4BP0=;
 h=From:To:Cc:Subject:Date:From;
 b=JBOL6/Ut1OXSMkNuqOkuP1mw3zKhyYpeOsl332jaZ2dhz6MaQF+1skS5IKyR0w3dX
 sIggrNvWoGTSm6rD3ezdHYmpCLST+iBpJQ9NvPhEyGXCWSuw2Fet2mUJVsjX6v5a+h
 eAQSQXm2nij2HCQhm6KCtdntWVb54GJBXngu7xr6d95uHe8bQ2xCMLuPyCgmssFVY/
 3Lb1QDjBR8QLkbkiS3Er7V/eDG0BmkYk1euTzsw9GUPU6Txfot+YAIS2ujyU5BNQxG
 DOJjOpP18RbwqOf0HgoVxoJ294CYSfJugE6ppoFBxZyLH6z4PJ5d7DxnICwXx1TqSq
 6sJeFFc7dRxmw==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] doc: gcc-plugins: drop more stale information
Date: Sat, 23 Jan 2021 22:11:52 +0900
Message-Id: <20210123131152.734504-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_081315_929050_AF06D4C4 
X-CRM114-Status: GOOD (  17.85  )
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
old code accordingly. We do not mention specific version ranges like
"all gcc versions from 4.5 to 6.0" since we often forget to update the
documentation when the minimal compiler version is raised.

[2] Drop the C compiler statements

Since commit 77342a02ff6e ("gcc-plugins: drop support for GCC <= 4.7")
the GCC plugin infrastructure only supports g++.

[3] Drop supported architectures

As of v5.11-rc4, the infrastructure supports more architectures;
arm, arm64, mips, powerpc, riscv, s390, um, and x86. (just grep
"select HAVE_GCC_PLUGINS") Again, we often forget to update this
document when a new architecture is supported. Let's just say
"only some architectures".

[4] Update the apt-get example

We are discussing to bump the minimal version to GCC 5. Change the
package example to gcc-10-plugin-dev while we are here.

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
I do not understand what was intended by the $(src)/ prefix. Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/gcc-plugins.rst | 30 ++++++++++++----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
index 63379d0150e3..7ea16f93db06 100644
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
@@ -85,7 +81,7 @@ the cyclomatic complexity GCC plugin.
 4. How to add a new GCC plugin
 ==============================
 
-The GCC plugins are in $(src)/scripts/gcc-plugins/. You can use a file or a directory
-here. It must be added to $(src)/scripts/gcc-plugins/Makefile,
-$(src)/scripts/Makefile.gcc-plugins and $(src)/arch/Kconfig.
+The GCC plugins are in scripts/gcc-plugins/. You can use a file or a directory
+here. It must be added to /scripts/gcc-plugins/Makefile,
+scripts/Makefile.gcc-plugins and a relevant Kconfig file.
 See the cyc_complexity_plugin.c (CONFIG_GCC_PLUGIN_CYC_COMPLEXITY) GCC plugin.
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
