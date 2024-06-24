Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B71DC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r7pDDki6/m4JpPNbr8oZADkHpTuF7N5dhgXW74EcnI4=; b=KOBn9RSWNYRx/lB2KKvNBV2+C/
	jxcMRdzwyzAs/mXaqyvlans4AZcAtQKRSDRQqi2P7ITOj+LWC/5tudUeueQjLQexPaRFLtCJK6Z5M
	OjMd8xVMhKcXEOHwClDBtjJN6ImCoaCzz52dTyo4wKeb3fjyNByWJQz3orBNMUQ2FAF57aI6Bgofo
	B6T/N8nS6hIZJRrx/cXC/54D+AjMsf/TbwXzsnSbkDFZ5NJ/mCr7FVUJDUkcP50hrHorMnm2TSgQ+
	IXVu1+EvwqCy8o7V7HB38wO4XeY5DqoaZBG3JVuzKIRaARfev1yN4Iw/JSo2jvHMr6BLO3lDgDk8j
	KVeM8c5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7o-00000000y9u-3w7h;
	Mon, 24 Jun 2024 23:29:28 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7l-00000000y6M-12Ib
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7065df788f6so4801343b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271763; x=1719876563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fldosNIASu5foth+y++2astaddaovQjRCjbJvozT8Ew=;
        b=ug2qVxYhBrYUf86btlBpRZEKU4z6yLTHrH0RJw0WiUm0/4CoZDU1vmGlcL+AYS3CoC
         jUdQCw/kBkxcf821nhimf/YRlPYBiGpsekLmh4pKxv30a6Y+nmRyU2kKQLUKVBVwvmdB
         flJMJTkngNU6Lzn3wiCHY2fjFpA9MDUutsJawev1IvMQ5Ja4tHs9LQX9lQ84vf+RLkOK
         XHwNIcQhlSMi3X5BalwbCRMR1/Z0e21FtKCic1pXuyoOCc/UnwDXO1Wf0b1hl5UBLIoU
         fPb4oLsTOx5yuCne+QhWHM3RIwRJXmyabnZvQdbeFyDku5omaVH/S0xKoMfakBHuTqcl
         2Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271763; x=1719876563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fldosNIASu5foth+y++2astaddaovQjRCjbJvozT8Ew=;
        b=FNDwIsUkTQg+clewdCgrJtc4/MZ9z+XNwPhxzSkzqRPStxbJ4o7piaeKz9MKSKfda/
         jzcWl9ZLkxeSq6lZ9ZyUgezjaqFBSE165/t+GlwsnkOY6DDQW4xydgAtcPeg/DW6XEED
         fKItmUNsV6JcCYpiWywz183ygRFTlCGp+vug9JHcEZnFdiE/PQDVGZiUOMQsxCMarcQN
         wcZdG9XhDFqmYW6NoEpSInnvQTWVAOuOmAVrDxwVcDzr5B+9/nvJyfMCruogmMBSoZzG
         VMepxx3n89pBYSk9+UnS25V9jEoNa3rH/isnLnBgao/9ZKV4TLrYxViolToLrlWHd6n0
         +PoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgR4QrIopBSnr4ewYngx/jgQKAvrUtj7LF9+yT//CEfPqj4f0CKwb6FdDg05qbiGytsR4P1A0D9bR6YUsHTCmKcvnQGcU9si9csv6L4iMv
X-Gm-Message-State: AOJu0YypPie2zsSb70P6Yym4frGfRe9O1KQEOncNY+6NNMcwb7FBwU4g
	O2HaKgne1UZv2ugeSefa7FGbmQ+ZwF0vd9g9wprn4YJVW+M0CLfLvdpFh7AO5e9ZTVHEEBCILVD
	fRQ==
X-Google-Smtp-Source: AGHT+IHgIjs0ZNjmgMymaYfJ8/9bZ93vYmLowFGFa4rCwsJRE0/Jc/du7SfPX0zd6RD0YkkBKKfvO6Hly8E=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:908c:b0:706:3421:7406 with SMTP id
 d2e1a72fcca58-7067454bf95mr299109b3a.1.1719271763360; Mon, 24 Jun 2024
 16:29:23 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:14 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-6-edliaw@google.com>
Subject: [PATCH v6 05/13] selftests/futex: Drop redundant -D_GNU_SOURCE CFLAGS
 in Makefile
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_162925_376827_F9CE380C 
X-CRM114-Status: GOOD (  10.96  )
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/futex/functional/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index 994fa3468f17..f79f9bac7918 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
-CFLAGS := $(CFLAGS) -g -O2 -Wall -D_GNU_SOURCE= -pthread $(INCLUDES) $(KHDR_INCLUDES)
+CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread $(INCLUDES) $(KHDR_INCLUDES)
 LDLIBS := -lpthread -lrt
 
 LOCAL_HDRS := \
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
