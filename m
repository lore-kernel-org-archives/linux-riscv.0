Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415EBC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cr/XiAr0JEE/AgXUjeiLPQoMICwFhb4EtHIs25nKQVo=; b=z+dgZBavZ/t3cRacO3ra2XAtIq
	zDA1gTXWA4krAZ9419Z3rbbBIP8dx+GBRHo0/gF1u25gdYfszqPH/uiDZcorbIf3t9KQYpIQ/wn3p
	tS1XQqc4qaLTBA7HWiRc/Vf5+MjAh3awhrtFev4lvC438bqcal4HSj04fI8apW66Os3DEVZ5N0fPX
	5dym6m8DcmDqOZ8/vIbn/3e7HSe7awbbQqXG1jjU++i1JoBeDnhp8fuG/ux5Lh8hOoECf0bBlVjMd
	RvGK7GFDelmr3jAMtOAn9qDJUG/a5AMc6W1TFDgbenneEhdeUf1FRBN2Y/k9s7vSo/tF6tAfCjaGA
	DmyKt/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3S-00000003kq9-2xOS;
	Fri, 10 May 2024 02:32:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drm-00000003ObL-0nzd
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lfjY9RujMMfudpJuG3AQZBDh8vReKDVIi2txg8s68yI=; b=VevF6PSLIEZ/xESFcDcFXopANn
	r33WIezBPGBKQ1yaIfFRCRnlZ7x7crTKF1qPIClZez1b+FanJxFUKcq1Q7uw1zRabzWk+H6tb7pEK
	hy/mGl5zL0KSRymTq7VulPap+QdjDw7ibRBsgGxQ+UiYlaofSzRFIwlQuYxArzNpOaLJBMCHTc8T5
	2eNP9IJlgbOmW77IHrGjkiMwuUlFYmpqbrGypA/mH8QGeL9yuHXifGrcxuWsgio9N5w8DGFbqEdUl
	/mlVVwwYDlmt/FA5F2s37291STuzR5+RdQBPSlvMlrPmIHnwX2p/GBPlIcwsRlC3ExwyPr0vbLuhg
	O/1b8HpA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drg-00000001mWH-0GFC
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:01 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6ee128aa957so1490333b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299911; x=1715904711; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lfjY9RujMMfudpJuG3AQZBDh8vReKDVIi2txg8s68yI=;
        b=weZ8uzyUW/vn/uMxXCcTCActcGrLM2LXuZflsStgKP0hsyOzJgXov/qsyOBAmsDBvc
         TrNVzHCC+viLZSMWGwl+SLCg0U5rplleoNelKQa0k8/qN+V0MpR5Hf/jGmS8YFfoWQ/W
         E5SsI3W7bxEMXksDjllp95TdMvjZBi24jZf5x/pGZw+zzl+6f05hOuKc+Oni1plG9v1s
         cCxxaoKMYhdHk1ekEcaxWimQ9+57nSsRXKV9cjSulpO40g/EohjMauSj3uTbjVzdBve8
         QNMJjUq7uEymQ4VBxar8F98Byp485ta8oqlSw1FFXqt533CiduLcrfN5hjYvp3uKMpDY
         Biuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299911; x=1715904711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfjY9RujMMfudpJuG3AQZBDh8vReKDVIi2txg8s68yI=;
        b=G7gAEVv1ye/d5b0Vdi6bzdJfWTzseMQ2ehQw2kgx4OY63jtNlOMWFxOMKq2FgJaLFB
         NeqNI/Z+JIx8b5hLhFIJ9dus5KgFIjMFKQcnXQiJbe4n0qKuw/MdD5B65RKhGeF8G3jO
         0fBz9LsQvfkcV4tkssHsciNd9nVmuJRzhFmUcca+kTQMCNQamKtIydnZq3t4iox2pAXF
         YF58ph7Dpj+rRfOcDw0O1yR58Z3U7ZFnLiNz4kCLg5WeE9KQI3vjS7bZqcgN8lwgZ5ui
         oWqirfpJdm7gU/m4UQaoU9NCVjjIDWbj2r7iaXTqRoPSdGNYi5yGVHFTmm/YDcyUtBM9
         qVVw==
X-Forwarded-Encrypted: i=1; AJvYcCWbotugYNm1Hl+1p9+GB1DN45UYlv1rcHNefiZI8M2NUNZK2rNtj3GfKLMk/4Pdp/8sRK2zsD+y5oxalqIytQs59vOtwM8Ulktrt/bJWYKK
X-Gm-Message-State: AOJu0YxWY/xJ6v5aISKQnQR7Am4reET5uOLaWCDFw0JM5WK3IeRiCxSU
	I0VHnyRXEQPe9W1ba8jK0kQDNPg5HfrO4fiDmAlz5r8t2biySG4StwLwlzkpIbebyHIoBylJ13b
	+mw==
X-Google-Smtp-Source: AGHT+IGMEDSh6n8JDhyUnrx8edlpa1/0ciKq5L6J3NGl7hDudyZ1Z9szb8Ek4WrJWFhP303EsBUN1+aLv5o=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2da8:b0:6f3:ea4b:d232 with SMTP id
 d2e1a72fcca58-6f4e01b953cmr21227b3a.0.1715299910911; Thu, 09 May 2024
 17:11:50 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:15 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-59-edliaw@google.com>
Subject: [PATCH v4 58/66] selftests/syscall_user_dispatch: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011156_130123_AFEF9F27 
X-CRM114-Status: UNSURE (   7.35  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c | 2 --
 tools/testing/selftests/syscall_user_dispatch/sud_test.c      | 2 --
 2 files changed, 4 deletions(-)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
index 073a03702ff5..758fa910e510 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
@@ -4,8 +4,6 @@
  *
  * Benchmark and test syscall user dispatch
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index d975a6767329..76e8f3d91537 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -4,8 +4,6 @@
  *
  * Test code for syscall user dispatch
  */
-
-#define _GNU_SOURCE
 #include <sys/prctl.h>
 #include <sys/sysinfo.h>
 #include <sys/syscall.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
