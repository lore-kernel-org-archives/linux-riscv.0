Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2D9C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t5p8dRTvrcMbXYWfqfwFUVH2rWJm0R7DXNUMh33lGdI=; b=2J/lzOHLlOCVYOvRyx1N5mctTk
	1VGz/BPfmKtyee2/i0/WqldumNvP3fbwTJMjSUiOfbjhhtdp//5MA4Qz277daWiQBNB6euwZjJPsk
	ugSOnbfK/9hYUDEl8yW8ci4QNbZFDwzL9wmvkVBUhqeqg/QkxjUeftlsLAlYC/VDoqqyHZ6eG8X/G
	iEkqgfM2gquFY0pIxIbPFKVt1FSNB8fiFeYbLLfdm3HuKKaX3p5QW6alXoCbzXVbKqt9cew1P2Enq
	mq+TbgxwkFmtSurvAjtdlvq0VELsy1IvBCFdm6eGUlMWFDcNirtddkh7T9DKug1d6zz6E/+342tUD
	2f8VeeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y2-00000002biA-0BDn;
	Thu, 09 May 2024 20:02:14 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xM-00000002b7Y-3i8I
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:38 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so1613997276.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284888; x=1715889688; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3wSVWuIBaY3YuCyJCESt9Kj/Ip4PjdWD4+MMXdzxtY=;
        b=4Tn0YCfwVZC1S6IE1X52sIUan6Eo12tS3ovTv6wopBVRNbIO+6Kut5Pn42EMDVcIMy
         RvsgRkDRYt6baFIOfY9TZNNOCXAZv2+N7CZ+ooNmxmhyuvbykhwnuTB+qyXqeHugwLBG
         FGqgrOgBmwWDO0COtXeVzS1iU38alXC0AozSbYJ3eFktB+uYt+GrwP7E+V1ZsQv3Mm5k
         ikrfy3bIjBu+ChdLoYjiboG3/GZMANg9RiBn2EYJWSWen+d8JfVPQmR0jpRmtAAYmWbN
         wwa9/zzFZOHbaT26MNvJru3cxzxZY8B+mU798Ocid8xNVS1Xj/Yp5Y1uJEw74Qd0u05m
         IGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284888; x=1715889688;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3wSVWuIBaY3YuCyJCESt9Kj/Ip4PjdWD4+MMXdzxtY=;
        b=HooJbXMqSdhDvpwivkd8w/waAOdAlvDjdf9H2Pri/5zzUXJtOqwBZQMxj4aVeMYKJE
         dRzWxyn6c5+jI7ejjAqQtmOfJvz1EysRWnaPwDL/kDKUPDbcMX1LsMa6/cqMczwGJCnZ
         63/mTEU4wrd6NxaCj3FSKRbZhrxhWXk3jsRwExPLIP1S0Gfy9Co90gqzEe19hFxirSJ4
         eMKl1S9ynJQndEJd6xljiD+quRbAsNL1nmuaAZqT1897EF2fhcshrDpSb+xiTymMi6LF
         bbljfTBJpLq+Bn6Fh+ilsFlRAdfomkT3aSVZBp80FKYw4wLRdH/GKwvdCTq8s4uviIIh
         IBow==
X-Forwarded-Encrypted: i=1; AJvYcCVhW4+LLhlf1hB6gg++vtafEK4mEaDur4uyurkn4DFV9hUrFrVP/Po4g0I/G053/FXlkyIQsA79xplaN/K/zmGRlzntcuR1O3+vB86rTuoN
X-Gm-Message-State: AOJu0YzZVc/dDKh0ithk5NpZtS3WBOQxUdqeI+Q00U/Ifc+cVMrfUwnM
	RKtDB4eHIRwcykscqiMKaX7XwIYeQeTX50o0QKws3yU2JAu94Uj2JM/ESugbNmnIEkOHLBS2YUs
	p6w==
X-Google-Smtp-Source: AGHT+IG3vixfOgsVRvWw8ba1GSc0WVoejlZw5UUOvsn+v5cimkQ1a21N59uv9KSFtZ774wjBAuCjwsx2Iew=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:d3c7:0:b0:de5:c2b:389b with SMTP id
 3f1490d57ef6-dee4f1924eamr46589276.5.1715284888528; Thu, 09 May 2024 13:01:28
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:06 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-15-edliaw@google.com>
Subject: [PATCH v3 14/68] selftests/drivers: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130133_585189_34E5BDFC 
X-CRM114-Status: UNSURE (   9.97  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index c812080e304e..7c8dbab8ac44 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <stdio.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
