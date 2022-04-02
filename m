Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1EC4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UeD+goNro8ybUotwkYYA1/ADBd7YeU5DmcMLFdhiNU=; b=RFHK+KTF9cTt5P
	8BuCtN8oYAt66AVW/RDhYPsXgn70k1xWYeuXmvfQ5K0rme/xfUYwyNXjIjtcR6+5I8GQX2MizlK5X
	KALLe98MTgvRNCivQYOSGi/MGVZsj0sVaF7aRv/rG5Vo2ExAnmX0p7xHbuEiG8itwHN5hG1F45YU/
	RdfuEwfRZOm6d8woiJ+GkoWFu2Q7I5iKkEsXQgkRL7shTVUl2OO3OImEZv68LlYsYy1vVBtfneOej
	0QO7U1CDEyRCiFQddtwVQcY0IiZseyHJfpbeDc9scIQQ9GGV1LyC7hfmPoH4+NUMsVg4wIlySDrSZ
	56D5pgxWohIbzpbAgTMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naVva-007zdk-JN; Sat, 02 Apr 2022 05:03:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naVvX-007zbx-9m
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 05:03:57 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so4262533pjk.4
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 22:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=jMnX9EwDk9B/aw5bO8HVu/sU4kD+BbpBPauEL2qiKx4=;
 b=ViQw8PLACBP3xKUfrnPxVyLuGlZYQyC8xj1oZnlBSUb7YXlWewI3dNZqJtdcZoL9B+
 KhEhDnvodyTLqs8kG986cVw+wV995en7vQ5K8QXbuWGcWxM754A/hkbK95MsSuAaqGtg
 mp/9ndPxm2y/4vED5DAbcuzPnDglFUmUHc48mxHa7nlhGFwgtSDa6GDEMiIJZwrRKOdM
 Hoej1k3LHvhIuQMv/tyrN2oeYejcN4VWNPwO3uz8N6P6QsDh/qrbnRj02EadoM8Zr9vj
 Nc6FoMwuJf4ljNJhGxMAcRrgyuRPL8aORM98amFNLejxWL2+vQ9yRZGl5wegcmpThfRQ
 4gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jMnX9EwDk9B/aw5bO8HVu/sU4kD+BbpBPauEL2qiKx4=;
 b=vkE5Q8ekTPvPU1ajwNf/aw+KwEG+TI/4Y+lxAbQexoC+n+3WhA4jRfJ/GdjSZeILWz
 T996mPh6TSPmuQluleWAnJbHcZzqQkMLEZ8UJVXGzrQtnh4hDx38BGMIXhcex/wXujDg
 7OCjgmfG0yNVsqMvCcZXAQTgZ3LV0nQPjrHa8x+klvEsKjIlWmEPocWeDWCoCG6H/MnV
 O55Z/5WkzKSQbrJhMCtf/rKdIHZYj09qo13k3Oup06cOm3bVYFz5qF5AsAvEW85wyVrp
 3dNqyOxVtkgWMqbDYvHYpy1HwmTFei9DpBuPIFzucZ1qxZglWSxIw7oXhFtJ3VyccV2t
 wCdg==
X-Gm-Message-State: AOAM531LSFIKmVU5tbbM1s3ARm0kMgA/UibL8hcJbhnxXYxtV4wGPRqg
 28XsaLIQMwPfrHP/+sNFJcyDoQ==
X-Google-Smtp-Source: ABdhPJz7SXTBVPKMIoy1/H98gQ1tDFCdG2zxWr503oWcC/rbFVxGf4XiFWtqqRKYYMzaFpyBxmDmVA==
X-Received: by 2002:a17:903:244e:b0:155:e4a0:bbf1 with SMTP id
 l14-20020a170903244e00b00155e4a0bbf1mr38668296pls.47.1648875833478; 
 Fri, 01 Apr 2022 22:03:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 gt14-20020a17090af2ce00b001c701e0a129sm14905615pjb.38.2022.04.01.22.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 22:03:53 -0700 (PDT)
Subject: [PATCH v1 1/6] RISC-V: Respect -Wsparse-error for -march errors
Date: Fri,  1 Apr 2022 22:00:36 -0700
Message-Id: <20220402050041.21302-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_220355_440804_4708E700 
X-CRM114-Status: GOOD (  17.29  )
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

Parsing RISC-V ISA strings is extremely complicated: there are many
extensions, versions of extensions, versions of the ISA string rules,
and a bunch of unwritten rules to deal with all the bugs that fell out
of that complexity.

Rather than forcing users to see an error when the ISA string parsing
fails, just stop parsing where we get lost.  Changes tend to end up at
the end of the ISA string, so that's probably going to work (and if
it doesn't there's a warning to true and clue folks in).

This does have the oddity in that "-Wsparse-error -march=..." behaves
differently than "-march... -Wsparse-error", but that's already the case
for "--arch=... -march=..." and "-march=... --arch=...".  Both
"-Wsparse-error" and "--arch" are sparse-specific arguments, so they're
probably both going to be in the same place.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 lib.h          |  5 +++++
 options.c      |  6 ------
 target-riscv.c | 16 ++++++++++++++--
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/lib.h b/lib.h
index b96e3192..2c0d7116 100644
--- a/lib.h
+++ b/lib.h
@@ -125,6 +125,11 @@ enum phase {
 #define	PASS_OPTIM		(1UL << PASS__OPTIM)
 #define	PASS_FINAL		(1UL << PASS__FINAL)
 
+enum flag_type {
+	FLAG_OFF,
+	FLAG_ON,
+	FLAG_FORCE_OFF,
+};
 
 extern void add_pre_buffer(const char *fmt, ...) FORMAT_ATTR(1);
 extern void predefine(const char *name, int weak, const char *fmt, ...) FORMAT_ATTR(3);
diff --git a/options.c b/options.c
index 6704fc8d..41a98240 100644
--- a/options.c
+++ b/options.c
@@ -23,12 +23,6 @@
 # define __GNUC_PATCHLEVEL__ 0
 #endif
 
-enum flag_type {
-	FLAG_OFF,
-	FLAG_ON,
-	FLAG_FORCE_OFF
-};
-
 int die_if_error = 0;
 int do_output = 1;
 int gcc_major = __GNUC__;
diff --git a/target-riscv.c b/target-riscv.c
index 6d9113c1..f5cc6cc3 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -3,6 +3,7 @@
 #include "target.h"
 #include "machine.h"
 #include <string.h>
+#include <stdio.h>
 
 #define RISCV_32BIT	(1 << 0)
 #define RISCV_64BIT	(1 << 1)
@@ -60,7 +61,18 @@ static void parse_march_riscv(const char *arg)
 			goto ext;
 		}
 	}
-	die("invalid argument to '-march': '%s'\n", arg);
+
+unknown:
+	/*
+	 * This behaves like do_warn() / do_error(), but we don't have a
+	 * position so it's just inline here.
+	 */
+	fflush(stdout);
+	fprintf(stderr, "%s: invalid argument to '-march': '%s'\n",
+		Wsparse_error == FLAG_ON ? "error" : "warning", arg);
+	if (Wsparse_error == FLAG_ON)
+		has_error |= ERROR_CURR_PHASE;
+	return;
 
 ext:
 	for (i = 0; i < ARRAY_SIZE(extensions); i++) {
@@ -73,7 +85,7 @@ ext:
 		}
 	}
 	if (arg[0])
-		die("invalid argument to '-march': '%s'\n", arg);
+		goto unknown;
 }
 
 static void init_riscv(const struct target *self)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
