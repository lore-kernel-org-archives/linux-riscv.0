Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235E9C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gUqJL8cl3897FoRTMIn+gDVoPk/IARpLutZhGkVRTc0=; b=mQJDzVMPZ9MuH7P2RbxGktKMkw
	Ku+PRQKvfI0+otLMWNq9kVeq78rvQQYLBUuHfM61WK14BCaXXgbt/A6zkCuTNgy7eYzT2N2zVu4tI
	DOCY7A3GMzrfcbTAItawmlwKoq+TAux9aOpajdJR2ZIYjLRscr7N3lvO+xe/Az0xarscPiiPcXdYx
	G7nvWg9OuRnQy3my0I55f3cio0+9nMSHXLGJ+go6qHf9K2Fu49Fs4m0Ff9HVQbBqEZM/uBI5+K3m+
	LzZNoIsAiMKKmDy0/A1Iq6iUbYWbZWtDkOtTipll2UxmEL71gA8tBki2mYHpMgGqefll6sSq16utt
	IRWo9WnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dp1-00000003MQl-30cR;
	Fri, 10 May 2024 00:09:11 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dov-00000003MM0-1ilR
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:09 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f47c380709so1117744b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299742; x=1715904542; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNdh0DGLEI6gEofoq5pc03LS982vJLdNlPLV5JPTShI=;
        b=q6navpqP3jgFuTBP86Pakess5uliOMdOFY3bkmeVP57sUYlm3/+HV2oE3uER5k/voh
         iMoyieBkhUslU+Gr19twIJHPP0jSri8bHLIlFJKClR93r/Ve0cD/zp2LNjDtEjSlFeoZ
         Y9iJwgoURAfp5deMufTyZy/L0pCZ0rqTUhjUVMoxp9cm0WjNV4pR8pAQiZwieozB2mgw
         jBbx9NXPS/nY9ugTJZlDmLhPZ17bwxOfECRueLn4VU/UL+MSSqOVF8Pq/vqpITqvsXRs
         QJSIGu8Uh5+chbdThkdRUOOYSksjwpdIu9IFi1/L5gMrIpCICqKFI7L13a0Lpww5VCqM
         jZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299742; x=1715904542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNdh0DGLEI6gEofoq5pc03LS982vJLdNlPLV5JPTShI=;
        b=EwfDY+InvqqxpskqxPJUA1Koj+yQ1xs4M8SOObFRA/PPLISA4gDwZSBtmJI4ow2ZjI
         AZIc8L7V7o1Y1SDrGh74EQ3BoUWWcSgFIPlJvMpETeZTDu6UWnX50ZBALi6kMQtyDZlT
         l17wY33Vrpc3XV/5CelcgL1R2oW4Xf89muNDETCKS4fkVFMtL/5sx/c1IUo5wNwevZiJ
         F7ax/XrSxjNVbz9tAg81keyIrG3lrrDrh+aUfapovtKLpc7tYzbGwcR1avBKJ3JIdJAb
         kVM4Fgj4Zib6ZZUlCRZzARMWpOH6/T565ryaEarEiGPsremhwo8QFi7eDqQmt/IaL5zu
         qfpA==
X-Forwarded-Encrypted: i=1; AJvYcCWbzhr3RKHPGnzYQuOHWTEfwVjeqkz6E2uhnypIY1RE1bBbKKbwSmweO1q7/TXp4tqKp4cIh33viI/yzf2ryDPt3+a428vNMxAIEKrx6i13
X-Gm-Message-State: AOJu0YyU/+YmNwr6tw7xIa8+/tuUeT85kUSnolNYW5hHKRici57LmE8J
	0PcA9EYEOMJ3vjhQD9f1qZFE3FeCnDRYkHG1iulVkSMLUeGzca5gPaikVeNl5kHhad21HbVeQsD
	qYQ==
X-Google-Smtp-Source: AGHT+IGtTUZs+3MsCtZfU8WOyARtKSKltxR3na4oeEBppwpGfuKUIqgIQ9le2QPvBBObPpo5IStZo3NSvjc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3c8a:b0:6f3:f447:57df with SMTP id
 d2e1a72fcca58-6f4e029a229mr27317b3a.1.1715299741860; Thu, 09 May 2024
 17:09:01 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:18 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-2-edliaw@google.com>
Subject: [PATCH v4 01/66] selftests: Compile with -D_GNU_SOURCE when including lib.mk
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170905_470277_B4513310 
X-CRM114-Status: GOOD (  10.95  )
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

lib.mk will add -D_GNU_SOURCE to CFLAGS by default.  This will make it
unnecessary to add #define _GNU_SOURCE in the source code.

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/Makefile | 4 ++--
 tools/testing/selftests/lib.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index f0431e6cb67e..9039f3709aff 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -170,11 +170,11 @@ ifneq ($(KBUILD_OUTPUT),)
   # $(realpath ...) resolves symlinks
   abs_objtree := $(realpath $(abs_objtree))
   BUILD := $(abs_objtree)/kselftest
-  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_objtree}/usr/include
+  KHDR_INCLUDES := -isystem ${abs_objtree}/usr/include
 else
   BUILD := $(CURDIR)
   abs_srctree := $(shell cd $(top_srcdir) && pwd)
-  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_srctree}/usr/include
+  KHDR_INCLUDES := -isystem ${abs_srctree}/usr/include
   DEFAULT_INSTALL_HDR_PATH := 1
 endif

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 3023e0e2f58f..e782f4c96aee 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -67,7 +67,7 @@ MAKEFLAGS += --no-print-directory
 endif

 ifeq ($(KHDR_INCLUDES),)
-KHDR_INCLUDES := -D_GNU_SOURCE -isystem $(top_srcdir)/usr/include
+KHDR_INCLUDES := -isystem $(top_srcdir)/usr/include
 endif

 # In order to use newer items that haven't yet been added to the user's system
@@ -188,6 +188,9 @@ endef
 clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
 	$(CLEAN)

+# Build with _GNU_SOURCE by default
+CFLAGS += -D_GNU_SOURCE
+
 # Enables to extend CFLAGS and LDFLAGS from command line, e.g.
 # make USERCFLAGS=-Werror USERLDFLAGS=-static
 CFLAGS += $(USERCFLAGS)
--
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
