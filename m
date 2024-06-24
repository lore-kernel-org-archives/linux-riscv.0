Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA15C30658
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hrfgTmgkhUWKQFz9Jy0/Rs3WA8hHVa689bxbcQ14IdI=; b=qKm3j+AFr8Yhi7mrdr6/tnUEp0
	cTZH+8CRjM3JDvjM4Dja7uDkvfY8BkDdIYbNgrY8XnnYAq3u7j6Oc9/e5iwq/U79iuBwXX1XaWgUG
	WzAsoCFvfm6M2a9DHni6DfFtdvGrb5r1ggqrwsWTcvrOoYoYUzrfsB5Ogv/cQQARdVE3Un5s+vAra
	LlsbRzbO7S1iwQoER6hzZTcU4XmFVTQKV1Yt/rUT8BiDvgrBXXIjrPYF46OTmgStHI7FA8k3eJblV
	XnRTZEha2ELe9NpcI1TCxKvTNaRoKfyH+MMokvRYg88BxceX6aDWFjaLfTz1/8ruDJNBhgoY6Ja+J
	0YqUemQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8P-00000000ygd-3bsc;
	Mon, 24 Jun 2024 23:30:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8M-00000000ycl-2Ghc
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Jun 2024 23:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rJFiGCZar+q63pIILXV1m5S/VTx8srfmbdTO812oVXc=; b=qH283i5a0F3o1YpPiGqLWMxR9m
	g/3DnZFZTvBrX0Q9j3GbLOzCcRHydRedBbfZ2biezGrwcMbDNJxXJmpU711MYA4fvOhHrjiK6eE7t
	K8yQ351uul5+xuG2m+V5AzEXwITWJphZCKJB1IyVyRXqaVEVy8nbk06j8ZfrM7zsw3DChZuIEmAxF
	iQRgRkrGgDTWF7kgfqlytzZW4/1oMW2s/ZNFUImibLAvO9NBbyu1K7S6B+zPMj6hcLsi8UeLHDMGt
	0RP5/8RO4x0aPreUt8iemVqqyrCsE9mqhbRgg6il8cokyoFkrOL03TiYU72Jd7F/oVQjEX8UFcM00
	q3bsvM/A==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8B-00000008JJ0-3n5V
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:59 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-71b1231febdso3695421a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271786; x=1719876586; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJFiGCZar+q63pIILXV1m5S/VTx8srfmbdTO812oVXc=;
        b=F4ELI6KXBUbGQaiZ4Ah/6w+eaRjHWjwLl2Z4/ysbDMmte/Gn0CoFT6xg2H59XQO7kO
         m6PJUK262d2CQacxJc0nwC61vWaaPSIXcOnw3Qkv4OQSSfHcHFVDxy6BPlwUOJ0QbYBs
         jQ3c6lOUreBMJnty/tTTUtHpF4rW4T8dRf8BkY4r1vNpNQzBEbxXzxBsxwBvUeyjXNtK
         sSX9E4TzZgk7HNWNZxemi7G1ufpW/CkcxxPI4oFNdy1IAUtwrcgh3SBGtK4VA8zpkNsb
         quOPALBkYK1sqxp9tqQfmAver+NlGGvHih8Crnym3sSkPTYaJnyE3ypNoVZwMU28M8zp
         xNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271786; x=1719876586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJFiGCZar+q63pIILXV1m5S/VTx8srfmbdTO812oVXc=;
        b=rIFylTg3rQkN336+ni6Idrh52DAHgKCsL9xiW4lQUUIo79gGtmak/axADGzsQBmBcs
         YukfSbvEWs5Rgib+Q114g75YLgyIAkmbdD05fy7BfSA17rWJmo+4HM6Eq/Lg4Mye6EnQ
         63lBE2WEDhEn6rTJT5T5b9f8Y8gD+tyWxXwaz67RBMdUmv2ZtN4cTCpppsTufKE9aLlE
         L5CntV1edcTQ6L0DucP2RLIQwkiLEkRhvYYXiZHA9ycyaHFIMhbW6An5pGkVbEGMnTNz
         fUTSdhSQtCw5OtmhH6q6rETCROHu+n5XlLsRdkCCpKp8gowBHXVvhzRJ5qozIjjttUPo
         M9zw==
X-Forwarded-Encrypted: i=1; AJvYcCU3TE5wPKcOIAXRvHZe/+G6Z4uavS8zsd6FKp9PQX8CbB1Ont3uXnEE4xFDHgH4lCPs2xumVhmmjeOAg9tF0xl46yphMgK3DqSB1vpUXbNS
X-Gm-Message-State: AOJu0Yx5VvJm/gDxoNnGziPwCVaKj9dxKGZMh3E7HQPWJqVsec6/KgOl
	BQyj9UA3A2WRNDSGMScSMpfjSbGmGLSU+04IRcZIHavy/+G+XvspFdPW53w2MIeB6UZKI1Z4jrF
	75g==
X-Google-Smtp-Source: AGHT+IHZaXS4lSce/uBBUIpFuXCH7I0BpPEaAf3VbI7ppnPDWzJgDOW4eIq57gPJilnwaCJeffaGJD+7rCQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:6dc1:0:b0:6c0:3f:cd46 with SMTP id
 41be03b00d2f7-71b5b395b46mr19980a12.2.1719271786190; Mon, 24 Jun 2024
 16:29:46 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:18 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-10-edliaw@google.com>
Subject: [PATCH v6 09/13] selftests/proc: Drop redundant -D_GNU_SOURCE CFLAGS
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
X-CRM114-CacheID: sfid-20240625_002953_216056_C51BAC36 
X-CRM114-Status: UNSURE (   9.92  )
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/proc/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index 6066f607f758..ee424a9f075f 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -Wall -O2 -Wno-unused-function
-CFLAGS += -D_GNU_SOURCE
 LDFLAGS += -pthread
 
 TEST_GEN_PROGS :=
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
