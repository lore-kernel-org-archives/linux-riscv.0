Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33AEC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gyupW6lfbrXc82t2aoEcvRSrQq1mjiY4H1/81bqoshA=; b=k4+c0ydJKAhPdPBuS/r4cPTCYs
	7LTtAXWpXAiUFRBEXWz54OXSh76xXW2ApCzSb+qWiH5/5hWL7mtS58Q+cZFRCAC0WWOycNghRI4SC
	ZSgzmeoNIpvyH8LhjBjw3Cgca5jDVGhJPRR0sba+uQCDH8tciphe8E6m9CR4mZtCgaNlt0E3Q5WBS
	ZpipqxtMr5N6Qt7t0seMnFM+bGQri/hcPKV7JU37qJmqOlXfSCGguPALYS4qIyjPgqDrgwuYJdR0d
	c76YXdvKWkjmyyW/SeZ+Rw/BBkZQkCRuNBHAu5es7+VzoDvs0FctQmS4s09Pbfb2cY0sx8z3CqEAS
	tWCzZKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1N-00000002eBq-1mK4;
	Thu, 09 May 2024 20:05:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zW-00000002cra-0cH3
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Bbb2U4Zk3Yr6WN7VZqepw83lSldjIXt27jnu3vVFb54=; b=HX3q9lId2uNr8mebZBBtDvN3c3
	9O0EcOK4ZdauE2NZm/1iBow9/AYu8MvDJe52/PMKzRS77Fex0U8jDNOW/BX+Quk0irnQNCBSx1fDR
	DdDFA3lip3/tkUhAxD4aJZen3P29TAD47dv4LatPCNH7P3nJYuKUBP9j+iJQB7iO7YVYHWRx8OnSh
	iIgQgccPjSnMcQdfv+uwQVIRW+K2o6zLqTyMZRzoHern9Y0Lm1VutIV8G0IF5nqcjcyFtgBCXXwTz
	CYYjnOalCEMWDN2L1nkWmYFNIqc2vwt7BSglr977dctvM6L3g5xIvh4vuJBuvh0pr18gm56wsMDNw
	1F8gHRJg==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zL-000000030EG-2vss
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ee13ebef37so12064935ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285014; x=1715889814; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbb2U4Zk3Yr6WN7VZqepw83lSldjIXt27jnu3vVFb54=;
        b=s1I2EcCeWVAqg7qdvIG0NO2YY270U/tQqkfUOG/Im1WE7H7ms9PfITYGSykMKGxtyG
         WpoxoQPSTp5t+31xV5J0B1Lt/OA0Fyj972KTCU5VrfsbvHhFYpEP7JrTv09sAuwsgh15
         hNJJGMnjDUkC8+GhqgcG6hLgfVwEel1PiSHjwea3xu9otgwbcB+ZKUuCydPp6qNg+2YT
         71bQEnRchOwGlIuhY51e5EcYnwIijxCbu2Lg5u6dGyHpKXFQsgk0f3uRrfFSKBk+CF+u
         gvpcxllaOJin34e7ytJHkaxmvVLTjLjoEkuW/OKDVm7v7qGpMkZBsseDPQpgVEus8tnA
         yVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285014; x=1715889814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbb2U4Zk3Yr6WN7VZqepw83lSldjIXt27jnu3vVFb54=;
        b=jej+bpADUxre84pyRaGfJm/pzY/xu0R8CAYAsRDo70b4Il8C25Ai5HKtNz0Sj91nT8
         pEPtFcycVGQ+aWCXjiD9/2nU4b/SpzI/wfvwKDM3vFsqg6lbjMwG2QbnVAznu0o6ipe8
         3LrYcINYWD9iN2V1zGl2zHO+t0NyCAjCzqE4jUJH4UsiHhDwqknFk1QnIzUxZdJMUOZ+
         +ZzGozeW9DMlAWVDyKel+3UsJhkRTscr2Sh+MMUExPCVVmX9AqIRpIE2vasNRwQG0dUz
         5tQetDu/REQGFJ412UGxRt+49y0y1GV02/VkP5lI6SFTHBXqlebSJuQEHF6hPZX20o1i
         5TUw==
X-Forwarded-Encrypted: i=1; AJvYcCXPgLW7GEMVBNUeK66Zywr6PETHE78qpwTklfwJyAgCXT+gQblh63GlkHdndWfSjXMCOwSQA6BMnpe5XvORE1JvOsBcRjrA5x11jMp26EvB
X-Gm-Message-State: AOJu0YxnO+dnLNwSmx8o607q7wKwD5kUe1rachOIIlWAi+EtlMM2lQQB
	lxNGlHP1G2opsEusMtL0JPIuG7QNSFXZZ19XQhBvbjnYMQmXmxRHcraRR/rXbIW+HH87kt0hH/i
	I2w==
X-Google-Smtp-Source: AGHT+IHaW8up98KKY0DKIREM61ZE6uwLOqj4Q30aku4j5YlMl7GJZFBGsR2DlfHZ+DXteqca0hW/DEYGwCQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:da8e:b0:1eb:d72d:55c5 with SMTP id
 d9443c01a7336-1ef43c0c9aamr312765ad.1.1715285013596; Thu, 09 May 2024
 13:03:33 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:49 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-58-edliaw@google.com>
Subject: [PATCH v3 57/68] selftests/seccomp: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210336_402643_C06B56BC 
X-CRM114-Status: GOOD (  10.99  )
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
 tools/testing/selftests/seccomp/seccomp_benchmark.c | 1 -
 tools/testing/selftests/seccomp/seccomp_bpf.c       | 2 --
 2 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_benchmark.c b/tools/testing/selftests/seccomp/seccomp_benchmark.c
index b83099160fbc..3632a4890da9 100644
--- a/tools/testing/selftests/seccomp/seccomp_benchmark.c
+++ b/tools/testing/selftests/seccomp/seccomp_benchmark.c
@@ -2,7 +2,6 @@
  * Strictly speaking, this is not a test. But it can report during test
  * runs so relative performace can be measured.
  */
-#define _GNU_SOURCE
 #include <assert.h>
 #include <err.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 783ebce8c4de..972ccc12553e 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -4,8 +4,6 @@
  *
  * Test code for seccomp bpf.
  */
-
-#define _GNU_SOURCE
 #include <sys/types.h>
 
 /*
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
