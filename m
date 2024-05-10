Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA18C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7sxLTl0g3jfLmOOt6p5RbDAO+Z6ePQ8eZKsPdMbCpxQ=; b=1IK2B8G7uxpFnpOaq/jOldfq2L
	9A8kjRBPg7ssJ00NS9LCx2yn2C4UN1jxn+2VNLDq+ekTITIKnHRYRH0iCUB91lXhvpVTVmm2f06gl
	YXkOm+AezC6RVgpUhNY9km3YhRVgNzhuXjsb+b3u7KCfVlg9ePgvXFitw3q3w4BwmiUkCPoXcqFjZ
	2vez3ZinqATC1EUEshRmV8JJ6gl+9YO9Y+fIBZUY/d4U/AxMQ4kCw62AYAhadQmMMHrMIrFEfq5II
	2LWOJgCrYvUQoqNu9MqE5WuSB1ydFkS0HhryFrf0vHmikhG6+MWIT2XEtRiQSg1eOUsJdOsEOdMqY
	Q9ZU4UPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpA-00000003MVg-0a8v;
	Fri, 10 May 2024 00:09:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dp3-00000003MOi-3qLp
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b38e234a96so1361955a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299749; x=1715904549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSnXkY+i8xBz8FisUXSmsQkSZaie1U2SXlbBYlPacTk=;
        b=DkyoCKGyItmTVIN/0CENWc+5BulQQAKLiFVqf1YYIFIQgQfrWQboE4/Yg2bjtWO+vU
         SUG0/G6OhJS9P3frbdsrczCfj/f1tRpxP/siR6X39wBcZc/HXTvrTCma6VNWCQ2jb7rs
         h/JD7GHk2brVReG7CXk2g+bgyop2uHLeo+u9ONjUer1z4JWNWJbeBbwh/wP2tWZ9ReA5
         GRejVOgK7TXxkUenVzZQLuGSHTKzEHbZbVqproLzu5IrS/x3uRUsT69r3Px3xjCvv1g7
         kRn7sf11p2VXIz7sVGz88THFD/lo7iwBRiUgOS53zjxLaCDLkHk9hjUz6vdP3xALu1YO
         2pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299749; x=1715904549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fSnXkY+i8xBz8FisUXSmsQkSZaie1U2SXlbBYlPacTk=;
        b=U8v8OwrLVHrLS2f7SzlhbblAKouiF8dZCgoorl7a50qOTLJPukQSp/C6C5+1GnYv0o
         SjXBiavrgz8WzrRUcbH42/1wVmPBGA/FrmQ3IaYPYDPyOGt6TQAykP4roAilA3rFyp4Q
         X1QWN9qEovDsZ4MgtaNtYdi20uxcZ3aNjUp825t00UZVlIoEt5SdGjGkqUjH1vw/zOJL
         Js2+Sb+MlFtIJ9/D194JvBxNECuHMIWZ2ZmKQmPrAluqeMEkMdxIqbxKH5EZPVSFWAIc
         +GHU5gPIV234KalCq6AOlqIKNgV4COFfMXr0CYfCZl7gtwFHzDxEenIpWJZch5kEs7aK
         x2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVpjMCmOFyLfukp74dCrHi9fz06P5rZyvUx9ClCAMm+WhjxKmOrt2vT6fKV0RFox+p2uXJ+xM8WBGQVU/VO2HE1qfwed9CjBLOxtd8cbK26
X-Gm-Message-State: AOJu0Yx1QcrU/29VXvmDpe8aSMnRhCovQGrpyIRjj99Rjdwms33EjdcW
	TKgQFH1MvmayudkQJ3KWrLc2joKEqMPl8WvgviKbazP2I0mi1qgjKDji9aQHAETGPLGLiY27NSN
	4+g==
X-Google-Smtp-Source: AGHT+IHrf8Ip06EWjJVaznBkpYP2PcAGdeazjj+Ng12mTejT5b1sQiTOfSMabgEBTdHLaeObK490rYSR9aw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:f2d2:b0:2ad:5fb9:16e9 with SMTP id
 98e67ed59e1d1-2b6cc247cb3mr2716a91.2.1715299748321; Thu, 09 May 2024 17:09:08
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:20 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-4-edliaw@google.com>
Subject: [PATCH v4 03/66] selftests/arm64: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_170914_080798_3D2A6088 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
