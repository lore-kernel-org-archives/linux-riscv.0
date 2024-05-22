Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12274C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 00:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gfZFs5WrA2HDWDSHD/Ku8yuTYJQfoJ5RbengYc4f64s=; b=QRI34tpBGi7SkT72QpVFlYlkU8
	O4ceHWMUWSUZU1w42AQttgkEz1jiRtims7Uan/SZzkqme9Z4Mvz9yoDFiJOmvhY85iGb+SJP1Bonz
	2+jOA4WNWkWXcLweYNkpFDhPS/Q8G841/lV/D8RaJaCZgKIicbtkdpAhNXPwzpli3ovRh+u2/ndt2
	J+s46/cizbWQkzTPcmqJ33VVdWfEz4uITp/3/bfbOuusG8sbn1LkQpue42FamIUE/ELVp4Z2/cDOq
	XKTmWMUeXQHdq0W2SlwrIQ2FaETTH+sTPW5fgrD0feUAQe+jb5q4fX7k6FM7KUMt5hgNVGukZ+2rI
	EMGzqeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKS-00000001Swi-1QoY;
	Wed, 22 May 2024 00:59:40 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKP-00000001StT-0EUT
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 00:59:38 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f6985cf246so2881393b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339571; x=1716944371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=heKXSaMRYcwqfGx66xXaJ0v1/7TXmPatEe8vgsf1Ibg=;
        b=bpk81Y57Co7rh/Q4OLV7uA3xHrs3qNY4G55xZaFq1B41b+UOzcwkcBHbjic+BovWu6
         hv323i2AoftlEviUi4bJxH78WjzLsZnLM3Jb6O0w8b/Eg6jXK03cGN3vcFE3OBWn5H/p
         /Trjd9ixUGFLnXMuepzWR/WBDi/qcA+UNo+kVWSdrC6MdRaQEt8uDKO6ZXhuVdbqYmtB
         02CBYe7RQhTzAshyxaPuteRODV9lPlEzqi6btaVADJg05T/YVoCUp+sggKlgqWN3uiaJ
         FK/JY1JyWoOGXQEqCGQQtz1vCm377ZoRg1I3yRbZHLt42KDxdBkXGaC+DyEBAJi1JHcf
         TdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339571; x=1716944371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heKXSaMRYcwqfGx66xXaJ0v1/7TXmPatEe8vgsf1Ibg=;
        b=dgf4N6dBPAVsDOdHpgWRv1jC6q1DIj04RIJTS5vTwMcFoTBqxIUhMqQ3EbOsLV3L/K
         aOaYNdNblrw9DE7E67PdtfdEZF0bOLf3zyu/AYDxPiEEySLChze3U3zx+6V+l0Cxq+6T
         AcMiB7kjggPJHomrf/jEodGTeSGH9dnaCqyYPSM82dv69dnlCADsGVxf1jpISSibc7RI
         q7yJ+X8flMW3nQ0AqmROPakiSL6jl2nTws19clExqCmELTBsbMv56jNCOyNEaEOMChAM
         2Mx2/s0Yf0Ak/W7JhfgOzhvs3MY2y0ogJlfVR1jzrrdT4S1/ynlLW+w0gf8vQ/skzF3k
         VB2g==
X-Forwarded-Encrypted: i=1; AJvYcCXKixmOKpS3iE4N1KrXL6HClgnNw6OCTD9IHufSqkN7UjBKTYw8SzEEb8kTezKyd/cNJivxK3XIv3w/ZW2k7zR8ZKlGbGs9S7EJF6pFuhP7
X-Gm-Message-State: AOJu0Yx2BNR2/7hpbrYXCYJH1n5T/GSi6anO1ptSvja2kEWcQB182tZ4
	zv4llPat4PeJCK+ijW8AjtaW0CX5IcAM9S0/QZ92kpR9jDdiUeEGZMQr+53NOZZV8WUyHH0QSSZ
	P3Q==
X-Google-Smtp-Source: AGHT+IEobdompRA9RjJm2/dX+ug/Gh+Xw1AlGzUbj4XxipP2oWSmXIk82GLItQak2HzxiyPL3MdiyXobY5E=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2d91:b0:6f4:9fc8:8cb0 with SMTP id
 d2e1a72fcca58-6f6d6504a94mr20246b3a.5.1716339570837; Tue, 21 May 2024
 17:59:30 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:48 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-3-edliaw@google.com>
Subject: [PATCH v5 02/68] kselftest: Desecalate reporting of missing _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_175937_243789_C8503F38 
X-CRM114-Status: GOOD (  12.82  )
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

From: Mark Brown <broonie@kernel.org>

Commit daef47b89efd0b7 ("selftests: Compile kselftest headers with
-D_GNU_SOURCE") adds a static_assert() which means that things which
would be warnings about undeclared functions get escalated into build
failures.  While we do actually want _GNU_SOURCE to be defined for users
of kselftest_harness we haven't actually done that yet and this is
causing widespread build breaks which were previously warnings about
uses of asprintf() without prototypes, including causing other test
programs in the same directory to fail to build.

Since the build failures that are introduced cause additional issues due
to make stopping builds early replace the static_assert() with a
missing without making the error more severe than it already was.  This
will be moot once the issue is fixed properly but reduces the disruption
while that happens.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/kselftest_harness.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index b634969cbb6f..8e53686b71cb 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -51,7 +51,7 @@
 #define __KSELFTEST_HARNESS_H
 
 #ifndef _GNU_SOURCE
-#define _GNU_SOURCE
+#warning kselftest harness requires _GNU_SOURCE to be defined
 #endif
 #include <asm/types.h>
 #include <ctype.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
