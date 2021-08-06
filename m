Return-Path: <SRS0=z89Q=M5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BA9C4338F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Aug 2021 17:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E88061102
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Aug 2021 17:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E88061102
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aSK1CjVdmdOn+AqTjGHbXR04mwJut+w7b3ZNJ/1odhI=; b=gKx
	SW1HPG+TppwO5sCAFQSLlFDsLcY7NAIKMoDILzW0BQI1n2/WR2SrFXfI+vWFclPwq+NAa9m/p2K6T
	0Q70cDYNXOt3ab5Kppwxdklw8uFwWEzjGAejSqhkw8KmZixQQ/TWITquo5K5MjMfmCz4lXNoNiJgC
	3GtU2SRonEgK0aQGeuj7tyMX11o9dhR+sbl/8XtqunbKPwxF0uA1SrS3EhtrT/2TaR4/GjjfVi1JC
	drV0Ar+Bn2r+GfvRWTcrOpqYY0ayUxtG0SQyW6Bzrvh42rxv+hDK/qnYr+yz543Oh5tR6bPLxSdwz
	JrDLcbdZebwoWd5VjVKLafvr3/qimSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC3cm-00D2pn-3e; Fri, 06 Aug 2021 17:27:12 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC3cj-00D2pJ-8F
 for linux-riscv@lists.infradead.org; Fri, 06 Aug 2021 17:27:10 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 s34-20020a05622a1aa2b0290290604b4996so738415qtc.15
 for <linux-riscv@lists.infradead.org>; Fri, 06 Aug 2021 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=DsQFy/CzTnQXNoNOJwZLuGXsmdWykdOYnmIA1IAJYnI=;
 b=SLKP8QT3UTFB+yk0MpS4S2ZYQEJh0gnI+gyTWPJzp356nk7gk9IXC4JqccWo2rsf3/
 mxbffoWg83nR9QH0xUW3c93TAvFZeiOCwFnyBppdGNWSrkzG4zWhh3dKLn5YLuKXJbd9
 Kxr9PqtKr7EAId4nMlv5kRVsG6V7G9nSeERVDXcCQeZGUpph8uOjFZYcZeihdrdHZ7sG
 Wijn7xnJJl2Uy1HwettgBfYqHN77gB3BnC3iKU7w8yZgCR0AKo4d/SJOJ/1AHNxoUB8h
 aEdlTKnQOo9Lyw3ZOZN+g7g29CTXQ76o0jFNXoZOkn8apGIHsDOeY6g/YqPyc8JegjGB
 qyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=DsQFy/CzTnQXNoNOJwZLuGXsmdWykdOYnmIA1IAJYnI=;
 b=efiQgJcheuKJ2i/3h4Nx9BT/yPj7zIiMg1KzfAptDupjnjb3EaOYZGZYzxVvgxMct+
 jmKNnJfraxKZsddn1zbprU1lYQhwFpi3LxxO1zr23rWY+NxmFkigpkBsc3gsfJuN3VWR
 4GvfDeqspoaJPYAJtI74ehAu6iJUWIMIrlRPYM977rRfwoiYcsS90kO9zo2iAvLE2/39
 pktLoNWSVMmknqPqGRi5sDn6jN7vRQTfKE/SpYSmaYMeUd5OZ2S9zt4UYe2RoU4EP/SY
 s5b86F5DwHv1za1HBPd7oXtAkUZfICBFGy53OykfNg6t4RQETBgF+3Zhdp/tXdzKGIbt
 d/hQ==
X-Gm-Message-State: AOAM530r3dJ8ZtjH3zr7AvF2usELpaHXwdZ5NPYUS5iWdo3of/7DjevG
 1fN4AG95naEnFS+1/8Vc0LZQ8UTH2yrAaAccx2c=
X-Google-Smtp-Source: ABdhPJxlVebXFVl1DX68O2az9jnUDVOkZsun/wYx/gJq/Ne5YY7RqIBz45lXfXNMiZy//yphthHXxKGwM9UXhBISE9s=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:d20b:bb87:51cd:edc3])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:27e4:: with SMTP id
 jt4mr1006501qvb.45.1628270826503; Fri, 06 Aug 2021 10:27:06 -0700 (PDT)
Date: Fri,  6 Aug 2021 10:27:01 -0700
Message-Id: <20210806172701.3993843-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v2] scripts/Makefile.clang: default to LLVM_IAS=1
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Khem Raj <raj.khem@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Michal Marek <michal.lkml@markovi.net>, 
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_102709_344906_23F76B59 
X-CRM114-Status: GOOD (  11.58  )
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

LLVM_IAS=1 controls enabling clang's integrated assembler via
-integrated-as. This was an explicit opt in until we could enable
assembler support in Clang for more architecures. Now we have support
and CI coverage of LLVM_IAS=1 for all architecures except a few more
bugs affecting s390 and powerpc.

This commit flips the default from opt in via LLVM_IAS=1 to opt out via
LLVM_IAS=0.  CI systems or developers that were previously doing builds
with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
opted-in.

This finally shortens the command line invocation when cross compiling
with LLVM to simply:

$ make ARCH=arm64 LLVM=1

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Drop "Currently" from Documentation/, as per Matthew.
* Drop Makefile and riscv Makefile, rebase on
  https://lore.kernel.org/lkml/20210805150102.131008-1-masahiroy@kernel.org/
  as per Masahiro.
* Base is kbuild/for-next, plus
  https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/
  https://lore.kernel.org/lkml/20210805150102.131008-1-masahiroy@kernel.org/.

 Documentation/kbuild/llvm.rst | 14 ++++++++------
 scripts/Makefile.clang        |  6 +++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index f8a360958f4c..e87ed5479963 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
 	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
 
-Currently, the integrated assembler is disabled by default. You can pass
-``LLVM_IAS=1`` to enable it.
+The integrated assembler is enabled by default. You can pass ``LLVM_IAS=0`` to
+disable it.
 
 Omitting CROSS_COMPILE
 ----------------------
 
 As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
 
-Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
-``--prefix=<path>`` to search for the GNU assembler and linker.
-
 If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
 from ``ARCH``.
 
@@ -78,7 +75,12 @@ That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
 
 For example, to cross-compile the arm64 kernel::
 
-	make ARCH=arm64 LLVM=1 LLVM_IAS=1
+	make ARCH=arm64 LLVM=1
+
+If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
+``--prefix=<path>`` to search for the GNU assembler and linker. ::
+
+	make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
 
 Supported Architectures
 -----------------------
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 1f4e3eb70f88..3ae63bd35582 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -22,12 +22,12 @@ else
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif # CROSS_COMPILE
 
-ifeq ($(LLVM_IAS),1)
-CLANG_FLAGS	+= -integrated-as
-else
+ifeq ($(LLVM_IAS),0)
 CLANG_FLAGS	+= -no-integrated-as
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+else
+CLANG_FLAGS	+= -integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)

base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
prerequisite-patch-id: 2654829756eb8a094a0ffad1679caa75a4d86619
prerequisite-patch-id: a51e7885ca2376d008bbf146a5589da247806f7b
prerequisite-patch-id: 6a0342755115ec459610657edac1075f069faa3d
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
