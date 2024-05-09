Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D6C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AKeHTI4bfrXvMkzLpcarIqPJSqJjFHnqdTAB+9GUM+s=; b=kshsIIRs2uikOfYlSh3pJaZDDQ
	ZBOQvKDSY21w77MGLmDX1s0NGKfskrMv5Sxgjv5bGlUJMqUmOTdxeMelnHj0r0WdRbOKsAzvQNacC
	3JM2RY/QuZ+5UAysQYlLDcfQq+ecW6m+u3OaNNVm2v8/x6vv9WV/AsPCGow+PXryCRU3ohAOrmufk
	bz8Rj8/9Y+xPsQEweNSzgdR2jgQ9G/iIDR3ebOvs/QBV+AWQeHUitTVYTSsm2O/mSzXFzJ2UHagSU
	Z8hgMbwlTbNCf9PEBu1BMB/CwF3otaxkpp8c3RjiZ0+lqOmKyDuvC3s4oJXNrDNC4Y514rUljNTYm
	b/mEKDqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A0n-00000002diW-0gyM;
	Thu, 09 May 2024 20:05:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zC-00000002cah-2ion
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:32 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f441afba80so1381996b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285003; x=1715889803; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdjVpsD7cc6ntiVj0izi2eF4LCU2xu7dOzrXEQPELk=;
        b=Gk56Ste0rMkbP4WfHQiJpv0VEV2SoIPFUFZ5scpw4oEqmp4UDgEpKgY539vnThRrVp
         rePjDVGurmul33rglxpAWU+J5qKJQHo95jRuP2VO1mn8FbN1plMewjkTwRomS4sFuWlA
         RFvP61hAfa3RBS+dlW85cozpvLrKbE2GE5XiLcXhOnafeRlVINhXC5nUi1IrEDstNEi+
         73E2YCU+1CxqX6MQ2PC5dQ+E/NT+xVNWITPt/CeeReCrBkML+3TuVMCRbt+Dcd6Oxwfl
         C52+W1Jg+/PXyLJ898OreGx0m+ER/4j6HQ3HKC4k517DK2QA0u2FYN1YxDvWK2GxBR27
         s8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285003; x=1715889803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdjVpsD7cc6ntiVj0izi2eF4LCU2xu7dOzrXEQPELk=;
        b=aJIUt7ESsU+kxK5x88Ls+o9e1IbyV7jjiZdstgvTqiZCDBJTvya2tRe1dwCNLCMWlr
         XptIgxyRX1iuSjNNJe8SUBwYAwUH3Vi5hkvsvmOlWAYj5a2rRfYGcZlm6V2cM5f4kT5K
         IuEgJ7KhsEa6CqVT8SpNKLpirXNiFhbK9onTeCUSMg7AvrUX8f396qgHKd3XShCpwngF
         8W8upGciaQqFMrtlm3cez5igmi46Jvo+ZSt/hUGvn40VRNP+6rJPbbJd+Y3ycU0y1qBQ
         Ck2fvdsW/Ve4AT0xr6OFLDCQ8EHgAvyKlUx7HE4ykF1tiiybD7xqphcwu4/hkuJcZNMO
         a0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVfzArGfOE4UZ6RDT+hyP9bDT7KZlS0QgG85j10V6oR9d4MEgGKMby6wf4wMB2ow9GGaxfYyP+UOFuTLJ3t0nLooAozMLtl6uz5QQAaIG71
X-Gm-Message-State: AOJu0YxrtuGnsejTdvG9T/4zpFn9pOpHWJk4ncU/aW8Er5xIMojHSI1K
	Sqz9VgRYWuQJpYlSxKeDvdJxSsQyRAPXkuQPv1OE4s8eMAEKyGw8QGnLaDBOUgPoSaGUBTQscyw
	31w==
X-Google-Smtp-Source: AGHT+IG24YrGgs9oGH55TwJXLYWUSPdxI7zBXzG/ZOnaBwcLAwEEtD/PozwH2fkQi/h91ia9Pf639lhh6mI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a17:b0:6ec:ceb4:d9e2 with SMTP id
 d2e1a72fcca58-6f4e01b9126mr37232b3a.0.1715285003556; Thu, 09 May 2024
 13:03:23 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:45 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-54-edliaw@google.com>
Subject: [PATCH v3 53/68] selftests/rlimits: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130327_035355_327C6F7F 
X-CRM114-Status: GOOD (  10.30  )
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
 tools/testing/selftests/rlimits/rlimits-per-userns.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/rlimits/rlimits-per-userns.c b/tools/testing/selftests/rlimits/rlimits-per-userns.c
index 26dc949e93ea..e0b4f2af9cee 100644
--- a/tools/testing/selftests/rlimits/rlimits-per-userns.c
+++ b/tools/testing/selftests/rlimits/rlimits-per-userns.c
@@ -2,7 +2,6 @@
 /*
  * Author: Alexey Gladkov <gladkov.alexey@gmail.com>
  */
-#define _GNU_SOURCE
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/time.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
