Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F672C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LJNPXLP9HtT4XImCiBfNo7EpO7PidVP85+bfLRcyswU=; b=NVKejuOe01XWm/MHXs90mbDZiS
	R5UfOUDsSIQ58Y3hgILYMHyXVDn1BDFvmiE980tc5sqnil/gr/ntvGYAX4xRt3x6RLdk7eecIZ3HB
	H97pcqbWXM4Vm2Ud5SAbhJVK6vwaCewSiBN860Ng4N8uCsWfEi7pVHvuLwihWmGt0wQbc3HgCruhv
	UZAro+KboutXPQy+M6zI4ZI9cLqLET9DCpurXdmbtApM8fMVGN/DQ58WBK0OakFXkNL7zjtLqOKvm
	D4m2hCWPctJ0x78iPedOffszZcFnDCZALxq1foaktbQf2f1b9ZBpPvhCeOKHinTo/LCYn/ge3q+JN
	VCVluDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqW-00000003NYc-2uOH;
	Fri, 10 May 2024 00:10:44 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpx-00000003N36-16N4
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:14 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5cf35636346so1170605a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299803; x=1715904603; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=29EvGICOAZ0F1vgmDohmB/AvF71KDeoXeGxlYusrQjw=;
        b=jE+eQkUqoZHT96sBzVhU3/PaXuuZyOHdI/zkew/veOP83DK959cB/KoLTe36FEbtGR
         K2n0usrnOcWcKll7yqYRg/D15O+o56GPBeRYL7xfevleqTaBNVy2zf7tYXhC01QQQdxy
         3zLxb/3BaRjT1rTWAf3GvEUpnGTIbc2maLMSONWV+Z1Ydfar1DIbBqCh+BglL7SV5iht
         7DLSu7qv5G+VTJDtUa15RX6ej+Mcrw0jR+GNVaJmwoQsVupnL4DuKCsSu12J2NwKz7W0
         P5Kolx298pQxrbjWYLkZrdye30QPqwf60/VDwcZYCA/s3EFXXDCK6AD9X4WnrDKG7M9y
         7fzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299803; x=1715904603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29EvGICOAZ0F1vgmDohmB/AvF71KDeoXeGxlYusrQjw=;
        b=W3Ebe3qCm7Ft+j3pWwz8F8K3WWJVEc65qXeszsl383FdWpEuDzPXLZvtIfV7uN9S/K
         cQJ4pl4LCYor45xk0hjoRMMAJ+8JrQpmGtK55NegGOkOf5+hPEWNJahUbwL4+wUrZGhb
         BFvm+C73zEN3FQmC5ksWGmFwMmV6XzzZ1Sp9WWljdBBsl8e9f+VeREQcFLLKr6tIFcR+
         P6J2uY+6+HAGg/e5HUYXMXFaJfgCQ0aH55xx2qSEfg3ttjpTmqpPXLkeMy++gQo/JjOV
         xXDq5BJF76VpoAarHu9IzODLIWuBiyeVTbw+ScGGSf5gAki64SWMSf5AwH32USyGG0h9
         wkig==
X-Forwarded-Encrypted: i=1; AJvYcCVaFBszeqIGPCEPQRP0LQZSdM0rD+7Ku3YwgU5vSPFE4+zlZPDKC49JJBpD4TmNins5HnUFyck4bpq3varL9nx1nqJpYEpMqzKv8+vQcNVH
X-Gm-Message-State: AOJu0Yz0/NFZ5865s8AQVhimlpjviLcp70tLOjOBudXgExNqxpukcaUM
	JoaN1Yx4p8hK+A0Hgmz8JHU1lEdJJDAYmXhhv3Gmh/zSNvWdLmtkLFp7r+LUOdl5hyl48mDGMF3
	P7g==
X-Google-Smtp-Source: AGHT+IFtyDIvJI7P2PUSrXqhLacKlQqz9FKu6p6E/UDw2sNkrLVdEwZSqWvpAdJ2mtDw06xzYlMjZpMo9tw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:234f:b0:1e8:51fd:a85c with SMTP id
 d9443c01a7336-1ef43f53a85mr727745ad.12.1715299803227; Thu, 09 May 2024
 17:10:03 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:38 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-22-edliaw@google.com>
Subject: [PATCH v4 21/66] selftests/intel_pstate: Drop duplicate -D_GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171011_759320_AFB77A39 
X-CRM114-Status: UNSURE (   9.69  )
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
 tools/testing/selftests/intel_pstate/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 05d66ef50c97..f45372cb00fe 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS := $(CFLAGS) -Wall -D_GNU_SOURCE
+CFLAGS := $(CFLAGS) -Wall
 LDLIBS += -lm
 
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
