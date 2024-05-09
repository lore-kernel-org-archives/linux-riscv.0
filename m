Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90758C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U9KQ2n4C4qzOt9iSfFNdJJKUGDo6cKihzy3l+Uk0HvE=; b=jFTN7JeaM7Iw3wA5+hqnj0Kah2
	9y4k6u33dsp+Z/BUgFqq859CMQEHd1xsmdMxGoRDmBtdoIAJBEgHF9hcAkzM4lH10o8UBVflMH9h5
	EV2iZMh21joeJah36d3Eoe4LQs4rQR6IV7y5V6J6a0HUEIRg0cuO4I2i6x3qMEpZORxRRZpopsRRi
	zfCL1EJTFw70JXPOeFdSxjUfj8ovAEPtL1D0G3mu5j8slaRrh74XBB9AAk22hNREBn6T6DMVLEa5f
	8d+oe7TFkrDutoST6tma9j5RjYhHROyZiZjcRov/5b7w2v5y9bkxjwY7aeMtcynG5XfqqgnlNJ9S/
	yLiEaYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1S-00000002eG6-3p5i;
	Thu, 09 May 2024 20:05:46 +0000
Received: from mail-pg1-f201.google.com ([209.85.215.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zU-00000002cmm-1y4E
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:50 +0000
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5d396a57ea5so955468a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285018; x=1715889818; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVdUVqzWYmb3RWbqhYAX2sm5BvszkqdFATAvwhSxfi0=;
        b=vlxS+GbTqLSa0aFd+XWz61mI7U3XeCWiKVERdDN+rWd/PGfSpyOo1obbBQQhb56Bqj
         mouQVGX3ESjMFhzzMtFRCv1euFgFpP3zZGls3TUSparO50PJDbVHxx37Bb6bgoazNVIh
         7fJUQhYPXXg2HYjli62NDLaT7NxUShpD9bUHca0EIXnZxyIee9f5aEQYzXjt7KYy/wa4
         VzL91//uyZVzu/UIIhiwk8JgqT8VPAcJz5nOwQrCPG9uhDd/nnX02RZ1Px2AsOqCbEeC
         xm6NVhC+NXdVLj0a57D1rSEnJyO6K2cSqw6KI61awqjsyWO9L2Ttzf67wua+ywVXsEtW
         yN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285018; x=1715889818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVdUVqzWYmb3RWbqhYAX2sm5BvszkqdFATAvwhSxfi0=;
        b=Q10Ot9eouRkSgJ/hETNINFP82MMqYtmgr6TigDp1he5Ia16QfoUTT3NRlymqi75WU3
         WsSb5nUtJVmoKiGNICjT98Pt6DYs38GBrolOZfuQGgBiHIkkmGVHNTqHeqJw1YbAeGU4
         n5j9LQ6eSRCCG8t8abDnGlB5G7tsRELLH7kheVq1Cg9Q+Hw+Vmhkz5yGKZxbF5EwJSIH
         QPZoCCXy3ll9wfNlHEaB/W1RmWDbd6PkZlxbjj2QZ18C0vkbUNlAFAzqvwJ503xvC8AW
         kZzhpZRIvz08ch3Q0LecaVnL8lsRrIIxafnVQHDhps4+BYIC9BRougKdVTHmNPxkneu5
         UZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCVeWMTv9ctJT6589Rg2o6ZTVG+JWadNf0ELQPhZTkjAvtRJ9l5e0Er93GhT5N8SEDb03dWwbsVvzHgAxmgPbEZpEaH3d0yxN8s7oyoG9O8A
X-Gm-Message-State: AOJu0YwOu+HZSQxMy69wLFLwrXB2caVzIKuqzCPw6H1diZzqjlvft17T
	nBh/HNj0YUhVw+2Omm3E1LXYGtkxB207tSOeS4c2LqFL162k6PjFRwV0Oc1pRcsNjE9BzvA8bjM
	n9A==
X-Google-Smtp-Source: AGHT+IHg5VgFl0oWnKy9QZrL+pJvNw77NDmjf2svPyBwnniX7haHt8pz7giq5R8s6VnTC5gIYeXcCZMMI1M=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:ec84:b0:1e4:3299:519f with SMTP id
 d9443c01a7336-1ef433db6a2mr390305ad.0.1715285018542; Thu, 09 May 2024
 13:03:38 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:51 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-60-edliaw@google.com>
Subject: [PATCH v3 59/68] selftests/splice: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130344_740922_79BED127 
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
 tools/testing/selftests/splice/default_file_splice_read.c | 1 -
 tools/testing/selftests/splice/splice_read.c              | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/splice/default_file_splice_read.c b/tools/testing/selftests/splice/default_file_splice_read.c
index a3c6e5672e09..a46c5ffb573d 100644
--- a/tools/testing/selftests/splice/default_file_splice_read.c
+++ b/tools/testing/selftests/splice/default_file_splice_read.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <fcntl.h>
 
 int main(int argc, char **argv)
diff --git a/tools/testing/selftests/splice/splice_read.c b/tools/testing/selftests/splice/splice_read.c
index 46dae6a25cfb..418a03837938 100644
--- a/tools/testing/selftests/splice/splice_read.c
+++ b/tools/testing/selftests/splice/splice_read.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
