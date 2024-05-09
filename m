Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A31EC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x0fhlN+2zEuvsALowBIWKUw08iX/9hhzbScbwWoiuX8=; b=pJOy4df4GEv0GcXY0JdoO9lb51
	evZJoVH1tz3WKvf/RlLaj1JNu8RJSbuf9/Z6IHotEfDDBe4DvqDzrerXzPU1WQfV8Aeh1Rda3LL1f
	xx3dy7LY/5iQ/+YVLz0HS9eudqa/PZV8DnMQXWQZRyNLpiuy/zNUTB5CUEIsUdo8jbdmVTWUmxvaG
	Z6cN+z0mpcdoZUr2nIQSER5gYrSI7Th4t1Z5FF7xQoee+6xuQAqPXtLr2lMqihuT7UnLzMIBYZmS1
	FWnF/pCg35YlSrermKixUCOnHV7ICI71+N6pF8Zw+Z9JwFU3M6/jfnVqjxNGodgw/MmzPPEIIpcnf
	gpoK/olg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8Q-00000002uNZ-0fuN;
	Thu, 09 May 2024 21:17:02 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yD-00000002bqk-2v4J
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:48 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be621bd84so20616507b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284942; x=1715889742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/Pst5TQmmPDAJyMHgqtrqTxRb697RB0f9O6Gjfco/Q=;
        b=TsPlnsp14Dsi3yrs5GJTBchBpp7+C0Eraucu0Z5f4BbqiPCSQr6TR9+TJXC8lUE+je
         L9SibJDFxyprhW2UnlTqdAPe1VJLLTAIDKMaawBRvQa7rurAf6e98z4YxKpzo0n6qbph
         cugcFxL2VQhri6ij27AZ/V+TOqdvLxkJGBUMHnyDuceIWvG0KyhfmgLwzL+vxv0nzguH
         YRJR+t/7rU6snQZcOuFjqX7colIKXcmP07bjshLMPUCrZHJUhpPiIVu3YXsg2Gs5YX+N
         /FBoqKuWLdRTnsPcaVUyxm/uzeXdDQYc+b1UfTVWonFkt9+C3Ch1oYIAPdjBcNtCGaBs
         3t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284942; x=1715889742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/Pst5TQmmPDAJyMHgqtrqTxRb697RB0f9O6Gjfco/Q=;
        b=J/4ipbB0PM+Ws5PnK7LvuOivQ28Stb8xYeM0FiUEAUjdZJJqVW4m+LITs0S+90PxkX
         Qfy2zX/Xpn3WPJwC6OKYhwC4v1+7G6qjcqkjZZjV6zQCxkeKm3xecx83MfwC4TTThckd
         hOCHwVXlpCRFj7aR6+tWd4WIBcKj5wSwMWjhmOOTtZBjfJ4OuswGhfsWq3flxjNI2qD1
         nK2jG28HOf4AWbNXHa2TvqgOWEqDR5+CbkAzRZdHe0sApPuUz8L62ivIOyXf86Lc+YJ9
         nExhoKkolt0uawn6KhkIknHwjWxpVTyjweG5MjLR9utp2EYLp+UI52WVSDwl9VO98vFF
         ziXg==
X-Forwarded-Encrypted: i=1; AJvYcCXAfzobMWLvbZQyPOC+JGiaHFnFe7ZIcTuca8hp6edrpeBPVOhMGTbVc0xXcQ27QEeUEaPqXD2x14Xm+b+G8mElvibb3H+RsanHVQZlvojg
X-Gm-Message-State: AOJu0YxbTKTaiYBoTGShmbWqm/WkeyOZriO6l5V7B02dCYraBkUsZa2a
	wsa3HKzdHugaLkE94lBRmBI5wzFSstWynOLD2NUc6O8CScpq587sqFZNJ+QXLb3s8+PICLE+cPN
	8ZQ==
X-Google-Smtp-Source: AGHT+IGMbs/JaF926sFyfnviZMWe9jqmOtpPzNvsiWM98FusLZCSeXAn1EjPRZgQVmyQ81yz73NAnaM90ZA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:154a:b0:deb:88f5:fa0e with SMTP id
 3f1490d57ef6-dee4f1ca69dmr59044276.5.1715284942280; Thu, 09 May 2024 13:02:22
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:25 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-34-edliaw@google.com>
Subject: [PATCH v3 33/68] selftests/mount: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130226_151774_201EB0BA 
X-CRM114-Status: GOOD (  10.36  )
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
 tools/testing/selftests/mount/nosymfollow-test.c          | 1 -
 tools/testing/selftests/mount/unprivileged-remount-test.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/mount/nosymfollow-test.c b/tools/testing/selftests/mount/nosymfollow-test.c
index 650d6d80a1d2..285453750ffc 100644
--- a/tools/testing/selftests/mount/nosymfollow-test.c
+++ b/tools/testing/selftests/mount/nosymfollow-test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..daffcf5c2f6d 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
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
