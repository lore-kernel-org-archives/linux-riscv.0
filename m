Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF3CC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7sxLTl0g3jfLmOOt6p5RbDAO+Z6ePQ8eZKsPdMbCpxQ=; b=bGORlytoOVcDcuG26SrFDMq/fh
	f+Yn1jrQEaUkMJK5hvSvhzwbL0P/HgxPHUFI/pdLrpD1OovMaWutwgQKvdRvX5x4tRgcffzMqACA0
	nqETXr5MiaR1ccgNqxR8UPxFz+yCRVvRLBZmtWR8+MuxS1HyM/VyoqOzXFgPydfKb3N4LjwvfwzU/
	CcjJpWLIXq3ve2BlysmoCasg9QpeVzCJ7OiqjisBwk3Vv6odBHgr/CwQ7yPt3rFXeWdtMPXLQfbJU
	X8nUyQ9gd3keUnaAy0dpCbFG4D3xCfYjfPIZ9vtXA1fmYAk/N1W+M7pgwBhOy0FMPzTScI3G/Lj2h
	f7F2REgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59x8-00000002ayf-1IbD;
	Thu, 09 May 2024 20:01:18 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59wo-00000002akq-2kC7
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:01 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6ceade361so2586864276.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284855; x=1715889655; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSnXkY+i8xBz8FisUXSmsQkSZaie1U2SXlbBYlPacTk=;
        b=brDYvRFUmiuraqFkbNA6WqzUQDXvkqXvcbAWLmeFaAKKHMlfIYm8tXilZyD0ytKYp1
         3ZmbiQWkUCuz90i2f98DCd+v3Xmf69T9tYjUCcoMFJcwTu2TYLAo86VD4Ha9FvElbMc4
         jhM0M6DIjGxNUh6EvRTae2DxpH3a2r74dRF2AfxbE/boD1iGj1n76+DRMIIKIPyxBCmY
         3aVYCIbTEL2QNm2r0AWs02y8mPKWdlaMgDBMTlFPwskjHXUcz2o6LuCS8pwUXaFxG90g
         vnUN6yaTvCXLDQ370p3wK1K2cWas0m4eZOzTEJH7Gk4zRQVn0PdfBdnzEVXHiVWD7aBi
         sqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284855; x=1715889655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fSnXkY+i8xBz8FisUXSmsQkSZaie1U2SXlbBYlPacTk=;
        b=VZeQtIo4W4nqbGmexx9S8MBNVgrduHc67iM0jyLDcnayW3oL4L+OKpi861rbLKPHwV
         lotBm1ru+a1+s2B578Myf8sOYOneA7IwLCeFGqEv2PaZRUxSwFTgVQWt7UnhzSArrcoT
         UIUMxpU3qdxrCG2yclKvDBjctCs51ldxf///zlUSJZAZQsHTnGFb9027gVfYcDyQzh/T
         V1bKeAraESayizj5Y5aaP3BAacx+3bMvyKcFAYVL1Nw7jL2DCKRWQYp+3orX6BxHBg6E
         3CRaT47M0Nr48Gh9KAXZT53POB4fBzz7tZh81PC27KnLjI9+w62Jd1KN1JWKXoftXxUq
         6/tg==
X-Forwarded-Encrypted: i=1; AJvYcCW2QX0ohf8Nh1DdpAeeJRvo/5i2fGpP3s1xLYGneee6O3xKD8yqEXtr81GhsxUWs1B2I6oJ4RtxUVU9EZgF90ZxCabMEQ/uCirD8QXfYyiF
X-Gm-Message-State: AOJu0YwdL2364WB0nXLtjv57bGnLznGrkf26CZP/U3VzZWvcUxSe2F+W
	SqIDAIG5s4eipidxrGMEruv+7cbgmlaaEVcZqrW04Y9oeGw6Iw61PuQH41dL8aXC50Rd4KD1ZzT
	yUA==
X-Google-Smtp-Source: AGHT+IGojUkNrisAmY+TVjQpynkG2w84qahgUw1mqZZfDgiCsUKwxR/6LFnDu05hn55cxfE5RMPak7RAuao=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:a443:0:b0:de5:9e4b:fbb with SMTP id
 3f1490d57ef6-dee4f363e51mr139553276.6.1715284854975; Thu, 09 May 2024
 13:00:54 -0700 (PDT)
Date: Thu,  9 May 2024 19:57:57 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-6-edliaw@google.com>
Subject: [PATCH v3 05/68] selftests/arm64: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130058_839745_5B9B21A8 
X-CRM114-Status: GOOD (  10.13  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/arm64/signal/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/Makefile b/tools/testing/selftests/arm64/signal/Makefile
index 8f5febaf1a9a..37c8207b99cf 100644
--- a/tools/testing/selftests/arm64/signal/Makefile
+++ b/tools/testing/selftests/arm64/signal/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2019 ARM Limited
 
 # Additional include paths needed by kselftest.h and local headers
-CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
+CFLAGS += -std=gnu99 -I.
 
 SRCS := $(filter-out testcases/testcases.c,$(wildcard testcases/*.c))
 PROGS := $(patsubst %.c,%,$(SRCS))
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
