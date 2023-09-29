Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EE4E71D56
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=656QEbZ92obS5aiXoRtC0Z6P6G7stujo5M40zWtNPbI=; b=tHphmBlhzJZPqp7z4S9HKDDmvm
	O8sV5Y3W2/Agn0w+EsTQuxip5JE9XyGaXcyet18IUbF9HrlnYf/pAU9QAiM/HhkWrz5ewpK9QnvU9
	1ZQ9a30L6WYyTndU8HKHMxYd3YAbIXDMx+DNAsTln07bbhd0BIamjGUGKggOcqvm51Ewy0QQCIto2
	WDGIy4UPgCk5q+hg2LnHmyxNuRqsywXTn5II30sS2/4UKA9fmtmD2C2Jn1kBCUMGJ9e2dJnJwxMjV
	wYD161MkaNAwpHpdKmvOfHKQTQRk4S0WOv0+z8n2DkflP59WmcGPFOdpB6+SWidbpbb4UK9Q6ifNk
	ls11Ozkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKmT-008aV1-1W;
	Fri, 29 Sep 2023 21:12:13 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKmM-008aQv-2X
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 21:12:09 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d81ff714678so22151287276.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696021920; x=1696626720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FR1ZKwT/o63KmLhMDo8tUZzc0vKzUsUCbtQdapDGJGA=;
        b=vc66vw4pG7d+yh61OWz5Cp1mGKem+UlCjIFv7lqimcZi7L+/8NHET5zn6+wiysioxV
         UBFQrWEgaw+leKoISHa1k9BTBg4Z2gay+95SruVHw4G3pGUoepl1z98pj6qzHRhMprwb
         Bq9k4JuwXPJY+ZpdLh6axbqwItbq9W4mNCgHS00vRXPPyEQBT/CsKqZxjxxmLuaCNrat
         9D1FxDC4hmjwu1WTvLL20ud2pLSdFTCWWP0HGSIUk+1xu/yzP2knbJaFNgT8vdd3dxc4
         x3hhgRAaKzV/JdGuqx9aqy8X0ph6Hjy8TomQoAmWX69CRquw2+MC9iHbficwQoTt/DgV
         QCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021920; x=1696626720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FR1ZKwT/o63KmLhMDo8tUZzc0vKzUsUCbtQdapDGJGA=;
        b=QxeSMW4WrS4sox6//zC8u0HLS8lTlWz0PYw68m4RG7mLxBqX8OkDT7XxzjzMqYd28H
         A3wyGDVmQoN0y2GQW/VXOyxQ3L3OR2AXzGMfuw1b8tC8Qp1TUchXEv4HgzpIshs5lUAD
         y6Z0V5hrY1SWcn5BQrKANgySfSQyB2QtRR7bm9Qrm1c1CvAoNvlmXYrnQtq5Eo2pL5DO
         W0eEySqfbvY2mR9Hfj47CgWvGTnFf7TLrvBrnwF7YKCT7KyP3yCrPxmkIk3H29wIWpiw
         jcqBtUAs6gTBO6nNf/VgWP2Y2S7HeTnE093JqcFE3gsIqlT1Pq6NBoSjSdzUT1iPBUY2
         N0ag==
X-Gm-Message-State: AOJu0Yw6pfkRZZSzfe5JPs9Rtb2VZNpd2QJWLX7JH27ZuRyYbvTAmGn/
	u9udKjPgGPa93fGV6sfCzZdHYkCScYU1GPyWZm4=
X-Google-Smtp-Source: AGHT+IHnDIypgcCWBxPESiB/yrBCpKXqORME3PWFhWMxCeyFk9cmGmraRzLwQcSrcYatS2Uvi9kN6m0eWCmXEF8Vfz0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:6812:0:b0:d13:856b:c10a with SMTP
 id d18-20020a256812000000b00d13856bc10amr77200ybc.3.1696021920090; Fri, 29
 Sep 2023 14:12:00 -0700 (PDT)
Date: Fri, 29 Sep 2023 21:11:57 +0000
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=samitolvanen@google.com;
 h=from:subject; bh=ARqQmg1Q7FqF1vgF9dpD7yhcKdtd1MfRgn2maiynoVQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFz2bINQRa9JuNqXpxYBQVzDJb/c0+7N1HB+sp
 2/Sm1UUS7iJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRc9mwAKCRBMtfaEi7xW
 7vOOC/9tO/6MqlDPfjsiexFNXOEfW7Ar2H9OEVyVIE92EgZgm/mYuBlQqBRKkWvnSCUPZ+ktWxw
 /8gD9WFejtTnKMje8tf/4wwgxbVQuClXmgi7zZQJvbJ2+SG6cp6B7JcXsMhPsJsbuh3NhTEQj/o
 pgpvv9Uyv2mK/vRlud+N82dGqhUfLNAWNPfHmZmQ/tMcij5bpFL8VvhWPFF6Akufb6mjaM9D8vG
 +cR914ZzFo93wp2YlrOemHXK7uUcqH8HHjkYtoFn7o8xhU+VQ7oy1yajipTLM7ewaa0tOrdIWqa
 08cpT5V8GX3uAGGuFOzPlMxeF7o/GIDLXMxDfovUqIRoGLzciTjGMCqRmRapZU6oY3GqWEqPSnx
 GnCaN0xzRvU31sMOUQQkusxUC/3qLR05lv7v/sDAlG5Yah5czQB5w1+2ClKsbQ3sCX6HmpcfWsx r/VvM19V0Dekn+5QLhuwnCOlt6Hs+HBdn3kG1truvPJvtRa+QxsCoiBcfxXnVWnQrVOuI=
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230929211155.3910949-5-samitolvanen@google.com>
Subject: [PATCH 1/2] mm: Change mmap_rnd_bits_max to __ro_after_init
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_141206_822747_65C13579 
X-CRM114-Status: GOOD (  11.44  )
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

Allow mmap_rnd_bits_max to be updated on architectures that
determine virtual address space size at runtime instead of relying
on Kconfig options by changing it from const to __ro_after_init.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/mm.h | 2 +-
 mm/mmap.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf5d0b1b16f4..72a98b2afaf9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -86,7 +86,7 @@ extern int sysctl_legacy_va_layout;
 
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
 extern const int mmap_rnd_bits_min;
-extern const int mmap_rnd_bits_max;
+extern int mmap_rnd_bits_max __ro_after_init;
 extern int mmap_rnd_bits __read_mostly;
 #endif
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
diff --git a/mm/mmap.c b/mm/mmap.c
index b56a7f0c9f85..ed1b178b223a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -64,7 +64,7 @@
 
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
 const int mmap_rnd_bits_min = CONFIG_ARCH_MMAP_RND_BITS_MIN;
-const int mmap_rnd_bits_max = CONFIG_ARCH_MMAP_RND_BITS_MAX;
+int mmap_rnd_bits_max __ro_after_init = CONFIG_ARCH_MMAP_RND_BITS_MAX;
 int mmap_rnd_bits __read_mostly = CONFIG_ARCH_MMAP_RND_BITS;
 #endif
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
-- 
2.42.0.582.g8ccd20d70d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
