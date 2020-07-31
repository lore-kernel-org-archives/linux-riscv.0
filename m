Return-Path: <SRS0=O7qi=BK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8209C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 03:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EF8207F5
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 03:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGVMcu3X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="UhyvW7wK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EF8207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5wBtL+n3RrT70UAUyqsUnXmyiP0GknOoujc2sxOtVXE=; b=fGVMcu3XLqqB7KjxglqoNa32b
	239a2n/3UCiEmufiaH3tg6dsng2MF91yUv3jMHtVoo4kHEAYjY5A8ONBy/myjXoIp7lyv60pg7RZF
	WQaLmxSMc3StA1xgjq+O7KzDK57GAONSvp5VkVbhPDDXo8stQ8NBT8TF37HIqsCnWmhFyBXfApxu0
	TB56VqTBxfnzqlPsJ8UY2OpONmBafNFJKq4CcdlOsnpr5o2v6ILoUUWy5DV3gH8HHFhvZmTGdHP18
	09rb7ZxkWyUQSQqc323S23ba6gSDH3/C9OvJroN9orlYQtuVioOBgCL9zcJnVEikU4x2u4AvZjkmQ
	+HyrUUoyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1MBY-0000UT-JD; Fri, 31 Jul 2020 03:58:20 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1MBU-0000TT-8Y
 for linux-riscv@lists.infradead.org; Fri, 31 Jul 2020 03:58:18 +0000
Received: by mail-pj1-x1043.google.com with SMTP id t15so6529286pjq.5
 for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2020 20:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bYfQQ6S5bjcG2bJGPR3Q2loKgWo2M6rqDE7tcHpb8Fg=;
 b=UhyvW7wKUpdxHUwj1HmsVImKUA5IpJlIojn2hMem7McIBLSfOKclGkaXX6mX7gJe84
 TwhUMn5P/8N1iLxhlD3b5hlv54TWTj35ONZnAoU3sIT3sLRDWOdhqbGMAIFL76q7aaFr
 sdSCGTJj0l9yy/cwwnLzZo40WhDawgRGptlV7wkNfKuoWKh6TOVcEQtg7RDE2yiM10zA
 wAMhip7tu+jc4pq6UIDzaCgb03WzxOsVKVoPMmjKX1aIFb3cs6UDrOQpj6SLJ7yeJJWV
 095FqziY4TzjKCP4+HXo0prtalUCdUz0JOxCGBStmQ5yHC8ex75Ht2BSMcMZzjHcuzdL
 mmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bYfQQ6S5bjcG2bJGPR3Q2loKgWo2M6rqDE7tcHpb8Fg=;
 b=QhiBSs6KTqZXH7oLT62kzlpqSrmnblS/qPL6T3X7LqIONCXmgFYa+p82ognUFpdfvS
 fAnDFkn2nZSbHnDyF1FVC/OPWhIf0979tUE6N2/umiz6sqJ/X61eMo3ZnWwarP3XJ3p4
 IjNOHuVeWLSKC4eRIzZLE9DDwvVDCHcO63hfqmhHZKxIuSHR9wpT4YwQA8ppFBAm+NYb
 B/+OkHPL4EFaCr5nlFz1LiUIhIsQPQ7G9fiP2Dq2tbde54v//L2oYOLXD7LRoVCDHaYc
 xH0U9saIQiWerznYCxc6Bw7EFfH38fBfqQMJceL+oMO4yomIX40bUU8oycFU0MYwIYLd
 Wv+Q==
X-Gm-Message-State: AOAM531lwqgRy47tCq2b79QdpzumVx2E/D9ShajujuGyqyr6XCCr2lJj
 p+VsxHP4Yl4EH6q19KnkKiK11I5NJ30=
X-Google-Smtp-Source: ABdhPJzpcO92ky8AVG1Wv5GoVtcSYJakfDrYe8qd4e9yHy4vyEKigcm/N68ldCe91cptocCxw3eQyw==
X-Received: by 2002:a17:90b:353:: with SMTP id
 fh19mr2212639pjb.196.1596167893907; 
 Thu, 30 Jul 2020 20:58:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t28sm5088225pgn.81.2020.07.30.20.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 20:58:13 -0700 (PDT)
Date: Thu, 30 Jul 2020 20:58:13 -0700 (PDT)
X-Google-Original-Date: Thu, 30 Jul 2020 20:02:52 PDT (-0700)
Subject: Re: [PATCH v2] riscv: don't specify -mno-save-restore when building
 with clang < 11
In-Reply-To: <20200729044428.32460-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-91321ec8-a62c-46f3-908f-4bd21148cd05@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_235816_480035_AB9DF43C 
X-CRM114-Status: GOOD (  28.24  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 Jul 2020 21:44:28 PDT (-0700), tklauser@distanz.ch wrote:
> Clang before version 11 doesn't support -msave-restore and
> -mno-save-restore [1].
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/804
>
> This avoids the following message when building with clang 10 and older:
>
>   '-save-restore' is not a recognized feature for this target (ignoring feature)
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
> v2: use cc-option and check for clang version
>
>  arch/riscv/Makefile | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index fb6e37db836d..30e34946af86 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -44,7 +44,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> -KBUILD_CFLAGS += -mno-save-restore
> +KBUILD_CFLAGS += $(call cc-option,-mno-save-restore)
> +# Clang versions less than 11 do not support save-restore. See
> +# https://github.com/ClangBuiltLinux/linux/issues/804
> +ifeq ($(CONFIG_CC_IS_CLANG), y)
> +  ifeq ($(shell test $(CONFIG_CLANG_VERSION) -lt 110000; echo $$?),0)
> +    KBUILD_CFLAGS := $(filter-out -mno-save-restore,$(KBUILD_CFLAGS))
> +  endif
> +endif
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)

Ya, that seems worse ;).

Does this work?  I still get a -mno-save-restore on GCC, but I don't have an
LLVM lying around to test it with.

From 3e3ae8610db0abba9dd6a18e5d6b9bc8c495c2fc Mon Sep 17 00:00:00 2001
From: Palmer Dabbelt <palmerdabbelt@google.com>
Date: Thu, 30 Jul 2020 19:41:11 -0700
Subject: [PATCH 1/2] Kbuild: add cc-option-skipwarn

The documentation describes the behavior of this function.  In theory we could
just add -Werror to cc-option, but I don't want to chase around an infinate
tail of weird build bugs due to compilers that have this odd behavior.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 Documentation/kbuild/makefiles.rst | 7 +++++++
 scripts/Kbuild.include             | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 6515ebc12b6f..dba9faf4af29 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -507,6 +507,13 @@ more details, with real examples.
 	cflags-y will be assigned no value if first option is not supported.
 	Note: cc-option uses KBUILD_CFLAGS for $(CC) options
 
+   cc-option-skipwarn
+	Some compilers emit a warning on unsupported options rather than an
+	error.  This trips up cc-option, as the test compiler run will succeed
+	only to spit out the warning for every file.  cc-option-skipwarn allows
+	the build infastructure to detect compiles that behave this way, but
+	otherwise acts exactly as cc-option does.
+
    cc-option-yn
 	cc-option-yn is used to check if gcc supports a given option
 	and return 'y' if supported, otherwise 'n'.
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 9a15fbf66aa1..2efd3a8890c7 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -129,6 +129,12 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 cc-option = $(call __cc-option, $(CC),\
 	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
 
+# cc-option-skipwarn
+# Usage: cflags-y += $(call cc-option-skipwarn,-mno-save-restore)
+
+cc-option-skipwarn = $(call __cc-option, $(CC),\
+	$(KBUILD_CPPFLAGS) -Werror $(CC_OPTION_CFLAGS),$(1),$(2))
+
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-- 
2.28.0.163.g6104cc2f0b6-goog


From 8509566a1a3480ea309fd81317d8cd6125b5e294 Mon Sep 17 00:00:00 2001
From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 29 Jul 2020 06:44:28 +0200
Subject: [PATCH 2/2] riscv: don't specify -mno-save-restore unless it's
 supported

Clang before version 11 doesn't support -msave-restore and
-mno-save-restore [1].

[1] https://github.com/ClangBuiltLinux/linux/issues/804

This avoids the following message when building with clang 10 and older:

  '-save-restore' is not a recognized feature for this target (ignoring feature)

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
[Palmer: Use cc-option-nowarn]
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index fb6e37db836d..532029c887f1 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -44,7 +44,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
-KBUILD_CFLAGS += -mno-save-restore
+KBUILD_CFLAGS += $(call cc-option-skipwarn,-mno-save-restore)
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.28.0.163.g6104cc2f0b6-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
