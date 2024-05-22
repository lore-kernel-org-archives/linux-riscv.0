Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F5C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 00:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=289LY3kGck9xIvmx1JxSd9w4CCKfcbG/NbaK6FMj7OI=; b=f/LpP3m9AmsXxnsc6kDjWmlQ6k
	0pSaforF18C7q6RwHeEusIdfXK0iMqq1Zv0wszv/gYV1x+TMBULupLSXJpZsO4dqQ3PdJTjFT9s79
	YvRODyuDrEQ5WRkjgaafBr0kqJsjvxZie3LbCd6favBnS5lmN5PU2aEbc8ZrxpdCXkDptc1Drvu84
	11Xiq44nel9bkCkd5Qo8ftrjsl3bb5KQNcSHtC7fp1uF/c6KYxaiKKBgYJJ0Wt2GjA0FdNBQy+bak
	u4wo2txRx3kf3BTg0oZosSQr9hzJnHvZi/oDRgNMzsIBiniky5O9jg+Uea3RfWG6mN6o1xGUCyfCq
	+fGc+2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKZ-00000001T0h-3ynC;
	Wed, 22 May 2024 00:59:47 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKS-00000001SvZ-1S6f
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 00:59:41 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc6ceade361so30988488276.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339577; x=1716944377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2+Rsi36vwtZnongYaIBJsOunisSLXoKXt6dmQkzkok=;
        b=HkBay4oyWtsgUjYJkISeLSBnbz+WQ/OgPCjbwLUxs8PgY1z2j5ua69dvs/1Fqw4w9q
         CG7H9nJLm1uv67AGTlrnQXufcRMiCJnQ1kft9BYUc8Q8xY4Gnhik4RL3TbTNgJeDoLoF
         qeMNayNYb2dgLi/P6J+6yYDnqpSPYuLyn17LsxSwYaTJwXgPPF2bfORS4vgBCcA5v7DF
         U5q0ZF7J2BNaF0XsP0WZjK//YS1mIVUI2Xx8PXHqyc3hdUWZkRmAaGusxwECM+AT31In
         NC6AiTLA5P6O+11jpNfl6A30oTQVfux8nddxmCSh2ZAhc58n7At74lOQUCCymVNKS1wU
         TWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339577; x=1716944377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2+Rsi36vwtZnongYaIBJsOunisSLXoKXt6dmQkzkok=;
        b=wor7W7c5r4RFab4r6iGlMI5gLD2R8Ax3GclPYNWTej3SWPfEopKe8iA5nt2UFPf7pr
         YEa9P37omw50rVPRD8Y4/T5UT4t3iuIWqDE/sCi1lumMhneAamoRYP5QxvTQi3HYPO4D
         1BODuEHvUJh5yDG71ENny9paItMgauqE1hlNMUyq9BylZw1e+cqiG/ypZOQyZnT0F8/H
         8aK2uH4UMesJeTiDFKz9w1gov7nym9gaoGO1EtlBUktzBBolV4KU0ey0ERg+m0HnAf5E
         vx+5VRFP07xIoj/RVAnx7Hu8yxSpyAtW6shnq/3NpYs3awr/nYxYEld9oLTIGxyDdZjh
         X9xA==
X-Forwarded-Encrypted: i=1; AJvYcCW4WdFPmsNbcNA2ajmqLuzdQLhw0r0MeavA4Jc05kmIwUtXz5O+92b4XZFqDmbv8cPngnv4VHAngfitT1TOsnB3Hu+lWesomIJ8hZAuA4CA
X-Gm-Message-State: AOJu0Ywk6SjuPxfXgeBQY0oW4ZqtIeTQg20dqRxiL7sgPnBj1KDHCJiT
	TBH8/TC3lwIFcGQk0zAk0PUqLI/CbmBom65aXxFB+vTzYhsNJ5fXrtvGpMUTKGiYj7l02m7o/Dc
	v6w==
X-Google-Smtp-Source: AGHT+IG/3Zpx7l7joTN4k4AeREX+mCmSb7fgmrUn7wwa4Tb4B4bmk+1v4oGre9mjMvzUs+OvPiRE3jsBfVg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:2b8b:b0:de5:2b18:3b74 with SMTP id
 3f1490d57ef6-df4e0a4dee9mr216829276.2.1716339577258; Tue, 21 May 2024
 17:59:37 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:50 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-5-edliaw@google.com>
Subject: [PATCH v5 04/68] selftests/arm64: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_175940_443899_6268169A 
X-CRM114-Status: UNSURE (   9.55  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
