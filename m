Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2954C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mVlNQdqlNW/g011gRszqo77UiRfUWeVyJdtGi/JOcco=; b=JpNemxPJ7VLrxQGDwM3dgkwIah
	0+fEylObPGyZ/J74KzynkZhb87B4etTZEJMjxW1F1OV00ZU7s2qKvoeP4+QkZy5bB5aXC3qrFQccp
	iTSsdbEfT3RBkk5QoRguFH82zCBq/67F2BaHxwVjx0pf4RwcJ0hW6FSX+TR2Mdqf2vsFO1OOGbXyC
	92LhAPEKCRMf9fagatnV9ir47XCtzDXA7hH4etQ8G0xd9R++PlAWfPsuyiKZrBC4TakClQZ1TosSD
	eDO9r6MBNV3tLMRa+IIyVOp5VPQJHsFvJ7X2h39zf3aN2iFvCJI9eLCwxMETx4QeaZMCdUfb6cHU2
	D8OL8Hjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1I-00000002e7Y-2dny;
	Thu, 09 May 2024 20:05:36 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zQ-00000002ckg-1zp1
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:42 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-618a2b1a441so1733018a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285016; x=1715889816; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEcgXmlghWsxQT9HZckvmES1mnfU4TIKjOLdePjkrYM=;
        b=p8Yydu/F7xt9J2tFLwzUBHoH9gos0UKOUGhqe5A6lG52Cj5QuLWV7zINJrX7iyNCjn
         lfbUTCQEUMkUuVNlU3/OwC4j36MmtByRpEBGNBary5ZJGB3G8nMAR+IFxFXdk3kqkkhy
         M7lI8MPvGmw59P+vNDJrZssr+avIHKoiBTo9E+tb03KPdc5j13W4ou04zKH+csuXeiOt
         gv/3NhLwMlSRk5PfT/7oCCWWn56oDK/SO2XmNuX+jLsnrS/PvQP3bYWBOL6B0z3CEEZY
         oqA7UK757igux+/btNA4OVtuIAZjINCx4U1QVIKpzgFQ1qOhBQMArbmyxjg2tc2JhGCo
         vtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285016; x=1715889816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEcgXmlghWsxQT9HZckvmES1mnfU4TIKjOLdePjkrYM=;
        b=odgWDfD/RmoJqjPT6DmpZWOs8LNOQVff7JKcXEyA5GzKruj0Z8ny5lH77msEZ+7WEh
         GLZsQks+6aKDHspf0jKDpSoTY8qib8Zq26rOe10l32to8iE6BGBpb+ft6/nmFzTwYwQf
         +4/npUx39OmU7uWazBoKXprDiHvWh670nDKoI6wxhRAicJwmFLcoQ0NRSvf0N+FEjw+S
         k65PGvooICGdW1IXGMLum2U4Td2Vb09r1Jc7fyj8MimusilyFLEo20n0QtZ3UY8gAfQa
         WSEU+H7Hrd0E20KlcluQjRPAi54MDlVR9x9tn+F6ISruk9h+h1XeRaORxaJPS3893pEV
         Jljg==
X-Forwarded-Encrypted: i=1; AJvYcCWRcjCtLLFGgCTHcfcxQoQ/bcOEEPb0GA2sQB/EDTf/JYI5mI76dStGTyKMmvKdWgFhay37BJDp+o16MvbenaEYAMc+TB0On5tNBgngiwgA
X-Gm-Message-State: AOJu0Yy5pfDxjD6dnTpfp0agpblNUPJzweEl3XSvXAGcfprEVtOyGOTy
	6JOO1R+nz3C+S9KJ0/svx7jNLK7yMOsvi9+qQqpODktIY5Vy0seRIWg7i22tCEzhTjhyF+FGpAP
	sjA==
X-Google-Smtp-Source: AGHT+IHTECOTBaYQhqNZfIW+fB7Q9TJWNGlGeyv6Oslt4KegdwxZAJ9Uq25W0NLahxVsi9SF18hcwHJJfh4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:11d2:b0:1e6:624c:f1b8 with SMTP id
 d9443c01a7336-1ef425511a6mr278815ad.0.1715285015792; Thu, 09 May 2024
 13:03:35 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:50 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-59-edliaw@google.com>
Subject: [PATCH v3 58/68] selftests/sigaltstack: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130340_704454_6B259C3C 
X-CRM114-Status: UNSURE (   9.60  )
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
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sigaltstack/sas.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/sigaltstack/sas.c b/tools/testing/selftests/sigaltstack/sas.c
index 07227fab1cc9..36b510de0195 100644
--- a/tools/testing/selftests/sigaltstack/sas.c
+++ b/tools/testing/selftests/sigaltstack/sas.c
@@ -6,8 +6,6 @@
  * If that succeeds, then swapcontext() can be used inside sighandler safely.
  *
  */
-
-#define _GNU_SOURCE
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
