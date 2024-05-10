Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A1C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NoWCVWIx6s5XOYT2eYjc70lV/f7qtE7TYKYWm47r8LU=; b=mGLuONJgdIQYIazgV2wIzV+YCg
	j58pd1ycUSY18G0HX/ITzndX0nswcDJemCbdOEypWDYOxblzxXSlQ6/NkqZhZ8LYC67RESm9lhAhI
	tCGxVnF9O+etmlWqFILF3m8BTzGLvZBZbL/mf5ajtXb69O9CaELGbpiFqA9zGUk5YU1GlbXYgv09b
	i4q0GIHiPttISuCsyI7mzkWrqrBXuyxme7C/Ce6+DcInssyQij70UwQkpvp2t348UV48oszz8ty0g
	+P08UqGXtuA2f+UOm4Rjqh9I5hx6bwiHL3fZx/jH7WHEfbRBYg54RfnS+rDp9MajQsCrFftij8e6K
	dRudcM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Et0-00000003asL-2MOh;
	Fri, 10 May 2024 01:17:22 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqR-00000003NRA-22Hy
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:04 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61be8f7ed6eso17662817b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299835; x=1715904635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6IDZpyB3UrvfTL2t0wE57nV4aaGR/g2u1ts2clTgN8=;
        b=3Xff+09hrU93D5lyzJOlWtst1H8jLoRh/RjBHJVIgNMlqul65EujluzYmuE1N2h+B3
         MftVjXYmt/bIHI+8uk4zDdLqX1jduAmgKYH8/CE423YN5yPtUNp6AUJNJBhlW+Hm8iCP
         sh0M1HxJVuKndAJ3bnMnUEAmBJVKfXDG+P8/RYVgjPuEH5J1ZGqGTa4K1A1xLke4ivK4
         6KXgVgUvX3IX+t99uCbDMzjnf6glXGMpyxSCaP/DuU/1Y4oQ1gim0u2r6OaG7fk1LDu/
         C9+ddOoiMEfdbBoRDJpwosuIPtu3ny8P3teVK6HbwfbFlSlmF0YwR3kwv9xNgP311/a6
         U90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299835; x=1715904635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6IDZpyB3UrvfTL2t0wE57nV4aaGR/g2u1ts2clTgN8=;
        b=EP5SfnfQjufA3SX42C1KP10jpfuI3dUBtJ8/YHnASyqssNxkHR806ZMpdAq8ulTW91
         UWRZf+2wI02mFB7qnGIqJZ1WORGoHmS9YTpD3qq8TGxemExhEuAu+iykVm5YvyYKuzpp
         GlThfxyjFTwbvhRZzrSJ2tFMTOE4Wfrm5AEnfb+qOL7cZpBFC/MBhvLXd9mql6DIfqTy
         iTZk7nMPyATcu2mDmCfY0RKntOxkxih67VIK1bQAF9CTh5VDzpU3Q47iMrXQH0FuBu8r
         seWiZpTILObRQxlLT/emVpy+uI0DNaWZ1qz5XLkr3NwfLsiJv30GnDawfNVUKvE8EXt+
         MR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqIy0SSWGYPBlyg+iBi2WvNZYQM9B7TumYccQ943ZNXK6ZEEEyXFF4IMzMPn/xwCBPtnwAGJXsIbumBa0ia8FTAn74LlEkrCD7IZI6xagN
X-Gm-Message-State: AOJu0YyAYKwO+P+PGPjoUf/fOqMPmFajzuoXt0zExBZQcLPRDm8ZjJgJ
	vdnbB9z1G7Osi3QdQ2AAra73IUYlmKaXz52mMN0dbiW1/5+fuoTGWyXjQMqjuJ4wdYPiMhyhl+y
	trQ==
X-Google-Smtp-Source: AGHT+IFp9arQQjLfM7uxnfZTL7Hk72AcVMd0VRlUcaVAMmNJqDm8Jb/qv8j63n8u+Ogp+M7sZzeDo1rc4Lg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a81:5b09:0:b0:618:9348:6b92 with SMTP id
 00721157ae682-620992cbc48mr10042437b3.1.1715299834767; Thu, 09 May 2024
 17:10:34 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:49 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-33-edliaw@google.com>
Subject: [PATCH v4 32/66] selftests/mount_setattr: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Seth Forshee <sforshee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171039_795134_8B6B2E2A 
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/mount_setattr/mount_setattr_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mount_setattr/mount_setattr_test.c b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
index c6a8c732b802..d894417134b6 100644
--- a/tools/testing/selftests/mount_setattr/mount_setattr_test.c
+++ b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <stdio.h>
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
