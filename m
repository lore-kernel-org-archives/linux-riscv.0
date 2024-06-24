Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64AEC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qq73WWQJmtLR1uaaEKuIrnuXL78j//uS7f7HnXDJvos=; b=EofwuETTQub/7N9ygn9xp2mlnc
	XawjZho0dHftEdq+BEKG/4qDp0jbI0WPl4tVWBn6FjKz939Hasd2csRWPMdnoPH+FzSD079a/vCyg
	ohIcEqTR91cxk8pKZQ7wYJBduzBAH4noF+8fgmSvFcqmHibnBeQp4FfFPNbjrolBDZtoR0ahskkzB
	v33VCziuiR/vyPWH77XIWmm/v/P1cXDMLQYZxpJdOc11uPzEE0+YCzuBxmc2ZKA9F0PgpHrDfZjLP
	8hzJDUIBqZlQmjiUVnAymzMm518VBwLdcuOU8SaBIF7BFVkxw6d2ahTpsA3qEhrbGlI+3MAqb+vIf
	EVfsQU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7i-00000000y4e-0RAJ;
	Mon, 24 Jun 2024 23:29:22 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7f-00000000y2T-1BgC
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:20 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6658175f9d4so6827807a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271758; x=1719876558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdSDNYLWJB5rZ7zGFIgNmO8T8+rT5KpGbZz7pQfLV3k=;
        b=AHbMm/R+v27gAPn5u6kg9Iz30ozot5YRrYogtktUDOopUwXvaBuSHKHNrGOqJbfbUp
         6XS08Z84I9fi0LnErltG7xtxKO9qo2vJVLLe+QP4nZgR8w8CetekRhHP7VNXVyI5nWIq
         e+msz8Gjt78ofnVdS3i5KfpaXOsRqPIfWqUcoKrslMYwjgg4bg3+U8FDp1QVp06n+G8j
         rDEksFokqtnaeDKw1irwvYamuKI+9IX7yEhXrIo/qBeRuiCwjjiJG/qrBgLegCJUqWCs
         LPuLHPvxKyqZXVouD1vlVWFUNP3qJy6XaHoD0f2Ek6OiIx+9p1n2VeMHHr1miqjh37Ge
         wbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271758; x=1719876558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdSDNYLWJB5rZ7zGFIgNmO8T8+rT5KpGbZz7pQfLV3k=;
        b=XYoMNauRWSf78wK9CGsv2ZLZtcC4sBMrHzfjluDgXp88trMb8mklGydD/hM7aCzsBy
         En7MipCJgI1HmcW01GS/mx/sRHGyS1BKjUkKy0VxRyqWfaS/u0OQXLTuGZUfII8KzSxg
         cQuDVxhyYrMby6YLefss0X2+YtdzcyAoZbIgqDo3aDAggOqzbNTq7en3mvWQKkikzYIV
         R3ymmakt9cyEdpMGBfOMfPFzOycxHvoX91pYdK0xVlCH2AnVNV5Y/H3sm/Vf73dvmB5D
         sfIdjvEO0ROYi2MgFkCmMTlxG7MmhNHopBLMpGu1bEWQJ78fv9gtvBOzPRdVFveCMKXL
         ylyg==
X-Forwarded-Encrypted: i=1; AJvYcCVw6yhOjNn8x+rt9XXCxrN2wNZd4V8ckE2gn64gR7+izB2mHdSwDmNBfccUEyuhqjjpE1l9ouUEczNzQINM6pKoioU/9x774urVDBlo5yLd
X-Gm-Message-State: AOJu0YzSotplB3mzSu6CRQJ5vzQL6EVcDQwy4Jzp0hDLkLH8Q0yxEvOa
	9JHx0MMyZAqZ5bfq/AZoqx68p+Ltvr7yxarOdH17BT7E41LFn/2QnKqR3+Lg/MeEndX37+16SfH
	EBw==
X-Google-Smtp-Source: AGHT+IGHwhaq3SpDsE/oDwZF6fJSdoqdJu1qur3CUdYhennVxCDTZQrp6vr5HFtn29b7yImBHRAcKRn1tcs=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:3d43:0:b0:71a:1f6f:1d0f with SMTP id
 41be03b00d2f7-71b5c3db10amr17532a12.6.1719271757877; Mon, 24 Jun 2024
 16:29:17 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:13 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-5-edliaw@google.com>
Subject: [PATCH v6 04/13] selftests/exec: Drop redundant -D_GNU_SOURCE CFLAGS
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
X-CRM114-CacheID: sfid-20240624_162919_405623_3503A693 
X-CRM114-Status: UNSURE (   9.76  )
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
 tools/testing/selftests/exec/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index ab67d58cfab7..ba012bc5aab9 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS = -Wall
 CFLAGS += -Wno-nonnull
-CFLAGS += -D_GNU_SOURCE
 
 ALIGNS := 0x1000 0x200000 0x1000000
 ALIGN_PIES        := $(patsubst %,load_address.%,$(ALIGNS))
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
